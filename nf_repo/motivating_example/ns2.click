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
		
		$queueSize   2000000,
		$mtuSize     9000,
		$burst       32,
		$io_method   NETMAP,
		
		$position    2,
		
		$lbIPAddr0   12.0.0.2,
		$lbIPAddr1   12.0.0.3
);

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass Firewall {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position |

	// Queues
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, BURST $burst, SNAPLEN $mtuSize, METHOD $io_method, SNIFFER false);
	out :: ToDevice  ($iface1, BURST $burst, METHOD $io_method);

	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check Ethernet header
	markIPHeader :: MarkIPHeader;

	// The module that turns this router into L3 firewall
	filter :: IPFilter(
		allow src net $ipNet0 && ip proto 17,
		drop all
	);

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

	// Get IP address for routing
	strip
		-> markIPHeader
		-> filter
		-> decTTL[0]
		-> fragIP[0]
		//-> IPPrint(L3-FW, TTL true)
		-> [0]etherEncap;

	// Discarded by firewall
	filter[1] -> Discard;
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
firewall :: Firewall(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position
);
/////////////////////////////////////////////////////////////////////////////
