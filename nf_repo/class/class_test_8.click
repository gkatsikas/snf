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
		((dst port 3282) || (dst port 30438) || (dst port 49908) || (dst port 50477) || (dst port 61669)) && ((dst net 8.0.0.0/18) || (dst net 8.0.64.0/22) || (dst net 8.0.68.0/23) || (dst net 8.0.70.0/25) || (dst net 8.0.70.128/26) || (dst net 8.0.70.192/27) || (dst net 8.0.70.224/29) || (dst net 8.0.70.232/30) || (dst net 8.0.70.236/31) || (dst net 8.0.70.238/32) || (dst net 8.0.70.240/28) || (dst net 8.0.71.0/24) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/26) || (dst net 8.0.98.64/28) || (dst net 8.0.98.80/30) || (dst net 8.0.98.84/31) || (dst net 8.0.98.86/32) || (dst net 8.0.98.88/29) || (dst net 8.0.98.96/27) || (dst net 8.0.98.128/25) || (dst net 8.0.99.0/24) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/27) || (dst net 8.0.128.32/29) || (dst net 8.0.128.40/30) || (dst net 8.0.128.44/31) || (dst net 8.0.128.46/32) || (dst net 8.0.128.48/28) || (dst net 8.0.128.64/26) || (dst net 8.0.128.128/25) || (dst net 8.0.129.0/24) || (dst net 8.0.130.0/23) || (dst net 8.0.132.0/23) || (dst net 8.0.134.0/24) || (dst net 8.0.135.0/25) || (dst net 8.0.135.128/28) || (dst net 8.0.135.144/29) || (dst net 8.0.135.152/30) || (dst net 8.0.135.156/31) || (dst net 8.0.135.159/32) || (dst net 8.0.135.160/27) || (dst net 8.0.135.192/26) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/21) || (dst net 8.0.232.0/24) || (dst net 8.0.233.0/25) || (dst net 8.0.233.128/26) || (dst net 8.0.233.192/27) || (dst net 8.0.233.224/28) || (dst net 8.0.233.240/32) || (dst net 8.0.233.242/31) || (dst net 8.0.233.244/30) || (dst net 8.0.233.248/29) || (dst net 8.0.234.0/23) || (dst net 8.0.236.0/22) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 41259) || (dst port 47542) || (dst port 48250) || (dst port 58235) || (dst port 65502)) && ((dst net 8.0.0.0/22) || (dst net 8.0.4.0/29) || (dst net 8.0.4.8/30) || (dst net 8.0.4.12/31) || (dst net 8.0.4.14/32) || (dst net 8.0.4.16/28) || (dst net 8.0.4.32/27) || (dst net 8.0.4.64/26) || (dst net 8.0.4.128/25) || (dst net 8.0.5.0/24) || (dst net 8.0.6.0/23) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/20) || (dst net 8.0.32.0/28) || (dst net 8.0.32.16/29) || (dst net 8.0.32.25/32) || (dst net 8.0.32.26/31) || (dst net 8.0.32.28/30) || (dst net 8.0.32.32/27) || (dst net 8.0.32.64/26) || (dst net 8.0.32.128/25) || (dst net 8.0.33.0/24) || (dst net 8.0.34.0/23) || (dst net 8.0.36.0/22) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/27) || (dst net 8.0.176.32/28) || (dst net 8.0.176.48/29) || (dst net 8.0.176.56/30) || (dst net 8.0.176.60/31) || (dst net 8.0.176.62/32) || (dst net 8.0.176.64/26) || (dst net 8.0.176.128/25) || (dst net 8.0.177.0/24) || (dst net 8.0.178.0/23) || (dst net 8.0.180.0/22) || (dst net 8.0.184.0/21) || (dst net 8.0.192.0/20) || (dst net 8.0.208.0/23) || (dst net 8.0.210.0/24) || (dst net 8.0.211.0/25) || (dst net 8.0.211.128/26) || (dst net 8.0.211.192/27) || (dst net 8.0.211.224/29) || (dst net 8.0.211.232/30) || (dst net 8.0.211.236/32) || (dst net 8.0.211.238/31) || (dst net 8.0.211.240/28) || (dst net 8.0.212.0/22) || (dst net 8.0.216.0/22) || (dst net 8.0.220.0/23) || (dst net 8.0.222.0/26) || (dst net 8.0.222.64/30) || (dst net 8.0.222.68/31) || (dst net 8.0.222.70/32) || (dst net 8.0.222.72/29) || (dst net 8.0.222.80/28) || (dst net 8.0.222.96/27) || (dst net 8.0.222.128/25) || (dst net 8.0.223.0/24) || (dst net 8.0.224.0/19) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 17650) || (dst port 27006) || (dst port 27224) || (dst port 55150) || (dst port 55443)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/20) || (dst net 8.0.48.0/21) || (dst net 8.0.56.0/23) || (dst net 8.0.58.0/24) || (dst net 8.0.59.0/25) || (dst net 8.0.59.128/27) || (dst net 8.0.59.160/28) || (dst net 8.0.59.176/31) || (dst net 8.0.59.178/32) || (dst net 8.0.59.180/30) || (dst net 8.0.59.184/29) || (dst net 8.0.59.192/26) || (dst net 8.0.60.0/22) || (dst net 8.0.64.0/21) || (dst net 8.0.72.0/22) || (dst net 8.0.76.0/23) || (dst net 8.0.78.0/26) || (dst net 8.0.78.64/27) || (dst net 8.0.78.96/29) || (dst net 8.0.78.104/31) || (dst net 8.0.78.106/32) || (dst net 8.0.78.108/30) || (dst net 8.0.78.112/28) || (dst net 8.0.78.128/25) || (dst net 8.0.79.0/24) || (dst net 8.0.80.0/21) || (dst net 8.0.88.0/24) || (dst net 8.0.89.0/25) || (dst net 8.0.89.128/26) || (dst net 8.0.89.192/28) || (dst net 8.0.89.208/29) || (dst net 8.0.89.216/30) || (dst net 8.0.89.221/32) || (dst net 8.0.89.222/31) || (dst net 8.0.89.224/27) || (dst net 8.0.90.0/23) || (dst net 8.0.92.0/22) || (dst net 8.0.96.0/19) || (dst net 8.0.128.0/23) || (dst net 8.0.130.0/24) || (dst net 8.0.131.0/26) || (dst net 8.0.131.64/27) || (dst net 8.0.131.96/30) || (dst net 8.0.131.100/31) || (dst net 8.0.131.103/32) || (dst net 8.0.131.104/29) || (dst net 8.0.131.112/28) || (dst net 8.0.131.128/25) || (dst net 8.0.132.0/22) || (dst net 8.0.136.0/21) || (dst net 8.0.144.0/22) || (dst net 8.0.148.0/23) || (dst net 8.0.150.0/24) || (dst net 8.0.151.0/26) || (dst net 8.0.151.64/28) || (dst net 8.0.151.80/30) || (dst net 8.0.151.85/32) || (dst net 8.0.151.86/31) || (dst net 8.0.151.88/29) || (dst net 8.0.151.96/27) || (dst net 8.0.151.128/25) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/18) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 2166) || (dst port 32669) || (dst port 35026) || (dst port 37465) || (dst port 52588)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/22) || (dst net 8.0.36.0/23) || (dst net 8.0.38.0/24) || (dst net 8.0.39.0/26) || (dst net 8.0.39.64/28) || (dst net 8.0.39.80/29) || (dst net 8.0.39.88/31) || (dst net 8.0.39.91/32) || (dst net 8.0.39.92/30) || (dst net 8.0.39.96/27) || (dst net 8.0.39.128/25) || (dst net 8.0.40.0/22) || (dst net 8.0.44.0/24) || (dst net 8.0.45.0/25) || (dst net 8.0.45.128/27) || (dst net 8.0.45.160/30) || (dst net 8.0.45.164/31) || (dst net 8.0.45.166/32) || (dst net 8.0.45.168/29) || (dst net 8.0.45.176/28) || (dst net 8.0.45.192/26) || (dst net 8.0.46.0/23) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/21) || (dst net 8.0.72.0/24) || (dst net 8.0.73.0/25) || (dst net 8.0.73.128/30) || (dst net 8.0.73.132/31) || (dst net 8.0.73.134/32) || (dst net 8.0.73.136/29) || (dst net 8.0.73.144/28) || (dst net 8.0.73.160/27) || (dst net 8.0.73.192/26) || (dst net 8.0.74.0/23) || (dst net 8.0.76.0/22) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/20) || (dst net 8.0.112.0/22) || (dst net 8.0.116.0/23) || (dst net 8.0.118.0/24) || (dst net 8.0.119.0/25) || (dst net 8.0.119.128/26) || (dst net 8.0.119.192/29) || (dst net 8.0.119.200/31) || (dst net 8.0.119.203/32) || (dst net 8.0.119.204/30) || (dst net 8.0.119.208/28) || (dst net 8.0.119.224/27) || (dst net 8.0.120.0/21) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/24) || (dst net 8.0.137.0/25) || (dst net 8.0.137.128/29) || (dst net 8.0.137.136/30) || (dst net 8.0.137.140/32) || (dst net 8.0.137.142/31) || (dst net 8.0.137.144/28) || (dst net 8.0.137.160/27) || (dst net 8.0.137.192/26) || (dst net 8.0.138.0/23) || (dst net 8.0.140.0/22) || (dst net 8.0.144.0/20) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/18) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 8547) || (dst port 10470) || (dst port 13943) || (dst port 46840) || (dst port 55185)) && ((dst net 8.0.0.0/17) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/24) || (dst net 8.0.141.0/25) || (dst net 8.0.141.128/26) || (dst net 8.0.141.192/27) || (dst net 8.0.141.224/28) || (dst net 8.0.141.240/29) || (dst net 8.0.141.248/31) || (dst net 8.0.141.251/32) || (dst net 8.0.141.252/30) || (dst net 8.0.142.0/23) || (dst net 8.0.144.0/21) || (dst net 8.0.152.0/22) || (dst net 8.0.156.0/23) || (dst net 8.0.158.0/24) || (dst net 8.0.159.0/25) || (dst net 8.0.159.128/26) || (dst net 8.0.159.192/27) || (dst net 8.0.159.224/28) || (dst net 8.0.159.240/30) || (dst net 8.0.159.244/31) || (dst net 8.0.159.246/32) || (dst net 8.0.159.248/29) || (dst net 8.0.160.0/20) || (dst net 8.0.176.0/21) || (dst net 8.0.184.0/22) || (dst net 8.0.188.0/23) || (dst net 8.0.190.0/24) || (dst net 8.0.191.0/25) || (dst net 8.0.191.128/28) || (dst net 8.0.191.144/32) || (dst net 8.0.191.146/31) || (dst net 8.0.191.148/30) || (dst net 8.0.191.152/29) || (dst net 8.0.191.160/27) || (dst net 8.0.191.192/26) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/22) || (dst net 8.0.228.0/29) || (dst net 8.0.228.8/32) || (dst net 8.0.228.10/31) || (dst net 8.0.228.12/30) || (dst net 8.0.228.16/28) || (dst net 8.0.228.32/27) || (dst net 8.0.228.64/26) || (dst net 8.0.228.128/25) || (dst net 8.0.229.0/24) || (dst net 8.0.230.0/23) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/25) || (dst net 8.0.244.128/28) || (dst net 8.0.244.144/30) || (dst net 8.0.244.149/32) || (dst net 8.0.244.150/31) || (dst net 8.0.244.152/29) || (dst net 8.0.244.160/27) || (dst net 8.0.244.192/26) || (dst net 8.0.245.0/24) || (dst net 8.0.246.0/23) || (dst net 8.0.248.0/21) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 11855) || (dst port 15723) || (dst port 20810) || (dst port 46520) || (dst port 61467)) && ((dst net 8.0.0.0/25) || (dst net 8.0.0.128/26) || (dst net 8.0.0.192/30) || (dst net 8.0.0.197/32) || (dst net 8.0.0.198/31) || (dst net 8.0.0.200/29) || (dst net 8.0.0.208/28) || (dst net 8.0.0.224/27) || (dst net 8.0.1.0/24) || (dst net 8.0.2.0/23) || (dst net 8.0.4.0/23) || (dst net 8.0.6.0/25) || (dst net 8.0.6.128/26) || (dst net 8.0.6.192/27) || (dst net 8.0.6.224/32) || (dst net 8.0.6.226/31) || (dst net 8.0.6.228/30) || (dst net 8.0.6.232/29) || (dst net 8.0.6.240/28) || (dst net 8.0.7.0/24) || (dst net 8.0.8.0/21) || (dst net 8.0.16.0/22) || (dst net 8.0.20.0/23) || (dst net 8.0.22.0/24) || (dst net 8.0.23.0/26) || (dst net 8.0.23.64/29) || (dst net 8.0.23.72/31) || (dst net 8.0.23.74/32) || (dst net 8.0.23.76/30) || (dst net 8.0.23.80/28) || (dst net 8.0.23.96/27) || (dst net 8.0.23.128/25) || (dst net 8.0.24.0/21) || (dst net 8.0.32.0/19) || (dst net 8.0.64.0/22) || (dst net 8.0.68.0/23) || (dst net 8.0.70.0/26) || (dst net 8.0.70.64/29) || (dst net 8.0.70.72/31) || (dst net 8.0.70.74/32) || (dst net 8.0.70.76/30) || (dst net 8.0.70.80/28) || (dst net 8.0.70.96/27) || (dst net 8.0.70.128/25) || (dst net 8.0.71.0/24) || (dst net 8.0.72.0/21) || (dst net 8.0.80.0/20) || (dst net 8.0.96.0/21) || (dst net 8.0.104.0/23) || (dst net 8.0.106.0/29) || (dst net 8.0.106.8/30) || (dst net 8.0.106.12/31) || (dst net 8.0.106.14/32) || (dst net 8.0.106.16/28) || (dst net 8.0.106.32/27) || (dst net 8.0.106.64/26) || (dst net 8.0.106.128/25) || (dst net 8.0.107.0/24) || (dst net 8.0.108.0/22) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/17) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 9669) || (dst port 25410) || (dst port 32752) || (dst port 38483) || (dst port 55417)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/22) || (dst net 8.0.36.0/23) || (dst net 8.0.38.0/26) || (dst net 8.0.38.64/27) || (dst net 8.0.38.96/28) || (dst net 8.0.38.112/29) || (dst net 8.0.38.120/30) || (dst net 8.0.38.125/32) || (dst net 8.0.38.126/31) || (dst net 8.0.38.128/25) || (dst net 8.0.39.0/24) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/19) || (dst net 8.0.96.0/23) || (dst net 8.0.98.0/25) || (dst net 8.0.98.128/26) || (dst net 8.0.98.192/30) || (dst net 8.0.98.196/32) || (dst net 8.0.98.198/31) || (dst net 8.0.98.200/29) || (dst net 8.0.98.208/28) || (dst net 8.0.98.224/27) || (dst net 8.0.99.0/24) || (dst net 8.0.100.0/22) || (dst net 8.0.104.0/21) || (dst net 8.0.112.0/20) || (dst net 8.0.128.0/19) || (dst net 8.0.160.0/22) || (dst net 8.0.164.0/23) || (dst net 8.0.166.0/25) || (dst net 8.0.166.128/26) || (dst net 8.0.166.192/27) || (dst net 8.0.166.224/29) || (dst net 8.0.166.232/30) || (dst net 8.0.166.236/31) || (dst net 8.0.166.239/32) || (dst net 8.0.166.240/28) || (dst net 8.0.167.0/24) || (dst net 8.0.168.0/22) || (dst net 8.0.172.0/23) || (dst net 8.0.174.0/26) || (dst net 8.0.174.64/27) || (dst net 8.0.174.96/29) || (dst net 8.0.174.104/30) || (dst net 8.0.174.108/31) || (dst net 8.0.174.111/32) || (dst net 8.0.174.112/28) || (dst net 8.0.174.128/25) || (dst net 8.0.175.0/24) || (dst net 8.0.176.0/20) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/23) || (dst net 8.0.226.0/24) || (dst net 8.0.227.0/28) || (dst net 8.0.227.16/31) || (dst net 8.0.227.18/32) || (dst net 8.0.227.20/30) || (dst net 8.0.227.24/29) || (dst net 8.0.227.32/27) || (dst net 8.0.227.64/26) || (dst net 8.0.227.128/25) || (dst net 8.0.228.0/22) || (dst net 8.0.232.0/21) || (dst net 8.0.240.0/20) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
		((dst port 9294) || (dst port 16523) || (dst port 26789) || (dst port 32016) || (dst port 37022)) && ((dst net 8.0.0.0/19) || (dst net 8.0.32.0/22) || (dst net 8.0.36.0/24) || (dst net 8.0.37.0/25) || (dst net 8.0.37.128/26) || (dst net 8.0.37.192/27) || (dst net 8.0.37.224/29) || (dst net 8.0.37.232/30) || (dst net 8.0.37.236/32) || (dst net 8.0.37.238/31) || (dst net 8.0.37.240/28) || (dst net 8.0.38.0/23) || (dst net 8.0.40.0/21) || (dst net 8.0.48.0/20) || (dst net 8.0.64.0/18) || (dst net 8.0.128.0/21) || (dst net 8.0.136.0/22) || (dst net 8.0.140.0/23) || (dst net 8.0.142.0/26) || (dst net 8.0.142.64/27) || (dst net 8.0.142.97/32) || (dst net 8.0.142.98/31) || (dst net 8.0.142.100/30) || (dst net 8.0.142.104/29) || (dst net 8.0.142.112/28) || (dst net 8.0.142.128/25) || (dst net 8.0.143.0/24) || (dst net 8.0.144.0/22) || (dst net 8.0.148.0/23) || (dst net 8.0.150.0/24) || (dst net 8.0.151.0/28) || (dst net 8.0.151.16/31) || (dst net 8.0.151.19/32) || (dst net 8.0.151.20/30) || (dst net 8.0.151.24/29) || (dst net 8.0.151.32/27) || (dst net 8.0.151.64/26) || (dst net 8.0.151.128/25) || (dst net 8.0.152.0/21) || (dst net 8.0.160.0/19) || (dst net 8.0.192.0/19) || (dst net 8.0.224.0/20) || (dst net 8.0.240.0/22) || (dst net 8.0.244.0/25) || (dst net 8.0.244.128/28) || (dst net 8.0.244.144/30) || (dst net 8.0.244.148/31) || (dst net 8.0.244.150/32) || (dst net 8.0.244.152/29) || (dst net 8.0.244.160/27) || (dst net 8.0.244.192/26) || (dst net 8.0.245.0/24) || (dst net 8.0.246.0/23) || (dst net 8.0.248.0/23) || (dst net 8.0.250.0/24) || (dst net 8.0.251.0/25) || (dst net 8.0.251.128/27) || (dst net 8.0.251.160/28) || (dst net 8.0.251.176/29) || (dst net 8.0.251.184/31) || (dst net 8.0.251.186/32) || (dst net 8.0.251.188/30) || (dst net 8.0.251.192/26) || (dst net 8.0.252.0/22) || (dst net 8.1.0.0/16) || (dst net 8.2.0.0/15) || (dst net 8.4.0.0/14) || (dst net 8.8.0.0/13) || (dst net 8.16.0.0/12) || (dst net 8.32.0.0/11) || (dst net 8.64.0.0/10) || (dst net 8.128.0.0/9)),
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

	strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

	ipclassifier[0] -> getIPClas0 -> Discard ();
	ipclassifier[1] -> getIPClas1 -> Discard ();
	ipclassifier[2] -> getIPClas2 -> Discard ();
	ipclassifier[3] -> getIPClas3 -> Discard ();
	ipclassifier[4] -> getIPClas4 -> Discard ();
	ipclassifier[5] -> getIPClas5 -> Discard ();
	ipclassifier[6] -> getIPClas6 -> Discard ();
	ipclassifier[7] -> getIPClas7 -> Discard ();
	
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
