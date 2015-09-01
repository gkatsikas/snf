/////////////////////////////////////////////////////////////////////////////
//      Module: router.click
// Description: Click implementation of an n-port  (even number) IPv4 
//              router (RFC 1812).
//      Author: Georgios Katsikas (katsikas@kth.se)
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      eth0,
	$macAddr0    10:00:00:00:00:01,
	$ipAddr0     10.0.0.1,
	$ipNetHost0  10.0.0.0/32,
	$ipBcast0    10.0.0.255/32,
	$ipNet0      10.0.0.0/24,
	$color0      1,

	$iface1      eth1,
	$macAddr1    20:00:00:00:00:01,
	$ipAddr1     11.0.0.1,
	$ipNetHost1  11.0.0.0/32,
	$ipBcast1    11.0.0.255/32,
	$ipNet1      11.0.0.0/24,
	$color1      2,

	$gwIPAddr    11.0.0.2,
	$gwMACAddr   20:00:00:00:00:02,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     1500,
	$burst       10
);
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass Router {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst |

	// Queues
	queue0 :: Queue($queueSize);
	queue1 :: Queue($queueSize);

	// Module's I/O
	in0     :: FromDevice($iface0, BURST $burst);
	out0    :: ToDevice  ($iface0, BURST $burst);
	in1     :: FromDevice($iface1, BURST $burst);
	out1    :: ToDevice  ($iface1, BURST $burst);
	
	// ARP Querier
	arpQuerier0 :: ARPQuerier($ipAddr0, $macAddr0);
	arpQuerier1 :: ARPQuerier($ipAddr1, $macAddr1);

	// ARP Responder
	arpResponder0 :: ARPResponder($ipAddr0 $macAddr0);
	arpResponder1 :: ARPResponder($ipAddr1 $macAddr1);

	// Classifier
	classifier0 :: Classifier(
		12/0806 20/0001,    /* ARP Requests    */
		12/0806 20/0002,    /* ARP Replies     */
		12/0800,            /* IPv4 packets    */
		-                   /* Everything else */
	);

	classifier1 :: Classifier(
		12/0806 20/0001,    /* ARP Requests    */
		12/0806 20/0002,    /* ARP Replies     */
		12/0800,            /* IPv4 packets    */
		-                   /* Everything else */
	);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check header's integrity
	checkIPHeader :: MarkIPHeader;

	// Routing table
	lookUp :: RadixIPLookup(
		$ipAddr0     0,
		$ipBcast0    0,
		$ipNetHost0  0,
		$ipAddr1     0,
		$ipBcast1    0,
		$ipNetHost1  0,
		$ipNet0      1,
		$ipNet1      2,
		0.0.0.0/0 $gwIPAddr $gwPort
	);

	// Process the IP options field (mandatory based on RFC 791)
	ipOpt0  :: IPGWOptions($ipAddr0);
	ipOpt1  :: IPGWOptions($ipAddr1);

	// Set source IP
	fixIP0  :: FixIPSrc($ipAddr0);
	fixIP1  :: FixIPSrc($ipAddr1);

	// Decrement IP TTL field
	decTTL0 :: DecIPTTL;
	decTTL1 :: DecIPTTL;

	// Fragment packets
	fragIP0 :: IPFragmenter($mtuSize);
	fragIP1 :: IPFragmenter($mtuSize);

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input --> Classifiers
	in0 -> [0]classifier0;
	in1 -> [0]classifier1;

	// Classify packets
	// --> ARP Requests
	classifier0[0] -> arpResponder0 -> queue0 -> out0;
	classifier1[0] -> arpResponder1 -> queue1 -> out1;
	
	// --> ARP Responses
	classifier0[1] -> [1]arpQuerier0 -> queue0 -> out0;
	classifier1[1] -> [1]arpQuerier1 -> queue1 -> out1;

	// --> IP packets
	classifier0[2] -> Paint($color0) -> strip;
	classifier1[2] -> Paint($color1) -> strip;

	// --> Drop the rest
	classifier0[3] -> Print(Dropped-If0) -> Discard;
	classifier1[3] -> Print(Dropped-If1) -> Discard;

	// Get IP address for routing
	strip
		-> checkIPHeader
		-> GetIPAddress(16)
		-> [0]lookUp;

	// Packets for this machine
	lookUp[0] -> Discard;

	// Routed through local ifaces
	lookUp[1]
		-> DropBroadcasts
		-> ipOpt0[0]
		-> fixIP0
		-> decTTL0[0]
		-> fragIP0[0]
		//-> Print(Router-Iface_0)
		-> [0]arpQuerier0;

	lookUp[2]
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		//-> Print(Router-Iface_1)
		-> [0]arpQuerier1;
	/////////////////////////////////////////////////////////////////////

	/////////////////////////////////////////////////////////////////////
	// ERROR Cheching
	/////////////////////////////////////////////////////////////////////
	// DecIPTTL[1] emits packets with expired TTLs. Reply with ICMPs.
	decTTL0[1] -> Discard;
	decTTL1[1] -> Discard;

	// Send back ICMP Parameter Problem msgs for badly formed IP options.
	ipOpt0[1] -> Discard;
	ipOpt1[1] -> Discard;

	// Send back ICMP UNREACH/NEEDFRAG msgs on big packets with DF set.
	// This makes path MTU discovery work.
	fragIP0[1] -> Discard;
	fragIP1[1] -> Discard;
	/////////////////////////////////////////////////////////////////////
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
router :: Router(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst
);
/////////////////////////////////////////////////////////////////////////////
