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
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((ip ipd >= 67108864 && ip ipd <= 67111973) || (ip ipd >= 67111975 && ip ipd <= 67126063) || (ip ipd >= 67126065 && ip ipd <= 67157104) || (ip ipd >= 67157106 && ip ipd <= 67158815) || (ip ipd >= 67158817 && ip ipd <= 67168523) || (ip ipd >= 67168525 && ip ipd <= 83886079)),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((ip ipd >= 67108864 && ip ipd <= 67125053) || (ip ipd >= 67125055 && ip ipd <= 67151562) || (ip ipd >= 67151564 && ip ipd <= 67156224) || (ip ipd >= 67156226 && ip ipd <= 67158236) || (ip ipd >= 67158238 && ip ipd <= 67173257) || (ip ipd >= 67173259 && ip ipd <= 83886079)),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((ip ipd >= 67108864 && ip ipd <= 67124446) || (ip ipd >= 67124448 && ip ipd <= 67126879) || (ip ipd >= 67126881 && ip ipd <= 67132408) || (ip ipd >= 67132410 && ip ipd <= 67140172) || (ip ipd >= 67140174 && ip ipd <= 67159097) || (ip ipd >= 67159099 && ip ipd <= 83886079)),
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
