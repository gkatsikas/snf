define(
		$iface0      netmap:nf3veth0,
		$macAddr0    20:00:00:00:00:02,
		$ipAddr0     12.0.0.2,
		$ipNetHost0  12.0.0.0/32,
		$ipBcast0    12.0.0.255/32,
		$ipNet0      12.0.0.0/24,
		$color0      1,
		
		$iface1      netmap:nf3veth1,
		$macAddr1    90:00:00:00:00:01,
		$ipAddr1     200.0.0.1,
		$ipNetHost1  200.0.0.0/32,
		$ipBcast1    200.0.0.255/32,
		$ipNet1      200.0.0.0/24,
		$color1      2,
		
		$gwIPAddr    200.0.0.2,
		$gwMACAddr   90:00:00:00:01:00,
		$gwPort      2,
		
		$queueSize   2000000,
		$mtuSize     9000,
		$burst       32,
		$io_method   NETMAP,
		
		$position    3,
		
		$lbIPAddr0   200.0.0.2,
		$lbIPAddr1   200.0.0.3
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
	queue1 :: Queue($queueSize);

	// Module's I/O
	in0     :: FromDevice($iface0, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $io_method, SNIFFER false);
	out1    :: ToDevice  ($iface1, BURST $burst, METHOD $io_method);
	
	// EtherEncap because we always send to one gw
	// Interface 0 has a fake destination since we never go back
	etherEncap1 :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip0 :: Strip(14);

	// Mark IP header (necessary after Strip)
	markIPHeader0 :: MarkIPHeader;

	// Implements NAPT
	ipRewriter :: IPRewriter(
		pattern $ipAddr1 1024-65535 - - 0 0   // Outbound Packets change src IP (S-NAPT)
	);

	// Process the IP options field (mandatory based on RFC 791)
	ipOpt1  :: IPGWOptions($ipAddr1);

	// Set source IP
	fixIP1  :: FixIPSrc($ipAddr1);

	// Decrement IP TTL field
	decTTL1 :: DecIPTTL;

	// Fragment packets
	fragIP1 :: IPFragmenter($mtuSize);

	// Packet & Rate Counters
	counter_rx0 :: AverageCounter;
	counter_tx1 :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input --> Processing
	in0 -> counter_rx0 -> Paint($color0) -> strip0;

	// --> Way out
	etherEncap1 -> counter_tx1 -> queue1 -> out1;

	// Outbound packets go to port 0 of Rewriter
	strip0
		-> markIPHeader0
		-> [0]ipRewriter;

	// Rewrite IP address for routing
	ipRewriter
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
		wait,

		print >> nf_rate.dat "In     Rate nf"$(position)": "$(counter_rx0.rate),
		print >> nf_rate.dat "In  Counter nf"$(position)": "$(counter_rx0.count),
		print >> nf_rate.dat "Out    Rate nf"$(position)": "$(counter_tx1.rate),
		print >> nf_rate.dat "Out Counter nf"$(position)": "$(counter_tx1.count),
		print >> nf_rate.dat "",

		wait 0.5s,
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
