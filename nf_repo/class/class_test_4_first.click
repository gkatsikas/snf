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
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((dst net 4.0.0.0/21) || (dst net 4.0.8.0/22) || (dst net 4.0.12.0/27) || (dst net 4.0.12.32/30) || (dst net 4.0.12.36/31) || (dst net 4.0.12.39/32) || (dst net 4.0.12.40/29) || (dst net 4.0.12.48/28) || (dst net 4.0.12.64/26) || (dst net 4.0.12.128/25) || (dst net 4.0.13.0/24) || (dst net 4.0.14.0/23) || (dst net 4.0.16.0/20) || (dst net 4.0.32.0/19) || (dst net 4.0.64.0/23) || (dst net 4.0.66.0/24) || (dst net 4.0.67.0/27) || (dst net 4.0.67.32/28) || (dst net 4.0.67.49/32) || (dst net 4.0.67.50/31) || (dst net 4.0.67.52/30) || (dst net 4.0.67.56/29) || (dst net 4.0.67.64/26) || (dst net 4.0.67.128/25) || (dst net 4.0.68.0/22) || (dst net 4.0.72.0/21) || (dst net 4.0.80.0/20) || (dst net 4.0.96.0/19) || (dst net 4.0.128.0/19) || (dst net 4.0.160.0/20) || (dst net 4.0.176.0/21) || (dst net 4.0.184.0/22) || (dst net 4.0.188.0/26) || (dst net 4.0.188.64/27) || (dst net 4.0.188.96/28) || (dst net 4.0.188.112/32) || (dst net 4.0.188.114/31) || (dst net 4.0.188.116/30) || (dst net 4.0.188.120/29) || (dst net 4.0.188.128/25) || (dst net 4.0.189.0/24) || (dst net 4.0.190.0/23) || (dst net 4.0.192.0/23) || (dst net 4.0.194.0/24) || (dst net 4.0.195.0/27) || (dst net 4.0.195.33/32) || (dst net 4.0.195.34/31) || (dst net 4.0.195.36/30) || (dst net 4.0.195.40/29) || (dst net 4.0.195.48/28) || (dst net 4.0.195.64/26) || (dst net 4.0.195.128/25) || (dst net 4.0.196.0/22) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/21) || (dst net 4.0.232.0/24) || (dst net 4.0.233.0/29) || (dst net 4.0.233.8/30) || (dst net 4.0.233.13/32) || (dst net 4.0.233.14/31) || (dst net 4.0.233.16/28) || (dst net 4.0.233.32/27) || (dst net 4.0.233.64/26) || (dst net 4.0.233.128/25) || (dst net 4.0.234.0/23) || (dst net 4.0.236.0/22) || (dst net 4.0.240.0/20) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/20) || (dst net 4.0.48.0/21) || (dst net 4.0.56.0/22) || (dst net 4.0.60.0/23) || (dst net 4.0.62.0/24) || (dst net 4.0.63.0/27) || (dst net 4.0.63.32/28) || (dst net 4.0.63.48/29) || (dst net 4.0.63.56/30) || (dst net 4.0.63.60/31) || (dst net 4.0.63.63/32) || (dst net 4.0.63.64/26) || (dst net 4.0.63.128/25) || (dst net 4.0.64.0/18) || (dst net 4.0.128.0/19) || (dst net 4.0.160.0/22) || (dst net 4.0.164.0/23) || (dst net 4.0.166.0/25) || (dst net 4.0.166.128/26) || (dst net 4.0.166.192/29) || (dst net 4.0.166.200/31) || (dst net 4.0.166.202/32) || (dst net 4.0.166.204/30) || (dst net 4.0.166.208/28) || (dst net 4.0.166.224/27) || (dst net 4.0.167.0/24) || (dst net 4.0.168.0/21) || (dst net 4.0.176.0/21) || (dst net 4.0.184.0/24) || (dst net 4.0.185.0/32) || (dst net 4.0.185.2/31) || (dst net 4.0.185.4/30) || (dst net 4.0.185.8/29) || (dst net 4.0.185.16/28) || (dst net 4.0.185.32/27) || (dst net 4.0.185.64/26) || (dst net 4.0.185.128/25) || (dst net 4.0.186.0/23) || (dst net 4.0.188.0/22) || (dst net 4.0.192.0/25) || (dst net 4.0.192.128/26) || (dst net 4.0.192.192/28) || (dst net 4.0.192.208/29) || (dst net 4.0.192.216/30) || (dst net 4.0.192.220/32) || (dst net 4.0.192.222/31) || (dst net 4.0.192.224/27) || (dst net 4.0.193.0/24) || (dst net 4.0.194.0/23) || (dst net 4.0.196.0/22) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/20) || (dst net 4.0.240.0/21) || (dst net 4.0.248.0/23) || (dst net 4.0.250.0/24) || (dst net 4.0.251.0/25) || (dst net 4.0.251.128/29) || (dst net 4.0.251.136/31) || (dst net 4.0.251.139/32) || (dst net 4.0.251.140/30) || (dst net 4.0.251.144/28) || (dst net 4.0.251.160/27) || (dst net 4.0.251.192/26) || (dst net 4.0.252.0/22) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/20) || (dst net 4.0.48.0/21) || (dst net 4.0.56.0/22) || (dst net 4.0.60.0/25) || (dst net 4.0.60.128/26) || (dst net 4.0.60.192/28) || (dst net 4.0.60.208/29) || (dst net 4.0.60.216/30) || (dst net 4.0.60.220/31) || (dst net 4.0.60.222/32) || (dst net 4.0.60.224/27) || (dst net 4.0.61.0/24) || (dst net 4.0.62.0/23) || (dst net 4.0.64.0/22) || (dst net 4.0.68.0/23) || (dst net 4.0.70.0/26) || (dst net 4.0.70.64/27) || (dst net 4.0.70.97/32) || (dst net 4.0.70.98/31) || (dst net 4.0.70.100/30) || (dst net 4.0.70.104/29) || (dst net 4.0.70.112/28) || (dst net 4.0.70.128/25) || (dst net 4.0.71.0/24) || (dst net 4.0.72.0/21) || (dst net 4.0.80.0/21) || (dst net 4.0.88.0/23) || (dst net 4.0.90.0/24) || (dst net 4.0.91.0/25) || (dst net 4.0.91.128/26) || (dst net 4.0.91.192/27) || (dst net 4.0.91.224/28) || (dst net 4.0.91.240/29) || (dst net 4.0.91.248/32) || (dst net 4.0.91.250/31) || (dst net 4.0.91.252/30) || (dst net 4.0.92.0/22) || (dst net 4.0.96.0/20) || (dst net 4.0.112.0/21) || (dst net 4.0.120.0/23) || (dst net 4.0.122.0/26) || (dst net 4.0.122.64/29) || (dst net 4.0.122.72/30) || (dst net 4.0.122.76/32) || (dst net 4.0.122.78/31) || (dst net 4.0.122.80/28) || (dst net 4.0.122.96/27) || (dst net 4.0.122.128/25) || (dst net 4.0.123.0/24) || (dst net 4.0.124.0/22) || (dst net 4.0.128.0/18) || (dst net 4.0.192.0/22) || (dst net 4.0.196.0/27) || (dst net 4.0.196.32/28) || (dst net 4.0.196.48/29) || (dst net 4.0.196.56/31) || (dst net 4.0.196.59/32) || (dst net 4.0.196.60/30) || (dst net 4.0.196.64/26) || (dst net 4.0.196.128/25) || (dst net 4.0.197.0/24) || (dst net 4.0.198.0/23) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/19) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
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
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((dst net 4.0.0.0/21) || (dst net 4.0.8.0/22) || (dst net 4.0.12.0/27) || (dst net 4.0.12.32/30) || (dst net 4.0.12.36/31) || (dst net 4.0.12.39/32) || (dst net 4.0.12.40/29) || (dst net 4.0.12.48/28) || (dst net 4.0.12.64/26) || (dst net 4.0.12.128/25) || (dst net 4.0.13.0/24) || (dst net 4.0.14.0/23) || (dst net 4.0.16.0/20) || (dst net 4.0.32.0/19) || (dst net 4.0.64.0/23) || (dst net 4.0.66.0/24) || (dst net 4.0.67.0/27) || (dst net 4.0.67.32/28) || (dst net 4.0.67.49/32) || (dst net 4.0.67.50/31) || (dst net 4.0.67.52/30) || (dst net 4.0.67.56/29) || (dst net 4.0.67.64/26) || (dst net 4.0.67.128/25) || (dst net 4.0.68.0/22) || (dst net 4.0.72.0/21) || (dst net 4.0.80.0/20) || (dst net 4.0.96.0/19) || (dst net 4.0.128.0/19) || (dst net 4.0.160.0/20) || (dst net 4.0.176.0/21) || (dst net 4.0.184.0/22) || (dst net 4.0.188.0/26) || (dst net 4.0.188.64/27) || (dst net 4.0.188.96/28) || (dst net 4.0.188.112/32) || (dst net 4.0.188.114/31) || (dst net 4.0.188.116/30) || (dst net 4.0.188.120/29) || (dst net 4.0.188.128/25) || (dst net 4.0.189.0/24) || (dst net 4.0.190.0/23) || (dst net 4.0.192.0/23) || (dst net 4.0.194.0/24) || (dst net 4.0.195.0/27) || (dst net 4.0.195.33/32) || (dst net 4.0.195.34/31) || (dst net 4.0.195.36/30) || (dst net 4.0.195.40/29) || (dst net 4.0.195.48/28) || (dst net 4.0.195.64/26) || (dst net 4.0.195.128/25) || (dst net 4.0.196.0/22) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/21) || (dst net 4.0.232.0/24) || (dst net 4.0.233.0/29) || (dst net 4.0.233.8/30) || (dst net 4.0.233.13/32) || (dst net 4.0.233.14/31) || (dst net 4.0.233.16/28) || (dst net 4.0.233.32/27) || (dst net 4.0.233.64/26) || (dst net 4.0.233.128/25) || (dst net 4.0.234.0/23) || (dst net 4.0.236.0/22) || (dst net 4.0.240.0/20) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/20) || (dst net 4.0.48.0/21) || (dst net 4.0.56.0/22) || (dst net 4.0.60.0/23) || (dst net 4.0.62.0/24) || (dst net 4.0.63.0/27) || (dst net 4.0.63.32/28) || (dst net 4.0.63.48/29) || (dst net 4.0.63.56/30) || (dst net 4.0.63.60/31) || (dst net 4.0.63.63/32) || (dst net 4.0.63.64/26) || (dst net 4.0.63.128/25) || (dst net 4.0.64.0/18) || (dst net 4.0.128.0/19) || (dst net 4.0.160.0/22) || (dst net 4.0.164.0/23) || (dst net 4.0.166.0/25) || (dst net 4.0.166.128/26) || (dst net 4.0.166.192/29) || (dst net 4.0.166.200/31) || (dst net 4.0.166.202/32) || (dst net 4.0.166.204/30) || (dst net 4.0.166.208/28) || (dst net 4.0.166.224/27) || (dst net 4.0.167.0/24) || (dst net 4.0.168.0/21) || (dst net 4.0.176.0/21) || (dst net 4.0.184.0/24) || (dst net 4.0.185.0/32) || (dst net 4.0.185.2/31) || (dst net 4.0.185.4/30) || (dst net 4.0.185.8/29) || (dst net 4.0.185.16/28) || (dst net 4.0.185.32/27) || (dst net 4.0.185.64/26) || (dst net 4.0.185.128/25) || (dst net 4.0.186.0/23) || (dst net 4.0.188.0/22) || (dst net 4.0.192.0/25) || (dst net 4.0.192.128/26) || (dst net 4.0.192.192/28) || (dst net 4.0.192.208/29) || (dst net 4.0.192.216/30) || (dst net 4.0.192.220/32) || (dst net 4.0.192.222/31) || (dst net 4.0.192.224/27) || (dst net 4.0.193.0/24) || (dst net 4.0.194.0/23) || (dst net 4.0.196.0/22) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/20) || (dst net 4.0.240.0/21) || (dst net 4.0.248.0/23) || (dst net 4.0.250.0/24) || (dst net 4.0.251.0/25) || (dst net 4.0.251.128/29) || (dst net 4.0.251.136/31) || (dst net 4.0.251.139/32) || (dst net 4.0.251.140/30) || (dst net 4.0.251.144/28) || (dst net 4.0.251.160/27) || (dst net 4.0.251.192/26) || (dst net 4.0.252.0/22) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((dst net 4.0.0.0/19) || (dst net 4.0.32.0/20) || (dst net 4.0.48.0/21) || (dst net 4.0.56.0/22) || (dst net 4.0.60.0/25) || (dst net 4.0.60.128/26) || (dst net 4.0.60.192/28) || (dst net 4.0.60.208/29) || (dst net 4.0.60.216/30) || (dst net 4.0.60.220/31) || (dst net 4.0.60.222/32) || (dst net 4.0.60.224/27) || (dst net 4.0.61.0/24) || (dst net 4.0.62.0/23) || (dst net 4.0.64.0/22) || (dst net 4.0.68.0/23) || (dst net 4.0.70.0/26) || (dst net 4.0.70.64/27) || (dst net 4.0.70.97/32) || (dst net 4.0.70.98/31) || (dst net 4.0.70.100/30) || (dst net 4.0.70.104/29) || (dst net 4.0.70.112/28) || (dst net 4.0.70.128/25) || (dst net 4.0.71.0/24) || (dst net 4.0.72.0/21) || (dst net 4.0.80.0/21) || (dst net 4.0.88.0/23) || (dst net 4.0.90.0/24) || (dst net 4.0.91.0/25) || (dst net 4.0.91.128/26) || (dst net 4.0.91.192/27) || (dst net 4.0.91.224/28) || (dst net 4.0.91.240/29) || (dst net 4.0.91.248/32) || (dst net 4.0.91.250/31) || (dst net 4.0.91.252/30) || (dst net 4.0.92.0/22) || (dst net 4.0.96.0/20) || (dst net 4.0.112.0/21) || (dst net 4.0.120.0/23) || (dst net 4.0.122.0/26) || (dst net 4.0.122.64/29) || (dst net 4.0.122.72/30) || (dst net 4.0.122.76/32) || (dst net 4.0.122.78/31) || (dst net 4.0.122.80/28) || (dst net 4.0.122.96/27) || (dst net 4.0.122.128/25) || (dst net 4.0.123.0/24) || (dst net 4.0.124.0/22) || (dst net 4.0.128.0/18) || (dst net 4.0.192.0/22) || (dst net 4.0.196.0/27) || (dst net 4.0.196.32/28) || (dst net 4.0.196.48/29) || (dst net 4.0.196.56/31) || (dst net 4.0.196.59/32) || (dst net 4.0.196.60/30) || (dst net 4.0.196.64/26) || (dst net 4.0.196.128/25) || (dst net 4.0.197.0/24) || (dst net 4.0.198.0/23) || (dst net 4.0.200.0/21) || (dst net 4.0.208.0/20) || (dst net 4.0.224.0/19) || (dst net 4.1.0.0/16) || (dst net 4.2.0.0/15) || (dst net 4.4.0.0/14) || (dst net 4.8.0.0/13) || (dst net 4.16.0.0/12) || (dst net 4.32.0.0/11) || (dst net 4.64.0.0/10) || (dst net 4.128.0.0/9)),
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
