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
elementclass LoadBalancer {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position, $lbIPAddr0, $lbIPAddr1 |

	// Queues
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, BURST $burst, SNAPLEN $mtuSize, PROMISC true, METHOD $io_method, SNIFFER false);
	out :: ToDevice  ($iface1, BURST $burst, METHOD $io_method);

	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Implements Round Robin Load Balancing across 2 servers
	lb :: RoundRobinIPMapper(
		- - $gwIPAddr - 0 0,
		- - $lbIPAddr1 - 0 0
	);

	// Implements the LB
	ipRewriter :: IPRewriter(
		lb
	);

	// Strip Ethernet header
	strip :: Strip(14);

	// Strip Ethernet header
	markIPHeader :: MarkIPHeader;

	// Decrement IP TTL field
	decTTL :: DecIPTTL;

	// Fragment packets
	fragIP :: IPFragmenter($mtuSize);

	// Packet & Rate Counters
	counter_rx0 :: AverageCounter;
	counter_tx1 :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input/Output
	in -> counter_rx0 -> strip;
	etherEncap -> counter_tx1 -> queue -> out;

	// Processing
	strip
		-> markIPHeader
		-> [0]ipRewriter[0]
		-> decTTL[0]
		-> fragIP[0]
		//-> IPPrint(L4-LB, TTL true)
		-> [0]etherEncap;
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
load_balancer :: LoadBalancer(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position, $lbIPAddr0, $lbIPAddr1
);
/////////////////////////////////////////////////////////////////////////////
