/////////////////////////////////////////////////////////////////////////////
// Configuration
define(
	$iface0      em4,
	$macAddr0    ec:f4:bb:d5:fe:d5,
	$ipAddr0     100.0.0.1,
	$ipNetHost0  100.0.0.0/32,
	$ipBcast0    100.0.0.255/32,
	$ipNet0      100.0.0.0/24,
	$color0      1,

	$iface1      eth0,
	$macAddr1    00:60:6e:d5:8a:b8,
	$ipAddr1     200.0.0.1,
	$ipNetHost1  200.0.0.0/32,
	$ipBcast1    200.0.0.255/32,
	$ipNet1      200.0.0.0/24,
	$color1      2,

	$gwIPAddr    200.0.0.2,
	$gwMACAddr   00:00:00:00:00:04,
	$gwPort      2,

	$queueSize   1000000,
	$mtuSize     9000,
	$burst       8
);
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Elements
elementclass IPClassifierBench {
	// Module's arguments
	$iface0, $macAddr0,  $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1,  $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method |

	// Queues
	queue :: Queue($queueSize);

	// Module's I/O
	in  :: FromDevice($iface0, BURST $burst);
	out :: ToDevice  ($iface1, BURST $burst);
	
	// ARP Querier
	etherEncap :: EtherEncap(0x0800, $macAddr1, $gwMACAddr);

	// Strip Ethernet header
	strip :: Strip(14);

	// Check IP header's integrity
	markIPHeader :: MarkIPHeader;

	// Measure the incoming pkt rate
	getRate :: AverageCounter;

	/////////////////////////////////////////////////////////////////////
	// Interface's pipeline
	/////////////////////////////////////////////////////////////////////
	// Input
	in -> getRate -> strip;

	// Output
	Idle -> etherEncap -> queue -> out;

	ipclassifier :: IPClassifier(
		((dst port 504) || (dst port 4380) || (dst port 25128) || (dst port 34715) || (dst port 43985)) && ((dst net 2.0.0.0/21) || (dst net 2.0.8.0/25) || (dst net 2.0.8.128/26) || (dst net 2.0.8.192/28) || (dst net 2.0.8.208/29) || (dst net 2.0.8.216/32) || (dst net 2.0.8.218/31) || (dst net 2.0.8.220/30) || (dst net 2.0.8.224/27) || (dst net 2.0.9.0/24) || (dst net 2.0.10.0/23) || (dst net 2.0.12.0/24) || (dst net 2.0.13.0/25) || (dst net 2.0.13.128/27) || (dst net 2.0.13.160/29) || (dst net 2.0.13.168/30) || (dst net 2.0.13.172/31) || (dst net 2.0.13.174/32) || (dst net 2.0.13.176/28) || (dst net 2.0.13.192/26) || (dst net 2.0.14.0/23) || (dst net 2.0.16.0/20) || (dst net 2.0.32.0/19) || (dst net 2.0.64.0/19) || (dst net 2.0.96.0/23) || (dst net 2.0.98.0/27) || (dst net 2.0.98.32/29) || (dst net 2.0.98.40/30) || (dst net 2.0.98.44/32) || (dst net 2.0.98.46/31) || (dst net 2.0.98.48/28) || (dst net 2.0.98.64/26) || (dst net 2.0.98.128/25) || (dst net 2.0.99.0/24) || (dst net 2.0.100.0/22) || (dst net 2.0.104.0/21) || (dst net 2.0.112.0/20) || (dst net 2.0.128.0/22) || (dst net 2.0.132.0/25) || (dst net 2.0.132.128/26) || (dst net 2.0.132.192/27) || (dst net 2.0.132.224/28) || (dst net 2.0.132.240/29) || (dst net 2.0.132.248/32) || (dst net 2.0.132.250/31) || (dst net 2.0.132.252/30) || (dst net 2.0.133.0/24) || (dst net 2.0.134.0/23) || (dst net 2.0.136.0/21) || (dst net 2.0.144.0/20) || (dst net 2.0.160.0/19) || (dst net 2.0.192.0/20) || (dst net 2.0.208.0/22) || (dst net 2.0.212.0/25) || (dst net 2.0.212.128/27) || (dst net 2.0.212.160/28) || (dst net 2.0.212.176/29) || (dst net 2.0.212.184/31) || (dst net 2.0.212.186/32) || (dst net 2.0.212.188/30) || (dst net 2.0.212.192/26) || (dst net 2.0.213.0/24) || (dst net 2.0.214.0/23) || (dst net 2.0.216.0/21) || (dst net 2.0.224.0/19) || (dst net 2.1.0.0/16) || (dst net 2.2.0.0/15) || (dst net 2.4.0.0/14) || (dst net 2.8.0.0/13) || (dst net 2.16.0.0/12) || (dst net 2.32.0.0/11) || (dst net 2.64.0.0/10) || (dst net 2.128.0.0/9)),
		((dst port 6027) || (dst port 27263) || (dst port 34533) || (dst port 42856) || (dst port 45954)) && ((dst net 2.0.0.0/18) || (dst net 2.0.64.0/19) || (dst net 2.0.96.0/21) || (dst net 2.0.104.0/23) || (dst net 2.0.106.0/25) || (dst net 2.0.106.128/26) || (dst net 2.0.106.192/27) || (dst net 2.0.106.224/32) || (dst net 2.0.106.226/31) || (dst net 2.0.106.228/30) || (dst net 2.0.106.232/29) || (dst net 2.0.106.240/28) || (dst net 2.0.107.0/24) || (dst net 2.0.108.0/22) || (dst net 2.0.112.0/20) || (dst net 2.0.128.0/20) || (dst net 2.0.144.0/22) || (dst net 2.0.148.0/23) || (dst net 2.0.150.0/25) || (dst net 2.0.150.128/26) || (dst net 2.0.150.192/29) || (dst net 2.0.150.201/32) || (dst net 2.0.150.202/31) || (dst net 2.0.150.204/30) || (dst net 2.0.150.208/28) || (dst net 2.0.150.224/27) || (dst net 2.0.151.0/24) || (dst net 2.0.152.0/21) || (dst net 2.0.160.0/21) || (dst net 2.0.168.0/22) || (dst net 2.0.172.0/23) || (dst net 2.0.174.0/24) || (dst net 2.0.175.0/25) || (dst net 2.0.175.128/26) || (dst net 2.0.175.192/28) || (dst net 2.0.175.208/32) || (dst net 2.0.175.210/31) || (dst net 2.0.175.212/30) || (dst net 2.0.175.216/29) || (dst net 2.0.175.224/27) || (dst net 2.0.176.0/20) || (dst net 2.0.192.0/20) || (dst net 2.0.208.0/21) || (dst net 2.0.216.0/25) || (dst net 2.0.216.128/27) || (dst net 2.0.216.161/32) || (dst net 2.0.216.162/31) || (dst net 2.0.216.164/30) || (dst net 2.0.216.168/29) || (dst net 2.0.216.176/28) || (dst net 2.0.216.192/26) || (dst net 2.0.217.0/24) || (dst net 2.0.218.0/23) || (dst net 2.0.220.0/22) || (dst net 2.0.224.0/21) || (dst net 2.0.232.0/22) || (dst net 2.0.236.0/23) || (dst net 2.0.238.0/27) || (dst net 2.0.238.32/28) || (dst net 2.0.238.48/31) || (dst net 2.0.238.51/32) || (dst net 2.0.238.52/30) || (dst net 2.0.238.56/29) || (dst net 2.0.238.64/26) || (dst net 2.0.238.128/25) || (dst net 2.0.239.0/24) || (dst net 2.0.240.0/20) || (dst net 2.1.0.0/16) || (dst net 2.2.0.0/15) || (dst net 2.4.0.0/14) || (dst net 2.8.0.0/13) || (dst net 2.16.0.0/12) || (dst net 2.32.0.0/11) || (dst net 2.64.0.0/10) || (dst net 2.128.0.0/9)),
	);

	// Performance Testers
	setIPClas :: SetCycleCount;
	getIPClas0 :: CycleCountAccum;
	getIPClas1 :: CycleCountAccum;

	strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

	ipclassifier[0] -> getIPClas0 -> Discard ();
	ipclassifier[1] -> getIPClas1 -> Discard ();
	
}
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Scenario
/////////////////////////////////////////////////////////////////////////////
ipclassifier :: IPClassifierBench(
	$iface0, $macAddr0, $ipAddr0, $ipNetHost0, $ipBcast0, $ipNet0, $color0,
	$iface1, $macAddr1, $ipAddr1, $ipNetHost1, $ipBcast1, $ipNet1, $color1,
	$gwIPAddr, $gwMACAddr, $gwPort, $queueSize, $mtuSize, $burst, $io_method
);
/////////////////////////////////////////////////////////////////////////////
