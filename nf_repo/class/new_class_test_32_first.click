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
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 24944) || (dst port 27017) || (dst port 27796) || (dst port 42684) || (dst port 57916)) && ((ip ipd >= 536870912 && ip ipd <= 536874694) || (ip ipd >= 536874696 && ip ipd <= 536880692) || (ip ipd >= 536880694 && ip ipd <= 536881369) || (ip ipd >= 536881371 && ip ipd <= 536881541) || (ip ipd >= 536881543 && ip ipd <= 536901589) || (ip ipd >= 536901591 && ip ipd <= 553648127)),
	((dst port 2058) || (dst port 11193) || (dst port 37516) || (dst port 50467) || (dst port 59064)) && ((ip ipd >= 536870912 && ip ipd <= 536874852) || (ip ipd >= 536874854 && ip ipd <= 536891118) || (ip ipd >= 536891120 && ip ipd <= 536924286) || (ip ipd >= 536924288 && ip ipd <= 536929741) || (ip ipd >= 536929743 && ip ipd <= 536931172) || (ip ipd >= 536931174 && ip ipd <= 553648127)),
	((dst port 25505) || (dst port 34451) || (dst port 38461) || (dst port 53209) || (dst port 61597)) && ((ip ipd >= 536870912 && ip ipd <= 536889078) || (ip ipd >= 536889080 && ip ipd <= 536905135) || (ip ipd >= 536905137 && ip ipd <= 536923555) || (ip ipd >= 536923557 && ip ipd <= 536927379) || (ip ipd >= 536927381 && ip ipd <= 536927895) || (ip ipd >= 536927897 && ip ipd <= 553648127)),
	((dst port 4775) || (dst port 12422) || (dst port 47116) || (dst port 48702) || (dst port 57618)) && ((ip ipd >= 536870912 && ip ipd <= 536893068) || (ip ipd >= 536893070 && ip ipd <= 536898439) || (ip ipd >= 536898441 && ip ipd <= 536908914) || (ip ipd >= 536908916 && ip ipd <= 536920008) || (ip ipd >= 536920010 && ip ipd <= 536928635) || (ip ipd >= 536928637 && ip ipd <= 553648127)),
	((dst port 6319) || (dst port 27315) || (dst port 36872) || (dst port 44218) || (dst port 53285)) && ((ip ipd >= 536870912 && ip ipd <= 536876799) || (ip ipd >= 536876801 && ip ipd <= 536881464) || (ip ipd >= 536881466 && ip ipd <= 536894464) || (ip ipd >= 536894466 && ip ipd <= 536917450) || (ip ipd >= 536917452 && ip ipd <= 536928522) || (ip ipd >= 536928524 && ip ipd <= 553648127)),
	((dst port 7410) || (dst port 24739) || (dst port 25076) || (dst port 31882) || (dst port 45062)) && ((ip ipd >= 536870912 && ip ipd <= 536912541) || (ip ipd >= 536912543 && ip ipd <= 536921333) || (ip ipd >= 536921335 && ip ipd <= 536928465) || (ip ipd >= 536928467 && ip ipd <= 536928480) || (ip ipd >= 536928482 && ip ipd <= 536929667) || (ip ipd >= 536929669 && ip ipd <= 553648127)),
	((dst port 15599) || (dst port 25623) || (dst port 41208) || (dst port 44644) || (dst port 63957)) && ((ip ipd >= 536870912 && ip ipd <= 536875945) || (ip ipd >= 536875947 && ip ipd <= 536878889) || (ip ipd >= 536878891 && ip ipd <= 536880302) || (ip ipd >= 536880304 && ip ipd <= 536902214) || (ip ipd >= 536902216 && ip ipd <= 536917350) || (ip ipd >= 536917352 && ip ipd <= 553648127)),
	((dst port 4817) || (dst port 29540) || (dst port 31712) || (dst port 32679) || (dst port 32746)) && ((ip ipd >= 536870912 && ip ipd <= 536894661) || (ip ipd >= 536894663 && ip ipd <= 536899018) || (ip ipd >= 536899020 && ip ipd <= 536922966) || (ip ipd >= 536922968 && ip ipd <= 536927222) || (ip ipd >= 536927224 && ip ipd <= 536930464) || (ip ipd >= 536930466 && ip ipd <= 553648127)),
	((dst port 5264) || (dst port 15624) || (dst port 26751) || (dst port 63123) || (dst port 63734)) && ((ip ipd >= 536870912 && ip ipd <= 536878121) || (ip ipd >= 536878123 && ip ipd <= 536880492) || (ip ipd >= 536880494 && ip ipd <= 536890580) || (ip ipd >= 536890582 && ip ipd <= 536919458) || (ip ipd >= 536919460 && ip ipd <= 536932047) || (ip ipd >= 536932049 && ip ipd <= 553648127)),
	((dst port 24131) || (dst port 28369) || (dst port 28854) || (dst port 37728) || (dst port 38383)) && ((ip ipd >= 536870912 && ip ipd <= 536879396) || (ip ipd >= 536879398 && ip ipd <= 536883776) || (ip ipd >= 536883778 && ip ipd <= 536883892) || (ip ipd >= 536883894 && ip ipd <= 536893136) || (ip ipd >= 536893138 && ip ipd <= 536925535) || (ip ipd >= 536925537 && ip ipd <= 553648127)),
	((dst port 26394) || (dst port 45749) || (dst port 53710) || (dst port 55659) || (dst port 65236)) && ((ip ipd >= 536870912 && ip ipd <= 536880662) || (ip ipd >= 536880664 && ip ipd <= 536895967) || (ip ipd >= 536895969 && ip ipd <= 536899057) || (ip ipd >= 536899059 && ip ipd <= 536910242) || (ip ipd >= 536910244 && ip ipd <= 536914834) || (ip ipd >= 536914836 && ip ipd <= 553648127)),
	((dst port 23441) || (dst port 24731) || (dst port 42265) || (dst port 42370) || (dst port 52367)) && ((ip ipd >= 536870912 && ip ipd <= 536871540) || (ip ipd >= 536871542 && ip ipd <= 536895438) || (ip ipd >= 536895440 && ip ipd <= 536902354) || (ip ipd >= 536902356 && ip ipd <= 536912793) || (ip ipd >= 536912795 && ip ipd <= 536922907) || (ip ipd >= 536922909 && ip ipd <= 553648127)),
	((dst port 9446) || (dst port 20624) || (dst port 39470) || (dst port 43704) || (dst port 55993)) && ((ip ipd >= 536870912 && ip ipd <= 536880407) || (ip ipd >= 536880409 && ip ipd <= 536890016) || (ip ipd >= 536890018 && ip ipd <= 536892820) || (ip ipd >= 536892822 && ip ipd <= 536896438) || (ip ipd >= 536896440 && ip ipd <= 536916367) || (ip ipd >= 536916369 && ip ipd <= 553648127)),
	((dst port 8152) || (dst port 17310) || (dst port 19071) || (dst port 41591) || (dst port 54635)) && ((ip ipd >= 536870912 && ip ipd <= 536871277) || (ip ipd >= 536871279 && ip ipd <= 536893485) || (ip ipd >= 536893487 && ip ipd <= 536895943) || (ip ipd >= 536895945 && ip ipd <= 536904763) || (ip ipd >= 536904765 && ip ipd <= 536931260) || (ip ipd >= 536931262 && ip ipd <= 553648127)),
	((dst port 755) || (dst port 18917) || (dst port 36761) || (dst port 43646) || (dst port 52094)) && ((ip ipd >= 536870912 && ip ipd <= 536874102) || (ip ipd >= 536874104 && ip ipd <= 536881126) || (ip ipd >= 536881128 && ip ipd <= 536895606) || (ip ipd >= 536895608 && ip ipd <= 536900930) || (ip ipd >= 536900932 && ip ipd <= 536920448) || (ip ipd >= 536920450 && ip ipd <= 553648127)),
	((dst port 3279) || (dst port 4840) || (dst port 15197) || (dst port 24469) || (dst port 30475)) && ((ip ipd >= 536870912 && ip ipd <= 536891923) || (ip ipd >= 536891925 && ip ipd <= 536898145) || (ip ipd >= 536898147 && ip ipd <= 536904636) || (ip ipd >= 536904638 && ip ipd <= 536918042) || (ip ipd >= 536918044 && ip ipd <= 536926096) || (ip ipd >= 536926098 && ip ipd <= 553648127)),
	((dst port 11875) || (dst port 19205) || (dst port 23431) || (dst port 38629) || (dst port 61219)) && ((ip ipd >= 536870912 && ip ipd <= 536884179) || (ip ipd >= 536884181 && ip ipd <= 536898604) || (ip ipd >= 536898606 && ip ipd <= 536908017) || (ip ipd >= 536908019 && ip ipd <= 536925407) || (ip ipd >= 536925409 && ip ipd <= 536925933) || (ip ipd >= 536925935 && ip ipd <= 553648127)),
	((dst port 3308) || (dst port 29154) || (dst port 39055) || (dst port 49042) || (dst port 56636)) && ((ip ipd >= 536870912 && ip ipd <= 536895097) || (ip ipd >= 536895099 && ip ipd <= 536897505) || (ip ipd >= 536897507 && ip ipd <= 536901258) || (ip ipd >= 536901260 && ip ipd <= 536912057) || (ip ipd >= 536912059 && ip ipd <= 536932808) || (ip ipd >= 536932810 && ip ipd <= 553648127)),
	((dst port 1239) || (dst port 12758) || (dst port 43162) || (dst port 60391) || (dst port 64360)) && ((ip ipd >= 536870912 && ip ipd <= 536877764) || (ip ipd >= 536877766 && ip ipd <= 536879497) || (ip ipd >= 536879499 && ip ipd <= 536909007) || (ip ipd >= 536909009 && ip ipd <= 536914513) || (ip ipd >= 536914515 && ip ipd <= 536925528) || (ip ipd >= 536925530 && ip ipd <= 553648127)),
	((dst port 42142) || (dst port 43247) || (dst port 47872) || (dst port 54704) || (dst port 54860)) && ((ip ipd >= 536870912 && ip ipd <= 536889182) || (ip ipd >= 536889184 && ip ipd <= 536905192) || (ip ipd >= 536905194 && ip ipd <= 536909608) || (ip ipd >= 536909610 && ip ipd <= 536918084) || (ip ipd >= 536918086 && ip ipd <= 536934333) || (ip ipd >= 536934335 && ip ipd <= 553648127)),
	((dst port 7683) || (dst port 18132) || (dst port 28992) || (dst port 60161) || (dst port 62376)) && ((ip ipd >= 536870912 && ip ipd <= 536892107) || (ip ipd >= 536892109 && ip ipd <= 536893818) || (ip ipd >= 536893820 && ip ipd <= 536905965) || (ip ipd >= 536905967 && ip ipd <= 536914437) || (ip ipd >= 536914439 && ip ipd <= 536927875) || (ip ipd >= 536927877 && ip ipd <= 553648127)),
	((dst port 15940) || (dst port 35125) || (dst port 43444) || (dst port 53617) || (dst port 60943)) && ((ip ipd >= 536870912 && ip ipd <= 536892730) || (ip ipd >= 536892732 && ip ipd <= 536898175) || (ip ipd >= 536898177 && ip ipd <= 536905395) || (ip ipd >= 536905397 && ip ipd <= 536925725) || (ip ipd >= 536925727 && ip ipd <= 536933993) || (ip ipd >= 536933995 && ip ipd <= 553648127)),
	((dst port 10679) || (dst port 12857) || (dst port 39480) || (dst port 40846) || (dst port 54789)) && ((ip ipd >= 536870912 && ip ipd <= 536879170) || (ip ipd >= 536879172 && ip ipd <= 536887097) || (ip ipd >= 536887099 && ip ipd <= 536910019) || (ip ipd >= 536910021 && ip ipd <= 536929025) || (ip ipd >= 536929027 && ip ipd <= 536932610) || (ip ipd >= 536932612 && ip ipd <= 553648127)),
	((dst port 2) || (dst port 7576) || (dst port 29790) || (dst port 41207) || (dst port 44307)) && ((ip ipd >= 536870912 && ip ipd <= 536896572) || (ip ipd >= 536896574 && ip ipd <= 536914647) || (ip ipd >= 536914649 && ip ipd <= 536914929) || (ip ipd >= 536914931 && ip ipd <= 536925876) || (ip ipd >= 536925878 && ip ipd <= 536928013) || (ip ipd >= 536928015 && ip ipd <= 553648127)),
	((dst port 3929) || (dst port 18317) || (dst port 37778) || (dst port 43348) || (dst port 48790)) && ((ip ipd >= 536870912 && ip ipd <= 536873025) || (ip ipd >= 536873027 && ip ipd <= 536893940) || (ip ipd >= 536893942 && ip ipd <= 536895214) || (ip ipd >= 536895216 && ip ipd <= 536908552) || (ip ipd >= 536908554 && ip ipd <= 536926951) || (ip ipd >= 536926953 && ip ipd <= 553648127)),
	((dst port 2162) || (dst port 31930) || (dst port 37313) || (dst port 38940) || (dst port 45282)) && ((ip ipd >= 536870912 && ip ipd <= 536876927) || (ip ipd >= 536876929 && ip ipd <= 536882473) || (ip ipd >= 536882475 && ip ipd <= 536899919) || (ip ipd >= 536899921 && ip ipd <= 536929714) || (ip ipd >= 536929716 && ip ipd <= 536935952) || (ip ipd >= 536935954 && ip ipd <= 553648127)),
	((dst port 16010) || (dst port 17855) || (dst port 31258) || (dst port 62072) || (dst port 62474)) && ((ip ipd >= 536870912 && ip ipd <= 536884225) || (ip ipd >= 536884227 && ip ipd <= 536899387) || (ip ipd >= 536899389 && ip ipd <= 536902481) || (ip ipd >= 536902483 && ip ipd <= 536916040) || (ip ipd >= 536916042 && ip ipd <= 536929614) || (ip ipd >= 536929616 && ip ipd <= 553648127)),
	((dst port 3302) || (dst port 37579) || (dst port 42034) || (dst port 51281) || (dst port 62920)) && ((ip ipd >= 536870912 && ip ipd <= 536871370) || (ip ipd >= 536871372 && ip ipd <= 536879240) || (ip ipd >= 536879242 && ip ipd <= 536885159) || (ip ipd >= 536885161 && ip ipd <= 536927087) || (ip ipd >= 536927089 && ip ipd <= 536933921) || (ip ipd >= 536933923 && ip ipd <= 553648127)),
	((dst port 7759) || (dst port 33100) || (dst port 34502) || (dst port 43838) || (dst port 59184)) && ((ip ipd >= 536870912 && ip ipd <= 536879368) || (ip ipd >= 536879370 && ip ipd <= 536879895) || (ip ipd >= 536879897 && ip ipd <= 536903801) || (ip ipd >= 536903803 && ip ipd <= 536913896) || (ip ipd >= 536913898 && ip ipd <= 536924955) || (ip ipd >= 536924957 && ip ipd <= 553648127)),
	((dst port 8090) || (dst port 13187) || (dst port 42473) || (dst port 47731) || (dst port 55621)) && ((ip ipd >= 536870912 && ip ipd <= 536886836) || (ip ipd >= 536886838 && ip ipd <= 536889103) || (ip ipd >= 536889105 && ip ipd <= 536896255) || (ip ipd >= 536896257 && ip ipd <= 536896568) || (ip ipd >= 536896570 && ip ipd <= 536925379) || (ip ipd >= 536925381 && ip ipd <= 553648127)),
	((dst port 10299) || (dst port 23015) || (dst port 38075) || (dst port 43672) || (dst port 47135)) && ((ip ipd >= 536870912 && ip ipd <= 536872389) || (ip ipd >= 536872391 && ip ipd <= 536877829) || (ip ipd >= 536877831 && ip ipd <= 536883230) || (ip ipd >= 536883232 && ip ipd <= 536894568) || (ip ipd >= 536894570 && ip ipd <= 536922008) || (ip ipd >= 536922010 && ip ipd <= 553648127)),
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
