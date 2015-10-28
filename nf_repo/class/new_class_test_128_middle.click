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
	((dst port 14878) || (dst port 34248) || (dst port 39034) || (dst port 43085) || (dst port 63844)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.81.214/32) || (dst net 0.0.159.149/32) || (dst net 0.0.162.254/32) || (dst net 0.0.202.184/32) || (dst net 0.0.249.137/32))),
	((dst port 15124) || (dst port 27320) || (dst port 36443) || (dst port 41299) || (dst port 50772)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.35.237/32) || (dst net 1.0.49.0/32) || (dst net 1.0.55.190/32) || (dst net 1.0.128.217/32) || (dst net 1.0.224.177/32))),
	((dst port 4393) || (dst port 27537) || (dst port 34124) || (dst port 56999) || (dst port 61613)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.26.193/32) || (dst net 2.0.60.30/32) || (dst net 2.0.62.14/32) || (dst net 2.0.126.176/32) || (dst net 2.0.160.251/32))),
	((dst port 8260) || (dst port 16060) || (dst port 18683) || (dst port 25600) || (dst port 38640)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.75.12/32) || (dst net 3.0.136.227/32) || (dst net 3.0.171.63/32) || (dst net 3.0.204.53/32) || (dst net 3.0.221.41/32))),
	((dst port 10142) || (dst port 32079) || (dst port 46240) || (dst port 61414) || (dst port 62893)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.40.148/32) || (dst net 4.0.55.96/32) || (dst net 4.0.80.125/32) || (dst net 4.0.125.220/32) || (dst net 4.0.228.124/32))),
	((dst port 5088) || (dst port 17309) || (dst port 34448) || (dst port 35489) || (dst port 59109)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.32.12/32) || (dst net 5.0.77.48/32) || (dst net 5.0.182.138/32) || (dst net 5.0.223.149/32) || (dst net 5.0.245.118/32))),
	((dst port 27976) || (dst port 36043) || (dst port 39873) || (dst port 42533) || (dst port 49993)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.55.159/32) || (dst net 6.0.72.192/32) || (dst net 6.0.154.195/32) || (dst net 6.0.162.71/32) || (dst net 6.0.234.13/32))),
	((dst port 8419) || (dst port 13934) || (dst port 25116) || (dst port 29268) || (dst port 36262)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.23.58/32) || (dst net 7.0.56.181/32) || (dst net 7.0.197.192/32) || (dst net 7.0.227.161/32) || (dst net 7.0.252.190/32))),
	((dst port 14079) || (dst port 41322) || (dst port 42054) || (dst port 50051) || (dst port 64084)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.34.142/32) || (dst net 8.0.176.178/32) || (dst net 8.0.182.232/32) || (dst net 8.0.186.117/32) || (dst net 8.0.220.107/32))),
	((dst port 17525) || (dst port 22522) || (dst port 26685) || (dst port 42394) || (dst port 56758)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.36.214/32) || (dst net 9.0.86.32/32) || (dst net 9.0.99.26/32) || (dst net 9.0.114.111/32) || (dst net 9.0.165.210/32))),
	((dst port 404) || (dst port 2110) || (dst port 21200) || (dst port 50462) || (dst port 53316)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.6.222/32) || (dst net 10.0.80.116/32) || (dst net 10.0.160.11/32) || (dst net 10.0.224.107/32) || (dst net 10.0.254.48/32))),
	((dst port 17718) || (dst port 20477) || (dst port 21757) || (dst port 35794) || (dst port 56785)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.3.1/32) || (dst net 11.0.45.236/32) || (dst net 11.0.117.210/32) || (dst net 11.0.236.103/32) || (dst net 11.0.243.159/32))),
	((dst port 10609) || (dst port 28959) || (dst port 30643) || (dst port 32589) || (dst port 32650)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.101.178/32) || (dst net 12.0.101.244/32) || (dst net 12.0.111.113/32) || (dst net 12.0.213.184/32) || (dst net 12.0.237.129/32))),
	((dst port 12292) || (dst port 15047) || (dst port 19002) || (dst port 27156) || (dst port 58268)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.59.224/32) || (dst net 13.0.96.97/32) || (dst net 13.0.172.118/32) || (dst net 13.0.224.226/32) || (dst net 13.0.242.19/32))),
	((dst port 18213) || (dst port 21615) || (dst port 24680) || (dst port 59860) || (dst port 64517)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.1.73/32) || (dst net 14.0.134.71/32) || (dst net 14.0.177.123/32) || (dst net 14.0.202.177/32) || (dst net 14.0.215.58/32))),
	((dst port 1232) || (dst port 7821) || (dst port 35986) || (dst port 48095) || (dst port 53954)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.41.89/32) || (dst net 15.0.128.200/32) || (dst net 15.0.160.146/32) || (dst net 15.0.161.126/32) || (dst net 15.0.186.119/32))),
	((dst port 35370) || (dst port 37335) || (dst port 42425) || (dst port 54297) || (dst port 62620)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.34.74/32) || (dst net 16.0.47.201/32) || (dst net 16.0.57.166/32) || (dst net 16.0.126.162/32) || (dst net 16.0.194.71/32))),
	((dst port 2576) || (dst port 25525) || (dst port 54119) || (dst port 56007) || (dst port 57887)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.19.248/32) || (dst net 17.0.45.89/32) || (dst net 17.0.50.159/32) || (dst net 17.0.64.114/32) || (dst net 17.0.130.108/32))),
	((dst port 10005) || (dst port 20487) || (dst port 47141) || (dst port 58788) || (dst port 60239)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.4.122/32) || (dst net 18.0.18.50/32) || (dst net 18.0.22.31/32) || (dst net 18.0.125.221/32) || (dst net 18.0.194.26/32))),
	((dst port 21224) || (dst port 50479) || (dst port 55246) || (dst port 56605) || (dst port 64137)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.1.219/32) || (dst net 19.0.35.160/32) || (dst net 19.0.55.118/32) || (dst net 19.0.120.97/32) || (dst net 19.0.210.210/32))),
	((dst port 6580) || (dst port 18309) || (dst port 19050) || (dst port 27175) || (dst port 40687)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.56.207/32) || (dst net 20.0.142.165/32) || (dst net 20.0.148.68/32) || (dst net 20.0.196.43/32) || (dst net 20.0.212.106/32))),
	((dst port 12414) || (dst port 24217) || (dst port 30682) || (dst port 31194) || (dst port 51184)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.24.200/32) || (dst net 21.0.91.122/32) || (dst net 21.0.153.42/32) || (dst net 21.0.199.179/32) || (dst net 21.0.255.147/32))),
	((dst port 16363) || (dst port 30703) || (dst port 35608) || (dst port 39487) || (dst port 50206)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.10.148/32) || (dst net 22.0.56.152/32) || (dst net 22.0.96.170/32) || (dst net 22.0.157.250/32) || (dst net 22.0.160.70/32))),
	((dst port 2766) || (dst port 25812) || (dst port 26950) || (dst port 33185) || (dst port 49039)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.28.213/32) || (dst net 23.0.64.30/32) || (dst net 23.0.74.197/32) || (dst net 23.0.119.232/32) || (dst net 23.0.235.60/32))),
	((dst port 14324) || (dst port 17858) || (dst port 24737) || (dst port 48155) || (dst port 51294)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.124.175/32) || (dst net 24.0.151.220/32) || (dst net 24.0.156.153/32) || (dst net 24.0.216.71/32) || (dst net 24.0.228.223/32))),
	((dst port 32882) || (dst port 39063) || (dst port 45306) || (dst port 47986) || (dst port 55834)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.11.78/32) || (dst net 25.0.87.36/32) || (dst net 25.0.91.124/32) || (dst net 25.0.208.138/32) || (dst net 25.0.247.14/32))),
	((dst port 3240) || (dst port 7259) || (dst port 21567) || (dst port 38165) || (dst port 63779)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.92.55/32) || (dst net 26.0.125.239/32) || (dst net 26.0.179.134/32) || (dst net 26.0.187.158/32) || (dst net 26.0.235.245/32))),
	((dst port 15159) || (dst port 21911) || (dst port 38023) || (dst port 44750) || (dst port 59691)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.14.8/32) || (dst net 27.0.17.175/32) || (dst net 27.0.56.50/32) || (dst net 27.0.77.146/32) || (dst net 27.0.144.49/32))),
	((dst port 18068) || (dst port 35245) || (dst port 37721) || (dst port 42568) || (dst port 61011)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.31.227/32) || (dst net 28.0.41.1/32) || (dst net 28.0.100.61/32) || (dst net 28.0.174.119/32) || (dst net 28.0.190.149/32))),
	((dst port 11022) || (dst port 15452) || (dst port 36822) || (dst port 60348) || (dst port 64560)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.1.32/32) || (dst net 29.0.29.45/32) || (dst net 29.0.106.70/32) || (dst net 29.0.109.21/32) || (dst net 29.0.139.212/32))),
	((dst port 1151) || (dst port 19508) || (dst port 21076) || (dst port 21547) || (dst port 61437)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.17.63/32) || (dst net 30.0.25.199/32) || (dst net 30.0.113.228/32) || (dst net 30.0.193.1/32) || (dst net 30.0.246.168/32))),
	((dst port 23530) || (dst port 34244) || (dst port 34400) || (dst port 58014) || (dst port 61936)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.3.64/32) || (dst net 31.0.8.186/32) || (dst net 31.0.29.144/32) || (dst net 31.0.106.197/32) || (dst net 31.0.180.253/32))),
	((dst port 27397) || (dst port 35724) || (dst port 52420) || (dst port 61345) || (dst port 64430)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.7.112/32) || (dst net 32.0.46.21/32) || (dst net 32.0.71.3/32) || (dst net 32.0.80.85/32) || (dst net 32.0.106.153/32))),
	((dst port 8903) || (dst port 15550) || (dst port 38233) || (dst port 49852) || (dst port 61405)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.26.193/32) || (dst net 33.0.46.207/32) || (dst net 33.0.60.172/32) || (dst net 33.0.105.97/32) || (dst net 33.0.163.192/32))),
	((dst port 34540) || (dst port 37897) || (dst port 38681) || (dst port 50636) || (dst port 56392)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.14.235/32) || (dst net 34.0.22.197/32) || (dst net 34.0.46.88/32) || (dst net 34.0.55.9/32) || (dst net 34.0.165.96/32))),
	((dst port 4946) || (dst port 13662) || (dst port 29642) || (dst port 44364) || (dst port 44538)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.168.189/32) || (dst net 35.0.178.253/32) || (dst net 35.0.182.150/32) || (dst net 35.0.223.240/32) || (dst net 35.0.242.205/32))),
	((dst port 5170) || (dst port 24892) || (dst port 31501) || (dst port 34010) || (dst port 55697)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.43.70/32) || (dst net 36.0.70.37/32) || (dst net 36.0.175.207/32) || (dst net 36.0.180.150/32) || (dst net 36.0.254.70/32))),
	((dst port 6548) || (dst port 8715) || (dst port 24865) || (dst port 45822) || (dst port 64076)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.18.190/32) || (dst net 37.0.21.149/32) || (dst net 37.0.167.105/32) || (dst net 37.0.222.48/32) || (dst net 37.0.240.97/32))),
	((dst port 4335) || (dst port 8192) || (dst port 16168) || (dst port 26734) || (dst port 59326)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.157.80/32) || (dst net 38.0.165.209/32) || (dst net 38.0.176.183/32) || (dst net 38.0.191.222/32) || (dst net 38.0.243.146/32))),
	((dst port 6185) || (dst port 10992) || (dst port 30240) || (dst port 46424) || (dst port 61177)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.111.249/32) || (dst net 39.0.157.189/32) || (dst net 39.0.194.153/32) || (dst net 39.0.217.134/32) || (dst net 39.0.229.62/32))),
	((dst port 3133) || (dst port 10952) || (dst port 15815) || (dst port 44056) || (dst port 59837)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.19.178/32) || (dst net 40.0.35.141/32) || (dst net 40.0.151.93/32) || (dst net 40.0.234.149/32) || (dst net 40.0.236.200/32))),
	((dst port 3822) || (dst port 11382) || (dst port 34210) || (dst port 36423) || (dst port 45270)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.35.205/32) || (dst net 41.0.177.210/32) || (dst net 41.0.191.122/32) || (dst net 41.0.209.108/32) || (dst net 41.0.248.206/32))),
	((dst port 5214) || (dst port 14428) || (dst port 19701) || (dst port 35302) || (dst port 55187)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.103.221/32) || (dst net 42.0.185.87/32) || (dst net 42.0.210.143/32) || (dst net 42.0.232.58/32) || (dst net 42.0.248.2/32))),
	((dst port 1478) || (dst port 2652) || (dst port 4082) || (dst port 14766) || (dst port 57360)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.31.221/32) || (dst net 43.0.107.34/32) || (dst net 43.0.134.215/32) || (dst net 43.0.134.231/32) || (dst net 43.0.156.236/32))),
	((dst port 8154) || (dst port 8989) || (dst port 12326) || (dst port 23208) || (dst port 54444)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.18.88/32) || (dst net 44.0.77.231/32) || (dst net 44.0.93.174/32) || (dst net 44.0.127.114/32) || (dst net 44.0.213.151/32))),
	((dst port 6317) || (dst port 8287) || (dst port 22319) || (dst port 29349) || (dst port 38920)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.56.188/32) || (dst net 45.0.88.28/32) || (dst net 45.0.161.163/32) || (dst net 45.0.172.72/32) || (dst net 45.0.194.173/32))),
	((dst port 3732) || (dst port 17417) || (dst port 26542) || (dst port 50676) || (dst port 57392)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.107.209/32) || (dst net 46.0.108.164/32) || (dst net 46.0.111.188/32) || (dst net 46.0.139.81/32) || (dst net 46.0.169.5/32))),
	((dst port 5463) || (dst port 6044) || (dst port 13125) || (dst port 29534) || (dst port 63682)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.22.219/32) || (dst net 47.0.88.108/32) || (dst net 47.0.118.154/32) || (dst net 47.0.144.170/32) || (dst net 47.0.165.16/32))),
	((dst port 6389) || (dst port 20878) || (dst port 26579) || (dst port 31330) || (dst port 33404)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.95.41/32) || (dst net 48.0.127.148/32) || (dst net 48.0.167.88/32) || (dst net 48.0.213.15/32) || (dst net 48.0.222.13/32))),
	((dst port 21905) || (dst port 36404) || (dst port 38723) || (dst port 59735) || (dst port 65445)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.101.151/32) || (dst net 49.0.126.26/32) || (dst net 49.0.170.223/32) || (dst net 49.0.208.133/32) || (dst net 49.0.218.2/32))),
	((dst port 15893) || (dst port 21151) || (dst port 39634) || (dst port 41058) || (dst port 53826)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.47.46/32) || (dst net 50.0.65.218/32) || (dst net 50.0.82.105/32) || (dst net 50.0.123.191/32) || (dst net 50.0.154.35/32))),
	((dst port 1343) || (dst port 10939) || (dst port 29729) || (dst port 55531) || (dst port 63432)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.22.157/32) || (dst net 51.0.40.125/32) || (dst net 51.0.68.229/32) || (dst net 51.0.153.160/32) || (dst net 51.0.155.43/32))),
	((dst port 14411) || (dst port 17501) || (dst port 34222) || (dst port 49860) || (dst port 52415)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.14.154/32) || (dst net 52.0.24.36/32) || (dst net 52.0.137.46/32) || (dst net 52.0.145.71/32) || (dst net 52.0.241.94/32))),
	((dst port 1695) || (dst port 19633) || (dst port 38850) || (dst port 46716) || (dst port 59539)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.67.120/32) || (dst net 53.0.122.74/32) || (dst net 53.0.127.200/32) || (dst net 53.0.135.134/32) || (dst net 53.0.199.15/32))),
	((dst port 15333) || (dst port 15710) || (dst port 18358) || (dst port 34893) || (dst port 52917)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.17.220/32) || (dst net 54.0.53.145/32) || (dst net 54.0.182.53/32) || (dst net 54.0.221.149/32) || (dst net 54.0.253.69/32))),
	((dst port 40548) || (dst port 42690) || (dst port 61314) || (dst port 62212) || (dst port 64951)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.4.57/32) || (dst net 55.0.57.210/32) || (dst net 55.0.94.88/32) || (dst net 55.0.229.222/32) || (dst net 55.0.243.157/32))),
	((dst port 1345) || (dst port 9820) || (dst port 23077) || (dst port 27955) || (dst port 61125)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.15.225/32) || (dst net 56.0.24.88/32) || (dst net 56.0.50.175/32) || (dst net 56.0.60.121/32) || (dst net 56.0.143.86/32))),
	((dst port 2251) || (dst port 31749) || (dst port 39056) || (dst port 49251) || (dst port 56349)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.10.184/32) || (dst net 57.0.121.172/32) || (dst net 57.0.181.38/32) || (dst net 57.0.223.147/32) || (dst net 57.0.244.234/32))),
	((dst port 2448) || (dst port 19141) || (dst port 42856) || (dst port 52451) || (dst port 58987)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.32.62/32) || (dst net 58.0.61.23/32) || (dst net 58.0.119.166/32) || (dst net 58.0.195.239/32) || (dst net 58.0.199.102/32))),
	((dst port 15443) || (dst port 26679) || (dst port 34943) || (dst port 58617) || (dst port 59690)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.129.101/32) || (dst net 59.0.200.220/32) || (dst net 59.0.212.42/32) || (dst net 59.0.228.173/32) || (dst net 59.0.249.93/32))),
	((dst port 1037) || (dst port 21060) || (dst port 25055) || (dst port 25593) || (dst port 28697)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.0.66/32) || (dst net 60.0.40.93/32) || (dst net 60.0.44.2/32) || (dst net 60.0.62.172/32) || (dst net 60.0.243.105/32))),
	((dst port 35691) || (dst port 42901) || (dst port 59242) || (dst port 63014) || (dst port 64152)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.24.96/32) || (dst net 61.0.34.255/32) || (dst net 61.0.47.96/32) || (dst net 61.0.91.147/32) || (dst net 61.0.92.24/32))),
	((dst port 5702) || (dst port 11355) || (dst port 25557) || (dst port 62449) || (dst port 65177)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.39.169/32) || (dst net 62.0.48.108/32) || (dst net 62.0.168.224/32) || (dst net 62.0.186.230/32) || (dst net 62.0.187.228/32))),
	((dst port 20756) || (dst port 31161) || (dst port 43888) || (dst port 58178) || (dst port 63935)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.32.135/32) || (dst net 63.0.122.255/32) || (dst net 63.0.148.35/32) || (dst net 63.0.152.16/32) || (dst net 63.0.238.209/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 27506) || (dst port 45174) || (dst port 49150) || (dst port 50368) || (dst port 53593)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.12.4/32) || (dst net 65.0.14.15/32) || (dst net 65.0.62.4/32) || (dst net 65.0.109.10/32) || (dst net 65.0.221.146/32))),
	((dst port 1632) || (dst port 11057) || (dst port 34373) || (dst port 37518) || (dst port 62064)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.23.49/32) || (dst net 66.0.49.94/32) || (dst net 66.0.100.121/32) || (dst net 66.0.144.176/32) || (dst net 66.0.223.137/32))),
	((dst port 3113) || (dst port 3840) || (dst port 22135) || (dst port 45241) || (dst port 55317)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.57.92/32) || (dst net 67.0.125.229/32) || (dst net 67.0.173.191/32) || (dst net 67.0.188.117/32) || (dst net 67.0.188.188/32))),
	((dst port 4837) || (dst port 34357) || (dst port 38373) || (dst port 44025) || (dst port 50106)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.18.26/32) || (dst net 68.0.130.122/32) || (dst net 68.0.190.136/32) || (dst net 68.0.220.124/32) || (dst net 68.0.241.109/32))),
	((dst port 30552) || (dst port 54584) || (dst port 55445) || (dst port 57613) || (dst port 63731)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.75.218/32) || (dst net 69.0.76.132/32) || (dst net 69.0.99.140/32) || (dst net 69.0.184.45/32) || (dst net 69.0.186.87/32))),
	((dst port 8348) || (dst port 29462) || (dst port 41383) || (dst port 46849) || (dst port 49472)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.74.135/32) || (dst net 70.0.124.140/32) || (dst net 70.0.135.5/32) || (dst net 70.0.251.71/32) || (dst net 70.0.254.153/32))),
	((dst port 16332) || (dst port 25244) || (dst port 27535) || (dst port 41110) || (dst port 63267)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.16.136/32) || (dst net 71.0.17.79/32) || (dst net 71.0.115.110/32) || (dst net 71.0.125.17/32) || (dst net 71.0.181.161/32))),
	((dst port 8159) || (dst port 23537) || (dst port 27047) || (dst port 29739) || (dst port 45363)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.52.221/32) || (dst net 72.0.138.60/32) || (dst net 72.0.163.216/32) || (dst net 72.0.164.70/32) || (dst net 72.0.183.45/32))),
	((dst port 29587) || (dst port 33525) || (dst port 36510) || (dst port 37857) || (dst port 59355)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.3.115/32) || (dst net 73.0.83.138/32) || (dst net 73.0.146.146/32) || (dst net 73.0.161.15/32) || (dst net 73.0.183.114/32))),
	((dst port 19467) || (dst port 33242) || (dst port 33670) || (dst port 42711) || (dst port 56345)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.49.218/32) || (dst net 74.0.87.116/32) || (dst net 74.0.90.224/32) || (dst net 74.0.116.186/32) || (dst net 74.0.212.216/32))),
	((dst port 2418) || (dst port 16255) || (dst port 36914) || (dst port 44296) || (dst port 44656)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.26.211/32) || (dst net 75.0.42.36/32) || (dst net 75.0.116.96/32) || (dst net 75.0.125.137/32) || (dst net 75.0.156.189/32))),
	((dst port 4517) || (dst port 7835) || (dst port 18883) || (dst port 21353) || (dst port 38191)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.43.88/32) || (dst net 76.0.71.135/32) || (dst net 76.0.127.139/32) || (dst net 76.0.143.40/32) || (dst net 76.0.209.86/32))),
	((dst port 15784) || (dst port 25468) || (dst port 47422) || (dst port 53245) || (dst port 61552)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.78.152/32) || (dst net 77.0.176.28/32) || (dst net 77.0.178.19/32) || (dst net 77.0.207.152/32) || (dst net 77.0.213.30/32))),
	((dst port 13619) || (dst port 19841) || (dst port 28764) || (dst port 42677) || (dst port 64950)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.15.219/32) || (dst net 78.0.69.135/32) || (dst net 78.0.134.45/32) || (dst net 78.0.159.241/32) || (dst net 78.0.240.7/32))),
	((dst port 12242) || (dst port 27322) || (dst port 31088) || (dst port 39252) || (dst port 47844)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.18.86/32) || (dst net 79.0.106.124/32) || (dst net 79.0.174.86/32) || (dst net 79.0.207.83/32) || (dst net 79.0.223.64/32))),
	((dst port 507) || (dst port 6324) || (dst port 19988) || (dst port 56974) || (dst port 58014)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.80.81/32) || (dst net 80.0.86.219/32) || (dst net 80.0.176.83/32) || (dst net 80.0.209.48/32) || (dst net 80.0.234.156/32))),
	((dst port 18684) || (dst port 21479) || (dst port 28888) || (dst port 42986) || (dst port 54094)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.56.232/32) || (dst net 81.0.156.60/32) || (dst net 81.0.173.31/32) || (dst net 81.0.237.139/32) || (dst net 81.0.245.116/32))),
	((dst port 18840) || (dst port 25600) || (dst port 44297) || (dst port 51304) || (dst port 62470)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.43.127/32) || (dst net 82.0.79.250/32) || (dst net 82.0.159.6/32) || (dst net 82.0.187.30/32) || (dst net 82.0.187.172/32))),
	((dst port 21924) || (dst port 30366) || (dst port 38079) || (dst port 38431) || (dst port 42344)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.134.205/32) || (dst net 83.0.151.83/32) || (dst net 83.0.208.169/32) || (dst net 83.0.215.201/32) || (dst net 83.0.217.64/32))),
	((dst port 10800) || (dst port 23802) || (dst port 43369) || (dst port 57399) || (dst port 65535)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.28.170/32) || (dst net 84.0.174.18/32) || (dst net 84.0.221.214/32) || (dst net 84.0.245.6/32) || (dst net 84.0.254.193/32))),
	((dst port 38435) || (dst port 42472) || (dst port 45178) || (dst port 55227) || (dst port 55257)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.3.196/32) || (dst net 85.0.30.231/32) || (dst net 85.0.84.5/32) || (dst net 85.0.208.138/32) || (dst net 85.0.242.170/32))),
	((dst port 16231) || (dst port 23902) || (dst port 27441) || (dst port 40551) || (dst port 48334)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.150.140/32) || (dst net 86.0.159.39/32) || (dst net 86.0.226.103/32) || (dst net 86.0.248.154/32) || (dst net 86.0.252.183/32))),
	((dst port 14739) || (dst port 15211) || (dst port 24926) || (dst port 60621) || (dst port 64703)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.23.189/32) || (dst net 87.0.44.122/32) || (dst net 87.0.98.219/32) || (dst net 87.0.147.104/32) || (dst net 87.0.240.75/32))),
	((dst port 12255) || (dst port 17108) || (dst port 19082) || (dst port 32007) || (dst port 54453)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.24.255/32) || (dst net 88.0.37.226/32) || (dst net 88.0.57.173/32) || (dst net 88.0.144.212/32) || (dst net 88.0.244.119/32))),
	((dst port 501) || (dst port 26180) || (dst port 26748) || (dst port 33631) || (dst port 40594)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.8.250/32) || (dst net 89.0.178.31/32) || (dst net 89.0.196.141/32) || (dst net 89.0.199.37/32) || (dst net 89.0.227.94/32))),
	((dst port 4086) || (dst port 6018) || (dst port 30435) || (dst port 31826) || (dst port 57135)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.102.164/32) || (dst net 90.0.138.68/32) || (dst net 90.0.167.183/32) || (dst net 90.0.175.187/32) || (dst net 90.0.207.3/32))),
	((dst port 16974) || (dst port 17451) || (dst port 33151) || (dst port 44903) || (dst port 63297)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.63.38/32) || (dst net 91.0.86.40/32) || (dst net 91.0.153.94/32) || (dst net 91.0.158.177/32) || (dst net 91.0.228.44/32))),
	((dst port 25919) || (dst port 50244) || (dst port 56954) || (dst port 58509) || (dst port 64864)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.11.55/32) || (dst net 92.0.72.187/32) || (dst net 92.0.106.140/32) || (dst net 92.0.111.195/32) || (dst net 92.0.209.7/32))),
	((dst port 7258) || (dst port 33527) || (dst port 35698) || (dst port 41441) || (dst port 61757)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.85.236/32) || (dst net 93.0.102.229/32) || (dst net 93.0.117.32/32) || (dst net 93.0.158.181/32) || (dst net 93.0.240.212/32))),
	((dst port 12283) || (dst port 25623) || (dst port 30246) || (dst port 38425) || (dst port 63406)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.4.181/32) || (dst net 94.0.57.84/32) || (dst net 94.0.117.108/32) || (dst net 94.0.205.199/32) || (dst net 94.0.220.116/32))),
	((dst port 10554) || (dst port 11020) || (dst port 11535) || (dst port 27511) || (dst port 44033)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.2.124/32) || (dst net 95.0.41.187/32) || (dst net 95.0.68.66/32) || (dst net 95.0.131.227/32) || (dst net 95.0.167.58/32))),
	((dst port 12718) || (dst port 25512) || (dst port 34406) || (dst port 38417) || (dst port 61046)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.12.40/32) || (dst net 96.0.50.44/32) || (dst net 96.0.93.5/32) || (dst net 96.0.195.75/32) || (dst net 96.0.227.66/32))),
	((dst port 2791) || (dst port 15125) || (dst port 45038) || (dst port 49843) || (dst port 61664)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.27.243/32) || (dst net 97.0.28.70/32) || (dst net 97.0.40.39/32) || (dst net 97.0.45.116/32) || (dst net 97.0.51.54/32))),
	((dst port 2969) || (dst port 3744) || (dst port 16385) || (dst port 25299) || (dst port 41467)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.106.62/32) || (dst net 98.0.146.73/32) || (dst net 98.0.174.160/32) || (dst net 98.0.231.20/32) || (dst net 98.0.243.216/32))),
	((dst port 2402) || (dst port 14941) || (dst port 15118) || (dst port 16476) || (dst port 37466)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.90.19/32) || (dst net 99.0.106.7/32) || (dst net 99.0.140.248/32) || (dst net 99.0.225.102/32) || (dst net 99.0.227.154/32))),
	((dst port 11369) || (dst port 23563) || (dst port 33045) || (dst port 44169) || (dst port 56339)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.65.173/32) || (dst net 100.0.91.32/32) || (dst net 100.0.111.211/32) || (dst net 100.0.156.159/32) || (dst net 100.0.207.209/32))),
	((dst port 3882) || (dst port 7094) || (dst port 29425) || (dst port 38192) || (dst port 55259)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.33.73/32) || (dst net 101.0.44.184/32) || (dst net 101.0.47.92/32) || (dst net 101.0.50.85/32) || (dst net 101.0.136.76/32))),
	((dst port 800) || (dst port 11542) || (dst port 17624) || (dst port 39702) || (dst port 45360)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.99.243/32) || (dst net 102.0.117.145/32) || (dst net 102.0.123.68/32) || (dst net 102.0.142.89/32) || (dst net 102.0.197.91/32))),
	((dst port 2017) || (dst port 27377) || (dst port 49984) || (dst port 52306) || (dst port 58217)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.114.247/32) || (dst net 103.0.131.244/32) || (dst net 103.0.155.155/32) || (dst net 103.0.192.195/32) || (dst net 103.0.226.127/32))),
	((dst port 642) || (dst port 36151) || (dst port 45224) || (dst port 55558) || (dst port 61089)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.21.172/32) || (dst net 104.0.71.130/32) || (dst net 104.0.121.142/32) || (dst net 104.0.131.69/32) || (dst net 104.0.243.66/32))),
	((dst port 19475) || (dst port 24537) || (dst port 31271) || (dst port 48787) || (dst port 58432)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.31.99/32) || (dst net 105.0.53.96/32) || (dst net 105.0.71.155/32) || (dst net 105.0.189.172/32) || (dst net 105.0.254.154/32))),
	((dst port 20060) || (dst port 22924) || (dst port 33318) || (dst port 52597) || (dst port 53681)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.83.252/32) || (dst net 106.0.84.133/32) || (dst net 106.0.158.17/32) || (dst net 106.0.158.217/32) || (dst net 106.0.202.7/32))),
	((dst port 16372) || (dst port 36577) || (dst port 47506) || (dst port 54324) || (dst port 55713)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.41.118/32) || (dst net 107.0.94.194/32) || (dst net 107.0.181.148/32) || (dst net 107.0.245.32/32) || (dst net 107.0.247.80/32))),
	((dst port 22384) || (dst port 42885) || (dst port 46133) || (dst port 52481) || (dst port 55716)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.30.218/32) || (dst net 108.0.105.111/32) || (dst net 108.0.138.160/32) || (dst net 108.0.148.133/32) || (dst net 108.0.207.42/32))),
	((dst port 3994) || (dst port 27512) || (dst port 31354) || (dst port 38220) || (dst port 43681)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.47.34/32) || (dst net 109.0.80.242/32) || (dst net 109.0.86.69/32) || (dst net 109.0.170.17/32) || (dst net 109.0.224.15/32))),
	((dst port 1549) || (dst port 16820) || (dst port 29924) || (dst port 34084) || (dst port 55544)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.19.12/32) || (dst net 110.0.122.41/32) || (dst net 110.0.125.231/32) || (dst net 110.0.182.140/32) || (dst net 110.0.239.19/32))),
	((dst port 6616) || (dst port 21371) || (dst port 40607) || (dst port 40913) || (dst port 51335)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.55.147/32) || (dst net 111.0.65.132/32) || (dst net 111.0.86.106/32) || (dst net 111.0.125.105/32) || (dst net 111.0.160.223/32))),
	((dst port 15242) || (dst port 29402) || (dst port 46663) || (dst port 53876) || (dst port 57006)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.61.117/32) || (dst net 112.0.73.99/32) || (dst net 112.0.194.58/32) || (dst net 112.0.205.218/32) || (dst net 112.0.235.210/32))),
	((dst port 17153) || (dst port 34740) || (dst port 40015) || (dst port 50795) || (dst port 58138)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.9.192/32) || (dst net 113.0.13.134/32) || (dst net 113.0.18.48/32) || (dst net 113.0.62.8/32) || (dst net 113.0.88.209/32))),
	((dst port 7466) || (dst port 32599) || (dst port 53159) || (dst port 63220) || (dst port 63810)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.18.76/32) || (dst net 114.0.54.202/32) || (dst net 114.0.188.7/32) || (dst net 114.0.242.52/32) || (dst net 114.0.245.63/32))),
	((dst port 33351) || (dst port 37428) || (dst port 58690) || (dst port 59513) || (dst port 60776)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.0.13/32) || (dst net 115.0.16.14/32) || (dst net 115.0.151.182/32) || (dst net 115.0.181.116/32) || (dst net 115.0.232.47/32))),
	((dst port 572) || (dst port 1037) || (dst port 4123) || (dst port 35812) || (dst port 61794)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.8.244/32) || (dst net 116.0.27.40/32) || (dst net 116.0.214.26/32) || (dst net 116.0.220.77/32) || (dst net 116.0.244.202/32))),
	((dst port 6080) || (dst port 13611) || (dst port 22062) || (dst port 48586) || (dst port 52339)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.28.86/32) || (dst net 117.0.108.114/32) || (dst net 117.0.110.81/32) || (dst net 117.0.130.236/32) || (dst net 117.0.156.244/32))),
	((dst port 6929) || (dst port 13242) || (dst port 35338) || (dst port 41316) || (dst port 61535)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.86.85/32) || (dst net 118.0.192.130/32) || (dst net 118.0.195.55/32) || (dst net 118.0.219.223/32) || (dst net 118.0.245.34/32))),
	((dst port 4062) || (dst port 28635) || (dst port 31936) || (dst port 40643) || (dst port 55880)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.72.231/32) || (dst net 119.0.76.11/32) || (dst net 119.0.82.194/32) || (dst net 119.0.112.143/32) || (dst net 119.0.191.87/32))),
	((dst port 21897) || (dst port 24686) || (dst port 33887) || (dst port 43824) || (dst port 46190)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.26.123/32) || (dst net 120.0.60.182/32) || (dst net 120.0.152.194/32) || (dst net 120.0.230.130/32) || (dst net 120.0.234.11/32))),
	((dst port 4204) || (dst port 16788) || (dst port 24667) || (dst port 56346) || (dst port 60028)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.121.82/32) || (dst net 121.0.124.18/32) || (dst net 121.0.128.211/32) || (dst net 121.0.188.172/32) || (dst net 121.0.245.37/32))),
	((dst port 9240) || (dst port 39641) || (dst port 44200) || (dst port 61064) || (dst port 63441)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.10.14/32) || (dst net 122.0.29.150/32) || (dst net 122.0.76.33/32) || (dst net 122.0.87.230/32) || (dst net 122.0.154.117/32))),
	((dst port 6068) || (dst port 18958) || (dst port 23069) || (dst port 38257) || (dst port 62774)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.26.173/32) || (dst net 123.0.103.33/32) || (dst net 123.0.115.46/32) || (dst net 123.0.175.35/32) || (dst net 123.0.222.252/32))),
	((dst port 6458) || (dst port 11198) || (dst port 47467) || (dst port 52934) || (dst port 58632)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.129.3/32) || (dst net 124.0.158.176/32) || (dst net 124.0.162.148/32) || (dst net 124.0.247.89/32) || (dst net 124.0.254.231/32))),
	((dst port 2756) || (dst port 21388) || (dst port 27539) || (dst port 31719) || (dst port 63461)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.12.39/32) || (dst net 125.0.187.48/32) || (dst net 125.0.191.52/32) || (dst net 125.0.197.166/32) || (dst net 125.0.211.22/32))),
	((dst port 7077) || (dst port 13237) || (dst port 32514) || (dst port 33851) || (dst port 40548)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.33.113/32) || (dst net 126.0.130.247/32) || (dst net 126.0.167.9/32) || (dst net 126.0.242.0/32) || (dst net 126.0.253.245/32))),
	((dst port 4699) || (dst port 6588) || (dst port 18835) || (dst port 26844) || (dst port 45281)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.24.202/32) || (dst net 127.0.123.142/32) || (dst net 127.0.153.250/32) || (dst net 127.0.185.212/32) || (dst net 127.0.201.40/32))),
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
getIPClas64 :: CycleCountAccum;
getIPClas65 :: CycleCountAccum;
getIPClas66 :: CycleCountAccum;
getIPClas67 :: CycleCountAccum;
getIPClas68 :: CycleCountAccum;
getIPClas69 :: CycleCountAccum;
getIPClas70 :: CycleCountAccum;
getIPClas71 :: CycleCountAccum;
getIPClas72 :: CycleCountAccum;
getIPClas73 :: CycleCountAccum;
getIPClas74 :: CycleCountAccum;
getIPClas75 :: CycleCountAccum;
getIPClas76 :: CycleCountAccum;
getIPClas77 :: CycleCountAccum;
getIPClas78 :: CycleCountAccum;
getIPClas79 :: CycleCountAccum;
getIPClas80 :: CycleCountAccum;
getIPClas81 :: CycleCountAccum;
getIPClas82 :: CycleCountAccum;
getIPClas83 :: CycleCountAccum;
getIPClas84 :: CycleCountAccum;
getIPClas85 :: CycleCountAccum;
getIPClas86 :: CycleCountAccum;
getIPClas87 :: CycleCountAccum;
getIPClas88 :: CycleCountAccum;
getIPClas89 :: CycleCountAccum;
getIPClas90 :: CycleCountAccum;
getIPClas91 :: CycleCountAccum;
getIPClas92 :: CycleCountAccum;
getIPClas93 :: CycleCountAccum;
getIPClas94 :: CycleCountAccum;
getIPClas95 :: CycleCountAccum;
getIPClas96 :: CycleCountAccum;
getIPClas97 :: CycleCountAccum;
getIPClas98 :: CycleCountAccum;
getIPClas99 :: CycleCountAccum;
getIPClas100 :: CycleCountAccum;
getIPClas101 :: CycleCountAccum;
getIPClas102 :: CycleCountAccum;
getIPClas103 :: CycleCountAccum;
getIPClas104 :: CycleCountAccum;
getIPClas105 :: CycleCountAccum;
getIPClas106 :: CycleCountAccum;
getIPClas107 :: CycleCountAccum;
getIPClas108 :: CycleCountAccum;
getIPClas109 :: CycleCountAccum;
getIPClas110 :: CycleCountAccum;
getIPClas111 :: CycleCountAccum;
getIPClas112 :: CycleCountAccum;
getIPClas113 :: CycleCountAccum;
getIPClas114 :: CycleCountAccum;
getIPClas115 :: CycleCountAccum;
getIPClas116 :: CycleCountAccum;
getIPClas117 :: CycleCountAccum;
getIPClas118 :: CycleCountAccum;
getIPClas119 :: CycleCountAccum;
getIPClas120 :: CycleCountAccum;
getIPClas121 :: CycleCountAccum;
getIPClas122 :: CycleCountAccum;
getIPClas123 :: CycleCountAccum;
getIPClas124 :: CycleCountAccum;
getIPClas125 :: CycleCountAccum;
getIPClas126 :: CycleCountAccum;
getIPClas127 :: CycleCountAccum;

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
ipclassifier[64] -> getIPClas64 -> Discard ();
ipclassifier[65] -> getIPClas65 -> Discard ();
ipclassifier[66] -> getIPClas66 -> Discard ();
ipclassifier[67] -> getIPClas67 -> Discard ();
ipclassifier[68] -> getIPClas68 -> Discard ();
ipclassifier[69] -> getIPClas69 -> Discard ();
ipclassifier[70] -> getIPClas70 -> Discard ();
ipclassifier[71] -> getIPClas71 -> Discard ();
ipclassifier[72] -> getIPClas72 -> Discard ();
ipclassifier[73] -> getIPClas73 -> Discard ();
ipclassifier[74] -> getIPClas74 -> Discard ();
ipclassifier[75] -> getIPClas75 -> Discard ();
ipclassifier[76] -> getIPClas76 -> Discard ();
ipclassifier[77] -> getIPClas77 -> Discard ();
ipclassifier[78] -> getIPClas78 -> Discard ();
ipclassifier[79] -> getIPClas79 -> Discard ();
ipclassifier[80] -> getIPClas80 -> Discard ();
ipclassifier[81] -> getIPClas81 -> Discard ();
ipclassifier[82] -> getIPClas82 -> Discard ();
ipclassifier[83] -> getIPClas83 -> Discard ();
ipclassifier[84] -> getIPClas84 -> Discard ();
ipclassifier[85] -> getIPClas85 -> Discard ();
ipclassifier[86] -> getIPClas86 -> Discard ();
ipclassifier[87] -> getIPClas87 -> Discard ();
ipclassifier[88] -> getIPClas88 -> Discard ();
ipclassifier[89] -> getIPClas89 -> Discard ();
ipclassifier[90] -> getIPClas90 -> Discard ();
ipclassifier[91] -> getIPClas91 -> Discard ();
ipclassifier[92] -> getIPClas92 -> Discard ();
ipclassifier[93] -> getIPClas93 -> Discard ();
ipclassifier[94] -> getIPClas94 -> Discard ();
ipclassifier[95] -> getIPClas95 -> Discard ();
ipclassifier[96] -> getIPClas96 -> Discard ();
ipclassifier[97] -> getIPClas97 -> Discard ();
ipclassifier[98] -> getIPClas98 -> Discard ();
ipclassifier[99] -> getIPClas99 -> Discard ();
ipclassifier[100] -> getIPClas100 -> Discard ();
ipclassifier[101] -> getIPClas101 -> Discard ();
ipclassifier[102] -> getIPClas102 -> Discard ();
ipclassifier[103] -> getIPClas103 -> Discard ();
ipclassifier[104] -> getIPClas104 -> Discard ();
ipclassifier[105] -> getIPClas105 -> Discard ();
ipclassifier[106] -> getIPClas106 -> Discard ();
ipclassifier[107] -> getIPClas107 -> Discard ();
ipclassifier[108] -> getIPClas108 -> Discard ();
ipclassifier[109] -> getIPClas109 -> Discard ();
ipclassifier[110] -> getIPClas110 -> Discard ();
ipclassifier[111] -> getIPClas111 -> Discard ();
ipclassifier[112] -> getIPClas112 -> Discard ();
ipclassifier[113] -> getIPClas113 -> Discard ();
ipclassifier[114] -> getIPClas114 -> Discard ();
ipclassifier[115] -> getIPClas115 -> Discard ();
ipclassifier[116] -> getIPClas116 -> Discard ();
ipclassifier[117] -> getIPClas117 -> Discard ();
ipclassifier[118] -> getIPClas118 -> Discard ();
ipclassifier[119] -> getIPClas119 -> Discard ();
ipclassifier[120] -> getIPClas120 -> Discard ();
ipclassifier[121] -> getIPClas121 -> Discard ();
ipclassifier[122] -> getIPClas122 -> Discard ();
ipclassifier[123] -> getIPClas123 -> Discard ();
ipclassifier[124] -> getIPClas124 -> Discard ();
ipclassifier[125] -> getIPClas125 -> Discard ();
ipclassifier[126] -> getIPClas126 -> Discard ();
ipclassifier[127] -> getIPClas127 -> Discard ();
	
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
