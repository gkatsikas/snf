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
	((dst port 13017) || (dst port 25216) || (dst port 49756) || (dst port 53362) || (dst port 56765)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.72.64/32) || (dst net 0.0.110.75/32) || (dst net 0.0.117.211/32) || (dst net 0.0.119.120/32) || (dst net 0.0.243.13/32))),
	((dst port 250) || (dst port 10863) || (dst port 11554) || (dst port 45092) || (dst port 60356)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.43.34/32) || (dst net 1.0.80.98/32) || (dst net 1.0.172.57/32) || (dst net 1.0.174.242/32) || (dst net 1.0.184.187/32))),
	((dst port 6137) || (dst port 21026) || (dst port 21195) || (dst port 30604) || (dst port 57046)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.45.155/32) || (dst net 2.0.50.179/32) || (dst net 2.0.132.122/32) || (dst net 2.0.171.21/32) || (dst net 2.0.172.170/32))),
	((dst port 1053) || (dst port 10840) || (dst port 11164) || (dst port 13364) || (dst port 43315)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.37.212/32) || (dst net 3.0.113.244/32) || (dst net 3.0.166.237/32) || (dst net 3.0.225.227/32) || (dst net 3.0.241.39/32))),
	((dst port 1563) || (dst port 1968) || (dst port 58077) || (dst port 58089) || (dst port 59850)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.27.237/32) || (dst net 4.0.62.217/32) || (dst net 4.0.92.119/32) || (dst net 4.0.143.167/32) || (dst net 4.0.246.192/32))),
	((dst port 21779) || (dst port 30917) || (dst port 35974) || (dst port 38212) || (dst port 49372)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.44.46/32) || (dst net 5.0.124.176/32) || (dst net 5.0.140.35/32) || (dst net 5.0.208.127/32) || (dst net 5.0.239.199/32))),
	((dst port 313) || (dst port 19752) || (dst port 29791) || (dst port 55283) || (dst port 58358)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.44.38/32) || (dst net 6.0.97.100/32) || (dst net 6.0.131.82/32) || (dst net 6.0.212.4/32) || (dst net 6.0.247.145/32))),
	((dst port 5998) || (dst port 26456) || (dst port 26600) || (dst port 34444) || (dst port 34492)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.64.23/32) || (dst net 7.0.108.72/32) || (dst net 7.0.181.96/32) || (dst net 7.0.187.227/32) || (dst net 7.0.214.238/32))),
	((dst port 10108) || (dst port 12082) || (dst port 21451) || (dst port 40677) || (dst port 42294)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.47.90/32) || (dst net 8.0.67.201/32) || (dst net 8.0.78.208/32) || (dst net 8.0.193.179/32) || (dst net 8.0.200.59/32))),
	((dst port 2043) || (dst port 9192) || (dst port 10963) || (dst port 37032) || (dst port 64583)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.41.149/32) || (dst net 9.0.104.184/32) || (dst net 9.0.116.136/32) || (dst net 9.0.136.127/32) || (dst net 9.0.237.1/32))),
	((dst port 2469) || (dst port 21961) || (dst port 24877) || (dst port 39474) || (dst port 42034)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.41.178/32) || (dst net 10.0.79.35/32) || (dst net 10.0.82.121/32) || (dst net 10.0.85.101/32) || (dst net 10.0.90.181/32))),
	((dst port 109) || (dst port 21337) || (dst port 28792) || (dst port 43164) || (dst port 63748)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.20.5/32) || (dst net 11.0.64.178/32) || (dst net 11.0.73.178/32) || (dst net 11.0.125.187/32) || (dst net 11.0.139.70/32))),
	((dst port 2745) || (dst port 7631) || (dst port 51465) || (dst port 62979) || (dst port 64586)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.25.210/32) || (dst net 12.0.42.88/32) || (dst net 12.0.81.129/32) || (dst net 12.0.89.106/32) || (dst net 12.0.244.158/32))),
	((dst port 18520) || (dst port 35995) || (dst port 43941) || (dst port 55815) || (dst port 57824)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.25.249/32) || (dst net 13.0.56.107/32) || (dst net 13.0.62.54/32) || (dst net 13.0.65.43/32) || (dst net 13.0.112.1/32))),
	((dst port 15332) || (dst port 17123) || (dst port 19628) || (dst port 24579) || (dst port 65425)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.142.192/32) || (dst net 14.0.194.2/32) || (dst net 14.0.194.125/32) || (dst net 14.0.218.120/32) || (dst net 14.0.230.235/32))),
	((dst port 6715) || (dst port 11920) || (dst port 30396) || (dst port 32989) || (dst port 56582)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.109.186/32) || (dst net 15.0.164.69/32) || (dst net 15.0.190.220/32) || (dst net 15.0.196.46/32) || (dst net 15.0.253.234/32))),
	((dst port 3592) || (dst port 12427) || (dst port 35655) || (dst port 54440) || (dst port 63918)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.74.138/32) || (dst net 16.0.161.16/32) || (dst net 16.0.229.231/32) || (dst net 16.0.238.86/32) || (dst net 16.0.249.181/32))),
	((dst port 12658) || (dst port 14980) || (dst port 39122) || (dst port 58755) || (dst port 63550)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.8.71/32) || (dst net 17.0.96.29/32) || (dst net 17.0.132.185/32) || (dst net 17.0.195.230/32) || (dst net 17.0.222.178/32))),
	((dst port 3403) || (dst port 4694) || (dst port 17689) || (dst port 57907) || (dst port 65188)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.21.179/32) || (dst net 18.0.140.171/32) || (dst net 18.0.181.91/32) || (dst net 18.0.197.103/32) || (dst net 18.0.198.233/32))),
	((dst port 11221) || (dst port 18535) || (dst port 31581) || (dst port 53435) || (dst port 59755)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.127.242/32) || (dst net 19.0.175.245/32) || (dst net 19.0.176.146/32) || (dst net 19.0.191.154/32) || (dst net 19.0.241.214/32))),
	((dst port 13767) || (dst port 17246) || (dst port 24431) || (dst port 35938) || (dst port 52869)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.43.30/32) || (dst net 20.0.102.57/32) || (dst net 20.0.180.5/32) || (dst net 20.0.231.11/32) || (dst net 20.0.233.47/32))),
	((dst port 1426) || (dst port 24728) || (dst port 39773) || (dst port 43720) || (dst port 53689)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.60.96/32) || (dst net 21.0.85.234/32) || (dst net 21.0.115.241/32) || (dst net 21.0.133.171/32) || (dst net 21.0.168.175/32))),
	((dst port 14013) || (dst port 16006) || (dst port 26657) || (dst port 29703) || (dst port 46026)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.138.180/32) || (dst net 22.0.191.13/32) || (dst net 22.0.194.59/32) || (dst net 22.0.203.22/32) || (dst net 22.0.248.64/32))),
	((dst port 1419) || (dst port 45116) || (dst port 51000) || (dst port 59135) || (dst port 62542)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.70.194/32) || (dst net 23.0.77.45/32) || (dst net 23.0.87.217/32) || (dst net 23.0.104.53/32) || (dst net 23.0.169.68/32))),
	((dst port 758) || (dst port 7204) || (dst port 35719) || (dst port 39454) || (dst port 60391)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.13.194/32) || (dst net 24.0.41.222/32) || (dst net 24.0.104.243/32) || (dst net 24.0.203.202/32) || (dst net 24.0.249.105/32))),
	((dst port 26783) || (dst port 36642) || (dst port 38643) || (dst port 45812) || (dst port 61676)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.18.178/32) || (dst net 25.0.98.38/32) || (dst net 25.0.100.20/32) || (dst net 25.0.123.63/32) || (dst net 25.0.142.121/32))),
	((dst port 7678) || (dst port 10592) || (dst port 17602) || (dst port 23220) || (dst port 36328)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.2.218/32) || (dst net 26.0.72.99/32) || (dst net 26.0.99.44/32) || (dst net 26.0.144.210/32) || (dst net 26.0.190.237/32))),
	((dst port 4774) || (dst port 6478) || (dst port 24835) || (dst port 30799) || (dst port 34713)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.49.17/32) || (dst net 27.0.68.7/32) || (dst net 27.0.106.26/32) || (dst net 27.0.165.238/32) || (dst net 27.0.206.239/32))),
	((dst port 22934) || (dst port 28781) || (dst port 52537) || (dst port 58469) || (dst port 65132)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.34.0/32) || (dst net 28.0.55.92/32) || (dst net 28.0.90.103/32) || (dst net 28.0.112.52/32) || (dst net 28.0.126.70/32))),
	((dst port 5413) || (dst port 14225) || (dst port 32758) || (dst port 33197) || (dst port 47819)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.36.171/32) || (dst net 29.0.77.29/32) || (dst net 29.0.141.75/32) || (dst net 29.0.147.159/32) || (dst net 29.0.251.113/32))),
	((dst port 16084) || (dst port 51850) || (dst port 56133) || (dst port 58549) || (dst port 63191)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.42.41/32) || (dst net 30.0.44.69/32) || (dst net 30.0.67.173/32) || (dst net 30.0.95.231/32) || (dst net 30.0.98.158/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
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
