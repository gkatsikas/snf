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
	((dst port 28792) || (dst port 30294) || (dst port 41468) || (dst port 54049) || (dst port 62350)) && ((ip dst >= 134217728 && ip dst <= 134248612) || (ip dst >= 134248614 && ip dst <= 134250886) || (ip dst >= 134250888 && ip dst <= 134257075) || (ip dst >= 134257077 && ip dst <= 134267263) || (ip dst >= 134267265 && ip dst <= 134271308) || (ip dst >= 134271310 && ip dst <= 150994943)),
	((dst port 6778) || (dst port 18961) || (dst port 27134) || (dst port 33715) || (dst port 35221)) && ((ip dst >= 134217728 && ip dst <= 134262881) || (ip dst >= 134262883 && ip dst <= 134263748) || (ip dst >= 134263750 && ip dst <= 134273517) || (ip dst >= 134273519 && ip dst <= 134280277) || (ip dst >= 134280279 && ip dst <= 134282422) || (ip dst >= 134282424 && ip dst <= 150994943)),
	((dst port 1251) || (dst port 46304) || (dst port 46901) || (dst port 48610) || (dst port 52477)) && ((ip dst >= 134217728 && ip dst <= 134246566) || (ip dst >= 134246568 && ip dst <= 134255523) || (ip dst >= 134255525 && ip dst <= 134265553) || (ip dst >= 134265555 && ip dst <= 134274696) || (ip dst >= 134274698 && ip dst <= 134275175) || (ip dst >= 134275177 && ip dst <= 150994943)),
	((dst port 13078) || (dst port 32044) || (dst port 43758) || (dst port 44700) || (dst port 60074)) && ((ip dst >= 134217728 && ip dst <= 134221999) || (ip dst >= 134222001 && ip dst <= 134248092) || (ip dst >= 134248094 && ip dst <= 134252133) || (ip dst >= 134252135 && ip dst <= 134264483) || (ip dst >= 134264485 && ip dst <= 134275795) || (ip dst >= 134275797 && ip dst <= 150994943)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 14125) || (dst port 20692) || (dst port 29231) || (dst port 33729) || (dst port 64840)) && ((ip dst >= 134217728 && ip dst <= 134226849) || (ip dst >= 134226851 && ip dst <= 134247241) || (ip dst >= 134247243 && ip dst <= 134253376) || (ip dst >= 134253378 && ip dst <= 134274475) || (ip dst >= 134274477 && ip dst <= 134276057) || (ip dst >= 134276059 && ip dst <= 150994943)),
	((dst port 10066) || (dst port 13862) || (dst port 40394) || (dst port 41320) || (dst port 65480)) && ((ip dst >= 134217728 && ip dst <= 134241658) || (ip dst >= 134241660 && ip dst <= 134246545) || (ip dst >= 134246547 && ip dst <= 134248368) || (ip dst >= 134248370 && ip dst <= 134270593) || (ip dst >= 134270595 && ip dst <= 134275499) || (ip dst >= 134275501 && ip dst <= 150994943)),
	((dst port 13452) || (dst port 27376) || (dst port 44602) || (dst port 44729) || (dst port 54817)) && ((ip dst >= 134217728 && ip dst <= 134217765) || (ip dst >= 134217767 && ip dst <= 134217784) || (ip dst >= 134217786 && ip dst <= 134238645) || (ip dst >= 134238647 && ip dst <= 134265395) || (ip dst >= 134265397 && ip dst <= 134268410) || (ip dst >= 134268412 && ip dst <= 150994943)),
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
