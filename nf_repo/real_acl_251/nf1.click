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
elementclass Firewall {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
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

	// The module that turns this router into L3 firewall
	filter :: IPFilter(
		drop   src net 10.0.0.0/8,
		drop   src net 172.16.0.0/12,
		drop   src net 192.168.0.0/16,
		allow  udp && dst port 13,
		allow  tcp && dst port 37,
		allow  udp && dst port 37,
		allow  udp && dst port 67,
		allow  tcp && dst port 113,
		allow  udp && dst port 138,
		allow  udp && dst port 53,
		allow  udp && src port 53,
		allow  udp && src port > 1024 && dst port > 33434 && dst port < 33600,
		allow  udp && src port > 33434 && src port < 33600 && dst port > 1024,
		allow  dst net 204.152.184.87/32 && tcp && dst port 22,
		allow  dst net 204.152.184.88/32 && tcp && dst port 22,
		allow  dst net 204.152.184.89/32 && tcp && dst port 22,
		allow  dst net 204.152.184.90/32 && tcp && dst port 22,
		allow  dst net 204.152.184.251/32 && tcp && dst port 22,
		allow  dst net 204.152.184.252/32 && tcp && dst port 22,
		allow  dst net 16.1.0.4/32 && udp && dst port 123,
		allow  src net 16.1.0.4/32 && udp && src port 123,
		allow  dst net 204.123.2.5/32 && udp && dst port 123,
		allow  src net 204.123.2.5/32 && udp && src port 123,
		allow  dst net 204.152.184.74/32 && tcp && dst port 25,
		allow  dst net 204.152.184.74/32 && tcp && dst port 80,
		allow  dst net 204.152.184.134/32 && tcp && dst port 22,
		allow  dst net 204.152.184.134/32 && tcp && dst port 25,
		allow  dst net 204.152.184.134/32 && udp && dst port 53,
		allow  src net 204.152.184.134/32 && udp && src port 53,
		allow  dst net 204.152.184.134/32 && tcp && dst port 53,
		allow  dst net 204.152.184.28/32 && tcp && dst port 179,
		allow  dst net 204.152.184.134/32 && tcp && dst port 544,
		allow  dst net 204.152.184.134/32 && tcp && dst port 2105,
		allow  src net 204.152.184.134/32 && dst net 204.152.184.0/21 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.187.35/32 && udp && dst port 88,
		allow  src net 204.152.187.35/32 && udp && src port 88,
		allow  dst net 204.152.187.35/32 && udp && dst port 123,
		allow  src net 204.152.187.35/32 && udp && src port 123,
		allow  dst net 204.152.187.35/32 && udp && dst port 750,
		allow  src net 204.152.187.35/32 && udp && src port 750,
		allow  dst net 204.152.188.19/32 && udp && dst port 88,
		allow  src net 204.152.188.19/32 && udp && src port 88,
		allow  dst net 204.152.188.19/32 && udp && dst port 123,
		allow  src net 204.152.188.19/32 && udp && src port 123,
		allow  dst net 204.152.188.19/32 && udp && dst port 750,
		allow  src net 204.152.188.19/32 && udp && src port 750,
		allow  dst net 204.152.184.130/32 && udp && dst port 88,
		allow  src net 204.152.184.130/32 && udp && src port 88,
		allow  dst net 204.152.184.130/32 && udp && dst port 123,
		allow  src net 204.152.184.130/32 && udp && src port 123,
		allow  dst net 204.152.184.130/32 && udp && dst port 750,
		allow  src net 204.152.184.130/32 && udp && src port 750,
		allow  dst net 204.152.184.130/32 && tcp && dst port 754,
		allow  src net 204.152.187.35/32 && dst net 204.152.184.130/32 && tcp && dst port 22,
		allow  dst net 204.152.184.182/32 && udp && dst port 123,
		allow  src net 204.152.184.182/32 && udp && src port 123,
		allow  dst net 204.152.184.182/32 && tcp && dst port 22,
		allow  dst net 204.152.184.182/32 && tcp && dst port 25,
		allow  dst net 204.152.184.182/32 && tcp && dst port 544,
		allow  dst net 204.152.184.182/32 && tcp && dst port 2105,
		allow  src net 204.152.184.182/32 && dst net 204.152.184.0/21 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.37/32 && tcp && dst port 25,
		allow  dst net 204.152.184.37/32 && udp && dst port 53,
		allow  src net 204.152.184.37/32 && udp && src port 53,
		allow  dst net 204.152.184.37/32 && tcp && dst port 53,
		allow  dst net 204.152.184.37/32 && tcp && dst port 80,
		allow  dst net 204.152.184.37/32 && tcp && dst port 119,
		allow  dst net 204.152.184.37/32 && udp && src port > 1024 && dst port 750,
		allow  src net 204.152.184.37/32 && udp && src port 750 && dst port > 1024,
		allow  dst net 204.152.184.37/32 && tcp && dst port 22,
		allow  dst net 204.152.184.37/32 && tcp && dst port 544,
		allow  dst net 204.152.184.37/32 && tcp && dst port 754,
		allow  dst net 204.152.184.37/32 && tcp && dst port 2105,
		allow  src net 204.152.184.37/32 && dst net 204.152.184.0/21 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.33/32 && tcp && dst port 21,
		allow  dst net 204.152.184.33/32 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.33/32 && tcp && dst port 22,
		allow  dst net 204.152.184.33/32 && tcp && dst port 25,
		allow  dst net 204.152.184.33/32 && udp && dst port 53,
		allow  src net 204.152.184.33/32 && udp && src port 53,
		allow  dst net 204.152.184.33/32 && tcp && dst port 53,
		allow  dst net 204.152.184.33/32 && tcp && dst port 80,
		allow  dst net 204.152.184.33/32 && tcp && dst port 119,
		allow  dst net 204.152.184.33/32 && tcp && dst port 544,
		allow  dst net 204.152.184.33/32 && tcp && dst port 2105,
		allow  src net 204.152.184.33/32 && dst net 204.152.184.0/21 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.34/32 && tcp && dst port 22,
		allow  dst net 204.152.184.34/32 && tcp && dst port 25,
		allow  dst net 204.152.184.34/32 && tcp && dst port 80,
		allow  dst net 204.152.184.34/32 && tcp && dst port 119,
		allow  dst net 204.152.184.34/32 && tcp && dst port 544,
		allow  dst net 204.152.184.34/32 && tcp && dst port 1999,
		allow  dst net 204.152.184.34/32 && tcp && dst port 2105,
		allow  dst net 204.152.184.34/32 && tcp && dst port 2401,
		allow  dst net 204.152.184.34/32 && tcp && dst port 5999,
		allow  src net 204.152.184.34/32 && dst net 204.152.184.0/21 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.70/32 && tcp && dst port 25,
		allow  dst net 204.152.184.72/32 && udp && dst port 123,
		allow  src net 204.152.184.72/32 && udp && src port 123,
		allow  dst net 204.152.184.101/32 && tcp && dst port 80,
		allow  dst net 204.152.184.101/32 && tcp && dst port 443,
		allow  dst net 204.152.184.103/32 && tcp && dst port 80,
		allow  dst net 204.152.184.103/32 && tcp && dst port 443,
		allow  dst net 204.152.184.64/32 && udp && dst port 53,
		allow  src net 204.152.184.64/32 && udp && src port 53,
		allow  dst net 204.152.184.64/32 && tcp && dst port 53,
		allow  dst net 204.152.184.73/32 && tcp && dst port 80,
		allow  dst net 204.152.184.81/32 && tcp && dst port 80,
		allow  dst net 204.152.185.33/32 && tcp && dst port 22,
		allow  dst net 204.152.185.33/32 && tcp && dst port 23,
		allow  dst net 204.152.185.33/32 && tcp && dst port 25,
		allow  dst net 204.152.184.75/32 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.75/32 && tcp && dst port 21,
		allow  dst net 204.152.184.75/32 && tcp && dst port 22,
		allow  dst net 204.152.184.75/32 && tcp && dst port 25,
		allow  dst net 204.152.184.75/32 && tcp && dst port 871,
		allow  dst net 204.152.184.75/32 && tcp && dst port 879,
		allow  dst net 204.152.184.75/32 && tcp && dst port 7326,
		allow  dst net 204.152.184.75/32 && udp && dst port 123,
		allow  src net 204.152.184.75/32 && udp && src port 123,
		allow  dst net 204.152.184.77/32 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.184.77/32 && tcp && dst port 21,
		allow  dst net 204.152.184.77/32 && tcp && dst port 22,
		allow  dst net 204.152.184.77/32 && tcp && dst port 25,
		allow  dst net 204.152.184.77/32 && tcp && dst port 80,
		allow  dst net 204.152.184.77/32 && udp && dst port 53,
		allow  src net 204.152.184.77/32 && udp && src port 53,
		allow  dst net 204.152.184.77/32 && tcp && dst port 53,
		allow  dst net 204.152.184.77/32 && tcp && dst port 873,
		allow  dst net 204.152.184.77/32 && tcp && dst port 1999,
		allow  dst net 204.152.184.77/32 && tcp && dst port 5998,
		allow  dst net 204.152.184.77/32 && tcp && dst port 5999,
		allow  dst net 204.152.184.77/32 && tcp && dst port 8080,
		allow  dst net 204.152.184.77/32 && udp && src port > 1024 && dst port 750,
		allow  src net 204.152.184.77/32 && udp && src port 750 && dst port > 1024,
		allow  dst net 204.152.188.96/27 && tcp && dst port 22,
		allow  dst net 204.152.188.98/32 && tcp && dst port 25,
		allow  dst net 204.152.188.105/32 && tcp && dst port 25,
		allow  dst net 204.152.188.98/32 && tcp && dst port 53,
		allow  dst net 204.152.188.98/32 && udp && dst port 53,
		allow  dst net 204.152.188.98/32 && tcp && dst port 80,
		allow  src net 204.152.188.98/32 && udp && dst port 161,
		allow  dst net 204.152.188.98/32 && udp && src port 161,
		allow  dst net 204.152.188.98/32 && udp && dst port 162,
		allow  src net 204.152.188.98/32 && udp && src port 162,
		allow  dst net 204.152.188.98/32 && tcp && dst port 443,
		allow  dst net 204.152.188.66/32 && tcp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.188.66/32 && tcp && dst port 21,
		allow  dst net 204.152.188.66/32 && tcp && dst port 22,
		allow  dst net 204.152.188.68/32 && tcp && dst port 22,
		allow  dst net 204.152.188.66/32 && tcp && dst port 25,
		allow  dst net 204.152.188.68/32 && tcp && dst port 25,
		allow  dst net 204.152.188.66/32 && udp && dst port 53,
		allow  src net 204.152.188.66/32 && udp && src port 53,
		allow  dst net 204.152.188.66/32 && tcp && dst port 53,
		allow  dst net 204.152.188.66/32 && tcp && dst port 80,
		allow  dst net 204.152.188.68/32 && tcp && dst port 80,
		allow  dst net 204.152.188.70/32 && tcp && dst port 80,
		allow  dst net 204.152.188.71/32 && tcp && dst port 80,
		allow  dst net 204.152.188.66/32 && tcp && dst port 110,
		allow  src net 192.246.108.4/32 && dst net 204.152.188.83/32 && tcp && dst port 23,
		allow  src net 204.152.188.64/28 && dst net 204.152.188.80/28 && udp && src port 67 && dst port 67,
		allow  src net 204.152.188.80/28 && dst net 204.152.188.64/28 && udp && src port 67 && dst port 67,
		allow  dst net 204.152.184.70/32 && tcp && dst port 80,
		allow  dst net 204.152.188.193/32 && tcp && dst port 22,
		allow  dst net 204.152.188.193/32 && tcp && dst port 25,
		allow  dst net 204.152.188.193/32 && tcp && dst port 80,
		allow  dst net 204.152.188.193/32 && tcp && dst port 443,
		allow  dst net 204.152.188.194/32 && tcp && dst port 22,
		allow  dst net 204.152.188.194/32 && tcp && dst port 25,
		allow  dst net 204.152.188.194/32 && tcp && dst port 110,
		allow  dst net 204.152.188.194/32 && tcp && dst port 143,
		allow  dst net 204.152.188.195/32 && tcp && dst port 22,
		allow  dst net 204.152.188.195/32 && udp && dst port 53,
		allow  src net 204.152.188.195/32 && udp && src port 53,
		allow  dst net 204.152.188.195/32 && tcp && dst port 53,
		allow  dst net 204.152.188.196/32 && tcp && dst port 22,
		allow  dst net 204.152.188.196/32 && tcp && dst port 80,
		allow  dst net 204.152.188.198/32 && tcp && dst port 22,
		allow  dst net 204.152.188.198/32 && tcp && dst port 80,
		allow  dst net 204.152.188.199/32 && tcp && dst port 21,
		allow  dst net 204.152.188.199/32 && tcp && dst port 22,
		allow  dst net 204.152.188.199/32 && tcp && dst port 110,
		allow  dst net 204.152.188.202/32 && tcp && dst port 179,
		allow  dst net 204.152.188.233/32 && udp && src port 7648 && dst port 7648,
		allow  src net 204.152.188.233/32 && udp && src port 7648 && dst port 7648,
		allow  dst net 204.152.188.233/32 && udp && src port 24032 && dst port 24032,
		allow  src net 204.152.188.233/32 && udp && src port 24032 && dst port 24032,
		allow  dst net 204.152.188.233/32 && tcp && dst port 7648,
		allow  dst net 204.152.188.233/32 && tcp && dst port 7649,
		allow  dst net 204.152.188.234/32 && tcp && dst port 22,
		allow  dst net 204.152.188.235/32 && tcp && dst port 22,
		allow  src net 204.152.188.200/32 && udp && dst port 161,
		allow  dst net 204.152.188.200/32 && udp && src port 161,
		allow  src net 204.152.188.225/32 && udp && dst port 161,
		allow  dst net 204.152.188.225/32 && udp && src port 161,
		allow  src net 204.152.188.200/32 && dst net 204.152.184.85/32 && tcp && dst port 23,
		allow  src net 204.152.188.200/32 && dst net 204.152.184.98/32 && tcp && dst port 23,
		allow  src net 204.152.188.192/26 && dst net 204.152.184.0/21 && tcp && dst port 22,
		allow  src net 204.152.188.200/32 && dst net 198.32.176.6/32 && udp && src port 69 && dst port > 1024,
		allow  src net 198.32.176.6/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port 69,
		allow  src net 204.152.188.200/32 && dst net 198.32.176.6/32 && udp && src port > 1024 && dst port > 1024,
		allow  src net 198.32.176.6/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port > 1024,
		allow  src net 204.152.188.200/32 && dst net 204.152.186.20/32 && udp && src port 69 && dst port > 1024,
		allow  src net 204.152.186.20/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port 69,
		allow  src net 204.152.188.200/32 && dst net 204.152.186.20/32 && udp && src port > 1024 && dst port > 1024,
		allow  src net 204.152.186.20/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port > 1024,
		allow  src net 204.152.188.200/32 && dst net 207.159.9.118/32 && udp && src port 69 && dst port > 1024,
		allow  src net 207.159.9.118/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port 69,
		allow  src net 204.152.188.200/32 && dst net 207.159.9.118/32 && udp && src port > 1024 && dst port > 1024,
		allow  src net 207.159.9.118/32 && dst net 204.152.188.200/32 && udp && src port > 1024 && dst port > 1024,
		allow  dst net 204.152.188.200/32 && udp && dst port 2055,
		allow  dst net 204.152.185.13/32 && udp && dst port 123,
		allow  src net 204.152.185.13/32 && udp && src port 123,
		allow  dst net 204.152.185.1/32 && tcp && dst port 22,
		allow  dst net 204.152.185.2/32 && tcp && dst port 22,
		allow  tcp,
		allow  src net 204.152.184.64/32 && tcp,
		allow  src net 204.152.184.70/32 && tcp,
		allow  src net 204.152.184.72/32 && tcp,
		allow  src net 204.152.184.74/32 && tcp,
		allow  src net 204.152.184.75/32 && tcp,
		allow  src net 204.152.184.77/32 && tcp,
		allow  src net 204.152.184.86/32 && tcp,
		allow  src net 204.152.184.90/32 && tcp,
		allow  src net 204.152.184.130/32 && tcp,
		allow  src net 204.152.184.134/32 && tcp,
		allow  src net 204.152.184.182/32 && tcp,
		allow  src net 204.152.184.16/29 && tcp,
		allow  src net 204.152.184.24/29 && tcp,
		allow  src net 204.152.184.32/27 && tcp,
		allow  src net 204.152.184.136/30 && tcp,
		allow  src net 204.152.184.148/30 && tcp,
		allow  src net 204.152.184.160/30 && tcp,
		allow  src net 204.152.184.172/30 && tcp,
		allow  src net 204.152.184.176/30 && tcp,
		allow  src net 204.152.185.0/27 && tcp,
		allow  src net 204.152.185.32/28 && tcp,
		allow  src net 204.152.188.96/27 && tcp,
		allow  src net 204.152.188.128/28 && tcp,
		allow  src net 204.152.188.160/27 && tcp,
		allow  src net 204.152.188.192/26 && tcp,
		allow  udp && dst port 137,
		allow  udp && dst port 139,
		allow  dst net 204.152.184.33/32 && udp && dst port 123,
		allow  dst net 204.152.184.34/32 && udp && dst port 123,
		allow  dst net 204.152.184.37/32 && udp && dst port 123,
		allow  dst net 204.152.184.134/32 && tcp,
		allow  udp && dst port 161,
		allow  udp && src port 161,
		drop
	);

	// Strip Ethernet header
	strip  :: Strip(14);

	// Mark IP header (necessary after Strip)
	markIPHeader :: MarkIPHeader;

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
	in0 -> counter_rx0 -> strip;

	// --> Way out
	etherEncap1 -> counter_tx1 -> queue1 -> out1;

	// Get IP address for routing
	strip
		-> markIPHeader
		-> filter
		-> DropBroadcasts
		-> ipOpt1[0]
		-> fixIP1
		-> decTTL1[0]
		-> fragIP1[0]
		//-> IPPrint(FW, TTL true)
		-> [0]etherEncap1;

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
