/////////////////////////////////////////////////////////////////////////////
//      Module: firewall.click
// Description: Click implementation of an n-port (even number) L3 firewall.
//      Author: Georgios Katsikas (katsikas@kth.se)
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      0,
	$macAddr0    10:00:00:00:00:01,
	$ipAddr0     10.0.0.1,
	$ipNetHost0  10.0.0.0/32,
	$ipBcast0    10.0.0.255/32,
	$ipNet0      10.0.0.0/24,
	$color0      1,

	$iface1      1,
	$macAddr1    20:00:00:00:00:01,
	$ipAddr1     11.0.0.1,
	$ipNetHost1  11.0.0.0/32,
	$ipBcast1    11.0.0.255/32,
	$ipNet1      11.0.0.0/24,
	$color1      2,

	$gwIPAddr0   10.0.0.2,
	$gwIPAddr1   11.0.0.2,
	$gwMACAddr   20:00:00:00:00:02,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     1500,
	$burst       10
);
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Elements
// Queues
queue0 :: Queue($queueSize);
queue1 :: Queue($queueSize);

// Module's I/O
in0     :: FromDevice($iface0, BURST $burst);
out0    :: ToDevice  ($iface0, BURST $burst);
in1     :: FromDevice($iface1, BURST $burst);
out1    :: ToDevice  ($iface1, BURST $burst);
toLinux :: Discard;
	
// Classifier
classifier0 :: Classifier(
	12/0800,            /* IPv4 packets    */
	-                   /* Everything else */
);

classifier1 :: Classifier(
	12/0800,            /* IPv4 packets    */
	-                   /* Everything else */
);

eth_encap0 :: EtherEncap(0x0800, $macAddr0, $gwIPAddr0);
eth_encap1 :: EtherEncap(0x0800, $macAddr1, $gwIPAddr1);

// The module that turns this router into L3 firewall
filter :: IPFilter(
	allow dst host $ipAddr0,
	allow dst host $ipAddr1,
	allow dst host 50.0.0.100,
	allow src host 20.0.0.10  && udp,
	allow src host 30.0.0.10  && tcp,
	allow src host 40.0.0.10  && udp,
	allow src host 60.0.0.10  && tcp,
	allow src host 70.0.0.10  && udp,
	allow src host 80.0.0.10  && tcp,
	allow src host 90.0.0.10  && icmp,
	allow src host 100.0.0.10 && icmp,
	allow src host 10.0.0.100 || dst host $ipAddr0 || dst host $ipAddr1 || src host $ipAddr0 || src host $ipAddr1,
	drop all
);

// Strip Ethernet header
strip  :: Strip(14);

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
	0.0.0.0/0 $gwIPAddr1 $gwPort
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
// --> IP packets
classifier0[0] -> Paint($color0) -> strip;
classifier1[0] -> Paint($color1) -> strip;

// --> Drop the rest
classifier0[1] -> Print(Dropped_0) -> Discard;
classifier1[1] -> Print(Dropped_1) -> Discard;

// Get IP address for routing
strip
	-> checkIPHeader
	-> filter
	-> GetIPAddress(16)
	-> [0]lookUp;

// Packets for this machine
lookUp[0]
	-> EtherEncap(0x0800, 1:1:1:1:1:1, 2:2:2:2:2:2)
	-> Print(Host)
	-> toLinux;

// Routed through local ifaces
lookUp[1]
	-> DropBroadcasts
	-> ipOpt0[0]
	-> fixIP0
	-> decTTL0[0]
	-> fragIP0[0]
	//-> Print(Iface_0)
	-> [0]eth_encap0;

	lookUp[2]
	-> DropBroadcasts
	-> ipOpt1[0]
	-> fixIP1
	-> decTTL1[0]
	-> fragIP1[0]
	//-> Print(Iface_1)
	-> [0]eth_encap0;

// Discarded by firewall
filter[1] -> Print(Dropped) -> Discard;
/////////////////////////////////////////////////////////////////////
