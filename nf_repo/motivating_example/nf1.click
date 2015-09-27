define(
		$iface0      netmap:nf1veth0,
		$macAddr0    10:00:00:00:00:01,
		$ipAddr0     10.0.0.1,
		$ipNetHost0  10.0.0.0/32,
		$ipBcast0    10.0.0.255/32,
		$ipNet0      10.0.0.0/24,
		$color0      1,
		
		$iface1      netmap:nf1veth1,
		$macAddr1    10:00:00:00:00:01,
		$ipAddr1     11.0.0.1,
		$ipNetHost1  11.0.0.0/32,
		$ipBcast1    11.0.0.255/32,
		$ipNet1      11.0.0.0/24,
		$color1      2,
		
		$gwIPAddr    11.0.0.2,
		$gwMACAddr   10:00:00:00:00:02,
		$gwPort      2,
		
		$queueSize   2000000,
		$mtuSize     9000,
		$burst       32,
		$io_method   NETMAP,
		
		$position    1,
		
		$lbIPAddr0   11.0.0.2,
		$lbIPAddr1   11.0.0.3
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
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, SNAPLEN $mtuSize, METHOD $io_method, SNIFFER false);
	out :: ToDevice  ($iface1, METHOD $io_method);
	
	// EtherEncap because we always send to one gw
	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check IP header
	markIPHeader :: MarkIPHeader;

	// IPClassifier
	ipClassifier :: IPClassifier(
		ip proto 17,
		ip proto 6,
		-
	);

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
		200.0.0.2    2
	);

	// Implements PNAT
	ipRewriter :: IPRewriter(
		pattern $ipAddr1 - - - 0 0,   /* Outbound UDP Packets change src IP */
		pattern $ipAddr1 - - - 0 0,   /* Outbound TCP Packets change src IP */
		drop                          /* Drop the rest */
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
	// Input
	in -> counter_rx0 -> strip;

	// Output
	etherEncap -> counter_tx1 -> queue -> out;

	// Outbound packets go to Classifier
	strip
		-> markIPHeader
		-> [0]ipClassifier;

	// UDP
	ipClassifier[0]
		//-> IPPrint(UDP)
		-> [0]ipRewriter;

	// TCP
	ipClassifier[1]
		//-> IPPrint(TCP)
		-> [1]ipRewriter;

	// Rest
	ipClassifier[2]
		//-> IPPrint(Drop)
		-> [2]ipRewriter;

	// Rewrite IP address for routing
	ipRewriter
		-> GetIPAddress(16)
		-> [0]lookUp;

	// Packets for this machine
	lookUp[0]
		-> Discard;

	// Routed through local ifaces
	lookUp[1]
		-> Discard;

	lookUp[2]
		-> DropBroadcasts
		-> FixIPSrc($ipAddr1)
		-> decTTL[0]
		-> fragIP[0]
		//-> IPPrint(SNAPT, TTL true)
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
napt :: NAPT(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method,
	$position
);
/////////////////////////////////////////////////////////////////////////////
