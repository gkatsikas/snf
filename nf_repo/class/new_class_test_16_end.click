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
	((dst port 9725) || (dst port 20421) || (dst port 55742) || (dst port 56855) || (dst port 63369)) && ((ip ipd >= 268435456 && ip ipd <= 268450664) || (ip ipd >= 268450666 && ip ipd <= 268461904) || (ip ipd >= 268461906 && ip ipd <= 268463676) || (ip ipd >= 268463678 && ip ipd <= 268470617) || (ip ipd >= 268470619 && ip ipd <= 268500162) || (ip ipd >= 268500164 && ip ipd <= 285212671)),
	((dst port 10434) || (dst port 35491) || (dst port 37540) || (dst port 53440) || (dst port 61949)) && ((ip ipd >= 268435456 && ip ipd <= 268466131) || (ip ipd >= 268466133 && ip ipd <= 268477368) || (ip ipd >= 268477370 && ip ipd <= 268480726) || (ip ipd >= 268480728 && ip ipd <= 268496530) || (ip ipd >= 268496532 && ip ipd <= 268500835) || (ip ipd >= 268500837 && ip ipd <= 285212671)),
	((dst port 1468) || (dst port 6326) || (dst port 33999) || (dst port 36798) || (dst port 56157)) && ((ip ipd >= 268435456 && ip ipd <= 268438146) || (ip ipd >= 268438148 && ip ipd <= 268442665) || (ip ipd >= 268442667 && ip ipd <= 268445640) || (ip ipd >= 268445642 && ip ipd <= 268457974) || (ip ipd >= 268457976 && ip ipd <= 268489283) || (ip ipd >= 268489285 && ip ipd <= 285212671)),
	((dst port 4344) || (dst port 9221) || (dst port 12582) || (dst port 22667) || (dst port 43975)) && ((ip ipd >= 268435456 && ip ipd <= 268436949) || (ip ipd >= 268436951 && ip ipd <= 268469332) || (ip ipd >= 268469334 && ip ipd <= 268479662) || (ip ipd >= 268479664 && ip ipd <= 268481230) || (ip ipd >= 268481232 && ip ipd <= 268483767) || (ip ipd >= 268483769 && ip ipd <= 285212671)),
	((dst port 1726) || (dst port 5067) || (dst port 45295) || (dst port 46774) || (dst port 49962)) && ((ip ipd >= 268435456 && ip ipd <= 268446420) || (ip ipd >= 268446422 && ip ipd <= 268449981) || (ip ipd >= 268449983 && ip ipd <= 268460366) || (ip ipd >= 268460368 && ip ipd <= 268473861) || (ip ipd >= 268473863 && ip ipd <= 268495823) || (ip ipd >= 268495825 && ip ipd <= 285212671)),
	((dst port 34036) || (dst port 39430) || (dst port 47438) || (dst port 54478) || (dst port 60244)) && ((ip ipd >= 268435456 && ip ipd <= 268463665) || (ip ipd >= 268463667 && ip ipd <= 268468615) || (ip ipd >= 268468617 && ip ipd <= 268474109) || (ip ipd >= 268474111 && ip ipd <= 268496110) || (ip ipd >= 268496112 && ip ipd <= 268496385) || (ip ipd >= 268496387 && ip ipd <= 285212671)),
	((dst port 6385) || (dst port 34828) || (dst port 35963) || (dst port 43717) || (dst port 45782)) && ((ip ipd >= 268435456 && ip ipd <= 268446034) || (ip ipd >= 268446036 && ip ipd <= 268453363) || (ip ipd >= 268453365 && ip ipd <= 268467622) || (ip ipd >= 268467624 && ip ipd <= 268473097) || (ip ipd >= 268473099 && ip ipd <= 268499427) || (ip ipd >= 268499429 && ip ipd <= 285212671)),
	((dst port 2074) || (dst port 9910) || (dst port 28922) || (dst port 32918) || (dst port 47932)) && ((ip ipd >= 268435456 && ip ipd <= 268467904) || (ip ipd >= 268467906 && ip ipd <= 268472915) || (ip ipd >= 268472917 && ip ipd <= 268474049) || (ip ipd >= 268474051 && ip ipd <= 268475481) || (ip ipd >= 268475483 && ip ipd <= 268479232) || (ip ipd >= 268479234 && ip ipd <= 285212671)),
	((dst port 7024) || (dst port 25098) || (dst port 36165) || (dst port 39137) || (dst port 40050)) && ((ip ipd >= 268435456 && ip ipd <= 268437752) || (ip ipd >= 268437754 && ip ipd <= 268438837) || (ip ipd >= 268438839 && ip ipd <= 268451521) || (ip ipd >= 268451523 && ip ipd <= 268456469) || (ip ipd >= 268456471 && ip ipd <= 268469669) || (ip ipd >= 268469671 && ip ipd <= 285212671)),
	((dst port 26709) || (dst port 31444) || (dst port 31907) || (dst port 45679) || (dst port 46561)) && ((ip ipd >= 268435456 && ip ipd <= 268467351) || (ip ipd >= 268467353 && ip ipd <= 268469085) || (ip ipd >= 268469087 && ip ipd <= 268478063) || (ip ipd >= 268478065 && ip ipd <= 268486052) || (ip ipd >= 268486054 && ip ipd <= 268496749) || (ip ipd >= 268496751 && ip ipd <= 285212671)),
	((dst port 15427) || (dst port 27099) || (dst port 34767) || (dst port 39157) || (dst port 61491)) && ((ip ipd >= 268435456 && ip ipd <= 268453585) || (ip ipd >= 268453587 && ip ipd <= 268453812) || (ip ipd >= 268453814 && ip ipd <= 268470465) || (ip ipd >= 268470467 && ip ipd <= 268475140) || (ip ipd >= 268475142 && ip ipd <= 268481552) || (ip ipd >= 268481554 && ip ipd <= 285212671)),
	((dst port 9416) || (dst port 15091) || (dst port 16477) || (dst port 42698) || (dst port 58952)) && ((ip ipd >= 268435456 && ip ipd <= 268470020) || (ip ipd >= 268470022 && ip ipd <= 268480118) || (ip ipd >= 268480120 && ip ipd <= 268486771) || (ip ipd >= 268486773 && ip ipd <= 268489273) || (ip ipd >= 268489275 && ip ipd <= 268495766) || (ip ipd >= 268495768 && ip ipd <= 285212671)),
	((dst port 8057) || (dst port 27294) || (dst port 33215) || (dst port 46038) || (dst port 62420)) && ((ip ipd >= 268435456 && ip ipd <= 268435770) || (ip ipd >= 268435772 && ip ipd <= 268453501) || (ip ipd >= 268453503 && ip ipd <= 268453735) || (ip ipd >= 268453737 && ip ipd <= 268491736) || (ip ipd >= 268491738 && ip ipd <= 268496794) || (ip ipd >= 268496796 && ip ipd <= 285212671)),
	((dst port 19468) || (dst port 21677) || (dst port 22185) || (dst port 22582) || (dst port 49652)) && ((ip ipd >= 268435456 && ip ipd <= 268441999) || (ip ipd >= 268442001 && ip ipd <= 268442515) || (ip ipd >= 268442517 && ip ipd <= 268464061) || (ip ipd >= 268464063 && ip ipd <= 268464374) || (ip ipd >= 268464376 && ip ipd <= 268485668) || (ip ipd >= 268485670 && ip ipd <= 285212671)),
	((dst port 24078) || (dst port 32234) || (dst port 52752) || (dst port 56664) || (dst port 63856)) && ((ip ipd >= 268435456 && ip ipd <= 268439099) || (ip ipd >= 268439101 && ip ipd <= 268442957) || (ip ipd >= 268442959 && ip ipd <= 268448725) || (ip ipd >= 268448727 && ip ipd <= 268467259) || (ip ipd >= 268467261 && ip ipd <= 268473020) || (ip ipd >= 268473022 && ip ipd <= 285212671)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
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
getIPClas8 :: CycleCountAccum;
getIPClas9 :: CycleCountAccum;
getIPClas10 :: CycleCountAccum;
getIPClas11 :: CycleCountAccum;
getIPClas12 :: CycleCountAccum;
getIPClas13 :: CycleCountAccum;
getIPClas14 :: CycleCountAccum;
getIPClas15 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
ipclassifier[8] -> getIPClas8 -> Discard ();
ipclassifier[9] -> getIPClas9 -> Discard ();
ipclassifier[10] -> getIPClas10 -> Discard ();
ipclassifier[11] -> getIPClas11 -> Discard ();
ipclassifier[12] -> getIPClas12 -> Discard ();
ipclassifier[13] -> getIPClas13 -> Discard ();
ipclassifier[14] -> getIPClas14 -> Discard ();
ipclassifier[15] -> getIPClas15 -> Discard ();
	
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
