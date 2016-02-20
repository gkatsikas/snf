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
	((dst port 17650) || (dst port 27006) || (dst port 27224) || (dst port 55150) || (dst port 55443)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/20) || (dst net 4.0.48.0/21) || (dst net 4.0.56.0/23) || (dst net 4.0.58.0/24) || (dst net 4.0.59.0/25) || (dst net 4.0.59.128/27) || (dst net 4.0.59.160/28) || (dst net 4.0.59.176/31) || (dst net 4.0.59.178/32) || (dst net 4.0.59.180/30) || (dst net 4.0.59.184/29) || (dst net 4.0.59.192/26) || (dst net 4.0.60.0/22) || (dst net 4.0.64.0/21) || (dst net 4.0.72.0/22) || (dst net 4.0.76.0/23) || (dst net 4.0.78.0/26) || (dst net 4.0.78.64/27) || (dst net 4.0.78.96/29) || (dst net 4.0.78.104/31) || (dst net 4.0.78.106/32) || (dst net 4.0.78.108/30) || (dst net 4.0.78.112/28) || (dst net 4.0.78.128/25) || (dst net 4.0.79.0/24) || (dst net 4.0.80.0/21) || (dst net 4.0.88.0/24) || (dst net 4.0.89.0/25) || (dst net 4.0.89.128/26) || (dst net 4.0.89.192/28) || (dst net 4.0.89.208/29) || (dst net 4.0.89.216/30) || (dst net 4.0.89.221/32) || (dst net 4.0.89.222/31) || (dst net 4.0.89.224/27) || (dst net 4.0.90.0/23) || (dst net 4.0.92.0/22) || (dst net 4.0.96.0/19) || (dst net 4.0.128.0/23) || (dst net 4.0.130.0/24) || (dst net 4.0.131.0/26) || (dst net 4.0.131.64/27) || (dst net 4.0.131.96/30) || (dst net 4.0.131.100/31) || (dst net 4.0.131.103/32) || (dst net 4.0.131.104/29) || (dst net 4.0.131.112/28) || (dst net 4.0.131.128/25) || (dst net 4.0.132.0/22) || (dst net 4.0.136.0/21) || (dst net 4.0.144.0/22) || (dst net 4.0.148.0/23) || (dst net 4.0.150.0/24) || (dst net 4.0.151.0/26) || (dst net 4.0.151.64/28) || (dst net 4.0.151.80/30) || (dst net 4.0.151.85/32) || (dst net 4.0.151.86/31) || (dst net 4.0.151.88/29) || (dst net 4.0.151.96/27) || (dst net 4.0.151.128/25) || (dst net 4.0.152.0/21) || (dst net 4.0.160.0/19) || (dst net 4.0.192.0/18) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 2166) || (dst port 32669) || (dst port 35026) || (dst port 37465) || (dst port 52588)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/22) || (dst net 4.0.36.0/23) || (dst net 4.0.38.0/24) || (dst net 4.0.39.0/26) || (dst net 4.0.39.64/28) || (dst net 4.0.39.80/29) || (dst net 4.0.39.88/31) || (dst net 4.0.39.91/32) || (dst net 4.0.39.92/30) || (dst net 4.0.39.96/27) || (dst net 4.0.39.128/25) || (dst net 4.0.40.0/22) || (dst net 4.0.44.0/24) || (dst net 4.0.45.0/25) || (dst net 4.0.45.128/27) || (dst net 4.0.45.160/30) || (dst net 4.0.45.164/31) || (dst net 4.0.45.166/32) || (dst net 4.0.45.168/29) || (dst net 4.0.45.176/28) || (dst net 4.0.45.192/26) || (dst net 4.0.46.0/23) || (dst net 4.0.48.0/20) || (dst net 4.0.64.0/21) || (dst net 4.0.72.0/24) || (dst net 4.0.73.0/25) || (dst net 4.0.73.128/30) || (dst net 4.0.73.132/31) || (dst net 4.0.73.134/32) || (dst net 4.0.73.136/29) || (dst net 4.0.73.144/28) || (dst net 4.0.73.160/27) || (dst net 4.0.73.192/26) || (dst net 4.0.74.0/23) || (dst net 4.0.76.0/22) || (dst net 4.0.80.0/20) || (dst net 4.0.96.0/20) || (dst net 4.0.112.0/22) || (dst net 4.0.116.0/23) || (dst net 4.0.118.0/24) || (dst net 4.0.119.0/25) || (dst net 4.0.119.128/26) || (dst net 4.0.119.192/29) || (dst net 4.0.119.200/31) || (dst net 4.0.119.203/32) || (dst net 4.0.119.204/30) || (dst net 4.0.119.208/28) || (dst net 4.0.119.224/27) || (dst net 4.0.120.0/21) || (dst net 4.0.128.0/21) || (dst net 4.0.136.0/24) || (dst net 4.0.137.0/25) || (dst net 4.0.137.128/29) || (dst net 4.0.137.136/30) || (dst net 4.0.137.140/32) || (dst net 4.0.137.142/31) || (dst net 4.0.137.144/28) || (dst net 4.0.137.160/27) || (dst net 4.0.137.192/26) || (dst net 4.0.138.0/23) || (dst net 4.0.140.0/22) || (dst net 4.0.144.0/20) || (dst net 4.0.160.0/19) || (dst net 4.0.192.0/18) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 8547) || (dst port 10470) || (dst port 13943) || (dst port 46840) || (dst port 55185)) && ((dst net 4.0.0.0/17) || (dst net 4.0.128.0/21) || (dst net 4.0.136.0/22) || (dst net 4.0.140.0/24) || (dst net 4.0.141.0/25) || (dst net 4.0.141.128/26) || (dst net 4.0.141.192/27) || (dst net 4.0.141.224/28) || (dst net 4.0.141.240/29) || (dst net 4.0.141.248/31) || (dst net 4.0.141.251/32) || (dst net 4.0.141.252/30) || (dst net 4.0.142.0/23) || (dst net 4.0.144.0/21) || (dst net 4.0.152.0/22) || (dst net 4.0.156.0/23) || (dst net 4.0.158.0/24) || (dst net 4.0.159.0/25) || (dst net 4.0.159.128/26) || (dst net 4.0.159.192/27) || (dst net 4.0.159.224/28) || (dst net 4.0.159.240/30) || (dst net 4.0.159.244/31) || (dst net 4.0.159.246/32) || (dst net 4.0.159.248/29) || (dst net 4.0.160.0/20) || (dst net 4.0.176.0/21) || (dst net 4.0.184.0/22) || (dst net 4.0.188.0/23) || (dst net 4.0.190.0/24) || (dst net 4.0.191.0/25) || (dst net 4.0.191.128/28) || (dst net 4.0.191.144/32) || (dst net 4.0.191.146/31) || (dst net 4.0.191.148/30) || (dst net 4.0.191.152/29) || (dst net 4.0.191.160/27) || (dst net 4.0.191.192/26) || (dst net 4.0.192.0/19) || (dst net 4.0.224.0/22) || (dst net 4.0.228.0/29) || (dst net 4.0.228.8/32) || (dst net 4.0.228.10/31) || (dst net 4.0.228.12/30) || (dst net 4.0.228.16/28) || (dst net 4.0.228.32/27) || (dst net 4.0.228.64/26) || (dst net 4.0.228.128/25) || (dst net 4.0.229.0/24) || (dst net 4.0.230.0/23) || (dst net 4.0.232.0/21) || (dst net 4.0.240.0/22) || (dst net 4.0.244.0/25) || (dst net 4.0.244.128/28) || (dst net 4.0.244.144/30) || (dst net 4.0.244.149/32) || (dst net 4.0.244.150/31) || (dst net 4.0.244.152/29) || (dst net 4.0.244.160/27) || (dst net 4.0.244.192/26) || (dst net 4.0.245.0/24) || (dst net 4.0.246.0/23) || (dst net 4.0.248.0/21) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
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
