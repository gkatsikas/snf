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
	((dst port 5081) || (dst port 11245) || (dst port 31682) || (dst port 55834) || (dst port 62691)) && ((ip dst >= 1073741824 && ip dst <= 1073764833) || (ip dst >= 1073764835 && ip dst <= 1073776903) || (ip dst >= 1073776905 && ip dst <= 1073784793) || (ip dst >= 1073784795 && ip dst <= 1073799453) || (ip dst >= 1073799455 && ip dst <= 1073802092) || (ip dst >= 1073802094 && ip dst <= 1090519039)),
	((dst port 8788) || (dst port 25994) || (dst port 27630) || (dst port 43332) || (dst port 44146)) && ((ip dst >= 1073741824 && ip dst <= 1073748115) || (ip dst >= 1073748117 && ip dst <= 1073749717) || (ip dst >= 1073749719 && ip dst <= 1073749888) || (ip dst >= 1073749890 && ip dst <= 1073770242) || (ip dst >= 1073770244 && ip dst <= 1073780993) || (ip dst >= 1073780995 && ip dst <= 1090519039)),
	((dst port 10117) || (dst port 15266) || (dst port 31823) || (dst port 39362) || (dst port 41527)) && ((ip dst >= 1073741824 && ip dst <= 1073754083) || (ip dst >= 1073754085 && ip dst <= 1073758721) || (ip dst >= 1073758723 && ip dst <= 1073772849) || (ip dst >= 1073772851 && ip dst <= 1073779174) || (ip dst >= 1073779176 && ip dst <= 1073792972) || (ip dst >= 1073792974 && ip dst <= 1090519039)),
	((dst port 16086) || (dst port 17427) || (dst port 26679) || (dst port 27077) || (dst port 61035)) && ((ip dst >= 1073741824 && ip dst <= 1073743855) || (ip dst >= 1073743857 && ip dst <= 1073748190) || (ip dst >= 1073748192 && ip dst <= 1073764321) || (ip dst >= 1073764323 && ip dst <= 1073793268) || (ip dst >= 1073793270 && ip dst <= 1073801922) || (ip dst >= 1073801924 && ip dst <= 1090519039)),
	((dst port 33846) || (dst port 36133) || (dst port 43180) || (dst port 44596) || (dst port 53955)) && ((ip dst >= 1073741824 && ip dst <= 1073751125) || (ip dst >= 1073751127 && ip dst <= 1073780277) || (ip dst >= 1073780279 && ip dst <= 1073780672) || (ip dst >= 1073780674 && ip dst <= 1073794255) || (ip dst >= 1073794257 && ip dst <= 1073795029) || (ip dst >= 1073795031 && ip dst <= 1090519039)),
	((dst port 17300) || (dst port 37507) || (dst port 39818) || (dst port 45992) || (dst port 50470)) && ((ip dst >= 1073741824 && ip dst <= 1073750197) || (ip dst >= 1073750199 && ip dst <= 1073754566) || (ip dst >= 1073754568 && ip dst <= 1073766953) || (ip dst >= 1073766955 && ip dst <= 1073778499) || (ip dst >= 1073778501 && ip dst <= 1073791288) || (ip dst >= 1073791290 && ip dst <= 1090519039)),
	((dst port 10800) || (dst port 18357) || (dst port 22652) || (dst port 52035) || (dst port 55174)) && ((ip dst >= 1073741824 && ip dst <= 1073744919) || (ip dst >= 1073744921 && ip dst <= 1073745177) || (ip dst >= 1073745179 && ip dst <= 1073749522) || (ip dst >= 1073749524 && ip dst <= 1073749898) || (ip dst >= 1073749900 && ip dst <= 1073766943) || (ip dst >= 1073766945 && ip dst <= 1090519039)),
	((dst port 7227) || (dst port 9612) || (dst port 18647) || (dst port 33469) || (dst port 64238)) && ((ip dst >= 1073741824 && ip dst <= 1073750345) || (ip dst >= 1073750347 && ip dst <= 1073756450) || (ip dst >= 1073756452 && ip dst <= 1073759028) || (ip dst >= 1073759030 && ip dst <= 1073761434) || (ip dst >= 1073761436 && ip dst <= 1073775125) || (ip dst >= 1073775127 && ip dst <= 1090519039)),
	((dst port 7257) || (dst port 10685) || (dst port 13022) || (dst port 43537) || (dst port 45811)) && ((ip dst >= 1073741824 && ip dst <= 1073756643) || (ip dst >= 1073756645 && ip dst <= 1073762042) || (ip dst >= 1073762044 && ip dst <= 1073786886) || (ip dst >= 1073786888 && ip dst <= 1073795720) || (ip dst >= 1073795722 && ip dst <= 1073801229) || (ip dst >= 1073801231 && ip dst <= 1090519039)),
	((dst port 19058) || (dst port 24158) || (dst port 31371) || (dst port 55523) || (dst port 56211)) && ((ip dst >= 1073741824 && ip dst <= 1073744280) || (ip dst >= 1073744282 && ip dst <= 1073747219) || (ip dst >= 1073747221 && ip dst <= 1073750156) || (ip dst >= 1073750158 && ip dst <= 1073753997) || (ip dst >= 1073753999 && ip dst <= 1073757166) || (ip dst >= 1073757168 && ip dst <= 1090519039)),
	((dst port 861) || (dst port 14923) || (dst port 15440) || (dst port 46833) || (dst port 57860)) && ((ip dst >= 1073741824 && ip dst <= 1073744676) || (ip dst >= 1073744678 && ip dst <= 1073755001) || (ip dst >= 1073755003 && ip dst <= 1073785421) || (ip dst >= 1073785423 && ip dst <= 1073787021) || (ip dst >= 1073787023 && ip dst <= 1073791869) || (ip dst >= 1073791871 && ip dst <= 1090519039)),
	((dst port 23573) || (dst port 37368) || (dst port 58032) || (dst port 61166) || (dst port 61404)) && ((ip dst >= 1073741824 && ip dst <= 1073745381) || (ip dst >= 1073745383 && ip dst <= 1073745955) || (ip dst >= 1073745957 && ip dst <= 1073753895) || (ip dst >= 1073753897 && ip dst <= 1073783773) || (ip dst >= 1073783775 && ip dst <= 1073799279) || (ip dst >= 1073799281 && ip dst <= 1090519039)),
	((dst port 10550) || (dst port 42206) || (dst port 43295) || (dst port 47183) || (dst port 64606)) && ((ip dst >= 1073741824 && ip dst <= 1073752486) || (ip dst >= 1073752488 && ip dst <= 1073753330) || (ip dst >= 1073753332 && ip dst <= 1073762921) || (ip dst >= 1073762923 && ip dst <= 1073777218) || (ip dst >= 1073777220 && ip dst <= 1073805088) || (ip dst >= 1073805090 && ip dst <= 1090519039)),
	((dst port 8619) || (dst port 22337) || (dst port 25051) || (dst port 32537) || (dst port 32624)) && ((ip dst >= 1073741824 && ip dst <= 1073746583) || (ip dst >= 1073746585 && ip dst <= 1073754357) || (ip dst >= 1073754359 && ip dst <= 1073770844) || (ip dst >= 1073770846 && ip dst <= 1073792793) || (ip dst >= 1073792795 && ip dst <= 1073803321) || (ip dst >= 1073803323 && ip dst <= 1090519039)),
	((dst port 85) || (dst port 25758) || (dst port 27555) || (dst port 33131) || (dst port 56758)) && ((ip dst >= 1073741824 && ip dst <= 1073765830) || (ip dst >= 1073765832 && ip dst <= 1073783027) || (ip dst >= 1073783029 && ip dst <= 1073789360) || (ip dst >= 1073789362 && ip dst <= 1073792496) || (ip dst >= 1073792498 && ip dst <= 1073803137) || (ip dst >= 1073803139 && ip dst <= 1090519039)),
	((dst port 17285) || (dst port 50202) || (dst port 50450) || (dst port 50962) || (dst port 61547)) && ((ip dst >= 1073741824 && ip dst <= 1073766754) || (ip dst >= 1073766756 && ip dst <= 1073772835) || (ip dst >= 1073772837 && ip dst <= 1073777080) || (ip dst >= 1073777082 && ip dst <= 1073782714) || (ip dst >= 1073782716 && ip dst <= 1073784765) || (ip dst >= 1073784767 && ip dst <= 1090519039)),
	((dst port 626) || (dst port 3899) || (dst port 9282) || (dst port 31042) || (dst port 47163)) && ((ip dst >= 1073741824 && ip dst <= 1073747585) || (ip dst >= 1073747587 && ip dst <= 1073761663) || (ip dst >= 1073761665 && ip dst <= 1073778925) || (ip dst >= 1073778927 && ip dst <= 1073785226) || (ip dst >= 1073785228 && ip dst <= 1073801368) || (ip dst >= 1073801370 && ip dst <= 1090519039)),
	((dst port 32341) || (dst port 38131) || (dst port 50312) || (dst port 50634) || (dst port 65279)) && ((ip dst >= 1073741824 && ip dst <= 1073746052) || (ip dst >= 1073746054 && ip dst <= 1073781888) || (ip dst >= 1073781890 && ip dst <= 1073782666) || (ip dst >= 1073782668 && ip dst <= 1073787116) || (ip dst >= 1073787118 && ip dst <= 1073791122) || (ip dst >= 1073791124 && ip dst <= 1090519039)),
	((dst port 10143) || (dst port 13973) || (dst port 24039) || (dst port 38921) || (dst port 54731)) && ((ip dst >= 1073741824 && ip dst <= 1073743446) || (ip dst >= 1073743448 && ip dst <= 1073761926) || (ip dst >= 1073761928 && ip dst <= 1073768967) || (ip dst >= 1073768969 && ip dst <= 1073772386) || (ip dst >= 1073772388 && ip dst <= 1073804859) || (ip dst >= 1073804861 && ip dst <= 1090519039)),
	((dst port 19450) || (dst port 21354) || (dst port 25851) || (dst port 28451) || (dst port 50553)) && ((ip dst >= 1073741824 && ip dst <= 1073745334) || (ip dst >= 1073745336 && ip dst <= 1073753972) || (ip dst >= 1073753974 && ip dst <= 1073772440) || (ip dst >= 1073772442 && ip dst <= 1073779806) || (ip dst >= 1073779808 && ip dst <= 1073795397) || (ip dst >= 1073795399 && ip dst <= 1090519039)),
	((dst port 16435) || (dst port 32977) || (dst port 59055) || (dst port 61743) || (dst port 64487)) && ((ip dst >= 1073741824 && ip dst <= 1073751701) || (ip dst >= 1073751703 && ip dst <= 1073761595) || (ip dst >= 1073761597 && ip dst <= 1073775298) || (ip dst >= 1073775300 && ip dst <= 1073782155) || (ip dst >= 1073782157 && ip dst <= 1073801516) || (ip dst >= 1073801518 && ip dst <= 1090519039)),
	((dst port 1637) || (dst port 3092) || (dst port 3824) || (dst port 10121) || (dst port 59131)) && ((ip dst >= 1073741824 && ip dst <= 1073741976) || (ip dst >= 1073741978 && ip dst <= 1073759893) || (ip dst >= 1073759895 && ip dst <= 1073773954) || (ip dst >= 1073773956 && ip dst <= 1073801043) || (ip dst >= 1073801045 && ip dst <= 1073807352) || (ip dst >= 1073807354 && ip dst <= 1090519039)),
	((dst port 6012) || (dst port 29186) || (dst port 29283) || (dst port 43223) || (dst port 62946)) && ((ip dst >= 1073741824 && ip dst <= 1073760927) || (ip dst >= 1073760929 && ip dst <= 1073761886) || (ip dst >= 1073761888 && ip dst <= 1073765843) || (ip dst >= 1073765845 && ip dst <= 1073776886) || (ip dst >= 1073776888 && ip dst <= 1073803376) || (ip dst >= 1073803378 && ip dst <= 1090519039)),
	((dst port 2908) || (dst port 27502) || (dst port 35291) || (dst port 45071) || (dst port 52678)) && ((ip dst >= 1073741824 && ip dst <= 1073766197) || (ip dst >= 1073766199 && ip dst <= 1073774891) || (ip dst >= 1073774893 && ip dst <= 1073775703) || (ip dst >= 1073775705 && ip dst <= 1073780076) || (ip dst >= 1073780078 && ip dst <= 1073803982) || (ip dst >= 1073803984 && ip dst <= 1090519039)),
	((dst port 3960) || (dst port 7123) || (dst port 34323) || (dst port 41566) || (dst port 53492)) && ((ip dst >= 1073741824 && ip dst <= 1073748405) || (ip dst >= 1073748407 && ip dst <= 1073779853) || (ip dst >= 1073779855 && ip dst <= 1073783878) || (ip dst >= 1073783880 && ip dst <= 1073786715) || (ip dst >= 1073786717 && ip dst <= 1073804668) || (ip dst >= 1073804670 && ip dst <= 1090519039)),
	((dst port 7552) || (dst port 14026) || (dst port 39278) || (dst port 48480) || (dst port 61050)) && ((ip dst >= 1073741824 && ip dst <= 1073752828) || (ip dst >= 1073752830 && ip dst <= 1073766361) || (ip dst >= 1073766363 && ip dst <= 1073784618) || (ip dst >= 1073784620 && ip dst <= 1073785735) || (ip dst >= 1073785737 && ip dst <= 1073790572) || (ip dst >= 1073790574 && ip dst <= 1090519039)),
	((dst port 3164) || (dst port 17344) || (dst port 36970) || (dst port 53345) || (dst port 59242)) && ((ip dst >= 1073741824 && ip dst <= 1073745829) || (ip dst >= 1073745831 && ip dst <= 1073753345) || (ip dst >= 1073753347 && ip dst <= 1073765605) || (ip dst >= 1073765607 && ip dst <= 1073779777) || (ip dst >= 1073779779 && ip dst <= 1073805267) || (ip dst >= 1073805269 && ip dst <= 1090519039)),
	((dst port 133) || (dst port 4626) || (dst port 12997) || (dst port 27342) || (dst port 32006)) && ((ip dst >= 1073741824 && ip dst <= 1073749562) || (ip dst >= 1073749564 && ip dst <= 1073773330) || (ip dst >= 1073773332 && ip dst <= 1073787665) || (ip dst >= 1073787667 && ip dst <= 1073795130) || (ip dst >= 1073795132 && ip dst <= 1073806821) || (ip dst >= 1073806823 && ip dst <= 1090519039)),
	((dst port 2120) || (dst port 20632) || (dst port 40137) || (dst port 52668) || (dst port 60029)) && ((ip dst >= 1073741825 && ip dst <= 1073748724) || (ip dst >= 1073748726 && ip dst <= 1073769690) || (ip dst >= 1073769692 && ip dst <= 1073780895) || (ip dst >= 1073780897 && ip dst <= 1073805557) || (ip dst >= 1073805559 && ip dst <= 1090519039)),
	((dst port 15794) || (dst port 24888) || (dst port 38457) || (dst port 42324) || (dst port 64627)) && ((ip dst >= 1073741824 && ip dst <= 1073755082) || (ip dst >= 1073755084 && ip dst <= 1073756739) || (ip dst >= 1073756741 && ip dst <= 1073759302) || (ip dst >= 1073759304 && ip dst <= 1073768297) || (ip dst >= 1073768299 && ip dst <= 1073772606) || (ip dst >= 1073772608 && ip dst <= 1090519039)),
	((dst port 1420) || (dst port 8753) || (dst port 23176) || (dst port 31430) || (dst port 45047)) && ((ip dst >= 1073741824 && ip dst <= 1073755823) || (ip dst >= 1073755825 && ip dst <= 1073759499) || (ip dst >= 1073759501 && ip dst <= 1073769948) || (ip dst >= 1073769950 && ip dst <= 1073787127) || (ip dst >= 1073787129 && ip dst <= 1073804311) || (ip dst >= 1073804313 && ip dst <= 1090519039)),
	((dst port 17007) || (dst port 26153) || (dst port 47045) || (dst port 47170) || (dst port 51419)) && ((ip dst >= 1073741824 && ip dst <= 1073750790) || (ip dst >= 1073750792 && ip dst <= 1073756283) || (ip dst >= 1073756285 && ip dst <= 1073759983) || (ip dst >= 1073759985 && ip dst <= 1073779014) || (ip dst >= 1073779016 && ip dst <= 1073786552) || (ip dst >= 1073786554 && ip dst <= 1090519039)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 4013) || (dst port 18138) || (dst port 38360) || (dst port 40576) || (dst port 54654)) && ((ip dst >= 1073741824 && ip dst <= 1073749579) || (ip dst >= 1073749581 && ip dst <= 1073751997) || (ip dst >= 1073751999 && ip dst <= 1073752054) || (ip dst >= 1073752056 && ip dst <= 1073754711) || (ip dst >= 1073754713 && ip dst <= 1073807174) || (ip dst >= 1073807176 && ip dst <= 1090519039)),
	((dst port 17666) || (dst port 19937) || (dst port 34138) || (dst port 37874) || (dst port 56558)) && ((ip dst >= 1073741824 && ip dst <= 1073751420) || (ip dst >= 1073751422 && ip dst <= 1073764884) || (ip dst >= 1073764886 && ip dst <= 1073765326) || (ip dst >= 1073765328 && ip dst <= 1073774118) || (ip dst >= 1073774120 && ip dst <= 1073804328) || (ip dst >= 1073804330 && ip dst <= 1090519039)),
	((dst port 7585) || (dst port 15761) || (dst port 16794) || (dst port 59104) || (dst port 62279)) && ((ip dst >= 1073741824 && ip dst <= 1073742610) || (ip dst >= 1073742612 && ip dst <= 1073756546) || (ip dst >= 1073756548 && ip dst <= 1073798190) || (ip dst >= 1073798192 && ip dst <= 1073801282) || (ip dst >= 1073801284 && ip dst <= 1073804319) || (ip dst >= 1073804321 && ip dst <= 1090519039)),
	((dst port 18411) || (dst port 38210) || (dst port 54151) || (dst port 60955) || (dst port 61337)) && ((ip dst >= 1073741824 && ip dst <= 1073742920) || (ip dst >= 1073742922 && ip dst <= 1073763286) || (ip dst >= 1073763288 && ip dst <= 1073765911) || (ip dst >= 1073765913 && ip dst <= 1073768870) || (ip dst >= 1073768872 && ip dst <= 1073775553) || (ip dst >= 1073775555 && ip dst <= 1090519039)),
	((dst port 8743) || (dst port 8928) || (dst port 9427) || (dst port 41751) || (dst port 46218)) && ((ip dst >= 1073741824 && ip dst <= 1073749005) || (ip dst >= 1073749007 && ip dst <= 1073775626) || (ip dst >= 1073775628 && ip dst <= 1073797827) || (ip dst >= 1073797829 && ip dst <= 1073798997) || (ip dst >= 1073798999 && ip dst <= 1073801888) || (ip dst >= 1073801890 && ip dst <= 1090519039)),
	((dst port 1596) || (dst port 24063) || (dst port 34595) || (dst port 61161) || (dst port 62841)) && ((ip dst >= 1073741824 && ip dst <= 1073758940) || (ip dst >= 1073758942 && ip dst <= 1073781862) || (ip dst >= 1073781864 && ip dst <= 1073782961) || (ip dst >= 1073782963 && ip dst <= 1073798615) || (ip dst >= 1073798617 && ip dst <= 1073798859) || (ip dst >= 1073798861 && ip dst <= 1090519039)),
	((dst port 11237) || (dst port 12264) || (dst port 29886) || (dst port 36508) || (dst port 50550)) && ((ip dst >= 1073741824 && ip dst <= 1073761229) || (ip dst >= 1073761231 && ip dst <= 1073777865) || (ip dst >= 1073777867 && ip dst <= 1073779676) || (ip dst >= 1073779678 && ip dst <= 1073789644) || (ip dst >= 1073789646 && ip dst <= 1073804889) || (ip dst >= 1073804891 && ip dst <= 1090519039)),
	((dst port 9000) || (dst port 31787) || (dst port 51406) || (dst port 54513) || (dst port 63707)) && ((ip dst >= 1073741824 && ip dst <= 1073743521) || (ip dst >= 1073743523 && ip dst <= 1073763737) || (ip dst >= 1073763739 && ip dst <= 1073773298) || (ip dst >= 1073773300 && ip dst <= 1073777769) || (ip dst >= 1073777771 && ip dst <= 1073791864) || (ip dst >= 1073791866 && ip dst <= 1090519039)),
	((dst port 8870) || (dst port 15715) || (dst port 21787) || (dst port 22680) || (dst port 42427)) && ((ip dst >= 1073741824 && ip dst <= 1073743739) || (ip dst >= 1073743741 && ip dst <= 1073765589) || (ip dst >= 1073765591 && ip dst <= 1073765807) || (ip dst >= 1073765809 && ip dst <= 1073789675) || (ip dst >= 1073789677 && ip dst <= 1073798062) || (ip dst >= 1073798064 && ip dst <= 1090519039)),
	((dst port 12006) || (dst port 13375) || (dst port 15213) || (dst port 33773) || (dst port 34253)) && ((ip dst >= 1073741824 && ip dst <= 1073748486) || (ip dst >= 1073748488 && ip dst <= 1073754580) || (ip dst >= 1073754582 && ip dst <= 1073764522) || (ip dst >= 1073764524 && ip dst <= 1073795040) || (ip dst >= 1073795042 && ip dst <= 1073801368) || (ip dst >= 1073801370 && ip dst <= 1090519039)),
	((dst port 18130) || (dst port 21420) || (dst port 23160) || (dst port 23897) || (dst port 40169)) && ((ip dst >= 1073741824 && ip dst <= 1073746153) || (ip dst >= 1073746155 && ip dst <= 1073774687) || (ip dst >= 1073774689 && ip dst <= 1073774751) || (ip dst >= 1073774753 && ip dst <= 1073776389) || (ip dst >= 1073776391 && ip dst <= 1073806126) || (ip dst >= 1073806128 && ip dst <= 1090519039)),
	((dst port 2543) || (dst port 17717) || (dst port 29214) || (dst port 46365) || (dst port 53977)) && ((ip dst >= 1073741824 && ip dst <= 1073771431) || (ip dst >= 1073771433 && ip dst <= 1073774343) || (ip dst >= 1073774345 && ip dst <= 1073798875) || (ip dst >= 1073798877 && ip dst <= 1073802961) || (ip dst >= 1073802963 && ip dst <= 1073807019) || (ip dst >= 1073807021 && ip dst <= 1090519039)),
	((dst port 2294) || (dst port 25042) || (dst port 53507) || (dst port 60203) || (dst port 62208)) && ((ip dst >= 1073741824 && ip dst <= 1073751668) || (ip dst >= 1073751670 && ip dst <= 1073781897) || (ip dst >= 1073781899 && ip dst <= 1073798601) || (ip dst >= 1073798603 && ip dst <= 1073803199) || (ip dst >= 1073803201 && ip dst <= 1073804654) || (ip dst >= 1073804656 && ip dst <= 1090519039)),
	((dst port 129) || (dst port 2074) || (dst port 7146) || (dst port 9167) || (dst port 15161)) && ((ip dst >= 1073741824 && ip dst <= 1073753109) || (ip dst >= 1073753111 && ip dst <= 1073759706) || (ip dst >= 1073759708 && ip dst <= 1073760467) || (ip dst >= 1073760469 && ip dst <= 1073760721) || (ip dst >= 1073760723 && ip dst <= 1073777457) || (ip dst >= 1073777459 && ip dst <= 1090519039)),
	((dst port 25052) || (dst port 29681) || (dst port 36001) || (dst port 38988) || (dst port 45220)) && ((ip dst >= 1073741824 && ip dst <= 1073751724) || (ip dst >= 1073751726 && ip dst <= 1073752201) || (ip dst >= 1073752203 && ip dst <= 1073754726) || (ip dst >= 1073754728 && ip dst <= 1073781849) || (ip dst >= 1073781851 && ip dst <= 1073782116) || (ip dst >= 1073782118 && ip dst <= 1090519039)),
	((dst port 8647) || (dst port 39349) || (dst port 41209) || (dst port 41326) || (dst port 63469)) && ((ip dst >= 1073741824 && ip dst <= 1073748856) || (ip dst >= 1073748858 && ip dst <= 1073751146) || (ip dst >= 1073751148 && ip dst <= 1073761870) || (ip dst >= 1073761872 && ip dst <= 1073789662) || (ip dst >= 1073789664 && ip dst <= 1073800685) || (ip dst >= 1073800687 && ip dst <= 1090519039)),
	((dst port 2544) || (dst port 15261) || (dst port 39373) || (dst port 44871) || (dst port 52884)) && ((ip dst >= 1073741824 && ip dst <= 1073743778) || (ip dst >= 1073743780 && ip dst <= 1073750214) || (ip dst >= 1073750216 && ip dst <= 1073781600) || (ip dst >= 1073781602 && ip dst <= 1073800326) || (ip dst >= 1073800328 && ip dst <= 1073802587) || (ip dst >= 1073802589 && ip dst <= 1090519039)),
	((dst port 9263) || (dst port 32291) || (dst port 34677) || (dst port 44779) || (dst port 53273)) && ((ip dst >= 1073741824 && ip dst <= 1073746300) || (ip dst >= 1073746302 && ip dst <= 1073752322) || (ip dst >= 1073752324 && ip dst <= 1073752785) || (ip dst >= 1073752787 && ip dst <= 1073761425) || (ip dst >= 1073761427 && ip dst <= 1073773594) || (ip dst >= 1073773596 && ip dst <= 1090519039)),
	((dst port 13676) || (dst port 14362) || (dst port 18973) || (dst port 42793) || (dst port 53134)) && ((ip dst >= 1073741824 && ip dst <= 1073756931) || (ip dst >= 1073756933 && ip dst <= 1073758125) || (ip dst >= 1073758127 && ip dst <= 1073770313) || (ip dst >= 1073770315 && ip dst <= 1073772672) || (ip dst >= 1073772674 && ip dst <= 1073801291) || (ip dst >= 1073801293 && ip dst <= 1090519039)),
	((dst port 12999) || (dst port 32463) || (dst port 45301) || (dst port 56480) || (dst port 57352)) && ((ip dst >= 1073741824 && ip dst <= 1073742341) || (ip dst >= 1073742343 && ip dst <= 1073747810) || (ip dst >= 1073747812 && ip dst <= 1073756614) || (ip dst >= 1073756616 && ip dst <= 1073762611) || (ip dst >= 1073762613 && ip dst <= 1073765968) || (ip dst >= 1073765970 && ip dst <= 1090519039)),
	((dst port 7451) || (dst port 13047) || (dst port 37150) || (dst port 55717) || (dst port 59107)) && ((ip dst >= 1073741824 && ip dst <= 1073748878) || (ip dst >= 1073748880 && ip dst <= 1073758709) || (ip dst >= 1073758711 && ip dst <= 1073760257) || (ip dst >= 1073760259 && ip dst <= 1073775864) || (ip dst >= 1073775866 && ip dst <= 1073803898) || (ip dst >= 1073803900 && ip dst <= 1090519039)),
	((dst port 252) || (dst port 42078) || (dst port 42100) || (dst port 55944) || (dst port 58349)) && ((ip dst >= 1073741824 && ip dst <= 1073742274) || (ip dst >= 1073742276 && ip dst <= 1073743109) || (ip dst >= 1073743111 && ip dst <= 1073756551) || (ip dst >= 1073756553 && ip dst <= 1073781835) || (ip dst >= 1073781837 && ip dst <= 1073796076) || (ip dst >= 1073796078 && ip dst <= 1090519039)),
	((dst port 29446) || (dst port 31834) || (dst port 33989) || (dst port 38988) || (dst port 49421)) && ((ip dst >= 1073741824 && ip dst <= 1073747996) || (ip dst >= 1073747998 && ip dst <= 1073757272) || (ip dst >= 1073757274 && ip dst <= 1073758122) || (ip dst >= 1073758124 && ip dst <= 1073798269) || (ip dst >= 1073798271 && ip dst <= 1073798572) || (ip dst >= 1073798574 && ip dst <= 1090519039)),
	((dst port 33194) || (dst port 40588) || (dst port 45232) || (dst port 54120) || (dst port 63929)) && ((ip dst >= 1073741824 && ip dst <= 1073742182) || (ip dst >= 1073742184 && ip dst <= 1073752725) || (ip dst >= 1073752727 && ip dst <= 1073758895) || (ip dst >= 1073758897 && ip dst <= 1073778102) || (ip dst >= 1073778104 && ip dst <= 1073798831) || (ip dst >= 1073798833 && ip dst <= 1090519039)),
	((dst port 9021) || (dst port 12583) || (dst port 15356) || (dst port 27624) || (dst port 65141)) && ((ip dst >= 1073741824 && ip dst <= 1073743547) || (ip dst >= 1073743549 && ip dst <= 1073753721) || (ip dst >= 1073753723 && ip dst <= 1073759593) || (ip dst >= 1073759595 && ip dst <= 1073769407) || (ip dst >= 1073769409 && ip dst <= 1073787017) || (ip dst >= 1073787019 && ip dst <= 1090519039)),
	((dst port 20365) || (dst port 25536) || (dst port 31084) || (dst port 41456) || (dst port 49669)) && ((ip dst >= 1073741824 && ip dst <= 1073748523) || (ip dst >= 1073748525 && ip dst <= 1073764176) || (ip dst >= 1073764178 && ip dst <= 1073770053) || (ip dst >= 1073770055 && ip dst <= 1073772064) || (ip dst >= 1073772066 && ip dst <= 1073786407) || (ip dst >= 1073786409 && ip dst <= 1090519039)),
	((dst port 30511) || (dst port 31140) || (dst port 39523) || (dst port 40365) || (dst port 63717)) && ((ip dst >= 1073741824 && ip dst <= 1073746394) || (ip dst >= 1073746396 && ip dst <= 1073769519) || (ip dst >= 1073769521 && ip dst <= 1073770189) || (ip dst >= 1073770191 && ip dst <= 1073778930) || (ip dst >= 1073778932 && ip dst <= 1073783982) || (ip dst >= 1073783984 && ip dst <= 1090519039)),
	((dst port 27888) || (dst port 35099) || (dst port 43898) || (dst port 53545) || (dst port 64943)) && ((ip dst >= 1073741824 && ip dst <= 1073751760) || (ip dst >= 1073751762 && ip dst <= 1073756988) || (ip dst >= 1073756990 && ip dst <= 1073770074) || (ip dst >= 1073770076 && ip dst <= 1073775562) || (ip dst >= 1073775564 && ip dst <= 1073805972) || (ip dst >= 1073805974 && ip dst <= 1090519039)),
	((dst port 1985) || (dst port 9535) || (dst port 19804) || (dst port 21807) || (dst port 47902)) && ((ip dst >= 1073741824 && ip dst <= 1073754586) || (ip dst >= 1073754588 && ip dst <= 1073754731) || (ip dst >= 1073754733 && ip dst <= 1073761709) || (ip dst >= 1073761711 && ip dst <= 1073793092) || (ip dst >= 1073793094 && ip dst <= 1073803321) || (ip dst >= 1073803323 && ip dst <= 1090519039)),
	((dst port 7191) || (dst port 10961) || (dst port 16283) || (dst port 43050) || (dst port 43227)) && ((ip dst >= 1073741824 && ip dst <= 1073743666) || (ip dst >= 1073743668 && ip dst <= 1073770979) || (ip dst >= 1073770981 && ip dst <= 1073773798) || (ip dst >= 1073773800 && ip dst <= 1073791944) || (ip dst >= 1073791946 && ip dst <= 1073806584) || (ip dst >= 1073806586 && ip dst <= 1090519039)),
	((dst port 9397) || (dst port 38928) || (dst port 42716) || (dst port 54720) || (dst port 59808)) && ((ip dst >= 1073741824 && ip dst <= 1073751925) || (ip dst >= 1073751927 && ip dst <= 1073770922) || (ip dst >= 1073770924 && ip dst <= 1073776397) || (ip dst >= 1073776399 && ip dst <= 1073776415) || (ip dst >= 1073776417 && ip dst <= 1073792825) || (ip dst >= 1073792827 && ip dst <= 1090519039)),
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
