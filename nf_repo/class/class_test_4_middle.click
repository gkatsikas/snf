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
	((dst port 4833) || (dst port 5946) || (dst port 17442) || (dst port 32374) || (dst port 62114)) && ((dst net 4.0.0.0/18) || (dst net 4.0.64.0/20) || (dst net 4.0.80.0/24) || (dst net 4.0.81.0/25) || (dst net 4.0.81.128/27) || (dst net 4.0.81.160/29) || (dst net 4.0.81.168/30) || (dst net 4.0.81.173/32) || (dst net 4.0.81.174/31) || (dst net 4.0.81.176/28) || (dst net 4.0.81.192/26) || (dst net 4.0.82.0/23) || (dst net 4.0.84.0/22) || (dst net 4.0.88.0/21) || (dst net 4.0.96.0/19) || (dst net 4.0.128.0/24) || (dst net 4.0.129.0/27) || (dst net 4.0.129.32/29) || (dst net 4.0.129.40/32) || (dst net 4.0.129.42/31) || (dst net 4.0.129.44/30) || (dst net 4.0.129.48/28) || (dst net 4.0.129.64/26) || (dst net 4.0.129.128/25) || (dst net 4.0.130.0/23) || (dst net 4.0.132.0/27) || (dst net 4.0.132.32/29) || (dst net 4.0.132.40/30) || (dst net 4.0.132.45/32) || (dst net 4.0.132.46/31) || (dst net 4.0.132.48/28) || (dst net 4.0.132.64/26) || (dst net 4.0.132.128/25) || (dst net 4.0.133.0/24) || (dst net 4.0.134.0/23) || (dst net 4.0.136.0/21) || (dst net 4.0.144.0/20) || (dst net 4.0.160.0/19) || (dst net 4.0.192.0/19) || (dst net 4.0.224.0/22) || (dst net 4.0.228.0/23) || (dst net 4.0.230.0/24) || (dst net 4.0.231.0/25) || (dst net 4.0.231.128/28) || (dst net 4.0.231.144/29) || (dst net 4.0.231.152/32) || (dst net 4.0.231.154/31) || (dst net 4.0.231.156/30) || (dst net 4.0.231.160/27) || (dst net 4.0.231.192/26) || (dst net 4.0.232.0/21) || (dst net 4.0.240.0/21) || (dst net 4.0.248.0/22) || (dst net 4.0.252.0/25) || (dst net 4.0.252.128/28) || (dst net 4.0.252.144/30) || (dst net 4.0.252.148/31) || (dst net 4.0.252.151/32) || (dst net 4.0.252.152/29) || (dst net 4.0.252.160/27) || (dst net 4.0.252.192/26) || (dst net 4.0.253.0/24) || (dst net 4.0.254.0/23) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 3282) || (dst port 30438) || (dst port 49908) || (dst port 50477) || (dst port 61669)) && ((dst net 4.0.0.0/18) || (dst net 4.0.64.0/22) || (dst net 4.0.68.0/23) || (dst net 4.0.70.0/25) || (dst net 4.0.70.128/26) || (dst net 4.0.70.192/27) || (dst net 4.0.70.224/29) || (dst net 4.0.70.232/30) || (dst net 4.0.70.236/31) || (dst net 4.0.70.238/32) || (dst net 4.0.70.240/28) || (dst net 4.0.71.0/24) || (dst net 4.0.72.0/21) || (dst net 4.0.80.0/20) || (dst net 4.0.96.0/23) || (dst net 4.0.98.0/26) || (dst net 4.0.98.64/28) || (dst net 4.0.98.80/30) || (dst net 4.0.98.84/31) || (dst net 4.0.98.86/32) || (dst net 4.0.98.88/29) || (dst net 4.0.98.96/27) || (dst net 4.0.98.128/25) || (dst net 4.0.99.0/24) || (dst net 4.0.100.0/22) || (dst net 4.0.104.0/21) || (dst net 4.0.112.0/20) || (dst net 4.0.128.0/27) || (dst net 4.0.128.32/29) || (dst net 4.0.128.40/30) || (dst net 4.0.128.44/31) || (dst net 4.0.128.46/32) || (dst net 4.0.128.48/28) || (dst net 4.0.128.64/26) || (dst net 4.0.128.128/25) || (dst net 4.0.129.0/24) || (dst net 4.0.130.0/23) || (dst net 4.0.132.0/23) || (dst net 4.0.134.0/24) || (dst net 4.0.135.0/25) || (dst net 4.0.135.128/28) || (dst net 4.0.135.144/29) || (dst net 4.0.135.152/30) || (dst net 4.0.135.156/31) || (dst net 4.0.135.159/32) || (dst net 4.0.135.160/27) || (dst net 4.0.135.192/26) || (dst net 4.0.136.0/21) || (dst net 4.0.144.0/20) || (dst net 4.0.160.0/19) || (dst net 4.0.192.0/19) || (dst net 4.0.224.0/21) || (dst net 4.0.232.0/24) || (dst net 4.0.233.0/25) || (dst net 4.0.233.128/26) || (dst net 4.0.233.192/27) || (dst net 4.0.233.224/28) || (dst net 4.0.233.240/32) || (dst net 4.0.233.242/31) || (dst net 4.0.233.244/30) || (dst net 4.0.233.248/29) || (dst net 4.0.234.0/23) || (dst net 4.0.236.0/22) || (dst net 4.0.240.0/20) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 41259) || (dst port 47542) || (dst port 48250) || (dst port 58235) || (dst port 65502)) && ((dst net 4.0.0.0/22) || (dst net 4.0.4.0/29) || (dst net 4.0.4.8/30) || (dst net 4.0.4.12/31) || (dst net 4.0.4.14/32) || (dst net 4.0.4.16/28) || (dst net 4.0.4.32/27) || (dst net 4.0.4.64/26) || (dst net 4.0.4.128/25) || (dst net 4.0.5.0/24) || (dst net 4.0.6.0/23) || (dst net 4.0.8.0/21) || (dst net 4.0.16.0/20) || (dst net 4.0.32.0/28) || (dst net 4.0.32.16/29) || (dst net 4.0.32.25/32) || (dst net 4.0.32.26/31) || (dst net 4.0.32.28/30) || (dst net 4.0.32.32/27) || (dst net 4.0.32.64/26) || (dst net 4.0.32.128/25) || (dst net 4.0.33.0/24) || (dst net 4.0.34.0/23) || (dst net 4.0.36.0/22) || (dst net 4.0.40.0/21) || (dst net 4.0.48.0/20) || (dst net 4.0.64.0/18) || (dst net 4.0.128.0/19) || (dst net 4.0.160.0/20) || (dst net 4.0.176.0/27) || (dst net 4.0.176.32/28) || (dst net 4.0.176.48/29) || (dst net 4.0.176.56/30) || (dst net 4.0.176.60/31) || (dst net 4.0.176.62/32) || (dst net 4.0.176.64/26) || (dst net 4.0.176.128/25) || (dst net 4.0.177.0/24) || (dst net 4.0.178.0/23) || (dst net 4.0.180.0/22) || (dst net 4.0.184.0/21) || (dst net 4.0.192.0/20) || (dst net 4.0.208.0/23) || (dst net 4.0.210.0/24) || (dst net 4.0.211.0/25) || (dst net 4.0.211.128/26) || (dst net 4.0.211.192/27) || (dst net 4.0.211.224/29) || (dst net 4.0.211.232/30) || (dst net 4.0.211.236/32) || (dst net 4.0.211.238/31) || (dst net 4.0.211.240/28) || (dst net 4.0.212.0/22) || (dst net 4.0.216.0/22) || (dst net 4.0.220.0/23) || (dst net 4.0.222.0/26) || (dst net 4.0.222.64/30) || (dst net 4.0.222.68/31) || (dst net 4.0.222.70/32) || (dst net 4.0.222.72/29) || (dst net 4.0.222.80/28) || (dst net 4.0.222.96/27) || (dst net 4.0.222.128/25) || (dst net 4.0.223.0/24) || (dst net 4.0.224.0/19) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
	
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
