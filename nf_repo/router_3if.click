/////////////////////////////////////////////////////////////////////////////
//      Module: router_3if.click
// Description: Click implementation of an n-port (even number) 
//              L4 PNAT (RFC 1631) + Load Balancer (across 2 servers) 
//              with performance counters.
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

	$gwIPAddr0   12.0.0.2,
	$gwIPAddr1   13.0.0.2,
	$gwIPAddr2   14.0.0.2,
	$gwMACAddr0  10:00:00:00:00:01,
	$gwMACAddr1  20:00:00:00:00:01,
	$gwMACAddr2  25:00:00:00:00:01,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     1500
);
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Elements
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
toLinux :: Discard;
	
// Classifier
classifier0   :: Classifier(
	12/0800,            /* IPv4 packets    */
	-                   /* Everything else */
);

classifier1   :: Classifier(
	12/0800,            /* IPv4 packets    */
	-                   /* Everything else */
);

classifier2   :: Classifier(
	12/0800,            /* IPv4 packets    */
	-                   /* Everything else */
);

eth_encap0 :: EtherEncap(0x0800, $macAddr0, $gwMACAddr0);
eth_encap1 :: EtherEncap(0x0800, $macAddr1, $gwMACAddr1);
eth_encap2 :: EtherEncap(0x0800, $macAddr2, $gwMACAddr2);

// Strip Ethernet header
strip :: Strip(14);

// Check header's integrity
checkIPHeader :: CheckIPHeader;

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
	0.0.0.0/0 $gwIPAddr0 $gwPort
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

// --> IP packets
classifier0[0] -> Paint($color0) -> strip;
classifier1[0] -> Paint($color1) -> strip;
classifier2[0] -> Paint($color2) -> strip;

// --> Drop the rest
classifier0[1] -> Print(Dropped-If0) -> Discard;
classifier1[1] -> Print(Dropped-If1) -> Discard;
classifier2[1] -> Print(Dropped-If2) -> Discard;

eth_encap0 -> queue0 ->out0;
eth_encap1 -> queue1 ->out1;
eth_encap2 -> queue2 ->out2;

// Packets coming from Intranet go to port 0 of Rewriter
strip
	-> checkIPHeader
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
	-> [0]eth_encap1;

lookUp[3]
	-> DropBroadcasts
	-> ipOpt2[0]
	-> fixIP2
	-> decTTL2[0]
	-> fragIP2[0]
	//-> Print(Iface_2)
	-> [0]eth_encap2;
/////////////////////////////////////////////////////////////////////
