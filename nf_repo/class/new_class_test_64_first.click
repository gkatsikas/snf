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
	((dst port 1337) || (dst port 23060) || (dst port 27015) || (dst port 31883) || (dst port 56262)) && ((ip ipd >= 1073741824 && ip ipd <= 1073758256) || (ip ipd >= 1073758258 && ip ipd <= 1073760441) || (ip ipd >= 1073760443 && ip ipd <= 1073775594) || (ip ipd >= 1073775596 && ip ipd <= 1073777856) || (ip ipd >= 1073777858 && ip ipd <= 1073788938) || (ip ipd >= 1073788940 && ip ipd <= 1090519039)),
	((dst port 2844) || (dst port 26754) || (dst port 35746) || (dst port 38514) || (dst port 52846)) && ((ip ipd >= 1073741824 && ip ipd <= 1073768072) || (ip ipd >= 1073768074 && ip ipd <= 1073779090) || (ip ipd >= 1073779092 && ip ipd <= 1073801835) || (ip ipd >= 1073801837 && ip ipd <= 1073804707) || (ip ipd >= 1073804709 && ip ipd <= 1073807222) || (ip ipd >= 1073807224 && ip ipd <= 1090519039)),
	((dst port 19194) || (dst port 20058) || (dst port 36954) || (dst port 54441) || (dst port 64095)) && ((ip ipd >= 1073741824 && ip ipd <= 1073750349) || (ip ipd >= 1073750351 && ip ipd <= 1073755403) || (ip ipd >= 1073755405 && ip ipd <= 1073779487) || (ip ipd >= 1073779489 && ip ipd <= 1073786476) || (ip ipd >= 1073786478 && ip ipd <= 1073805343) || (ip ipd >= 1073805345 && ip ipd <= 1090519039)),
	((dst port 13133) || (dst port 13379) || (dst port 38979) || (dst port 44674) || (dst port 52937)) && ((ip ipd >= 1073741824 && ip ipd <= 1073747222) || (ip ipd >= 1073747224 && ip ipd <= 1073763638) || (ip ipd >= 1073763640 && ip ipd <= 1073776005) || (ip ipd >= 1073776007 && ip ipd <= 1073780077) || (ip ipd >= 1073780079 && ip ipd <= 1073806372) || (ip ipd >= 1073806374 && ip ipd <= 1090519039)),
	((dst port 5947) || (dst port 10486) || (dst port 16189) || (dst port 49903) || (dst port 51722)) && ((ip ipd >= 1073741824 && ip ipd <= 1073752567) || (ip ipd >= 1073752569 && ip ipd <= 1073754764) || (ip ipd >= 1073754766 && ip ipd <= 1073760225) || (ip ipd >= 1073760227 && ip ipd <= 1073793798) || (ip ipd >= 1073793800 && ip ipd <= 1073798960) || (ip ipd >= 1073798962 && ip ipd <= 1090519039)),
	((dst port 50925) || (dst port 51133) || (dst port 53924) || (dst port 62546) || (dst port 64668)) && ((ip ipd >= 1073741824 && ip ipd <= 1073763627) || (ip ipd >= 1073763629 && ip ipd <= 1073767500) || (ip ipd >= 1073767502 && ip ipd <= 1073775710) || (ip ipd >= 1073775712 && ip ipd <= 1073780929) || (ip ipd >= 1073780931 && ip ipd <= 1073798709) || (ip ipd >= 1073798711 && ip ipd <= 1090519039)),
	((dst port 27529) || (dst port 31311) || (dst port 38356) || (dst port 45271) || (dst port 52535)) && ((ip ipd >= 1073741824 && ip ipd <= 1073767818) || (ip ipd >= 1073767820 && ip ipd <= 1073782980) || (ip ipd >= 1073782982 && ip ipd <= 1073786810) || (ip ipd >= 1073786812 && ip ipd <= 1073792182) || (ip ipd >= 1073792184 && ip ipd <= 1073797002) || (ip ipd >= 1073797004 && ip ipd <= 1090519039)),
	((dst port 2) || (dst port 17034) || (dst port 28131) || (dst port 30411) || (dst port 58895)) && ((ip ipd >= 1073741824 && ip ipd <= 1073761143) || (ip ipd >= 1073761145 && ip ipd <= 1073772908) || (ip ipd >= 1073772910 && ip ipd <= 1073777929) || (ip ipd >= 1073777931 && ip ipd <= 1073780292) || (ip ipd >= 1073780294 && ip ipd <= 1073795146) || (ip ipd >= 1073795148 && ip ipd <= 1090519039)),
	((dst port 18330) || (dst port 42761) || (dst port 48843) || (dst port 51301) || (dst port 64357)) && ((ip ipd >= 1073741824 && ip ipd <= 1073747842) || (ip ipd >= 1073747844 && ip ipd <= 1073778675) || (ip ipd >= 1073778677 && ip ipd <= 1073784951) || (ip ipd >= 1073784953 && ip ipd <= 1073785577) || (ip ipd >= 1073785579 && ip ipd <= 1073786326) || (ip ipd >= 1073786328 && ip ipd <= 1090519039)),
	((dst port 16624) || (dst port 18782) || (dst port 19389) || (dst port 48377) || (dst port 51208)) && ((ip ipd >= 1073741824 && ip ipd <= 1073742162) || (ip ipd >= 1073742164 && ip ipd <= 1073745702) || (ip ipd >= 1073745704 && ip ipd <= 1073747512) || (ip ipd >= 1073747514 && ip ipd <= 1073755891) || (ip ipd >= 1073755893 && ip ipd <= 1073802561) || (ip ipd >= 1073802563 && ip ipd <= 1090519039)),
	((dst port 13681) || (dst port 30678) || (dst port 31059) || (dst port 44822) || (dst port 49311)) && ((ip ipd >= 1073741824 && ip ipd <= 1073758250) || (ip ipd >= 1073758252 && ip ipd <= 1073772834) || (ip ipd >= 1073772836 && ip ipd <= 1073800268) || (ip ipd >= 1073800270 && ip ipd <= 1073801460) || (ip ipd >= 1073801462 && ip ipd <= 1073802318) || (ip ipd >= 1073802320 && ip ipd <= 1090519039)),
	((dst port 9745) || (dst port 17229) || (dst port 25985) || (dst port 50559) || (dst port 60192)) && ((ip ipd >= 1073741824 && ip ipd <= 1073775010) || (ip ipd >= 1073775012 && ip ipd <= 1073796551) || (ip ipd >= 1073796553 && ip ipd <= 1073800661) || (ip ipd >= 1073800663 && ip ipd <= 1073804654) || (ip ipd >= 1073804656 && ip ipd <= 1073805598) || (ip ipd >= 1073805600 && ip ipd <= 1090519039)),
	((dst port 17835) || (dst port 42409) || (dst port 48629) || (dst port 51134) || (dst port 54363)) && ((ip ipd >= 1073741824 && ip ipd <= 1073769261) || (ip ipd >= 1073769263 && ip ipd <= 1073771608) || (ip ipd >= 1073771610 && ip ipd <= 1073783526) || (ip ipd >= 1073783528 && ip ipd <= 1073792327) || (ip ipd >= 1073792329 && ip ipd <= 1073792661) || (ip ipd >= 1073792663 && ip ipd <= 1090519039)),
	((dst port 27849) || (dst port 28204) || (dst port 41521) || (dst port 55125) || (dst port 61920)) && ((ip ipd >= 1073741824 && ip ipd <= 1073746886) || (ip ipd >= 1073746888 && ip ipd <= 1073749687) || (ip ipd >= 1073749689 && ip ipd <= 1073753646) || (ip ipd >= 1073753648 && ip ipd <= 1073793447) || (ip ipd >= 1073793449 && ip ipd <= 1073806827) || (ip ipd >= 1073806829 && ip ipd <= 1090519039)),
	((dst port 2726) || (dst port 2850) || (dst port 6160) || (dst port 14982) || (dst port 56456)) && ((ip ipd >= 1073741824 && ip ipd <= 1073757997) || (ip ipd >= 1073757999 && ip ipd <= 1073766542) || (ip ipd >= 1073766544 && ip ipd <= 1073794158) || (ip ipd >= 1073794160 && ip ipd <= 1073796134) || (ip ipd >= 1073796136 && ip ipd <= 1073803819) || (ip ipd >= 1073803821 && ip ipd <= 1090519039)),
	((dst port 7137) || (dst port 13868) || (dst port 26458) || (dst port 27359) || (dst port 65426)) && ((ip ipd >= 1073741824 && ip ipd <= 1073775376) || (ip ipd >= 1073775378 && ip ipd <= 1073790983) || (ip ipd >= 1073790985 && ip ipd <= 1073795841) || (ip ipd >= 1073795843 && ip ipd <= 1073798776) || (ip ipd >= 1073798778 && ip ipd <= 1073804388) || (ip ipd >= 1073804390 && ip ipd <= 1090519039)),
	((dst port 27318) || (dst port 53548) || (dst port 53573) || (dst port 58932) || (dst port 63299)) && ((ip ipd >= 1073741824 && ip ipd <= 1073748172) || (ip ipd >= 1073748174 && ip ipd <= 1073755187) || (ip ipd >= 1073755189 && ip ipd <= 1073765551) || (ip ipd >= 1073765553 && ip ipd <= 1073767192) || (ip ipd >= 1073767194 && ip ipd <= 1073795798) || (ip ipd >= 1073795800 && ip ipd <= 1090519039)),
	((dst port 275) || (dst port 40991) || (dst port 43747) || (dst port 48438) || (dst port 64714)) && ((ip ipd >= 1073741824 && ip ipd <= 1073769027) || (ip ipd >= 1073769029 && ip ipd <= 1073771873) || (ip ipd >= 1073771875 && ip ipd <= 1073780667) || (ip ipd >= 1073780669 && ip ipd <= 1073781365) || (ip ipd >= 1073781367 && ip ipd <= 1073789335) || (ip ipd >= 1073789337 && ip ipd <= 1090519039)),
	((dst port 9568) || (dst port 16963) || (dst port 29587) || (dst port 44614) || (dst port 46128)) && ((ip ipd >= 1073741824 && ip ipd <= 1073750354) || (ip ipd >= 1073750356 && ip ipd <= 1073757344) || (ip ipd >= 1073757346 && ip ipd <= 1073763341) || (ip ipd >= 1073763343 && ip ipd <= 1073786246) || (ip ipd >= 1073786248 && ip ipd <= 1073800551) || (ip ipd >= 1073800553 && ip ipd <= 1090519039)),
	((dst port 14204) || (dst port 46889) || (dst port 48013) || (dst port 51488) || (dst port 62799)) && ((ip ipd >= 1073741824 && ip ipd <= 1073746653) || (ip ipd >= 1073746655 && ip ipd <= 1073755124) || (ip ipd >= 1073755126 && ip ipd <= 1073781065) || (ip ipd >= 1073781067 && ip ipd <= 1073787107) || (ip ipd >= 1073787109 && ip ipd <= 1073799473) || (ip ipd >= 1073799475 && ip ipd <= 1090519039)),
	((dst port 14328) || (dst port 17741) || (dst port 27538) || (dst port 44359) || (dst port 49863)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743163) || (ip ipd >= 1073743165 && ip ipd <= 1073754617) || (ip ipd >= 1073754619 && ip ipd <= 1073755942) || (ip ipd >= 1073755944 && ip ipd <= 1073790352) || (ip ipd >= 1073790354 && ip ipd <= 1073796819) || (ip ipd >= 1073796821 && ip ipd <= 1090519039)),
	((dst port 1148) || (dst port 7177) || (dst port 27056) || (dst port 35270) || (dst port 47530)) && ((ip ipd >= 1073741824 && ip ipd <= 1073745132) || (ip ipd >= 1073745134 && ip ipd <= 1073771821) || (ip ipd >= 1073771823 && ip ipd <= 1073782640) || (ip ipd >= 1073782642 && ip ipd <= 1073783353) || (ip ipd >= 1073783355 && ip ipd <= 1073796602) || (ip ipd >= 1073796604 && ip ipd <= 1090519039)),
	((dst port 21620) || (dst port 24627) || (dst port 35694) || (dst port 41409) || (dst port 50388)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743644) || (ip ipd >= 1073743646 && ip ipd <= 1073748524) || (ip ipd >= 1073748526 && ip ipd <= 1073757714) || (ip ipd >= 1073757716 && ip ipd <= 1073770382) || (ip ipd >= 1073770384 && ip ipd <= 1073783790) || (ip ipd >= 1073783792 && ip ipd <= 1090519039)),
	((dst port 22181) || (dst port 24140) || (dst port 51559) || (dst port 54952) || (dst port 55956)) && ((ip ipd >= 1073741824 && ip ipd <= 1073744986) || (ip ipd >= 1073744988 && ip ipd <= 1073746996) || (ip ipd >= 1073746998 && ip ipd <= 1073753920) || (ip ipd >= 1073753922 && ip ipd <= 1073772647) || (ip ipd >= 1073772649 && ip ipd <= 1073791810) || (ip ipd >= 1073791812 && ip ipd <= 1090519039)),
	((dst port 11926) || (dst port 23001) || (dst port 27055) || (dst port 34796) || (dst port 36337)) && ((ip ipd >= 1073741824 && ip ipd <= 1073760079) || (ip ipd >= 1073760081 && ip ipd <= 1073787917) || (ip ipd >= 1073787919 && ip ipd <= 1073795255) || (ip ipd >= 1073795257 && ip ipd <= 1073798865) || (ip ipd >= 1073798867 && ip ipd <= 1073800669) || (ip ipd >= 1073800671 && ip ipd <= 1090519039)),
	((dst port 26281) || (dst port 39478) || (dst port 52532) || (dst port 53891) || (dst port 56879)) && ((ip ipd >= 1073741824 && ip ipd <= 1073751053) || (ip ipd >= 1073751055 && ip ipd <= 1073757245) || (ip ipd >= 1073757247 && ip ipd <= 1073757404) || (ip ipd >= 1073757406 && ip ipd <= 1073789357) || (ip ipd >= 1073789359 && ip ipd <= 1073805525) || (ip ipd >= 1073805527 && ip ipd <= 1090519039)),
	((dst port 10816) || (dst port 20338) || (dst port 44407) || (dst port 47835) || (dst port 57599)) && ((ip ipd >= 1073741824 && ip ipd <= 1073744356) || (ip ipd >= 1073744358 && ip ipd <= 1073765105) || (ip ipd >= 1073765107 && ip ipd <= 1073773786) || (ip ipd >= 1073773788 && ip ipd <= 1073791312) || (ip ipd >= 1073791314 && ip ipd <= 1073805958) || (ip ipd >= 1073805960 && ip ipd <= 1090519039)),
	((dst port 1990) || (dst port 13850) || (dst port 37232) || (dst port 54352) || (dst port 61906)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743275) || (ip ipd >= 1073743277 && ip ipd <= 1073751678) || (ip ipd >= 1073751680 && ip ipd <= 1073760688) || (ip ipd >= 1073760690 && ip ipd <= 1073780602) || (ip ipd >= 1073780604 && ip ipd <= 1073801246) || (ip ipd >= 1073801248 && ip ipd <= 1090519039)),
	((dst port 2291) || (dst port 13765) || (dst port 24157) || (dst port 37638) || (dst port 49609)) && ((ip ipd >= 1073741824 && ip ipd <= 1073746296) || (ip ipd >= 1073746298 && ip ipd <= 1073751985) || (ip ipd >= 1073751987 && ip ipd <= 1073761977) || (ip ipd >= 1073761979 && ip ipd <= 1073779973) || (ip ipd >= 1073779975 && ip ipd <= 1073783875) || (ip ipd >= 1073783877 && ip ipd <= 1090519039)),
	((dst port 22714) || (dst port 23228) || (dst port 40783) || (dst port 45734) || (dst port 63391)) && ((ip ipd >= 1073741824 && ip ipd <= 1073746097) || (ip ipd >= 1073746099 && ip ipd <= 1073759868) || (ip ipd >= 1073759870 && ip ipd <= 1073761672) || (ip ipd >= 1073761674 && ip ipd <= 1073766347) || (ip ipd >= 1073766349 && ip ipd <= 1073792326) || (ip ipd >= 1073792328 && ip ipd <= 1090519039)),
	((dst port 10603) || (dst port 21485) || (dst port 30071) || (dst port 48244) || (dst port 52932)) && ((ip ipd >= 1073741824 && ip ipd <= 1073751944) || (ip ipd >= 1073751946 && ip ipd <= 1073775641) || (ip ipd >= 1073775643 && ip ipd <= 1073778882) || (ip ipd >= 1073778884 && ip ipd <= 1073786977) || (ip ipd >= 1073786979 && ip ipd <= 1073787464) || (ip ipd >= 1073787466 && ip ipd <= 1090519039)),
	((dst port 7286) || (dst port 37163) || (dst port 37727) || (dst port 47741) || (dst port 64737)) && ((ip ipd >= 1073741824 && ip ipd <= 1073742639) || (ip ipd >= 1073742641 && ip ipd <= 1073770701) || (ip ipd >= 1073770703 && ip ipd <= 1073778752) || (ip ipd >= 1073778754 && ip ipd <= 1073794613) || (ip ipd >= 1073794615 && ip ipd <= 1073802976) || (ip ipd >= 1073802978 && ip ipd <= 1090519039)),
	((dst port 9731) || (dst port 22622) || (dst port 34437) || (dst port 38522) || (dst port 47555)) && ((ip ipd >= 1073741824 && ip ipd <= 1073770953) || (ip ipd >= 1073770955 && ip ipd <= 1073772938) || (ip ipd >= 1073772940 && ip ipd <= 1073775301) || (ip ipd >= 1073775303 && ip ipd <= 1073777540) || (ip ipd >= 1073777542 && ip ipd <= 1073780174) || (ip ipd >= 1073780176 && ip ipd <= 1090519039)),
	((dst port 2272) || (dst port 10652) || (dst port 30357) || (dst port 45401) || (dst port 45436)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743982) || (ip ipd >= 1073743984 && ip ipd <= 1073768637) || (ip ipd >= 1073768639 && ip ipd <= 1073775114) || (ip ipd >= 1073775116 && ip ipd <= 1073791472) || (ip ipd >= 1073791474 && ip ipd <= 1073801393) || (ip ipd >= 1073801395 && ip ipd <= 1090519039)),
	((dst port 18921) || (dst port 21800) || (dst port 27808) || (dst port 42963) || (dst port 54726)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753077) || (ip ipd >= 1073753079 && ip ipd <= 1073758255) || (ip ipd >= 1073758257 && ip ipd <= 1073790545) || (ip ipd >= 1073790547 && ip ipd <= 1073795570) || (ip ipd >= 1073795572 && ip ipd <= 1073803889) || (ip ipd >= 1073803891 && ip ipd <= 1090519039)),
	((dst port 13689) || (dst port 33641) || (dst port 33949) || (dst port 45145) || (dst port 48355)) && ((ip ipd >= 1073741824 && ip ipd <= 1073745692) || (ip ipd >= 1073745694 && ip ipd <= 1073766934) || (ip ipd >= 1073766936 && ip ipd <= 1073770098) || (ip ipd >= 1073770100 && ip ipd <= 1073770750) || (ip ipd >= 1073770752 && ip ipd <= 1073784048) || (ip ipd >= 1073784050 && ip ipd <= 1090519039)),
	((dst port 1908) || (dst port 7598) || (dst port 35426) || (dst port 41422) || (dst port 48031)) && ((ip ipd >= 1073741824 && ip ipd <= 1073749931) || (ip ipd >= 1073749933 && ip ipd <= 1073765876) || (ip ipd >= 1073765878 && ip ipd <= 1073769059) || (ip ipd >= 1073769061 && ip ipd <= 1073774742) || (ip ipd >= 1073774744 && ip ipd <= 1073795120) || (ip ipd >= 1073795122 && ip ipd <= 1090519039)),
	((dst port 25048) || (dst port 41299) || (dst port 46223) || (dst port 62029) || (dst port 63941)) && ((ip ipd >= 1073741824 && ip ipd <= 1073775298) || (ip ipd >= 1073775300 && ip ipd <= 1073775384) || (ip ipd >= 1073775386 && ip ipd <= 1073777848) || (ip ipd >= 1073777850 && ip ipd <= 1073788146) || (ip ipd >= 1073788148 && ip ipd <= 1073789072) || (ip ipd >= 1073789074 && ip ipd <= 1090519039)),
	((dst port 11746) || (dst port 29480) || (dst port 32130) || (dst port 52463) || (dst port 55670)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753905) || (ip ipd >= 1073753907 && ip ipd <= 1073761755) || (ip ipd >= 1073761757 && ip ipd <= 1073773854) || (ip ipd >= 1073773856 && ip ipd <= 1073786837) || (ip ipd >= 1073786839 && ip ipd <= 1073787715) || (ip ipd >= 1073787717 && ip ipd <= 1090519039)),
	((dst port 12297) || (dst port 23407) || (dst port 30063) || (dst port 39108) || (dst port 44212)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743361) || (ip ipd >= 1073743363 && ip ipd <= 1073757159) || (ip ipd >= 1073757161 && ip ipd <= 1073764036) || (ip ipd >= 1073764038 && ip ipd <= 1073776406) || (ip ipd >= 1073776408 && ip ipd <= 1073798959) || (ip ipd >= 1073798961 && ip ipd <= 1090519039)),
	((dst port 1458) || (dst port 53750) || (dst port 56104) || (dst port 60557) || (dst port 63893)) && ((ip ipd >= 1073741824 && ip ipd <= 1073745222) || (ip ipd >= 1073745224 && ip ipd <= 1073750912) || (ip ipd >= 1073750914 && ip ipd <= 1073769552) || (ip ipd >= 1073769554 && ip ipd <= 1073795625) || (ip ipd >= 1073795627 && ip ipd <= 1073797203) || (ip ipd >= 1073797205 && ip ipd <= 1090519039)),
	((dst port 810) || (dst port 1129) || (dst port 35861) || (dst port 39673) || (dst port 52258)) && ((ip ipd >= 1073741824 && ip ipd <= 1073748322) || (ip ipd >= 1073748324 && ip ipd <= 1073759884) || (ip ipd >= 1073759886 && ip ipd <= 1073790055) || (ip ipd >= 1073790057 && ip ipd <= 1073793085) || (ip ipd >= 1073793087 && ip ipd <= 1073796157) || (ip ipd >= 1073796159 && ip ipd <= 1090519039)),
	((dst port 42706) || (dst port 44996) || (dst port 48211) || (dst port 48305) || (dst port 53366)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743727) || (ip ipd >= 1073743729 && ip ipd <= 1073762270) || (ip ipd >= 1073762272 && ip ipd <= 1073762835) || (ip ipd >= 1073762837 && ip ipd <= 1073779641) || (ip ipd >= 1073779643 && ip ipd <= 1073782903) || (ip ipd >= 1073782905 && ip ipd <= 1090519039)),
	((dst port 13880) || (dst port 15792) || (dst port 37317) || (dst port 40379) || (dst port 57923)) && ((ip ipd >= 1073741824 && ip ipd <= 1073742033) || (ip ipd >= 1073742035 && ip ipd <= 1073748645) || (ip ipd >= 1073748647 && ip ipd <= 1073750326) || (ip ipd >= 1073750328 && ip ipd <= 1073762544) || (ip ipd >= 1073762546 && ip ipd <= 1073791253) || (ip ipd >= 1073791255 && ip ipd <= 1090519039)),
	((dst port 4133) || (dst port 25543) || (dst port 42460) || (dst port 52287) || (dst port 64288)) && ((ip ipd >= 1073741824 && ip ipd <= 1073747634) || (ip ipd >= 1073747636 && ip ipd <= 1073766528) || (ip ipd >= 1073766530 && ip ipd <= 1073780730) || (ip ipd >= 1073780732 && ip ipd <= 1073794502) || (ip ipd >= 1073794504 && ip ipd <= 1073799379) || (ip ipd >= 1073799381 && ip ipd <= 1090519039)),
	((dst port 2605) || (dst port 10411) || (dst port 30981) || (dst port 46844) || (dst port 57067)) && ((ip ipd >= 1073741824 && ip ipd <= 1073758253) || (ip ipd >= 1073758255 && ip ipd <= 1073763534) || (ip ipd >= 1073763536 && ip ipd <= 1073780614) || (ip ipd >= 1073780616 && ip ipd <= 1073798432) || (ip ipd >= 1073798434 && ip ipd <= 1073804843) || (ip ipd >= 1073804845 && ip ipd <= 1090519039)),
	((dst port 12632) || (dst port 17919) || (dst port 22571) || (dst port 42692) || (dst port 44739)) && ((ip ipd >= 1073741824 && ip ipd <= 1073744530) || (ip ipd >= 1073744532 && ip ipd <= 1073746540) || (ip ipd >= 1073746542 && ip ipd <= 1073754005) || (ip ipd >= 1073754007 && ip ipd <= 1073757411) || (ip ipd >= 1073757413 && ip ipd <= 1073793608) || (ip ipd >= 1073793610 && ip ipd <= 1090519039)),
	((dst port 4046) || (dst port 14497) || (dst port 18907) || (dst port 51528) || (dst port 60878)) && ((ip ipd >= 1073741824 && ip ipd <= 1073743312) || (ip ipd >= 1073743314 && ip ipd <= 1073756787) || (ip ipd >= 1073756789 && ip ipd <= 1073762599) || (ip ipd >= 1073762601 && ip ipd <= 1073785220) || (ip ipd >= 1073785222 && ip ipd <= 1073806059) || (ip ipd >= 1073806061 && ip ipd <= 1090519039)),
	((dst port 1592) || (dst port 18493) || (dst port 31702) || (dst port 34966) || (dst port 61267)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753695) || (ip ipd >= 1073753697 && ip ipd <= 1073758678) || (ip ipd >= 1073758680 && ip ipd <= 1073767029) || (ip ipd >= 1073767031 && ip ipd <= 1073784503) || (ip ipd >= 1073784505 && ip ipd <= 1073790364) || (ip ipd >= 1073790366 && ip ipd <= 1090519039)),
	((dst port 429) || (dst port 12573) || (dst port 14796) || (dst port 20445) || (dst port 33429)) && ((ip ipd >= 1073741824 && ip ipd <= 1073764478) || (ip ipd >= 1073764480 && ip ipd <= 1073780298) || (ip ipd >= 1073780300 && ip ipd <= 1073798793) || (ip ipd >= 1073798795 && ip ipd <= 1073799855) || (ip ipd >= 1073799857 && ip ipd <= 1073805241) || (ip ipd >= 1073805243 && ip ipd <= 1090519039)),
	((dst port 9114) || (dst port 18316) || (dst port 32436) || (dst port 42250) || (dst port 58567)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753820) || (ip ipd >= 1073753822 && ip ipd <= 1073754399) || (ip ipd >= 1073754401 && ip ipd <= 1073756268) || (ip ipd >= 1073756270 && ip ipd <= 1073777456) || (ip ipd >= 1073777458 && ip ipd <= 1073795429) || (ip ipd >= 1073795431 && ip ipd <= 1090519039)),
	((dst port 15992) || (dst port 19452) || (dst port 23627) || (dst port 25176) || (dst port 37401)) && ((ip ipd >= 1073741824 && ip ipd <= 1073744651) || (ip ipd >= 1073744653 && ip ipd <= 1073747220) || (ip ipd >= 1073747222 && ip ipd <= 1073753867) || (ip ipd >= 1073753869 && ip ipd <= 1073764877) || (ip ipd >= 1073764879 && ip ipd <= 1073787255) || (ip ipd >= 1073787257 && ip ipd <= 1090519039)),
	((dst port 33823) || (dst port 43415) || (dst port 48964) || (dst port 52026) || (dst port 61207)) && ((ip ipd >= 1073741824 && ip ipd <= 1073760781) || (ip ipd >= 1073760783 && ip ipd <= 1073762843) || (ip ipd >= 1073762845 && ip ipd <= 1073764833) || (ip ipd >= 1073764835 && ip ipd <= 1073798623) || (ip ipd >= 1073798625 && ip ipd <= 1073802035) || (ip ipd >= 1073802037 && ip ipd <= 1090519039)),
	((dst port 3878) || (dst port 6562) || (dst port 12780) || (dst port 28401) || (dst port 45242)) && ((ip ipd >= 1073741824 && ip ipd <= 1073761977) || (ip ipd >= 1073761979 && ip ipd <= 1073762985) || (ip ipd >= 1073762987 && ip ipd <= 1073779703) || (ip ipd >= 1073779705 && ip ipd <= 1073793926) || (ip ipd >= 1073793928 && ip ipd <= 1073794848) || (ip ipd >= 1073794850 && ip ipd <= 1090519039)),
	((dst port 456) || (dst port 34539) || (dst port 41116) || (dst port 42155) || (dst port 64311)) && ((ip ipd >= 1073741824 && ip ipd <= 1073762979) || (ip ipd >= 1073762981 && ip ipd <= 1073775632) || (ip ipd >= 1073775634 && ip ipd <= 1073777424) || (ip ipd >= 1073777426 && ip ipd <= 1073781956) || (ip ipd >= 1073781958 && ip ipd <= 1073806306) || (ip ipd >= 1073806308 && ip ipd <= 1090519039)),
	((dst port 9446) || (dst port 12839) || (dst port 26043) || (dst port 49553) || (dst port 57178)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753074) || (ip ipd >= 1073753076 && ip ipd <= 1073754360) || (ip ipd >= 1073754362 && ip ipd <= 1073760513) || (ip ipd >= 1073760515 && ip ipd <= 1073770893) || (ip ipd >= 1073770895 && ip ipd <= 1073802693) || (ip ipd >= 1073802695 && ip ipd <= 1090519039)),
	((dst port 5520) || (dst port 7153) || (dst port 27345) || (dst port 39529) || (dst port 52806)) && ((ip ipd >= 1073741824 && ip ipd <= 1073763330) || (ip ipd >= 1073763332 && ip ipd <= 1073779240) || (ip ipd >= 1073779242 && ip ipd <= 1073794340) || (ip ipd >= 1073794342 && ip ipd <= 1073795843) || (ip ipd >= 1073795845 && ip ipd <= 1073798762) || (ip ipd >= 1073798764 && ip ipd <= 1090519039)),
	((dst port 11520) || (dst port 17564) || (dst port 26798) || (dst port 29691) || (dst port 58886)) && ((ip ipd >= 1073741824 && ip ipd <= 1073763030) || (ip ipd >= 1073763032 && ip ipd <= 1073774841) || (ip ipd >= 1073774843 && ip ipd <= 1073775038) || (ip ipd >= 1073775040 && ip ipd <= 1073785058) || (ip ipd >= 1073785060 && ip ipd <= 1073790590) || (ip ipd >= 1073790592 && ip ipd <= 1090519039)),
	((dst port 26242) || (dst port 33803) || (dst port 39101) || (dst port 44896) || (dst port 59414)) && ((ip ipd >= 1073741824 && ip ipd <= 1073753239) || (ip ipd >= 1073753241 && ip ipd <= 1073771618) || (ip ipd >= 1073771620 && ip ipd <= 1073773428) || (ip ipd >= 1073773430 && ip ipd <= 1073804369) || (ip ipd >= 1073804371 && ip ipd <= 1073804668) || (ip ipd >= 1073804670 && ip ipd <= 1090519039)),
	((dst port 6524) || (dst port 6842) || (dst port 8700) || (dst port 51479) || (dst port 54335)) && ((ip ipd >= 1073741824 && ip ipd <= 1073764491) || (ip ipd >= 1073764493 && ip ipd <= 1073766748) || (ip ipd >= 1073766750 && ip ipd <= 1073790527) || (ip ipd >= 1073790529 && ip ipd <= 1073804930) || (ip ipd >= 1073804932 && ip ipd <= 1073806079) || (ip ipd >= 1073806081 && ip ipd <= 1090519039)),
	((dst port 1595) || (dst port 6348) || (dst port 7930) || (dst port 15949) || (dst port 46129)) && ((ip ipd >= 1073741824 && ip ipd <= 1073750987) || (ip ipd >= 1073750989 && ip ipd <= 1073764830) || (ip ipd >= 1073764832 && ip ipd <= 1073766734) || (ip ipd >= 1073766736 && ip ipd <= 1073792950) || (ip ipd >= 1073792952 && ip ipd <= 1073793875) || (ip ipd >= 1073793877 && ip ipd <= 1090519039)),
	((dst port 4235) || (dst port 17860) || (dst port 37778) || (dst port 38643) || (dst port 65232)) && ((ip ipd >= 1073741824 && ip ipd <= 1073747643) || (ip ipd >= 1073747645 && ip ipd <= 1073779807) || (ip ipd >= 1073779809 && ip ipd <= 1073780336) || (ip ipd >= 1073780338 && ip ipd <= 1073788569) || (ip ipd >= 1073788571 && ip ipd <= 1073802843) || (ip ipd >= 1073802845 && ip ipd <= 1090519039)),
	((dst port 2927) || (dst port 8789) || (dst port 18000) || (dst port 37932) || (dst port 42053)) && ((ip ipd >= 1073741824 && ip ipd <= 1073757451) || (ip ipd >= 1073757453 && ip ipd <= 1073758650) || (ip ipd >= 1073758652 && ip ipd <= 1073766456) || (ip ipd >= 1073766458 && ip ipd <= 1073794937) || (ip ipd >= 1073794939 && ip ipd <= 1073806239) || (ip ipd >= 1073806241 && ip ipd <= 1090519039)),
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
getIPClas32 :: CycleCountAccum;
getIPClas33 :: CycleCountAccum;
getIPClas34 :: CycleCountAccum;
getIPClas35 :: CycleCountAccum;
getIPClas36 :: CycleCountAccum;
getIPClas37 :: CycleCountAccum;
getIPClas38 :: CycleCountAccum;
getIPClas39 :: CycleCountAccum;
getIPClas40 :: CycleCountAccum;
getIPClas41 :: CycleCountAccum;
getIPClas42 :: CycleCountAccum;
getIPClas43 :: CycleCountAccum;
getIPClas44 :: CycleCountAccum;
getIPClas45 :: CycleCountAccum;
getIPClas46 :: CycleCountAccum;
getIPClas47 :: CycleCountAccum;
getIPClas48 :: CycleCountAccum;
getIPClas49 :: CycleCountAccum;
getIPClas50 :: CycleCountAccum;
getIPClas51 :: CycleCountAccum;
getIPClas52 :: CycleCountAccum;
getIPClas53 :: CycleCountAccum;
getIPClas54 :: CycleCountAccum;
getIPClas55 :: CycleCountAccum;
getIPClas56 :: CycleCountAccum;
getIPClas57 :: CycleCountAccum;
getIPClas58 :: CycleCountAccum;
getIPClas59 :: CycleCountAccum;
getIPClas60 :: CycleCountAccum;
getIPClas61 :: CycleCountAccum;
getIPClas62 :: CycleCountAccum;
getIPClas63 :: CycleCountAccum;

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
ipclassifier[32] -> getIPClas32 -> Discard ();
ipclassifier[33] -> getIPClas33 -> Discard ();
ipclassifier[34] -> getIPClas34 -> Discard ();
ipclassifier[35] -> getIPClas35 -> Discard ();
ipclassifier[36] -> getIPClas36 -> Discard ();
ipclassifier[37] -> getIPClas37 -> Discard ();
ipclassifier[38] -> getIPClas38 -> Discard ();
ipclassifier[39] -> getIPClas39 -> Discard ();
ipclassifier[40] -> getIPClas40 -> Discard ();
ipclassifier[41] -> getIPClas41 -> Discard ();
ipclassifier[42] -> getIPClas42 -> Discard ();
ipclassifier[43] -> getIPClas43 -> Discard ();
ipclassifier[44] -> getIPClas44 -> Discard ();
ipclassifier[45] -> getIPClas45 -> Discard ();
ipclassifier[46] -> getIPClas46 -> Discard ();
ipclassifier[47] -> getIPClas47 -> Discard ();
ipclassifier[48] -> getIPClas48 -> Discard ();
ipclassifier[49] -> getIPClas49 -> Discard ();
ipclassifier[50] -> getIPClas50 -> Discard ();
ipclassifier[51] -> getIPClas51 -> Discard ();
ipclassifier[52] -> getIPClas52 -> Discard ();
ipclassifier[53] -> getIPClas53 -> Discard ();
ipclassifier[54] -> getIPClas54 -> Discard ();
ipclassifier[55] -> getIPClas55 -> Discard ();
ipclassifier[56] -> getIPClas56 -> Discard ();
ipclassifier[57] -> getIPClas57 -> Discard ();
ipclassifier[58] -> getIPClas58 -> Discard ();
ipclassifier[59] -> getIPClas59 -> Discard ();
ipclassifier[60] -> getIPClas60 -> Discard ();
ipclassifier[61] -> getIPClas61 -> Discard ();
ipclassifier[62] -> getIPClas62 -> Discard ();
ipclassifier[63] -> getIPClas63 -> Discard ();
	
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
