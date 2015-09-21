define(
		$iface0      netmap:ns2veth0,
		$macAddr0    10:00:00:00:00:02,
		$ipAddr0     11.0.0.2,
		$ipNetHost0  11.0.0.0/32,
		$ipBcast0    11.0.0.255/32,
		$ipNet0      11.0.0.0/24,
		$color0      1,
		
		$iface1      netmap:ns2veth1,
		$macAddr1    20:00:00:00:00:01,
		$ipAddr1     12.0.0.1,
		$ipNetHost1  12.0.0.0/32,
		$ipBcast1    12.0.0.255/32,
		$ipNet1      12.0.0.0/24,
		$color1      2,
		
		$gwIPAddr    12.0.0.2,
		$gwMACAddr   20:00:00:00:00:02,
		$gwPort      2,
		
		$queueSize   5000000,
		$mtuSize     9000,
		$burst       8,
		$io_method   NETMAP,
		
		$position    2,
		
		$lbIPAddr0   12.0.0.2,
		$lbIPAddr1   12.0.0.3
);

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass Router {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
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
	strip  :: Strip(14);

	// Mark IP header (necessary after Strip)
	markIPHeader :: MarkIPHeader;

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
		0.0.0.0/0 $gwPort
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
	in0 -> counter_rx0 -> strip;
	in1 -> counter_rx1 -> strip;

	// --> Way out
	etherEncap0 -> counter_tx0 -> queue0 -> out0;
	etherEncap1 -> counter_tx1 -> queue1 -> out1;

	// Get IP address for routing
	strip
		-> markIPHeader
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
		//-> IPPrint(Router, TTL true)
		-> [0]etherEncap0;

	lookUp[2]
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		//-> IPPrint(Router, TTL true)
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
router :: Router(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position
);
/////////////////////////////////////////////////////////////////////////////
