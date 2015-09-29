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
	((dst port 16394) || (dst port 23571) || (dst port 50406) || (dst port 50427) || (dst port 61214)) && ((ip ipd >= 268435456 && ip ipd <= 268437397) || (ip ipd >= 268437399 && ip ipd <= 268440721) || (ip ipd >= 268440723 && ip ipd <= 268443557) || (ip ipd >= 268443559 && ip ipd <= 268467846) || (ip ipd >= 268467848 && ip ipd <= 268499246) || (ip ipd >= 268499248 && ip ipd <= 285212671)),
	((dst port 2383) || (dst port 14527) || (dst port 15111) || (dst port 36871) || (dst port 42771)) && ((ip ipd >= 268435456 && ip ipd <= 268468221) || (ip ipd >= 268468223 && ip ipd <= 268479490) || (ip ipd >= 268479492 && ip ipd <= 268480130) || (ip ipd >= 268480132 && ip ipd <= 268484559) || (ip ipd >= 268484561 && ip ipd <= 268485052) || (ip ipd >= 268485054 && ip ipd <= 285212671)),
	((dst port 3122) || (dst port 10470) || (dst port 10874) || (dst port 43385) || (dst port 48767)) && ((ip ipd >= 268435456 && ip ipd <= 268450188) || (ip ipd >= 268450190 && ip ipd <= 268450770) || (ip ipd >= 268450772 && ip ipd <= 268459800) || (ip ipd >= 268459802 && ip ipd <= 268475866) || (ip ipd >= 268475868 && ip ipd <= 268478252) || (ip ipd >= 268478254 && ip ipd <= 285212671)),
	((dst port 1176) || (dst port 3519) || (dst port 32544) || (dst port 38899) || (dst port 47310)) && ((ip ipd >= 268435456 && ip ipd <= 268443643) || (ip ipd >= 268443645 && ip ipd <= 268467187) || (ip ipd >= 268467189 && ip ipd <= 268476157) || (ip ipd >= 268476159 && ip ipd <= 268495358) || (ip ipd >= 268495360 && ip ipd <= 268497660) || (ip ipd >= 268497662 && ip ipd <= 285212671)),
	((dst port 21565) || (dst port 29225) || (dst port 30654) || (dst port 48712) || (dst port 64042)) && ((ip ipd >= 268435456 && ip ipd <= 268439738) || (ip ipd >= 268439740 && ip ipd <= 268464398) || (ip ipd >= 268464400 && ip ipd <= 268464474) || (ip ipd >= 268464476 && ip ipd <= 268469480) || (ip ipd >= 268469482 && ip ipd <= 268486046) || (ip ipd >= 268486048 && ip ipd <= 285212671)),
	((dst port 4609) || (dst port 8116) || (dst port 10491) || (dst port 16709) || (dst port 34495)) && ((ip ipd >= 268435456 && ip ipd <= 268446686) || (ip ipd >= 268446688 && ip ipd <= 268448912) || (ip ipd >= 268448914 && ip ipd <= 268459869) || (ip ipd >= 268459871 && ip ipd <= 268497042) || (ip ipd >= 268497044 && ip ipd <= 268498689) || (ip ipd >= 268498691 && ip ipd <= 285212671)),
	((dst port 21445) || (dst port 37800) || (dst port 46764) || (dst port 49693) || (dst port 57141)) && ((ip ipd >= 268435456 && ip ipd <= 268442348) || (ip ipd >= 268442350 && ip ipd <= 268459609) || (ip ipd >= 268459611 && ip ipd <= 268463235) || (ip ipd >= 268463237 && ip ipd <= 268469384) || (ip ipd >= 268469386 && ip ipd <= 268490610) || (ip ipd >= 268490612 && ip ipd <= 285212671)),
	((dst port 15757) || (dst port 23730) || (dst port 26326) || (dst port 29824) || (dst port 35358)) && ((ip ipd >= 268435456 && ip ipd <= 268460953) || (ip ipd >= 268460955 && ip ipd <= 268475144) || (ip ipd >= 268475146 && ip ipd <= 268481317) || (ip ipd >= 268481319 && ip ipd <= 268490283) || (ip ipd >= 268490285 && ip ipd <= 268496748) || (ip ipd >= 268496750 && ip ipd <= 285212671)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 14181) || (dst port 34567) || (dst port 43833) || (dst port 52562) || (dst port 56601)) && ((ip ipd >= 268435456 && ip ipd <= 268440900) || (ip ipd >= 268440902 && ip ipd <= 268442334) || (ip ipd >= 268442336 && ip ipd <= 268454445) || (ip ipd >= 268454447 && ip ipd <= 268463084) || (ip ipd >= 268463086 && ip ipd <= 268466413) || (ip ipd >= 268466415 && ip ipd <= 285212671)),
	((dst port 211) || (dst port 15261) || (dst port 30131) || (dst port 32201) || (dst port 52125)) && ((ip ipd >= 268435456 && ip ipd <= 268440763) || (ip ipd >= 268440765 && ip ipd <= 268451429) || (ip ipd >= 268451431 && ip ipd <= 268452734) || (ip ipd >= 268452736 && ip ipd <= 268460544) || (ip ipd >= 268460546 && ip ipd <= 268482089) || (ip ipd >= 268482091 && ip ipd <= 285212671)),
	((dst port 8784) || (dst port 11217) || (dst port 39716) || (dst port 52158) || (dst port 62001)) && ((ip ipd >= 268435456 && ip ipd <= 268447699) || (ip ipd >= 268447701 && ip ipd <= 268452895) || (ip ipd >= 268452897 && ip ipd <= 268463321) || (ip ipd >= 268463323 && ip ipd <= 268479017) || (ip ipd >= 268479019 && ip ipd <= 268498599) || (ip ipd >= 268498601 && ip ipd <= 285212671)),
	((dst port 21590) || (dst port 41404) || (dst port 47609) || (dst port 52567) || (dst port 54680)) && ((ip ipd >= 268435456 && ip ipd <= 268439636) || (ip ipd >= 268439638 && ip ipd <= 268454622) || (ip ipd >= 268454624 && ip ipd <= 268458228) || (ip ipd >= 268458230 && ip ipd <= 268468856) || (ip ipd >= 268468858 && ip ipd <= 268489578) || (ip ipd >= 268489580 && ip ipd <= 285212671)),
	((dst port 5832) || (dst port 13406) || (dst port 14452) || (dst port 34034) || (dst port 60894)) && ((ip ipd >= 268435456 && ip ipd <= 268438169) || (ip ipd >= 268438171 && ip ipd <= 268438426) || (ip ipd >= 268438428 && ip ipd <= 268439500) || (ip ipd >= 268439502 && ip ipd <= 268445502) || (ip ipd >= 268445504 && ip ipd <= 268485726) || (ip ipd >= 268485728 && ip ipd <= 285212671)),
	((dst port 13149) || (dst port 15244) || (dst port 24797) || (dst port 28580) || (dst port 30769)) && ((ip ipd >= 268435456 && ip ipd <= 268452611) || (ip ipd >= 268452613 && ip ipd <= 268467872) || (ip ipd >= 268467874 && ip ipd <= 268481311) || (ip ipd >= 268481313 && ip ipd <= 268481755) || (ip ipd >= 268481757 && ip ipd <= 268482089) || (ip ipd >= 268482091 && ip ipd <= 285212671)),
	((dst port 2073) || (dst port 21599) || (dst port 38771) || (dst port 49361) || (dst port 53930)) && ((ip ipd >= 268435456 && ip ipd <= 268437699) || (ip ipd >= 268437701 && ip ipd <= 268464587) || (ip ipd >= 268464589 && ip ipd <= 268469781) || (ip ipd >= 268469783 && ip ipd <= 268491895) || (ip ipd >= 268491897 && ip ipd <= 268499501) || (ip ipd >= 268499503 && ip ipd <= 285212671)),
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
