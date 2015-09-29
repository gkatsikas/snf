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
	((dst port 17650) || (dst port 27006) || (dst port 27224) || (dst port 55150) || (dst port 55443)) && ((ip ipd >= 67108864 && ip ipd <= 67124146) || (ip ipd >= 67124148 && ip ipd <= 67128938) || (ip ipd >= 67128940 && ip ipd <= 67131867) || (ip ipd >= 67131869 && ip ipd <= 67142501) || (ip ipd >= 67142503 && ip ipd <= 67147603) || (ip ipd >= 67147605 && ip ipd <= 83886079)),
	((dst port 2166) || (dst port 32669) || (dst port 35026) || (dst port 37465) || (dst port 52588)) && ((ip ipd >= 67108864 && ip ipd <= 67118937) || (ip ipd >= 67118939 && ip ipd <= 67120550) || (ip ipd >= 67120552 && ip ipd <= 67127686) || (ip ipd >= 67127688 && ip ipd <= 67139529) || (ip ipd >= 67139531 && ip ipd <= 67144076) || (ip ipd >= 67144078 && ip ipd <= 83886079)),
	((dst port 8547) || (dst port 10470) || (dst port 13943) || (dst port 46840) || (dst port 55185)) && ((ip ipd >= 67108864 && ip ipd <= 67145209) || (ip ipd >= 67145211 && ip ipd <= 67149814) || (ip ipd >= 67149816 && ip ipd <= 67157904) || (ip ipd >= 67157906 && ip ipd <= 67167240) || (ip ipd >= 67167242 && ip ipd <= 67171475) || (ip ipd >= 67171477 && ip ipd <= 83886079)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
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
