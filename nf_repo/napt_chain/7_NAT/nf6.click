define(
		$iface0      netmap:nf6veth0,
		$macAddr0    50:00:00:00:00:02,
		$ipAddr0     15.0.0.2,
		$ipNetHost0  15.0.0.0/32,
		$ipBcast0    15.0.0.255/32,
		$ipNet0      15.0.0.0/24,
		$color0      1,
		
		$iface1      netmap:nf6veth1,
		$macAddr1    60:00:00:00:00:01,
		$ipAddr1     16.0.0.1,
		$ipNetHost1  16.0.0.0/32,
		$ipBcast1    16.0.0.255/32,
		$ipNet1      16.0.0.0/24,
		$color1      2,
		
		$gwIPAddr    16.0.0.2,
		$gwMACAddr   60:00:00:00:00:02,
		$gwPort      2,
		
		$queueSize   2000000,
		$mtuSize     9000,
		$burst       32,
		$io_method   NETMAP,
		
		$position    6,
		
		$lbIPAddr0   16.0.0.2,
		$lbIPAddr1   16.0.0.3
);

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass NAPT {
	// Module's arguments
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position |

	// Queues
	queue0 :: Queue($queueSize);
	queue1 :: Queue($queueSize);

	// Module's I/O
	in0     :: FromDevice($iface0, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $io_method, SNIFFER false);
	out0    :: ToDevice  ($iface0, BURST $burst, METHOD $io_method);
	in1     :: FromDevice($iface1, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $io_method, SNIFFER false);
	out1    :: ToDevice  ($iface1, BURST $burst, METHOD $io_method);
	
	// EtherEncap because we always send to one gw
	// Interface 0 has a fake destination since we never go back
	etherEncap0 :: EtherEncap(0x0800, $macAddr0, 1:1:1:1:1:1);
	etherEncap1 :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip0  :: Strip(14);
	strip1  :: Strip(14);

	// Mark IP header (necessary after Strip)
	markIPHeader0 :: MarkIPHeader;
	markIPHeader1 :: MarkIPHeader;

	// Routing table
	lookUp :: RadixIPLookup(
		$ipAddr0     0,
		//$ipBcast0    0,
		//$ipNetHost0  0,
		$ipAddr1     0,
		//$ipBcast1    0,
		//$ipNetHost1  0,
		$ipNet0      1,
		$ipNet1      2,
		0.0.0.0/0 $gwPort
	);

	// Implements NAPT
	ipRewriter :: IPRewriter(
		pattern $ipAddr1 1024-65535 - - 0 0,   // Outbound Packets change src IP (S-NAPT)
		pattern - - $ipAddr0 - 0 0,            // Inbound  Packets change dst IP (D-NAPT)
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

	// Packet & Rate Counters
	counter_rx0 :: AverageCounter;
	counter_rx1 :: AverageCounter;
	counter_tx0 :: AverageCounter;
	counter_tx1 :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input --> Processing
	in0 -> counter_rx0 -> Paint(ANNO 47, COLOR 255) -> strip0;
	in1 -> counter_rx1 -> Paint(ANNO 47, COLOR 255) -> strip1;

	// --> Way out
	etherEncap0 -> counter_tx0 -> queue0 -> out0;
	etherEncap1 -> counter_tx1 -> queue1 -> out1;

	// Outbound packets go to port 0 of Rewriter
	strip0
		-> markIPHeader0
		-> [0]ipRewriter;

	// Inbound packets go to port 1 of Rewriter
	strip1
		-> markIPHeader1
		-> [1]ipRewriter;

	// Rewrite IP address for routing
	ipRewriter
		-> GetIPAddress(16)
		-> [0]lookUp;

	// Packets for this machine (Never mind, it's a middlebox)
	lookUp[0]
		-> Discard;

	// Routed through local ifaces
	lookUp[1]
		-> DropBroadcasts
		-> ipOpt0[0]
		-> fixIP0
		-> decTTL0[0]
		-> fragIP0[0]
		//-> IPPrint(NAPT, TTL true)
		-> [0]etherEncap0;

	lookUp[2]
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		//-> IPPrint(NAPT, TTL true)
		-> [0]etherEncap1;
	/////////////////////////////////////////////////////////////////////

	// Save useful counters
	DriverManager(
		pause,

		print >> nf_rate.dat "In     Rate nf"$(position)": "$(counter_rx0.rate),
		print >> nf_rate.dat "In  Counter nf"$(position)": "$(counter_rx0.count),
		print >> nf_rate.dat "Out    Rate nf"$(position)": "$(counter_tx1.rate),
		print >> nf_rate.dat "Out Counter nf"$(position)": "$(counter_tx1.count),
		print >> nf_rate.dat "",

		wait 1s,
		stop
	);
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
napt :: NAPT(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position
);
/////////////////////////////////////////////////////////////////////////////
