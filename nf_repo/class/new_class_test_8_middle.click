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
	((dst port 28792) || (dst port 30294) || (dst port 41468) || (dst port 54049) || (dst port 62350)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.120.165/32) || (dst net 0.0.129.135/32) || (dst net 0.0.153.180/32) || (dst net 0.0.193.128/32) || (dst net 0.0.209.77/32))),
	((dst port 6778) || (dst port 18961) || (dst port 27134) || (dst port 33715) || (dst port 35221)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.176.98/32) || (dst net 1.0.179.197/32) || (dst net 1.0.217.238/32) || (dst net 1.0.244.86/32) || (dst net 1.0.252.183/32))),
	((dst port 1251) || (dst port 46304) || (dst port 46901) || (dst port 48610) || (dst port 52477)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.112.167/32) || (dst net 2.0.147.164/32) || (dst net 2.0.186.210/32) || (dst net 2.0.222.137/32) || (dst net 2.0.224.104/32))),
	((dst port 13078) || (dst port 32044) || (dst port 43758) || (dst port 44700) || (dst port 60074)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.16.176/32) || (dst net 3.0.118.157/32) || (dst net 3.0.134.102/32) || (dst net 3.0.182.164/32) || (dst net 3.0.226.212/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 14125) || (dst port 20692) || (dst port 29231) || (dst port 33729) || (dst port 64840)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.35.162/32) || (dst net 5.0.115.74/32) || (dst net 5.0.139.65/32) || (dst net 5.0.221.172/32) || (dst net 5.0.227.218/32))),
	((dst port 10066) || (dst port 13862) || (dst port 40394) || (dst port 41320) || (dst port 65480)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.93.123/32) || (dst net 6.0.112.146/32) || (dst net 6.0.119.177/32) || (dst net 6.0.206.130/32) || (dst net 6.0.225.172/32))),
	((dst port 13452) || (dst port 27376) || (dst port 44602) || (dst port 44729) || (dst port 54817)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.0.38/32) || (dst net 7.0.0.57/32) || (dst net 7.0.81.182/32) || (dst net 7.0.186.52/32) || (dst net 7.0.197.251/32))),
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
