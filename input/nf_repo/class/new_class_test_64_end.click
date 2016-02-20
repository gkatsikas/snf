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
	((dst port 16517) || (dst port 24900) || (dst port 26809) || (dst port 45888) || (dst port 55319)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.16.70/32) || (dst net 0.0.51.22/32) || (dst net 0.0.124.229/32) || (dst net 0.0.154.45/32) || (dst net 0.0.181.25/32))),
	((dst port 2700) || (dst port 31870) || (dst port 35970) || (dst port 36629) || (dst port 53354)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.44.195/32) || (dst net 1.0.60.109/32) || (dst net 1.0.196.36/32) || (dst net 1.0.230.142/32) || (dst net 1.0.236.133/32))),
	((dst port 2447) || (dst port 3837) || (dst port 26672) || (dst port 33470) || (dst port 47091)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.40.132/32) || (dst net 2.0.136.87/32) || (dst net 2.0.151.240/32) || (dst net 2.0.200.80/32) || (dst net 2.0.234.97/32))),
	((dst port 1253) || (dst port 15781) || (dst port 23698) || (dst port 25144) || (dst port 27439)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.2.209/32) || (dst net 3.0.15.5/32) || (dst net 3.0.17.136/32) || (dst net 3.0.28.41/32) || (dst net 3.0.250.38/32))),
	((dst port 14802) || (dst port 24224) || (dst port 34765) || (dst port 42314) || (dst port 58759)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.80.138/32) || (dst net 4.0.85.115/32) || (dst net 4.0.139.62/32) || (dst net 4.0.210.28/32) || (dst net 4.0.240.195/32))),
	((dst port 12008) || (dst port 12032) || (dst port 14831) || (dst port 27312) || (dst port 37209)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.11.238/32) || (dst net 5.0.39.56/32) || (dst net 5.0.56.187/32) || (dst net 5.0.155.157/32) || (dst net 5.0.233.220/32))),
	((dst port 30332) || (dst port 35347) || (dst port 42328) || (dst port 54488) || (dst port 63228)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.9.231/32) || (dst net 6.0.62.230/32) || (dst net 6.0.162.28/32) || (dst net 6.0.178.63/32) || (dst net 6.0.199.192/32))),
	((dst port 1756) || (dst port 32562) || (dst port 38798) || (dst port 41993) || (dst port 63161)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.85.188/32) || (dst net 7.0.146.11/32) || (dst net 7.0.186.194/32) || (dst net 7.0.232.149/32) || (dst net 7.0.247.16/32))),
	((dst port 480) || (dst port 19805) || (dst port 20857) || (dst port 28981) || (dst port 60811)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.74.75/32) || (dst net 8.0.99.35/32) || (dst net 8.0.127.92/32) || (dst net 8.0.141.199/32) || (dst net 8.0.191.195/32))),
	((dst port 22611) || (dst port 28779) || (dst port 29672) || (dst port 31033) || (dst port 56894)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.1.113/32) || (dst net 9.0.24.21/32) || (dst net 9.0.109.187/32) || (dst net 9.0.192.218/32) || (dst net 9.0.251.191/32))),
	((dst port 19331) || (dst port 32484) || (dst port 35353) || (dst port 36396) || (dst port 51283)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.5.24/32) || (dst net 10.0.80.32/32) || (dst net 10.0.104.78/32) || (dst net 10.0.141.80/32) || (dst net 10.0.172.74/32))),
	((dst port 949) || (dst port 7218) || (dst port 17960) || (dst port 38011) || (dst port 64750)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.38.246/32) || (dst net 11.0.85.128/32) || (dst net 11.0.95.193/32) || (dst net 11.0.221.18/32) || (dst net 11.0.221.199/32))),
	((dst port 11284) || (dst port 13631) || (dst port 49668) || (dst port 55665) || (dst port 64152)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.23.233/32) || (dst net 12.0.158.172/32) || (dst net 12.0.205.212/32) || (dst net 12.0.222.211/32) || (dst net 12.0.232.222/32))),
	((dst port 5855) || (dst port 20581) || (dst port 36004) || (dst port 36419) || (dst port 36421)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.59.39/32) || (dst net 13.0.88.181/32) || (dst net 13.0.170.30/32) || (dst net 13.0.197.195/32) || (dst net 13.0.254.216/32))),
	((dst port 6521) || (dst port 23769) || (dst port 24456) || (dst port 37702) || (dst port 49508)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.34.20/32) || (dst net 14.0.50.225/32) || (dst net 14.0.102.33/32) || (dst net 14.0.126.168/32) || (dst net 14.0.238.5/32))),
	((dst port 1640) || (dst port 43680) || (dst port 45849) || (dst port 47248) || (dst port 60561)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.28.36/32) || (dst net 15.0.113.110/32) || (dst net 15.0.141.133/32) || (dst net 15.0.174.58/32) || (dst net 15.0.236.199/32))),
	((dst port 485) || (dst port 7878) || (dst port 30243) || (dst port 33079) || (dst port 49177)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.33.223/32) || (dst net 16.0.66.62/32) || (dst net 16.0.200.226/32) || (dst net 16.0.202.69/32) || (dst net 16.0.219.205/32))),
	((dst port 12240) || (dst port 28331) || (dst port 51049) || (dst port 60803) || (dst port 61400)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.4.88/32) || (dst net 17.0.71.207/32) || (dst net 17.0.111.23/32) || (dst net 17.0.131.1/32) || (dst net 17.0.155.188/32))),
	((dst port 2517) || (dst port 26344) || (dst port 28218) || (dst port 33365) || (dst port 46389)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.18.153/32) || (dst net 18.0.20.146/32) || (dst net 18.0.126.140/32) || (dst net 18.0.160.65/32) || (dst net 18.0.241.239/32))),
	((dst port 4862) || (dst port 6290) || (dst port 11403) || (dst port 31609) || (dst port 57033)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.20.59/32) || (dst net 19.0.63.75/32) || (dst net 19.0.68.176/32) || (dst net 19.0.94.0/32) || (dst net 19.0.95.70/32))),
	((dst port 11138) || (dst port 12928) || (dst port 29761) || (dst port 37678) || (dst port 64747)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.49.197/32) || (dst net 20.0.66.173/32) || (dst net 20.0.99.155/32) || (dst net 20.0.156.107/32) || (dst net 20.0.244.127/32))),
	((dst port 14446) || (dst port 30461) || (dst port 42379) || (dst port 45354) || (dst port 63109)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.0.88/32) || (dst net 21.0.24.249/32) || (dst net 21.0.88.54/32) || (dst net 21.0.93.247/32) || (dst net 21.0.195.41/32))),
	((dst port 672) || (dst port 17350) || (dst port 30022) || (dst port 33591) || (dst port 37214)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.45.72/32) || (dst net 22.0.63.4/32) || (dst net 22.0.207.172/32) || (dst net 22.0.217.47/32) || (dst net 22.0.231.127/32))),
	((dst port 2210) || (dst port 4247) || (dst port 34563) || (dst port 41334) || (dst port 63951)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.13.140/32) || (dst net 23.0.95.23/32) || (dst net 23.0.114.77/32) || (dst net 23.0.230.64/32) || (dst net 23.0.233.237/32))),
	((dst port 1216) || (dst port 29896) || (dst port 55516) || (dst port 56249) || (dst port 56872)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.90.124/32) || (dst net 24.0.115.12/32) || (dst net 24.0.138.164/32) || (dst net 24.0.217.16/32) || (dst net 24.0.246.13/32))),
	((dst port 16844) || (dst port 39234) || (dst port 41916) || (dst port 43087) || (dst port 48765)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.1.177/32) || (dst net 25.0.2.20/32) || (dst net 25.0.26.204/32) || (dst net 25.0.90.122/32) || (dst net 25.0.160.123/32))),
	((dst port 7274) || (dst port 19368) || (dst port 57200) || (dst port 59183) || (dst port 63440)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.10.189/32) || (dst net 26.0.36.149/32) || (dst net 26.0.124.60/32) || (dst net 26.0.125.228/32) || (dst net 26.0.192.236/32))),
	((dst port 26924) || (dst port 46288) || (dst port 47946) || (dst port 53854) || (dst port 57184)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.35.93/32) || (dst net 27.0.115.77/32) || (dst net 27.0.146.94/32) || (dst net 27.0.184.10/32) || (dst net 27.0.198.113/32))),
	((dst port 17789) || (dst port 28948) || (dst port 48254) || (dst port 48467) || (dst port 62877)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.102.188/32) || (dst net 28.0.134.63/32) || (dst net 28.0.150.77/32) || (dst net 28.0.208.52/32) || (dst net 28.0.215.197/32))),
	((dst port 2383) || (dst port 7435) || (dst port 27004) || (dst port 44864) || (dst port 58342)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.105.220/32) || (dst net 29.0.108.238/32) || (dst net 29.0.175.201/32) || (dst net 29.0.189.201/32) || (dst net 29.0.216.52/32))),
	((dst port 1246) || (dst port 21295) || (dst port 27619) || (dst port 31602) || (dst port 40185)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.63.201/32) || (dst net 30.0.73.165/32) || (dst net 30.0.169.95/32) || (dst net 30.0.179.188/32) || (dst net 30.0.221.193/32))),
	((dst port 130) || (dst port 3283) || (dst port 21851) || (dst port 51821) || (dst port 56035)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.32.2/32) || (dst net 31.0.103.161/32) || (dst net 31.0.108.231/32) || (dst net 31.0.123.116/32) || (dst net 31.0.131.246/32))),
	((dst port 6510) || (dst port 23667) || (dst port 27973) || (dst port 31739) || (dst port 52272)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.102.121/32) || (dst net 32.0.109.173/32) || (dst net 32.0.142.149/32) || (dst net 32.0.155.253/32) || (dst net 32.0.210.112/32))),
	((dst port 15818) || (dst port 21436) || (dst port 24934) || (dst port 41688) || (dst port 61826)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.3.97/32) || (dst net 33.0.20.215/32) || (dst net 33.0.121.116/32) || (dst net 33.0.121.221/32) || (dst net 33.0.145.170/32))),
	((dst port 3426) || (dst port 52341) || (dst port 53430) || (dst port 56818) || (dst port 58046)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.15.69/32) || (dst net 34.0.49.154/32) || (dst net 34.0.111.3/32) || (dst net 34.0.151.139/32) || (dst net 34.0.156.113/32))),
	((dst port 5078) || (dst port 15172) || (dst port 20358) || (dst port 39896) || (dst port 50757)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.22.7/32) || (dst net 35.0.36.152/32) || (dst net 35.0.55.47/32) || (dst net 35.0.104.21/32) || (dst net 35.0.203.164/32))),
	((dst port 14487) || (dst port 14702) || (dst port 27313) || (dst port 32732) || (dst port 41631)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.141.242/32) || (dst net 36.0.144.16/32) || (dst net 36.0.194.192/32) || (dst net 36.0.226.208/32) || (dst net 36.0.248.118/32))),
	((dst port 3084) || (dst port 7794) || (dst port 50777) || (dst port 54257) || (dst port 62792)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.26.143/32) || (dst net 37.0.112.140/32) || (dst net 37.0.190.135/32) || (dst net 37.0.200.23/32) || (dst net 37.0.237.22/32))),
	((dst port 9579) || (dst port 17544) || (dst port 35353) || (dst port 37945) || (dst port 64117)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.19.102/32) || (dst net 38.0.31.38/32) || (dst net 38.0.45.79/32) || (dst net 38.0.143.195/32) || (dst net 38.0.208.233/32))),
	((dst port 8913) || (dst port 27128) || (dst port 33408) || (dst port 56972) || (dst port 62664)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.20.85/32) || (dst net 39.0.36.250/32) || (dst net 39.0.163.226/32) || (dst net 39.0.195.31/32) || (dst net 39.0.234.116/32))),
	((dst port 6116) || (dst port 17223) || (dst port 26992) || (dst port 50417) || (dst port 59687)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.38.147/32) || (dst net 40.0.141.232/32) || (dst net 40.0.199.149/32) || (dst net 40.0.204.129/32) || (dst net 40.0.244.60/32))),
	((dst port 19370) || (dst port 36050) || (dst port 40715) || (dst port 43570) || (dst port 64561)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.108.251/32) || (dst net 41.0.116.116/32) || (dst net 41.0.165.235/32) || (dst net 41.0.187.195/32) || (dst net 41.0.202.168/32))),
	((dst port 12151) || (dst port 13701) || (dst port 24249) || (dst port 43572) || (dst port 54062)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.2.75/32) || (dst net 42.0.60.162/32) || (dst net 42.0.152.239/32) || (dst net 42.0.175.52/32) || (dst net 42.0.191.213/32))),
	((dst port 8509) || (dst port 9226) || (dst port 13659) || (dst port 30494) || (dst port 50643)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.78.74/32) || (dst net 43.0.83.162/32) || (dst net 43.0.157.86/32) || (dst net 43.0.184.64/32) || (dst net 43.0.230.160/32))),
	((dst port 15351) || (dst port 44807) || (dst port 48833) || (dst port 51022) || (dst port 51690)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.70.234/32) || (dst net 44.0.201.191/32) || (dst net 44.0.209.245/32) || (dst net 44.0.218.208/32) || (dst net 44.0.223.10/32))),
	((dst port 27451) || (dst port 45673) || (dst port 53393) || (dst port 56641) || (dst port 59785)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.145.185/32) || (dst net 45.0.197.147/32) || (dst net 45.0.235.156/32) || (dst net 45.0.250.126/32) || (dst net 45.0.251.143/32))),
	((dst port 103) || (dst port 17545) || (dst port 33007) || (dst port 37081) || (dst port 51125)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.8.67/32) || (dst net 46.0.126.233/32) || (dst net 46.0.161.65/32) || (dst net 46.0.212.165/32) || (dst net 46.0.233.37/32))),
	((dst port 26990) || (dst port 32873) || (dst port 35561) || (dst port 43706) || (dst port 52963)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.16.52/32) || (dst net 47.0.73.215/32) || (dst net 47.0.134.164/32) || (dst net 47.0.161.55/32) || (dst net 47.0.207.56/32))),
	((dst port 28308) || (dst port 31322) || (dst port 34689) || (dst port 60601) || (dst port 62244)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.82.200/32) || (dst net 48.0.91.182/32) || (dst net 48.0.130.112/32) || (dst net 48.0.160.104/32) || (dst net 48.0.242.222/32))),
	((dst port 29634) || (dst port 44836) || (dst port 49791) || (dst port 51655) || (dst port 55494)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.12.87/32) || (dst net 49.0.32.167/32) || (dst net 49.0.34.100/32) || (dst net 49.0.69.192/32) || (dst net 49.0.182.175/32))),
	((dst port 5725) || (dst port 10710) || (dst port 37543) || (dst port 60235) || (dst port 65070)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.54.32/32) || (dst net 50.0.87.30/32) || (dst net 50.0.116.211/32) || (dst net 50.0.146.61/32) || (dst net 50.0.205.185/32))),
	((dst port 3276) || (dst port 26768) || (dst port 28559) || (dst port 41963) || (dst port 53304)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.53.93/32) || (dst net 51.0.87.120/32) || (dst net 51.0.99.153/32) || (dst net 51.0.112.48/32) || (dst net 51.0.166.114/32))),
	((dst port 12280) || (dst port 16209) || (dst port 22235) || (dst port 52200) || (dst port 54876)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.58.2/32) || (dst net 52.0.72.157/32) || (dst net 52.0.77.188/32) || (dst net 52.0.93.22/32) || (dst net 52.0.131.77/32))),
	((dst port 7249) || (dst port 10903) || (dst port 11933) || (dst port 17558) || (dst port 58205)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.21.99/32) || (dst net 53.0.98.141/32) || (dst net 53.0.116.202/32) || (dst net 53.0.137.1/32) || (dst net 53.0.252.78/32))),
	((dst port 10708) || (dst port 15694) || (dst port 48902) || (dst port 53133) || (dst port 53207)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.72.164/32) || (dst net 54.0.142.204/32) || (dst net 54.0.192.39/32) || (dst net 54.0.230.96/32) || (dst net 54.0.230.166/32))),
	((dst port 14339) || (dst port 22096) || (dst port 38069) || (dst port 38548) || (dst port 50159)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.30.69/32) || (dst net 55.0.110.130/32) || (dst net 55.0.189.124/32) || (dst net 55.0.212.215/32) || (dst net 55.0.237.228/32))),
	((dst port 11782) || (dst port 37320) || (dst port 45438) || (dst port 52519) || (dst port 65121)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.49.221/32) || (dst net 56.0.114.143/32) || (dst net 56.0.149.232/32) || (dst net 56.0.174.165/32) || (dst net 56.0.222.46/32))),
	((dst port 10212) || (dst port 21977) || (dst port 43545) || (dst port 52016) || (dst port 59999)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.69.220/32) || (dst net 57.0.108.255/32) || (dst net 57.0.112.99/32) || (dst net 57.0.113.144/32) || (dst net 57.0.119.19/32))),
	((dst port 8831) || (dst port 24873) || (dst port 25148) || (dst port 35572) || (dst port 60489)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.34.107/32) || (dst net 58.0.37.98/32) || (dst net 58.0.83.187/32) || (dst net 58.0.199.65/32) || (dst net 58.0.243.239/32))),
	((dst port 11171) || (dst port 12623) || (dst port 25316) || (dst port 56726) || (dst port 63292)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.40.142/32) || (dst net 59.0.141.180/32) || (dst net 59.0.186.226/32) || (dst net 59.0.221.192/32) || (dst net 59.0.252.101/32))),
	((dst port 17076) || (dst port 17942) || (dst port 18408) || (dst port 52187) || (dst port 59192)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.21.194/32) || (dst net 60.0.57.166/32) || (dst net 60.0.140.4/32) || (dst net 60.0.206.249/32) || (dst net 60.0.235.8/32))),
	((dst port 2293) || (dst port 14960) || (dst port 22221) || (dst port 34991) || (dst port 50611)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.11.218/32) || (dst net 61.0.56.73/32) || (dst net 61.0.74.206/32) || (dst net 61.0.98.203/32) || (dst net 61.0.238.163/32))),
	((dst port 13791) || (dst port 29307) || (dst port 39893) || (dst port 50687) || (dst port 59710)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.118.135/32) || (dst net 62.0.121.174/32) || (dst net 62.0.142.233/32) || (dst net 62.0.153.78/32) || (dst net 62.0.174.203/32))),
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
