/////////////////////////////////////////////////////////////////////////////
//      Module: napt_3if.click
// Description: Click implementation of a L4 NAPT with 3 ports
//      Author: Georgios Katsikas (katsikas@kth.se)
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      eth0,
	$macAddr0    30:00:00:00:00:02,
	$ipAddr0     12.0.0.2,
	$ipNetHost0  12.0.0.0/32,
	$ipBcast0    12.0.0.255/32,
	$ipNet0      12.0.0.0/24,
	$color0      1,

	$iface1      eth1,
	$macAddr1    40:00:00:00:00:01,
	$ipAddr1     13.0.0.1,
	$ipNetHost1  13.0.0.0/32,
	$ipBcast1    13.0.0.255/32,
	$ipNet1      13.0.0.0/24,
	$color1      2,

	$iface2      eth2,
	$macAddr2    60:00:00:00:00:01,
	$ipAddr2     14.0.0.1,
	$ipNetHost2  14.0.0.0/32,
	$ipBcast2    14.0.0.255/32,
	$ipNet2      14.0.0.0/24,
	$color2      3,

	$gwIPAddr    13.0.0.2,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     1500
);
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass NAPT_3IF {
	// Module's arguments
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$iface2, $macAddr2, $ipAddr2, $ipNetHost2, $ipBcast2, $ipNet2, $color2,
	$gwIPAddr, $gwPort, $queueSize, $mtuSize |

	// Queues
	queue0 :: Queue($queueSize);
	queue1 :: Queue($queueSize);
	queue2 :: Queue($queueSize);

	// Module's I/O
	in0     :: FromDevice($iface0);
	out0    :: ToDevice  ($iface0);
	in1     :: FromDevice($iface1);
	out1    :: ToDevice  ($iface1);
	in2     :: FromDevice($iface2);
	out2    :: ToDevice  ($iface2);
	
	// ARP Querier
	arpQuerier0   :: ARPQuerier($ipAddr0, $macAddr0);
	arpQuerier1   :: ARPQuerier($ipAddr1, $macAddr1);
	arpQuerier2   :: ARPQuerier($ipAddr2, $macAddr2);

	// ARP Responder
	arpResponder0 :: ARPResponder($ipAddr0 $macAddr0);
	arpResponder1 :: ARPResponder($ipAddr1 $macAddr1);
	arpResponder2 :: ARPResponder($ipAddr2 $macAddr2);

	// Classifier
	classifier0   :: Classifier(
		12/0806 20/0001,    /* ARP Requests    */
		12/0806 20/0002,    /* ARP Replies     */
		12/0800,            /* IPv4 packets    */
		-                   /* Everything else */
	);

	classifier1   :: Classifier(
		12/0806 20/0001,    /* ARP Requests    */
		12/0806 20/0002,    /* ARP Replies     */
		12/0800,            /* IPv4 packets    */
		-                   /* Everything else */
	);

	classifier2   :: Classifier(
		12/0806 20/0001,    /* ARP Requests    */
		12/0806 20/0002,    /* ARP Replies     */
		12/0800,            /* IPv4 packets    */
		-                   /* Everything else */
	);

	// Strip Ethernet header
	strip0 :: Strip(14);
	strip1 :: Strip(14);
	strip2 :: Strip(14);

	// Check header's integrity
	checkIPHeader0 :: CheckIPHeader;
	checkIPHeader1 :: CheckIPHeader;
	checkIPHeader2 :: CheckIPHeader;

	// Implements NAPT
	ipRewriter :: IPRewriter(
		pattern $ipAddr1 1024-65535 - - 0 0,  /* Packets from Intranet change src IP and port */
		pattern - - $ipAddr0 - 0 0,  /* Packets from Internet change dst IP and port */
		pattern - - $ipAddr0 - 0 0   /* Packets from Internet change dst IP and port */
	);

	// Routing table
	lookUp :: RadixIPLookup(
		$ipAddr0     0,
		$ipBcast0    0,
		$ipNetHost0  0,
		$ipAddr1     0,
		$ipBcast1    0,
		$ipNetHost1  0,
		$ipAddr2     0,
		$ipBcast2    0,
		$ipNetHost2  0,
		$ipNet0      1,
		$ipNet1      2,
		$ipNet2      3,
		0.0.0.0/0 $gwIPAddr $gwPort
	);

	// Process the IP options field (mandatory based on RFC 791)
	ipOpt0  :: IPGWOptions($ipAddr0);
	ipOpt1  :: IPGWOptions($ipAddr1);
	ipOpt2  :: IPGWOptions($ipAddr2);

	// Set source IP
	fixIP0  :: FixIPSrc($ipAddr0);
	fixIP1  :: FixIPSrc($ipAddr1);
	fixIP2  :: FixIPSrc($ipAddr2);

	// Decrement IP TTL field
	decTTL0 :: DecIPTTL;
	decTTL1 :: DecIPTTL;
	decTTL2 :: DecIPTTL;

	// Fragment packets
	fragIP0 :: IPFragmenter($mtuSize);
	fragIP1 :: IPFragmenter($mtuSize);
	fragIP2 :: IPFragmenter($mtuSize);

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input --> Classifiers
	in0 -> [0]classifier0;
	in1 -> [0]classifier1;
	in2 -> [0]classifier2;

	// Classify packets
	// --> ARP Requests
	classifier0[0] -> arpResponder0 -> queue0 -> out0;
	classifier1[0] -> arpResponder1 -> queue1 -> out1;
	classifier2[0] -> arpResponder2 -> queue2 -> out2;
	
	// --> ARP Responses
	classifier0[1] -> [1]arpQuerier0 -> queue0 -> out0;
	classifier1[1] -> [1]arpQuerier1 -> queue1 -> out1;
	classifier2[1] -> [1]arpQuerier2 -> queue2 -> out2;

	// --> IP packets
	classifier0[2] -> Paint($color0) -> strip0;
	classifier1[2] -> Paint($color1) -> strip1;
	classifier2[2] -> Paint($color2) -> strip2;

	// --> Drop the rest
	classifier0[3] -> Discard;
	classifier1[3] -> Discard;
	classifier2[3] -> Discard;

	// Packets coming from Intranet go to port 0 of Rewriter
	strip0
		-> checkIPHeader0
		-> [0]ipRewriter;

	strip1
		-> checkIPHeader1
		-> [1]ipRewriter;

	strip2
		-> checkIPHeader2
		-> [2]ipRewriter;

	ipRewriter
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
		-> [0]arpQuerier0;

	lookUp[2]
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		-> [0]arpQuerier1;

	lookUp[3]
		-> DropBroadcasts
		-> ipOpt2[0]
		-> fixIP2
		-> decTTL2[0]
		-> fragIP2[0]
		-> [0]arpQuerier2;
	/////////////////////////////////////////////////////////////////////
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
napt :: NAPT_3IF(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$iface2, $macAddr2, $ipAddr2, $ipNetHost2, $ipBcast2, $ipNet2, $color2,
	$gwIPAddr, $gwPort, $queueSize, $mtuSize
);
/////////////////////////////////////////////////////////////////////////////
