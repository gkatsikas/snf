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
	((dst port 16394) || (dst port 23571) || (dst port 50406) || (dst port 50427) || (dst port 61214)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.7.150/32) || (dst net 0.0.20.146/32) || (dst net 0.0.31.166/32) || (dst net 0.0.126.135/32) || (dst net 0.0.249.47/32))),
	((dst port 2383) || (dst port 14527) || (dst port 15111) || (dst port 36871) || (dst port 42771)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.127.254/32) || (dst net 1.0.172.3/32) || (dst net 1.0.174.131/32) || (dst net 1.0.191.208/32) || (dst net 1.0.193.189/32))),
	((dst port 3122) || (dst port 10470) || (dst port 10874) || (dst port 43385) || (dst port 48767)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.57.141/32) || (dst net 2.0.59.211/32) || (dst net 2.0.95.25/32) || (dst net 2.0.157.219/32) || (dst net 2.0.167.45/32))),
	((dst port 1176) || (dst port 3519) || (dst port 32544) || (dst port 38899) || (dst port 47310)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.31.252/32) || (dst net 3.0.123.244/32) || (dst net 3.0.158.254/32) || (dst net 3.0.233.255/32) || (dst net 3.0.242.253/32))),
	((dst port 21565) || (dst port 29225) || (dst port 30654) || (dst port 48712) || (dst port 64042)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.16.187/32) || (dst net 4.0.113.15/32) || (dst net 4.0.113.91/32) || (dst net 4.0.132.233/32) || (dst net 4.0.197.159/32))),
	((dst port 4609) || (dst port 8116) || (dst port 10491) || (dst port 16709) || (dst port 34495)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.43.223/32) || (dst net 5.0.52.145/32) || (dst net 5.0.95.94/32) || (dst net 5.0.240.147/32) || (dst net 5.0.247.2/32))),
	((dst port 21445) || (dst port 37800) || (dst port 46764) || (dst port 49693) || (dst port 57141)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.26.237/32) || (dst net 6.0.94.90/32) || (dst net 6.0.108.132/32) || (dst net 6.0.132.137/32) || (dst net 6.0.215.115/32))),
	((dst port 15757) || (dst port 23730) || (dst port 26326) || (dst port 29824) || (dst port 35358)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.99.154/32) || (dst net 7.0.155.9/32) || (dst net 7.0.179.38/32) || (dst net 7.0.214.44/32) || (dst net 7.0.239.109/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 14181) || (dst port 34567) || (dst port 43833) || (dst port 52562) || (dst port 56601)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.21.69/32) || (dst net 9.0.26.223/32) || (dst net 9.0.74.46/32) || (dst net 9.0.107.237/32) || (dst net 9.0.120.238/32))),
	((dst port 211) || (dst port 15261) || (dst port 30131) || (dst port 32201) || (dst port 52125)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.20.188/32) || (dst net 10.0.62.102/32) || (dst net 10.0.67.127/32) || (dst net 10.0.98.1/32) || (dst net 10.0.182.42/32))),
	((dst port 8784) || (dst port 11217) || (dst port 39716) || (dst port 52158) || (dst port 62001)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.47.212/32) || (dst net 11.0.68.32/32) || (dst net 11.0.108.218/32) || (dst net 11.0.170.42/32) || (dst net 11.0.246.168/32))),
	((dst port 21590) || (dst port 41404) || (dst port 47609) || (dst port 52567) || (dst port 54680)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.16.85/32) || (dst net 12.0.74.223/32) || (dst net 12.0.88.245/32) || (dst net 12.0.130.121/32) || (dst net 12.0.211.107/32))),
	((dst port 5832) || (dst port 13406) || (dst port 14452) || (dst port 34034) || (dst port 60894)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.10.154/32) || (dst net 13.0.11.155/32) || (dst net 13.0.15.205/32) || (dst net 13.0.39.63/32) || (dst net 13.0.196.95/32))),
	((dst port 13149) || (dst port 15244) || (dst port 24797) || (dst port 28580) || (dst port 30769)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.67.4/32) || (dst net 14.0.126.161/32) || (dst net 14.0.179.32/32) || (dst net 14.0.180.220/32) || (dst net 14.0.182.42/32))),
	((dst port 2073) || (dst port 21599) || (dst port 38771) || (dst port 49361) || (dst port 53930)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.8.196/32) || (dst net 15.0.113.204/32) || (dst net 15.0.134.22/32) || (dst net 15.0.220.120/32) || (dst net 15.0.250.46/32))),
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
