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
	((dst port 5312) || (dst port 13995) || (dst port 14015) || (dst port 25482) || (dst port 41260)) && ((ip dst >= 134217728 && ip dst <= 134223083) || (ip dst >= 134223085 && ip dst <= 134223923) || (ip dst >= 134223925 && ip dst <= 134264188) || (ip dst >= 134264190 && ip dst <= 134267798) || (ip dst >= 134267800 && ip dst <= 134272038) || (ip dst >= 134272040 && ip dst <= 150994943)),
	((dst port 18491) || (dst port 18615) || (dst port 27687) || (dst port 50914) || (dst port 51372)) && ((ip dst >= 134217728 && ip dst <= 134235370) || (ip dst >= 134235372 && ip dst <= 134243277) || (ip dst >= 134243279 && ip dst <= 134263090) || (ip dst >= 134263092 && ip dst <= 134279827) || (ip dst >= 134279829 && ip dst <= 134280129) || (ip dst >= 134280131 && ip dst <= 150994943)),
	((dst port 8942) || (dst port 11592) || (dst port 26093) || (dst port 39389) || (dst port 53723)) && ((ip dst >= 134217728 && ip dst <= 134218468) || (ip dst >= 134218470 && ip dst <= 134230298) || (ip dst >= 134230300 && ip dst <= 134230439) || (ip dst >= 134230441 && ip dst <= 134233721) || (ip dst >= 134233723 && ip dst <= 134282166) || (ip dst >= 134282168 && ip dst <= 150994943)),
	((dst port 6661) || (dst port 14379) || (dst port 41598) || (dst port 45614) || (dst port 52087)) && ((ip dst >= 134217728 && ip dst <= 134228064) || (ip dst >= 134228066 && ip dst <= 134233036) || (ip dst >= 134233038 && ip dst <= 134234581) || (ip dst >= 134234583 && ip dst <= 134272015) || (ip dst >= 134272017 && ip dst <= 134282474) || (ip dst >= 134282476 && ip dst <= 150994943)),
	((dst port 7696) || (dst port 14877) || (dst port 20892) || (dst port 39205) || (dst port 45865)) && ((ip dst >= 134217728 && ip dst <= 134221426) || (ip dst >= 134221428 && ip dst <= 134259240) || (ip dst >= 134259242 && ip dst <= 134261606) || (ip dst >= 134261608 && ip dst <= 134263357) || (ip dst >= 134263359 && ip dst <= 134267073) || (ip dst >= 134267075 && ip dst <= 150994943)),
	((dst port 9374) || (dst port 10596) || (dst port 31807) || (dst port 46072) || (dst port 56377)) && ((ip dst >= 134217728 && ip dst <= 134239332) || (ip dst >= 134239334 && ip dst <= 134252208) || (ip dst >= 134252210 && ip dst <= 134254029) || (ip dst >= 134254031 && ip dst <= 134256262) || (ip dst >= 134256264 && ip dst <= 134267704) || (ip dst >= 134267706 && ip dst <= 150994943)),
	((dst port 20365) || (dst port 28236) || (dst port 33954) || (dst port 34639) || (dst port 38544)) && ((ip dst >= 134217728 && ip dst <= 134226596) || (ip dst >= 134226598 && ip dst <= 134238437) || (ip dst >= 134238439 && ip dst <= 134254220) || (ip dst >= 134254222 && ip dst <= 134266159) || (ip dst >= 134266161 && ip dst <= 134271026) || (ip dst >= 134271028 && ip dst <= 150994943)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
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
