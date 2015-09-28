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
	((dst port 13017) || (dst port 25216) || (dst port 49756) || (dst port 53362) || (dst port 56765)) && ((ip dst >= 536870912 && ip dst <= 536889407) || (ip dst >= 536889409 && ip dst <= 536899146) || (ip dst >= 536899148 && ip dst <= 536901074) || (ip dst >= 536901076 && ip dst <= 536901495) || (ip dst >= 536901497 && ip dst <= 536933132) || (ip dst >= 536933134 && ip dst <= 553648127)),
	((dst port 250) || (dst port 10863) || (dst port 11554) || (dst port 45092) || (dst port 60356)) && ((ip dst >= 536870912 && ip dst <= 536881953) || (ip dst >= 536881955 && ip dst <= 536891489) || (ip dst >= 536891491 && ip dst <= 536915000) || (ip dst >= 536915002 && ip dst <= 536915697) || (ip dst >= 536915699 && ip dst <= 536918202) || (ip dst >= 536918204 && ip dst <= 553648127)),
	((dst port 6137) || (dst port 21026) || (dst port 21195) || (dst port 30604) || (dst port 57046)) && ((ip dst >= 536870912 && ip dst <= 536882586) || (ip dst >= 536882588 && ip dst <= 536883890) || (ip dst >= 536883892 && ip dst <= 536904825) || (ip dst >= 536904827 && ip dst <= 536914708) || (ip dst >= 536914710 && ip dst <= 536915113) || (ip dst >= 536915115 && ip dst <= 553648127)),
	((dst port 1053) || (dst port 10840) || (dst port 11164) || (dst port 13364) || (dst port 43315)) && ((ip dst >= 536870912 && ip dst <= 536880595) || (ip dst >= 536880597 && ip dst <= 536900083) || (ip dst >= 536900085 && ip dst <= 536913644) || (ip dst >= 536913646 && ip dst <= 536928738) || (ip dst >= 536928740 && ip dst <= 536932646) || (ip dst >= 536932648 && ip dst <= 553648127)),
	((dst port 1563) || (dst port 1968) || (dst port 58077) || (dst port 58089) || (dst port 59850)) && ((ip dst >= 536870912 && ip dst <= 536878060) || (ip dst >= 536878062 && ip dst <= 536887000) || (ip dst >= 536887002 && ip dst <= 536894582) || (ip dst >= 536894584 && ip dst <= 536907686) || (ip dst >= 536907688 && ip dst <= 536934079) || (ip dst >= 536934081 && ip dst <= 553648127)),
	((dst port 21779) || (dst port 30917) || (dst port 35974) || (dst port 38212) || (dst port 49372)) && ((ip dst >= 536870912 && ip dst <= 536882221) || (ip dst >= 536882223 && ip dst <= 536902831) || (ip dst >= 536902833 && ip dst <= 536906786) || (ip dst >= 536906788 && ip dst <= 536924286) || (ip dst >= 536924288 && ip dst <= 536932294) || (ip dst >= 536932296 && ip dst <= 553648127)),
	((dst port 313) || (dst port 19752) || (dst port 29791) || (dst port 55283) || (dst port 58358)) && ((ip dst >= 536870912 && ip dst <= 536882213) || (ip dst >= 536882215 && ip dst <= 536895843) || (ip dst >= 536895845 && ip dst <= 536904529) || (ip dst >= 536904531 && ip dst <= 536925187) || (ip dst >= 536925189 && ip dst <= 536934288) || (ip dst >= 536934290 && ip dst <= 553648127)),
	((dst port 5998) || (dst port 26456) || (dst port 26600) || (dst port 34444) || (dst port 34492)) && ((ip dst >= 536870912 && ip dst <= 536887318) || (ip dst >= 536887320 && ip dst <= 536898631) || (ip dst >= 536898633 && ip dst <= 536917343) || (ip dst >= 536917345 && ip dst <= 536919010) || (ip dst >= 536919012 && ip dst <= 536925933) || (ip dst >= 536925935 && ip dst <= 553648127)),
	((dst port 10108) || (dst port 12082) || (dst port 21451) || (dst port 40677) || (dst port 42294)) && ((ip dst >= 536870912 && ip dst <= 536883033) || (ip dst >= 536883035 && ip dst <= 536888264) || (ip dst >= 536888266 && ip dst <= 536891087) || (ip dst >= 536891089 && ip dst <= 536920498) || (ip dst >= 536920500 && ip dst <= 536922170) || (ip dst >= 536922172 && ip dst <= 553648127)),
	((dst port 2043) || (dst port 9192) || (dst port 10963) || (dst port 37032) || (dst port 64583)) && ((ip dst >= 536870912 && ip dst <= 536881556) || (ip dst >= 536881558 && ip dst <= 536897719) || (ip dst >= 536897721 && ip dst <= 536900743) || (ip dst >= 536900745 && ip dst <= 536905854) || (ip dst >= 536905856 && ip dst <= 536931584) || (ip dst >= 536931586 && ip dst <= 553648127)),
	((dst port 2469) || (dst port 21961) || (dst port 24877) || (dst port 39474) || (dst port 42034)) && ((ip dst >= 536870912 && ip dst <= 536881585) || (ip dst >= 536881587 && ip dst <= 536891170) || (ip dst >= 536891172 && ip dst <= 536892024) || (ip dst >= 536892026 && ip dst <= 536892772) || (ip dst >= 536892774 && ip dst <= 536894132) || (ip dst >= 536894134 && ip dst <= 553648127)),
	((dst port 109) || (dst port 21337) || (dst port 28792) || (dst port 43164) || (dst port 63748)) && ((ip dst >= 536870912 && ip dst <= 536876036) || (ip dst >= 536876038 && ip dst <= 536887473) || (ip dst >= 536887475 && ip dst <= 536889777) || (ip dst >= 536889779 && ip dst <= 536903098) || (ip dst >= 536903100 && ip dst <= 536906565) || (ip dst >= 536906567 && ip dst <= 553648127)),
	((dst port 2745) || (dst port 7631) || (dst port 51465) || (dst port 62979) || (dst port 64586)) && ((ip dst >= 536870912 && ip dst <= 536877521) || (ip dst >= 536877523 && ip dst <= 536881751) || (ip dst >= 536881753 && ip dst <= 536891776) || (ip dst >= 536891778 && ip dst <= 536893801) || (ip dst >= 536893803 && ip dst <= 536933533) || (ip dst >= 536933535 && ip dst <= 553648127)),
	((dst port 18520) || (dst port 35995) || (dst port 43941) || (dst port 55815) || (dst port 57824)) && ((ip dst >= 536870912 && ip dst <= 536877560) || (ip dst >= 536877562 && ip dst <= 536885354) || (ip dst >= 536885356 && ip dst <= 536886837) || (ip dst >= 536886839 && ip dst <= 536887594) || (ip dst >= 536887596 && ip dst <= 536899584) || (ip dst >= 536899586 && ip dst <= 553648127)),
	((dst port 15332) || (dst port 17123) || (dst port 19628) || (dst port 24579) || (dst port 65425)) && ((ip dst >= 536870912 && ip dst <= 536907455) || (ip dst >= 536907457 && ip dst <= 536920577) || (ip dst >= 536920579 && ip dst <= 536920700) || (ip dst >= 536920702 && ip dst <= 536926839) || (ip dst >= 536926841 && ip dst <= 536930026) || (ip dst >= 536930028 && ip dst <= 553648127)),
	((dst port 6715) || (dst port 11920) || (dst port 30396) || (dst port 32989) || (dst port 56582)) && ((ip dst >= 536870912 && ip dst <= 536899001) || (ip dst >= 536899003 && ip dst <= 536912964) || (ip dst >= 536912966 && ip dst <= 536919771) || (ip dst >= 536919773 && ip dst <= 536921133) || (ip dst >= 536921135 && ip dst <= 536935913) || (ip dst >= 536935915 && ip dst <= 553648127)),
	((dst port 3592) || (dst port 12427) || (dst port 35655) || (dst port 54440) || (dst port 63918)) && ((ip dst >= 536870912 && ip dst <= 536889993) || (ip dst >= 536889995 && ip dst <= 536912143) || (ip dst >= 536912145 && ip dst <= 536929766) || (ip dst >= 536929768 && ip dst <= 536931925) || (ip dst >= 536931927 && ip dst <= 536934836) || (ip dst >= 536934838 && ip dst <= 553648127)),
	((dst port 12658) || (dst port 14980) || (dst port 39122) || (dst port 58755) || (dst port 63550)) && ((ip dst >= 536870912 && ip dst <= 536873030) || (ip dst >= 536873032 && ip dst <= 536895516) || (ip dst >= 536895518 && ip dst <= 536904888) || (ip dst >= 536904890 && ip dst <= 536921061) || (ip dst >= 536921063 && ip dst <= 536927921) || (ip dst >= 536927923 && ip dst <= 553648127)),
	((dst port 3403) || (dst port 4694) || (dst port 17689) || (dst port 57907) || (dst port 65188)) && ((ip dst >= 536870912 && ip dst <= 536876466) || (ip dst >= 536876468 && ip dst <= 536906922) || (ip dst >= 536906924 && ip dst <= 536917338) || (ip dst >= 536917340 && ip dst <= 536921446) || (ip dst >= 536921448 && ip dst <= 536921832) || (ip dst >= 536921834 && ip dst <= 553648127)),
	((dst port 11221) || (dst port 18535) || (dst port 31581) || (dst port 53435) || (dst port 59755)) && ((ip dst >= 536870912 && ip dst <= 536903665) || (ip dst >= 536903667 && ip dst <= 536915956) || (ip dst >= 536915958 && ip dst <= 536916113) || (ip dst >= 536916115 && ip dst <= 536919961) || (ip dst >= 536919963 && ip dst <= 536932821) || (ip dst >= 536932823 && ip dst <= 553648127)),
	((dst port 13767) || (dst port 17246) || (dst port 24431) || (dst port 35938) || (dst port 52869)) && ((ip dst >= 536870912 && ip dst <= 536881949) || (ip dst >= 536881951 && ip dst <= 536897080) || (ip dst >= 536897082 && ip dst <= 536916996) || (ip dst >= 536916998 && ip dst <= 536930058) || (ip dst >= 536930060 && ip dst <= 536930606) || (ip dst >= 536930608 && ip dst <= 553648127)),
	((dst port 1426) || (dst port 24728) || (dst port 39773) || (dst port 43720) || (dst port 53689)) && ((ip dst >= 536870912 && ip dst <= 536886367) || (ip dst >= 536886369 && ip dst <= 536892905) || (ip dst >= 536892907 && ip dst <= 536900592) || (ip dst >= 536900594 && ip dst <= 536905130) || (ip dst >= 536905132 && ip dst <= 536914094) || (ip dst >= 536914096 && ip dst <= 553648127)),
	((dst port 14013) || (dst port 16006) || (dst port 26657) || (dst port 29703) || (dst port 46026)) && ((ip dst >= 536870912 && ip dst <= 536906419) || (ip dst >= 536906421 && ip dst <= 536919820) || (ip dst >= 536919822 && ip dst <= 536920634) || (ip dst >= 536920636 && ip dst <= 536922901) || (ip dst >= 536922903 && ip dst <= 536934463) || (ip dst >= 536934465 && ip dst <= 553648127)),
	((dst port 1419) || (dst port 45116) || (dst port 51000) || (dst port 59135) || (dst port 62542)) && ((ip dst >= 536870912 && ip dst <= 536889025) || (ip dst >= 536889027 && ip dst <= 536890668) || (ip dst >= 536890670 && ip dst <= 536893400) || (ip dst >= 536893402 && ip dst <= 536897588) || (ip dst >= 536897590 && ip dst <= 536914243) || (ip dst >= 536914245 && ip dst <= 553648127)),
	((dst port 758) || (dst port 7204) || (dst port 35719) || (dst port 39454) || (dst port 60391)) && ((ip dst >= 536870912 && ip dst <= 536874433) || (ip dst >= 536874435 && ip dst <= 536881629) || (ip dst >= 536881631 && ip dst <= 536897778) || (ip dst >= 536897780 && ip dst <= 536923081) || (ip dst >= 536923083 && ip dst <= 536934760) || (ip dst >= 536934762 && ip dst <= 553648127)),
	((dst port 26783) || (dst port 36642) || (dst port 38643) || (dst port 45812) || (dst port 61676)) && ((ip dst >= 536870912 && ip dst <= 536875697) || (ip dst >= 536875699 && ip dst <= 536896037) || (ip dst >= 536896039 && ip dst <= 536896531) || (ip dst >= 536896533 && ip dst <= 536902462) || (ip dst >= 536902464 && ip dst <= 536907384) || (ip dst >= 536907386 && ip dst <= 553648127)),
	((dst port 7678) || (dst port 10592) || (dst port 17602) || (dst port 23220) || (dst port 36328)) && ((ip dst >= 536870912 && ip dst <= 536871641) || (ip dst >= 536871643 && ip dst <= 536889442) || (ip dst >= 536889444 && ip dst <= 536896299) || (ip dst >= 536896301 && ip dst <= 536907985) || (ip dst >= 536907987 && ip dst <= 536919788) || (ip dst >= 536919790 && ip dst <= 553648127)),
	((dst port 4774) || (dst port 6478) || (dst port 24835) || (dst port 30799) || (dst port 34713)) && ((ip dst >= 536870912 && ip dst <= 536883472) || (ip dst >= 536883474 && ip dst <= 536888326) || (ip dst >= 536888328 && ip dst <= 536898073) || (ip dst >= 536898075 && ip dst <= 536913389) || (ip dst >= 536913391 && ip dst <= 536923886) || (ip dst >= 536923888 && ip dst <= 553648127)),
	((dst port 22934) || (dst port 28781) || (dst port 52537) || (dst port 58469) || (dst port 65132)) && ((ip dst >= 536870912 && ip dst <= 536879615) || (ip dst >= 536879617 && ip dst <= 536885083) || (ip dst >= 536885085 && ip dst <= 536894054) || (ip dst >= 536894056 && ip dst <= 536899635) || (ip dst >= 536899637 && ip dst <= 536903237) || (ip dst >= 536903239 && ip dst <= 553648127)),
	((dst port 5413) || (dst port 14225) || (dst port 32758) || (dst port 33197) || (dst port 47819)) && ((ip dst >= 536870912 && ip dst <= 536880298) || (ip dst >= 536880300 && ip dst <= 536890652) || (ip dst >= 536890654 && ip dst <= 536907082) || (ip dst >= 536907084 && ip dst <= 536908702) || (ip dst >= 536908704 && ip dst <= 536935280) || (ip dst >= 536935282 && ip dst <= 553648127)),
	((dst port 16084) || (dst port 51850) || (dst port 56133) || (dst port 58549) || (dst port 63191)) && ((ip dst >= 536870912 && ip dst <= 536881704) || (ip dst >= 536881706 && ip dst <= 536882244) || (ip dst >= 536882246 && ip dst <= 536888236) || (ip dst >= 536888238 && ip dst <= 536895462) || (ip dst >= 536895464 && ip dst <= 536896157) || (ip dst >= 536896159 && ip dst <= 553648127)),
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
getIPClas8 :: CycleCountAccum;
getIPClas9 :: CycleCountAccum;
getIPClas10 :: CycleCountAccum;
getIPClas11 :: CycleCountAccum;
getIPClas12 :: CycleCountAccum;
getIPClas13 :: CycleCountAccum;
getIPClas14 :: CycleCountAccum;
getIPClas15 :: CycleCountAccum;
getIPClas16 :: CycleCountAccum;
getIPClas17 :: CycleCountAccum;
getIPClas18 :: CycleCountAccum;
getIPClas19 :: CycleCountAccum;
getIPClas20 :: CycleCountAccum;
getIPClas21 :: CycleCountAccum;
getIPClas22 :: CycleCountAccum;
getIPClas23 :: CycleCountAccum;
getIPClas24 :: CycleCountAccum;
getIPClas25 :: CycleCountAccum;
getIPClas26 :: CycleCountAccum;
getIPClas27 :: CycleCountAccum;
getIPClas28 :: CycleCountAccum;
getIPClas29 :: CycleCountAccum;
getIPClas30 :: CycleCountAccum;
getIPClas31 :: CycleCountAccum;

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
ipclassifier[16] -> getIPClas16 -> Discard ();
ipclassifier[17] -> getIPClas17 -> Discard ();
ipclassifier[18] -> getIPClas18 -> Discard ();
ipclassifier[19] -> getIPClas19 -> Discard ();
ipclassifier[20] -> getIPClas20 -> Discard ();
ipclassifier[21] -> getIPClas21 -> Discard ();
ipclassifier[22] -> getIPClas22 -> Discard ();
ipclassifier[23] -> getIPClas23 -> Discard ();
ipclassifier[24] -> getIPClas24 -> Discard ();
ipclassifier[25] -> getIPClas25 -> Discard ();
ipclassifier[26] -> getIPClas26 -> Discard ();
ipclassifier[27] -> getIPClas27 -> Discard ();
ipclassifier[28] -> getIPClas28 -> Discard ();
ipclassifier[29] -> getIPClas29 -> Discard ();
ipclassifier[30] -> getIPClas30 -> Discard ();
ipclassifier[31] -> getIPClas31 -> Discard ();
	
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
