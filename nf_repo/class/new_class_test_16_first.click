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
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 5129) || (dst port 16641) || (dst port 18304) || (dst port 24232) || (dst port 25417)) && ((ip dst >= 268435456 && ip dst <= 268452419) || (ip dst >= 268452421 && ip dst <= 268459718) || (ip dst >= 268459720 && ip dst <= 268461212) || (ip dst >= 268461214 && ip dst <= 268464741) || (ip dst >= 268464743 && ip dst <= 268466644) || (ip dst >= 268466646 && ip dst <= 285212671)),
	((dst port 21074) || (dst port 30175) || (dst port 30193) || (dst port 61616) || (dst port 61917)) && ((ip dst >= 268435456 && ip dst <= 268469137) || (ip dst >= 268469139 && ip dst <= 268479482) || (ip dst >= 268479484 && ip dst <= 268479774) || (ip dst >= 268479776 && ip dst <= 268482692) || (ip dst >= 268482694 && ip dst <= 268483206) || (ip dst >= 268483208 && ip dst <= 285212671)),
	((dst port 9856) || (dst port 22533) || (dst port 34263) || (dst port 35502) || (dst port 43916)) && ((ip dst >= 268435456 && ip dst <= 268461790) || (ip dst >= 268461792 && ip dst <= 268469347) || (ip dst >= 268469349 && ip dst <= 268475147) || (ip dst >= 268475149 && ip dst <= 268478798) || (ip dst >= 268478800 && ip dst <= 268500108) || (ip dst >= 268500110 && ip dst <= 285212671)),
	((dst port 16170) || (dst port 17473) || (dst port 55312) || (dst port 60153) || (dst port 63577)) && ((ip dst >= 268435456 && ip dst <= 268436434) || (ip dst >= 268436436 && ip dst <= 268453426) || (ip dst >= 268453428 && ip dst <= 268471247) || (ip dst >= 268471249 && ip dst <= 268477594) || (ip dst >= 268477596 && ip dst <= 268489801) || (ip dst >= 268489803 && ip dst <= 285212671)),
	((dst port 28616) || (dst port 38170) || (dst port 46332) || (dst port 46389) || (dst port 49265)) && ((ip dst >= 268435456 && ip dst <= 268436902) || (ip dst >= 268436904 && ip dst <= 268445990) || (ip dst >= 268445992 && ip dst <= 268465324) || (ip dst >= 268465326 && ip dst <= 268480939) || (ip dst >= 268480941 && ip dst <= 268489006) || (ip dst >= 268489008 && ip dst <= 285212671)),
	((dst port 278) || (dst port 5237) || (dst port 10688) || (dst port 32486) || (dst port 59200)) && ((ip dst >= 268435456 && ip dst <= 268446673) || (ip dst >= 268446675 && ip dst <= 268453773) || (ip dst >= 268453775 && ip dst <= 268481048) || (ip dst >= 268481050 && ip dst <= 268484861) || (ip dst >= 268484863 && ip dst <= 268500438) || (ip dst >= 268500440 && ip dst <= 285212671)),
	((dst port 4381) || (dst port 14144) || (dst port 25542) || (dst port 33980) || (dst port 35654)) && ((ip dst >= 268435456 && ip dst <= 268435870) || (ip dst >= 268435872 && ip dst <= 268464057) || (ip dst >= 268464059 && ip dst <= 268473780) || (ip dst >= 268473782 && ip dst <= 268484390) || (ip dst >= 268484392 && ip dst <= 268486770) || (ip dst >= 268486772 && ip dst <= 285212671)),
	((dst port 18369) || (dst port 20327) || (dst port 24374) || (dst port 44965) || (dst port 53474)) && ((ip dst >= 268435456 && ip dst <= 268460737) || (ip dst >= 268460739 && ip dst <= 268470757) || (ip dst >= 268470759 && ip dst <= 268476538) || (ip dst >= 268476540 && ip dst <= 268478648) || (ip dst >= 268478650 && ip dst <= 268481942) || (ip dst >= 268481944 && ip dst <= 285212671)),
	((dst port 3622) || (dst port 4629) || (dst port 10504) || (dst port 19466) || (dst port 47434)) && ((ip dst >= 268435456 && ip dst <= 268436067) || (ip dst >= 268436069 && ip dst <= 268442257) || (ip dst >= 268442259 && ip dst <= 268449918) || (ip dst >= 268449920 && ip dst <= 268469597) || (ip dst >= 268469599 && ip dst <= 268486304) || (ip dst >= 268486306 && ip dst <= 285212671)),
	((dst port 9851) || (dst port 18740) || (dst port 37866) || (dst port 45590) || (dst port 54637)) && ((ip dst >= 268435456 && ip dst <= 268438771) || (ip dst >= 268438773 && ip dst <= 268464717) || (ip dst >= 268464719 && ip dst <= 268465416) || (ip dst >= 268465418 && ip dst <= 268466769) || (ip dst >= 268466771 && ip dst <= 268469534) || (ip dst >= 268469536 && ip dst <= 285212671)),
	((dst port 108) || (dst port 1923) || (dst port 24743) || (dst port 32090) || (dst port 56113)) && ((ip dst >= 268435456 && ip dst <= 268439221) || (ip dst >= 268439223 && ip dst <= 268457159) || (ip dst >= 268457161 && ip dst <= 268471002) || (ip dst >= 268471004 && ip dst <= 268480097) || (ip dst >= 268480099 && ip dst <= 268500133) || (ip dst >= 268500135 && ip dst <= 285212671)),
	((dst port 8028) || (dst port 12339) || (dst port 23024) || (dst port 40248) || (dst port 63791)) && ((ip dst >= 268435456 && ip dst <= 268437787) || (ip dst >= 268437789 && ip dst <= 268470600) || (ip dst >= 268470602 && ip dst <= 268473216) || (ip dst >= 268473218 && ip dst <= 268479977) || (ip dst >= 268479979 && ip dst <= 268483884) || (ip dst >= 268483886 && ip dst <= 285212671)),
	((dst port 16484) || (dst port 16975) || (dst port 27810) || (dst port 54927) || (dst port 63850)) && ((ip dst >= 268435456 && ip dst <= 268443708) || (ip dst >= 268443710 && ip dst <= 268458847) || (ip dst >= 268458849 && ip dst <= 268471688) || (ip dst >= 268471690 && ip dst <= 268475276) || (ip dst >= 268475278 && ip dst <= 268497980) || (ip dst >= 268497982 && ip dst <= 285212671)),
	((dst port 7639) || (dst port 13734) || (dst port 17277) || (dst port 29613) || (dst port 43615)) && ((ip dst >= 268435456 && ip dst <= 268451484) || (ip dst >= 268451486 && ip dst <= 268480994) || (ip dst >= 268480996 && ip dst <= 268485304) || (ip dst >= 268485306 && ip dst <= 268488740) || (ip dst >= 268488742 && ip dst <= 268494302) || (ip dst >= 268494304 && ip dst <= 285212671)),
	((dst port 5407) || (dst port 24597) || (dst port 28306) || (dst port 45051) || (dst port 54803)) && ((ip dst >= 268435456 && ip dst <= 268435853) || (ip dst >= 268435855 && ip dst <= 268442905) || (ip dst >= 268442907 && ip dst <= 268446988) || (ip dst >= 268446990 && ip dst <= 268471302) || (ip dst >= 268471304 && ip dst <= 268474735) || (ip dst >= 268474737 && ip dst <= 285212671)),
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
