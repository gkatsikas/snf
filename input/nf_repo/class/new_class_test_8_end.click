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
	((dst port 5312) || (dst port 13995) || (dst port 14015) || (dst port 25482) || (dst port 41260)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.20.236/32) || (dst net 0.0.24.52/32) || (dst net 0.0.181.125/32) || (dst net 0.0.195.151/32) || (dst net 0.0.212.39/32))),
	((dst port 18491) || (dst port 18615) || (dst port 27687) || (dst port 50914) || (dst port 51372)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.68.235/32) || (dst net 1.0.99.206/32) || (dst net 1.0.177.51/32) || (dst net 1.0.242.148/32) || (dst net 1.0.243.194/32))),
	((dst port 8942) || (dst port 11592) || (dst port 26093) || (dst port 39389) || (dst port 53723)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.2.229/32) || (dst net 2.0.49.27/32) || (dst net 2.0.49.168/32) || (dst net 2.0.62.122/32) || (dst net 2.0.251.183/32))),
	((dst port 6661) || (dst port 14379) || (dst port 41598) || (dst port 45614) || (dst port 52087)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.40.97/32) || (dst net 3.0.59.205/32) || (dst net 3.0.65.214/32) || (dst net 3.0.212.16/32) || (dst net 3.0.252.235/32))),
	((dst port 7696) || (dst port 14877) || (dst port 20892) || (dst port 39205) || (dst port 45865)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.14.115/32) || (dst net 4.0.162.41/32) || (dst net 4.0.171.103/32) || (dst net 4.0.178.62/32) || (dst net 4.0.192.194/32))),
	((dst port 9374) || (dst port 10596) || (dst port 31807) || (dst port 46072) || (dst port 56377)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.84.101/32) || (dst net 5.0.134.177/32) || (dst net 5.0.141.206/32) || (dst net 5.0.150.135/32) || (dst net 5.0.195.57/32))),
	((dst port 20365) || (dst port 28236) || (dst port 33954) || (dst port 34639) || (dst port 38544)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.34.165/32) || (dst net 6.0.80.230/32) || (dst net 6.0.142.141/32) || (dst net 6.0.189.48/32) || (dst net 6.0.208.51/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;
getIPClas4 :: CycleCountAccum;
getIPClas5 :: CycleCountAccum;
getIPClas6 :: CycleCountAccum;
getIPClas7 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
	
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
