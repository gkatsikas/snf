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
	((dst port 11738) || (dst port 14586) || (dst port 35582) || (dst port 37310) || (dst port 64493)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.24.172/32) || (dst net 1.0.43.33/32) || (dst net 1.0.85.43/32) || (dst net 1.0.127.228/32) || (dst net 1.0.236.61/32))),
	((dst port 9363) || (dst port 16818) || (dst port 23192) || (dst port 44262) || (dst port 56176)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.46.177/32) || (dst net 2.0.78.248/32) || (dst net 2.0.92.204/32) || (dst net 2.0.113.96/32) || (dst net 2.0.126.87/32))),
	((dst port 5461) || (dst port 15123) || (dst port 29579) || (dst port 37404) || (dst port 60831)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.30.233/32) || (dst net 3.0.80.97/32) || (dst net 3.0.88.161/32) || (dst net 3.0.168.29/32) || (dst net 3.0.216.139/32))),
	((dst port 22148) || (dst port 43324) || (dst port 44731) || (dst port 55916) || (dst port 55924)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.3.192/32) || (dst net 4.0.59.17/32) || (dst net 4.0.120.240/32) || (dst net 4.0.196.111/32) || (dst net 4.0.204.106/32))),
	((dst port 10095) || (dst port 44457) || (dst port 53117) || (dst port 55972) || (dst port 64138)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.37.69/32) || (dst net 5.0.124.68/32) || (dst net 5.0.164.46/32) || (dst net 5.0.175.77/32) || (dst net 5.0.202.86/32))),
	((dst port 16872) || (dst port 38222) || (dst port 43585) || (dst port 61328) || (dst port 63194)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.22.89/32) || (dst net 6.0.34.4/32) || (dst net 6.0.79.28/32) || (dst net 6.0.130.212/32) || (dst net 6.0.223.5/32))),
	((dst port 6665) || (dst port 11700) || (dst port 12291) || (dst port 22389) || (dst port 46310)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.25.247/32) || (dst net 7.0.35.69/32) || (dst net 7.0.165.61/32) || (dst net 7.0.170.141/32) || (dst net 7.0.210.60/32))),
	((dst port 13526) || (dst port 18211) || (dst port 24759) || (dst port 59833) || (dst port 64872)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.23.122/32) || (dst net 8.0.89.153/32) || (dst net 8.0.93.199/32) || (dst net 8.0.168.92/32) || (dst net 8.0.176.85/32))),
	((dst port 2584) || (dst port 9475) || (dst port 14337) || (dst port 16854) || (dst port 53357)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.108.88/32) || (dst net 9.0.146.174/32) || (dst net 9.0.181.8/32) || (dst net 9.0.234.155/32) || (dst net 9.0.254.51/32))),
	((dst port 19943) || (dst port 20972) || (dst port 25585) || (dst port 26400) || (dst port 35829)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.26.34/32) || (dst net 10.0.88.234/32) || (dst net 10.0.126.35/32) || (dst net 10.0.214.105/32) || (dst net 10.0.221.252/32))),
	((dst port 12697) || (dst port 60422) || (dst port 61244) || (dst port 61478) || (dst port 64309)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.77.224/32) || (dst net 11.0.85.232/32) || (dst net 11.0.99.218/32) || (dst net 11.0.140.53/32) || (dst net 11.0.205.253/32))),
	((dst port 5069) || (dst port 24930) || (dst port 27540) || (dst port 35377) || (dst port 36690)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.8.69/32) || (dst net 12.0.68.202/32) || (dst net 12.0.84.136/32) || (dst net 12.0.252.12/32) || (dst net 12.0.255.196/32))),
	((dst port 8525) || (dst port 22099) || (dst port 24719) || (dst port 26789) || (dst port 63726)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.41.203/32) || (dst net 13.0.109.80/32) || (dst net 13.0.164.148/32) || (dst net 13.0.164.151/32) || (dst net 13.0.246.92/32))),
	((dst port 10238) || (dst port 13970) || (dst port 47449) || (dst port 47747) || (dst port 47776)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.116.126/32) || (dst net 14.0.120.14/32) || (dst net 14.0.131.161/32) || (dst net 14.0.189.248/32) || (dst net 14.0.214.125/32))),
	((dst port 29654) || (dst port 37140) || (dst port 39499) || (dst port 43837) || (dst port 54805)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.131.178/32) || (dst net 15.0.164.160/32) || (dst net 15.0.224.207/32) || (dst net 15.0.237.231/32) || (dst net 15.0.253.226/32))),
	((dst port 4988) || (dst port 17102) || (dst port 31811) || (dst port 46282) || (dst port 58229)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.20.90/32) || (dst net 16.0.75.253/32) || (dst net 16.0.111.223/32) || (dst net 16.0.198.195/32) || (dst net 16.0.218.220/32))),
	((dst port 29293) || (dst port 31751) || (dst port 35194) || (dst port 35823) || (dst port 48994)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.50.84/32) || (dst net 17.0.73.58/32) || (dst net 17.0.96.28/32) || (dst net 17.0.184.26/32) || (dst net 17.0.247.240/32))),
	((dst port 2617) || (dst port 17491) || (dst port 20109) || (dst port 55450) || (dst port 59607)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.35.186/32) || (dst net 18.0.65.13/32) || (dst net 18.0.163.120/32) || (dst net 18.0.196.87/32) || (dst net 18.0.208.89/32))),
	((dst port 5255) || (dst port 5506) || (dst port 25805) || (dst port 54628) || (dst port 58324)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.0.186/32) || (dst net 19.0.82.97/32) || (dst net 19.0.109.31/32) || (dst net 19.0.134.63/32) || (dst net 19.0.196.173/32))),
	((dst port 5865) || (dst port 8521) || (dst port 54194) || (dst port 57450) || (dst port 64882)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.23.34/32) || (dst net 20.0.156.240/32) || (dst net 20.0.204.167/32) || (dst net 20.0.208.169/32) || (dst net 20.0.238.19/32))),
	((dst port 9540) || (dst port 16377) || (dst port 40385) || (dst port 52036) || (dst port 61584)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.68.6/32) || (dst net 21.0.108.165/32) || (dst net 21.0.152.194/32) || (dst net 21.0.165.38/32) || (dst net 21.0.225.43/32))),
	((dst port 39269) || (dst port 43216) || (dst port 48184) || (dst port 51287) || (dst port 55499)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.19.21/32) || (dst net 22.0.48.91/32) || (dst net 22.0.98.235/32) || (dst net 22.0.181.244/32) || (dst net 22.0.203.16/32))),
	((dst port 18781) || (dst port 22205) || (dst port 40699) || (dst port 44035) || (dst port 49555)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.102.169/32) || (dst net 23.0.127.198/32) || (dst net 23.0.147.168/32) || (dst net 23.0.174.192/32) || (dst net 23.0.214.154/32))),
	((dst port 16775) || (dst port 45728) || (dst port 52508) || (dst port 54246) || (dst port 58970)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.3.175/32) || (dst net 24.0.72.59/32) || (dst net 24.0.128.127/32) || (dst net 24.0.224.117/32) || (dst net 24.0.245.147/32))),
	((dst port 6) || (dst port 8565) || (dst port 31987) || (dst port 36464) || (dst port 45666)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.37.29/32) || (dst net 25.0.38.42/32) || (dst net 25.0.95.137/32) || (dst net 25.0.165.253/32) || (dst net 25.0.216.228/32))),
	((dst port 6068) || (dst port 14248) || (dst port 39352) || (dst port 49621) || (dst port 50337)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.25.129/32) || (dst net 26.0.57.82/32) || (dst net 26.0.123.6/32) || (dst net 26.0.192.201/32) || (dst net 26.0.255.247/32))),
	((dst port 16456) || (dst port 24161) || (dst port 33733) || (dst port 37354) || (dst port 61004)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.37.239/32) || (dst net 27.0.76.156/32) || (dst net 27.0.115.125/32) || (dst net 27.0.152.56/32) || (dst net 27.0.228.98/32))),
	((dst port 2728) || (dst port 19405) || (dst port 29631) || (dst port 37118) || (dst port 49216)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.33.236/32) || (dst net 28.0.42.24/32) || (dst net 28.0.82.182/32) || (dst net 28.0.129.140/32) || (dst net 28.0.240.199/32))),
	((dst port 9040) || (dst port 9237) || (dst port 43165) || (dst port 46493) || (dst port 57681)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.9.66/32) || (dst net 29.0.48.26/32) || (dst net 29.0.208.157/32) || (dst net 29.0.248.158/32) || (dst net 29.0.251.171/32))),
	((dst port 12768) || (dst port 14255) || (dst port 33933) || (dst port 42581) || (dst port 50790)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.90.210/32) || (dst net 30.0.101.255/32) || (dst net 30.0.104.22/32) || (dst net 30.0.151.1/32) || (dst net 30.0.154.254/32))),
	((dst port 4222) || (dst port 28898) || (dst port 49803) || (dst port 58004) || (dst port 61117)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.18.234/32) || (dst net 31.0.73.180/32) || (dst net 31.0.133.16/32) || (dst net 31.0.202.250/32) || (dst net 31.0.222.241/32))),
	((dst port 2365) || (dst port 2891) || (dst port 12439) || (dst port 39003) || (dst port 40351)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.42.180/32) || (dst net 32.0.45.242/32) || (dst net 32.0.129.164/32) || (dst net 32.0.143.177/32) || (dst net 32.0.152.211/32))),
	((dst port 3905) || (dst port 33722) || (dst port 43258) || (dst port 50610) || (dst port 62718)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.9.156/32) || (dst net 33.0.100.76/32) || (dst net 33.0.141.246/32) || (dst net 33.0.175.139/32) || (dst net 33.0.230.191/32))),
	((dst port 1618) || (dst port 4345) || (dst port 12560) || (dst port 19417) || (dst port 25207)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.24.253/32) || (dst net 34.0.84.232/32) || (dst net 34.0.133.179/32) || (dst net 34.0.141.68/32) || (dst net 34.0.249.156/32))),
	((dst port 2282) || (dst port 13176) || (dst port 27381) || (dst port 33426) || (dst port 60266)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.7.197/32) || (dst net 35.0.43.251/32) || (dst net 35.0.54.35/32) || (dst net 35.0.70.232/32) || (dst net 35.0.169.90/32))),
	((dst port 30785) || (dst port 49179) || (dst port 49966) || (dst port 54606) || (dst port 56504)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.51.170/32) || (dst net 36.0.94.153/32) || (dst net 36.0.143.244/32) || (dst net 36.0.156.205/32) || (dst net 36.0.245.230/32))),
	((dst port 5440) || (dst port 18809) || (dst port 33597) || (dst port 45707) || (dst port 46027)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.2.51/32) || (dst net 37.0.7.139/32) || (dst net 37.0.93.146/32) || (dst net 37.0.158.5/32) || (dst net 37.0.158.86/32))),
	((dst port 11953) || (dst port 15158) || (dst port 33492) || (dst port 44828) || (dst port 65441)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.2.48/32) || (dst net 38.0.3.248/32) || (dst net 38.0.144.67/32) || (dst net 38.0.159.79/32) || (dst net 38.0.186.10/32))),
	((dst port 18391) || (dst port 23503) || (dst port 27582) || (dst port 29210) || (dst port 36566)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.0.207/32) || (dst net 39.0.59.196/32) || (dst net 39.0.128.45/32) || (dst net 39.0.156.136/32) || (dst net 39.0.167.191/32))),
	((dst port 14685) || (dst port 56736) || (dst port 62741) || (dst port 63378) || (dst port 64896)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.2.224/32) || (dst net 40.0.3.35/32) || (dst net 40.0.216.216/32) || (dst net 40.0.250.211/32) || (dst net 40.0.252.31/32))),
	((dst port 8787) || (dst port 20202) || (dst port 37556) || (dst port 41218) || (dst port 52654)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.68.100/32) || (dst net 41.0.124.157/32) || (dst net 41.0.132.5/32) || (dst net 41.0.236.144/32) || (dst net 41.0.251.71/32))),
	((dst port 723) || (dst port 1097) || (dst port 32212) || (dst port 37859) || (dst port 44311)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.44.176/32) || (dst net 42.0.102.18/32) || (dst net 42.0.205.86/32) || (dst net 42.0.222.220/32) || (dst net 42.0.251.72/32))),
	((dst port 14474) || (dst port 14926) || (dst port 50432) || (dst port 62677) || (dst port 63686)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.99.177/32) || (dst net 43.0.115.238/32) || (dst net 43.0.199.216/32) || (dst net 43.0.252.30/32) || (dst net 43.0.255.228/32))),
	((dst port 1993) || (dst port 7320) || (dst port 26815) || (dst port 45902) || (dst port 63974)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.39.152/32) || (dst net 44.0.116.227/32) || (dst net 44.0.127.122/32) || (dst net 44.0.215.129/32) || (dst net 44.0.240.238/32))),
	((dst port 32788) || (dst port 40708) || (dst port 40829) || (dst port 46051) || (dst port 64546)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.17.116/32) || (dst net 45.0.139.248/32) || (dst net 45.0.188.150/32) || (dst net 45.0.226.182/32) || (dst net 45.0.242.232/32))),
	((dst port 11656) || (dst port 18656) || (dst port 23611) || (dst port 23930) || (dst port 55573)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.137.20/32) || (dst net 46.0.147.210/32) || (dst net 46.0.161.245/32) || (dst net 46.0.195.230/32) || (dst net 46.0.228.47/32))),
	((dst port 6251) || (dst port 13908) || (dst port 38685) || (dst port 45358) || (dst port 51892)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.67.147/32) || (dst net 47.0.114.118/32) || (dst net 47.0.120.119/32) || (dst net 47.0.127.77/32) || (dst net 47.0.138.239/32))),
	((dst port 16726) || (dst port 31655) || (dst port 44218) || (dst port 48243) || (dst port 58400)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.4.33/32) || (dst net 48.0.4.49/32) || (dst net 48.0.49.68/32) || (dst net 48.0.84.98/32) || (dst net 48.0.182.224/32))),
	((dst port 15622) || (dst port 15740) || (dst port 28515) || (dst port 38293) || (dst port 53119)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.0.178/32) || (dst net 49.0.141.86/32) || (dst net 49.0.149.139/32) || (dst net 49.0.223.210/32) || (dst net 49.0.228.129/32))),
	((dst port 21793) || (dst port 27479) || (dst port 52525) || (dst port 57367) || (dst port 58925)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.85.148/32) || (dst net 50.0.102.183/32) || (dst net 50.0.129.134/32) || (dst net 50.0.161.15/32) || (dst net 50.0.202.226/32))),
	((dst port 11676) || (dst port 13011) || (dst port 23149) || (dst port 51668) || (dst port 52626)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.53.132/32) || (dst net 51.0.71.66/32) || (dst net 51.0.136.116/32) || (dst net 51.0.190.215/32) || (dst net 51.0.238.145/32))),
	((dst port 4877) || (dst port 18368) || (dst port 39399) || (dst port 55279) || (dst port 61893)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.15.169/32) || (dst net 52.0.44.116/32) || (dst net 52.0.127.219/32) || (dst net 52.0.171.3/32) || (dst net 52.0.197.81/32))),
	((dst port 3223) || (dst port 9668) || (dst port 25568) || (dst port 42469) || (dst port 56074)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.30.214/32) || (dst net 53.0.87.245/32) || (dst net 53.0.125.238/32) || (dst net 53.0.145.213/32) || (dst net 53.0.165.16/32))),
	((dst port 3494) || (dst port 6795) || (dst port 9019) || (dst port 17961) || (dst port 61112)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.2.135/32) || (dst net 54.0.52.38/32) || (dst net 54.0.114.105/32) || (dst net 54.0.154.143/32) || (dst net 54.0.249.142/32))),
	((dst port 6818) || (dst port 36239) || (dst port 41325) || (dst port 48647) || (dst port 52210)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.3.249/32) || (dst net 55.0.114.236/32) || (dst net 55.0.120.77/32) || (dst net 55.0.150.108/32) || (dst net 55.0.224.236/32))),
	((dst port 1695) || (dst port 56627) || (dst port 57419) || (dst port 64141) || (dst port 64181)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.4.20/32) || (dst net 56.0.103.171/32) || (dst net 56.0.113.196/32) || (dst net 56.0.169.224/32) || (dst net 56.0.192.209/32))),
	((dst port 17873) || (dst port 38736) || (dst port 46251) || (dst port 53849) || (dst port 60473)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.73.82/32) || (dst net 57.0.141.121/32) || (dst net 57.0.198.212/32) || (dst net 57.0.211.201/32) || (dst net 57.0.221.85/32))),
	((dst port 3457) || (dst port 7559) || (dst port 11433) || (dst port 33171) || (dst port 44442)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.57.6/32) || (dst net 58.0.123.186/32) || (dst net 58.0.180.172/32) || (dst net 58.0.184.154/32) || (dst net 58.0.198.27/32))),
	((dst port 37) || (dst port 11739) || (dst port 24550) || (dst port 29015) || (dst port 44797)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.85.48/32) || (dst net 59.0.140.127/32) || (dst net 59.0.160.107/32) || (dst net 59.0.170.225/32) || (dst net 59.0.188.19/32))),
	((dst port 6480) || (dst port 38436) || (dst port 47564) || (dst port 51209) || (dst port 52397)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.29.143/32) || (dst net 60.0.83.78/32) || (dst net 60.0.153.71/32) || (dst net 60.0.197.148/32) || (dst net 60.0.249.65/32))),
	((dst port 8514) || (dst port 29118) || (dst port 41492) || (dst port 42666) || (dst port 47597)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.114.198/32) || (dst net 61.0.222.2/32) || (dst net 61.0.238.49/32) || (dst net 61.0.239.32/32) || (dst net 61.0.239.94/32))),
	((dst port 2572) || (dst port 20824) || (dst port 21121) || (dst port 22298) || (dst port 38386)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.80.254/32) || (dst net 62.0.90.106/32) || (dst net 62.0.202.159/32) || (dst net 62.0.222.106/32) || (dst net 62.0.232.179/32))),
	((dst port 4976) || (dst port 14745) || (dst port 35320) || (dst port 38862) || (dst port 53953)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.43.100/32) || (dst net 63.0.43.229/32) || (dst net 63.0.167.41/32) || (dst net 63.0.171.44/32) || (dst net 63.0.229.36/32))),
	((dst port 5673) || (dst port 23311) || (dst port 39448) || (dst port 60471) || (dst port 62329)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.28.52/32) || (dst net 64.0.41.68/32) || (dst net 64.0.83.148/32) || (dst net 64.0.151.100/32) || (dst net 64.0.243.199/32))),
	((dst port 14) || (dst port 10458) || (dst port 35871) || (dst port 42765) || (dst port 64322)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.3.13/32) || (dst net 65.0.31.48/32) || (dst net 65.0.34.70/32) || (dst net 65.0.136.97/32) || (dst net 65.0.177.108/32))),
	((dst port 13315) || (dst port 28559) || (dst port 35598) || (dst port 58037) || (dst port 59994)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.46.149/32) || (dst net 66.0.86.177/32) || (dst net 66.0.96.93/32) || (dst net 66.0.114.170/32) || (dst net 66.0.136.194/32))),
	((dst port 319) || (dst port 2250) || (dst port 2838) || (dst port 5096) || (dst port 36081)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.84.204/32) || (dst net 67.0.170.108/32) || (dst net 67.0.182.117/32) || (dst net 67.0.187.164/32) || (dst net 67.0.246.34/32))),
	((dst port 5918) || (dst port 15456) || (dst port 49961) || (dst port 50879) || (dst port 55423)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.93.49/32) || (dst net 68.0.141.132/32) || (dst net 68.0.165.140/32) || (dst net 68.0.180.1/32) || (dst net 68.0.253.137/32))),
	((dst port 3916) || (dst port 6309) || (dst port 12037) || (dst port 18899) || (dst port 47082)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.120.162/32) || (dst net 69.0.127.171/32) || (dst net 69.0.153.180/32) || (dst net 69.0.191.136/32) || (dst net 69.0.227.156/32))),
	((dst port 3070) || (dst port 24714) || (dst port 29975) || (dst port 33018) || (dst port 42642)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.28.222/32) || (dst net 70.0.39.158/32) || (dst net 70.0.53.249/32) || (dst net 70.0.71.48/32) || (dst net 70.0.101.123/32))),
	((dst port 8481) || (dst port 25839) || (dst port 51395) || (dst port 53537) || (dst port 64199)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.62.145/32) || (dst net 71.0.135.95/32) || (dst net 71.0.153.43/32) || (dst net 71.0.183.115/32) || (dst net 71.0.236.58/32))),
	((dst port 26110) || (dst port 39579) || (dst port 51407) || (dst port 63432) || (dst port 65427)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.101.195/32) || (dst net 72.0.147.179/32) || (dst net 72.0.173.219/32) || (dst net 72.0.237.88/32) || (dst net 72.0.241.104/32))),
	((dst port 1491) || (dst port 24979) || (dst port 25737) || (dst port 34035) || (dst port 43261)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.2.59/32) || (dst net 73.0.148.158/32) || (dst net 73.0.241.231/32) || (dst net 73.0.253.91/32) || (dst net 73.0.254.177/32))),
	((dst port 6411) || (dst port 7666) || (dst port 11356) || (dst port 27014) || (dst port 65164)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.9.50/32) || (dst net 74.0.85.211/32) || (dst net 74.0.101.28/32) || (dst net 74.0.118.162/32) || (dst net 74.0.224.200/32))),
	((dst port 361) || (dst port 10761) || (dst port 19247) || (dst port 40383) || (dst port 56685)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.53.206/32) || (dst net 75.0.88.50/32) || (dst net 75.0.114.130/32) || (dst net 75.0.166.63/32) || (dst net 75.0.200.164/32))),
	((dst port 2964) || (dst port 4170) || (dst port 12256) || (dst port 39523) || (dst port 44410)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.3.123/32) || (dst net 76.0.14.17/32) || (dst net 76.0.127.153/32) || (dst net 76.0.139.14/32) || (dst net 76.0.211.125/32))),
	((dst port 12466) || (dst port 18553) || (dst port 54144) || (dst port 57765) || (dst port 59100)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.71.238/32) || (dst net 77.0.132.222/32) || (dst net 77.0.158.159/32) || (dst net 77.0.170.54/32) || (dst net 77.0.221.29/32))),
	((dst port 11830) || (dst port 26022) || (dst port 28282) || (dst port 50527) || (dst port 65148)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.2.65/32) || (dst net 78.0.14.178/32) || (dst net 78.0.105.183/32) || (dst net 78.0.235.6/32) || (dst net 78.0.246.249/32))),
	((dst port 11685) || (dst port 21487) || (dst port 31305) || (dst port 42487) || (dst port 50986)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.16.0/32) || (dst net 79.0.36.18/32) || (dst net 79.0.45.209/32) || (dst net 79.0.141.118/32) || (dst net 79.0.221.44/32))),
	((dst port 4788) || (dst port 12557) || (dst port 16896) || (dst port 25259) || (dst port 51520)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.142.60/32) || (dst net 80.0.184.86/32) || (dst net 80.0.189.209/32) || (dst net 80.0.199.231/32) || (dst net 80.0.244.104/32))),
	((dst port 7428) || (dst port 23970) || (dst port 49627) || (dst port 53529) || (dst port 62581)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.14.196/32) || (dst net 81.0.101.243/32) || (dst net 81.0.132.36/32) || (dst net 81.0.139.187/32) || (dst net 81.0.226.204/32))),
	((dst port 4220) || (dst port 10674) || (dst port 19027) || (dst port 29652) || (dst port 36191)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.30.66/32) || (dst net 82.0.106.80/32) || (dst net 82.0.149.107/32) || (dst net 82.0.162.254/32) || (dst net 82.0.165.202/32))),
	((dst port 5784) || (dst port 13303) || (dst port 29573) || (dst port 34095) || (dst port 44551)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.0.114/32) || (dst net 83.0.20.227/32) || (dst net 83.0.67.110/32) || (dst net 83.0.106.90/32) || (dst net 83.0.219.255/32))),
	((dst port 15970) || (dst port 23340) || (dst port 38215) || (dst port 40257) || (dst port 55182)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.10.33/32) || (dst net 84.0.53.74/32) || (dst net 84.0.143.85/32) || (dst net 84.0.155.123/32) || (dst net 84.0.183.72/32))),
	((dst port 2237) || (dst port 41696) || (dst port 46091) || (dst port 56111) || (dst port 63680)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.39.48/32) || (dst net 85.0.98.54/32) || (dst net 85.0.158.206/32) || (dst net 85.0.172.129/32) || (dst net 85.0.226.5/32))),
	((dst port 13138) || (dst port 18492) || (dst port 22869) || (dst port 28638) || (dst port 46845)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.38.46/32) || (dst net 86.0.113.156/32) || (dst net 86.0.153.217/32) || (dst net 86.0.158.17/32) || (dst net 86.0.182.249/32))),
	((dst port 11684) || (dst port 22839) || (dst port 34221) || (dst port 55221) || (dst port 56806)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.71.154/32) || (dst net 87.0.82.205/32) || (dst net 87.0.106.66/32) || (dst net 87.0.232.208/32) || (dst net 87.0.249.71/32))),
	((dst port 10335) || (dst port 24414) || (dst port 26361) || (dst port 32707) || (dst port 64103)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.38.38/32) || (dst net 88.0.87.230/32) || (dst net 88.0.152.146/32) || (dst net 88.0.184.65/32) || (dst net 88.0.209.20/32))),
	((dst port 3542) || (dst port 10564) || (dst port 13910) || (dst port 29246) || (dst port 33439)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.88.223/32) || (dst net 89.0.89.98/32) || (dst net 89.0.133.106/32) || (dst net 89.0.191.207/32) || (dst net 89.0.233.248/32))),
	((dst port 14795) || (dst port 16399) || (dst port 19170) || (dst port 23171) || (dst port 46135)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.13.36/32) || (dst net 90.0.74.45/32) || (dst net 90.0.152.161/32) || (dst net 90.0.190.249/32) || (dst net 90.0.206.93/32))),
	((dst port 27096) || (dst port 35935) || (dst port 44982) || (dst port 53232) || (dst port 58880)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.84.7/32) || (dst net 91.0.84.157/32) || (dst net 91.0.142.60/32) || (dst net 91.0.231.88/32) || (dst net 91.0.252.196/32))),
	((dst port 7114) || (dst port 7145) || (dst port 16374) || (dst port 32124) || (dst port 49149)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.2.83/32) || (dst net 92.0.111.236/32) || (dst net 92.0.157.143/32) || (dst net 92.0.168.96/32) || (dst net 92.0.244.178/32))),
	((dst port 1516) || (dst port 15583) || (dst port 20125) || (dst port 27371) || (dst port 55295)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.3.254/32) || (dst net 93.0.43.233/32) || (dst net 93.0.113.120/32) || (dst net 93.0.126.117/32) || (dst net 93.0.193.45/32))),
	((dst port 867) || (dst port 16149) || (dst port 23626) || (dst port 33466) || (dst port 54598)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.17.97/32) || (dst net 94.0.36.9/32) || (dst net 94.0.54.195/32) || (dst net 94.0.227.149/32) || (dst net 94.0.249.74/32))),
	((dst port 18282) || (dst port 39685) || (dst port 48194) || (dst port 54073) || (dst port 58494)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.18.17/32) || (dst net 95.0.23.22/32) || (dst net 95.0.149.65/32) || (dst net 95.0.193.251/32) || (dst net 95.0.207.27/32))),
	((dst port 13726) || (dst port 22802) || (dst port 41206) || (dst port 46245) || (dst port 61207)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.52.38/32) || (dst net 96.0.79.180/32) || (dst net 96.0.92.148/32) || (dst net 96.0.152.126/32) || (dst net 96.0.161.170/32))),
	((dst port 2120) || (dst port 20849) || (dst port 49902) || (dst port 56042) || (dst port 58409)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.1.205/32) || (dst net 97.0.18.235/32) || (dst net 97.0.88.184/32) || (dst net 97.0.166.152/32) || (dst net 97.0.252.29/32))),
	((dst port 7996) || (dst port 35242) || (dst port 48733) || (dst port 57645) || (dst port 61684)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.0.243/32) || (dst net 98.0.92.86/32) || (dst net 98.0.92.201/32) || (dst net 98.0.149.245/32) || (dst net 98.0.215.127/32))),
	((dst port 3223) || (dst port 4340) || (dst port 7602) || (dst port 33624) || (dst port 63994)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.32.83/32) || (dst net 99.0.71.73/32) || (dst net 99.0.140.69/32) || (dst net 99.0.221.48/32) || (dst net 99.0.242.209/32))),
	((dst port 42679) || (dst port 51564) || (dst port 52941) || (dst port 53058) || (dst port 63236)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.93.16/32) || (dst net 100.0.94.22/32) || (dst net 100.0.117.102/32) || (dst net 100.0.154.223/32) || (dst net 100.0.155.224/32))),
	((dst port 17603) || (dst port 24291) || (dst port 25406) || (dst port 38369) || (dst port 63503)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.58.2/32) || (dst net 101.0.62.62/32) || (dst net 101.0.71.135/32) || (dst net 101.0.160.147/32) || (dst net 101.0.217.195/32))),
	((dst port 4505) || (dst port 24382) || (dst port 29335) || (dst port 60501) || (dst port 60866)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.94.216/32) || (dst net 102.0.146.13/32) || (dst net 102.0.172.151/32) || (dst net 102.0.196.91/32) || (dst net 102.0.219.237/32))),
	((dst port 810) || (dst port 6131) || (dst port 32781) || (dst port 39685) || (dst port 44410)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.95.226/32) || (dst net 103.0.106.248/32) || (dst net 103.0.180.13/32) || (dst net 103.0.182.223/32) || (dst net 103.0.223.182/32))),
	((dst port 3221) || (dst port 7696) || (dst port 11223) || (dst port 15610) || (dst port 18109)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.10.223/32) || (dst net 104.0.73.255/32) || (dst net 104.0.133.116/32) || (dst net 104.0.186.115/32) || (dst net 104.0.227.244/32))),
	((dst port 3364) || (dst port 5280) || (dst port 5939) || (dst port 36240) || (dst port 45493)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.57.81/32) || (dst net 105.0.132.192/32) || (dst net 105.0.164.55/32) || (dst net 105.0.206.84/32) || (dst net 105.0.216.235/32))),
	((dst port 29556) || (dst port 39510) || (dst port 50953) || (dst port 58221) || (dst port 64252)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.17.174/32) || (dst net 106.0.71.45/32) || (dst net 106.0.184.37/32) || (dst net 106.0.188.49/32) || (dst net 106.0.195.89/32))),
	((dst port 1861) || (dst port 2008) || (dst port 23835) || (dst port 41176) || (dst port 41817)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.2.253/32) || (dst net 107.0.50.117/32) || (dst net 107.0.62.243/32) || (dst net 107.0.99.248/32) || (dst net 107.0.224.49/32))),
	((dst port 1768) || (dst port 12574) || (dst port 31403) || (dst port 47939) || (dst port 48905)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.30.22/32) || (dst net 108.0.42.244/32) || (dst net 108.0.139.239/32) || (dst net 108.0.202.155/32) || (dst net 108.0.230.63/32))),
	((dst port 5391) || (dst port 17280) || (dst port 32192) || (dst port 40390) || (dst port 40626)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.21.197/32) || (dst net 109.0.87.230/32) || (dst net 109.0.130.109/32) || (dst net 109.0.171.182/32) || (dst net 109.0.182.144/32))),
	((dst port 3435) || (dst port 22423) || (dst port 36074) || (dst port 55143) || (dst port 60530)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.47.74/32) || (dst net 110.0.122.34/32) || (dst net 110.0.142.90/32) || (dst net 110.0.143.179/32) || (dst net 110.0.163.95/32))),
	((dst port 16670) || (dst port 26937) || (dst port 56063) || (dst port 60542) || (dst port 64416)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.72.99/32) || (dst net 111.0.117.158/32) || (dst net 111.0.171.22/32) || (dst net 111.0.174.196/32) || (dst net 111.0.227.47/32))),
	((dst port 14269) || (dst port 15772) || (dst port 58323) || (dst port 63464) || (dst port 64239)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.12.108/32) || (dst net 112.0.41.93/32) || (dst net 112.0.131.224/32) || (dst net 112.0.182.57/32) || (dst net 112.0.204.240/32))),
	((dst port 4452) || (dst port 16795) || (dst port 44057) || (dst port 46174) || (dst port 51093)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.120.220/32) || (dst net 113.0.123.131/32) || (dst net 113.0.151.150/32) || (dst net 113.0.151.154/32) || (dst net 113.0.222.47/32))),
	((dst port 10043) || (dst port 29749) || (dst port 43458) || (dst port 47973) || (dst port 56996)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.73.23/32) || (dst net 114.0.88.218/32) || (dst net 114.0.118.59/32) || (dst net 114.0.119.1/32) || (dst net 114.0.253.127/32))),
	((dst port 2595) || (dst port 8220) || (dst port 37882) || (dst port 40657) || (dst port 53655)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.64.21/32) || (dst net 115.0.157.87/32) || (dst net 115.0.159.80/32) || (dst net 115.0.177.107/32) || (dst net 115.0.249.242/32))),
	((dst port 5601) || (dst port 19087) || (dst port 47434) || (dst port 48843) || (dst port 55325)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.71.99/32) || (dst net 116.0.119.124/32) || (dst net 116.0.183.177/32) || (dst net 116.0.227.51/32) || (dst net 116.0.230.152/32))),
	((dst port 11124) || (dst port 16239) || (dst port 54558) || (dst port 54634) || (dst port 62758)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.98.100/32) || (dst net 117.0.131.197/32) || (dst net 117.0.154.221/32) || (dst net 117.0.162.187/32) || (dst net 117.0.206.22/32))),
	((dst port 3351) || (dst port 31800) || (dst port 44905) || (dst port 63409) || (dst port 64301)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.5.179/32) || (dst net 118.0.24.13/32) || (dst net 118.0.42.208/32) || (dst net 118.0.122.143/32) || (dst net 118.0.130.58/32))),
	((dst port 11237) || (dst port 11349) || (dst port 22496) || (dst port 50120) || (dst port 58134)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.22.54/32) || (dst net 119.0.41.19/32) || (dst net 119.0.56.12/32) || (dst net 119.0.162.159/32) || (dst net 119.0.186.46/32))),
	((dst port 17449) || (dst port 46426) || (dst port 55830) || (dst port 56533) || (dst port 57829)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.81.118/32) || (dst net 120.0.122.2/32) || (dst net 120.0.202.183/32) || (dst net 120.0.252.167/32) || (dst net 120.0.253.82/32))),
	((dst port 4581) || (dst port 8705) || (dst port 39882) || (dst port 50459) || (dst port 54505)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.73.212/32) || (dst net 121.0.119.14/32) || (dst net 121.0.131.191/32) || (dst net 121.0.172.127/32) || (dst net 121.0.250.226/32))),
	((dst port 18430) || (dst port 19502) || (dst port 28416) || (dst port 40520) || (dst port 51291)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.140.241/32) || (dst net 122.0.173.222/32) || (dst net 122.0.182.235/32) || (dst net 122.0.217.150/32) || (dst net 122.0.229.69/32))),
	((dst port 40561) || (dst port 48928) || (dst port 55862) || (dst port 56303) || (dst port 64607)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.22.177/32) || (dst net 123.0.67.169/32) || (dst net 123.0.114.11/32) || (dst net 123.0.225.232/32) || (dst net 123.0.243.173/32))),
	((dst port 24998) || (dst port 30319) || (dst port 42287) || (dst port 58698) || (dst port 63676)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.50.198/32) || (dst net 124.0.55.240/32) || (dst net 124.0.92.95/32) || (dst net 124.0.136.4/32) || (dst net 124.0.166.246/32))),
	((dst port 21691) || (dst port 25741) || (dst port 35973) || (dst port 36726) || (dst port 49357)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.24.148/32) || (dst net 125.0.107.161/32) || (dst net 125.0.116.211/32) || (dst net 125.0.153.93/32) || (dst net 125.0.170.39/32))),
	((dst port 17644) || (dst port 34077) || (dst port 42645) || (dst port 45641) || (dst port 64624)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.44.199/32) || (dst net 126.0.125.130/32) || (dst net 126.0.183.154/32) || (dst net 126.0.187.210/32) || (dst net 126.0.201.195/32))),
	((dst port 4530) || (dst port 14226) || (dst port 21884) || (dst port 24289) || (dst port 47952)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.10.128/32) || (dst net 127.0.119.95/32) || (dst net 127.0.252.224/32) || (dst net 127.0.253.107/32) || (dst net 127.0.255.215/32))),
	((dst port 9214) || (dst port 39130) || (dst port 58229) || (dst port 60178) || (dst port 62469)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.30.22/32) || (dst net 128.0.45.21/32) || (dst net 128.0.47.207/32) || (dst net 128.0.178.149/32) || (dst net 128.0.216.212/32))),
	((dst port 13773) || (dst port 17835) || (dst port 39465) || (dst port 58636) || (dst port 63259)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.56.155/32) || (dst net 129.0.107.98/32) || (dst net 129.0.129.202/32) || (dst net 129.0.173.202/32) || (dst net 129.0.222.3/32))),
	((dst port 2356) || (dst port 9842) || (dst port 28153) || (dst port 34163) || (dst port 34352)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.13.175/32) || (dst net 130.0.19.154/32) || (dst net 130.0.131.59/32) || (dst net 130.0.209.117/32) || (dst net 130.0.223.205/32))),
	((dst port 13502) || (dst port 37671) || (dst port 43030) || (dst port 61938) || (dst port 65173)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.6.193/32) || (dst net 131.0.87.135/32) || (dst net 131.0.105.93/32) || (dst net 131.0.160.151/32) || (dst net 131.0.253.8/32))),
	((dst port 1336) || (dst port 11994) || (dst port 26726) || (dst port 55587) || (dst port 63015)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.13.20/32) || (dst net 132.0.117.19/32) || (dst net 132.0.164.163/32) || (dst net 132.0.209.202/32) || (dst net 132.0.244.213/32))),
	((dst port 15151) || (dst port 37334) || (dst port 43102) || (dst port 49370) || (dst port 62249)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.55.178/32) || (dst net 133.0.57.35/32) || (dst net 133.0.160.116/32) || (dst net 133.0.215.163/32) || (dst net 133.0.243.213/32))),
	((dst port 15163) || (dst port 21627) || (dst port 21851) || (dst port 37962) || (dst port 52136)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.109.129/32) || (dst net 134.0.211.49/32) || (dst net 134.0.215.31/32) || (dst net 134.0.225.114/32) || (dst net 134.0.254.100/32))),
	((dst port 1015) || (dst port 1910) || (dst port 24753) || (dst port 52318) || (dst port 54143)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.51.92/32) || (dst net 135.0.60.98/32) || (dst net 135.0.76.241/32) || (dst net 135.0.165.93/32) || (dst net 135.0.254.66/32))),
	((dst port 20487) || (dst port 31242) || (dst port 37192) || (dst port 60981) || (dst port 64537)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.28.207/32) || (dst net 136.0.81.19/32) || (dst net 136.0.81.93/32) || (dst net 136.0.155.84/32) || (dst net 136.0.177.132/32))),
	((dst port 8911) || (dst port 10087) || (dst port 22804) || (dst port 29492) || (dst port 56090)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.33.196/32) || (dst net 137.0.150.2/32) || (dst net 137.0.184.24/32) || (dst net 137.0.223.193/32) || (dst net 137.0.242.44/32))),
	((dst port 2091) || (dst port 13259) || (dst port 15992) || (dst port 24340) || (dst port 48463)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.4.134/32) || (dst net 138.0.32.173/32) || (dst net 138.0.37.167/32) || (dst net 138.0.60.14/32) || (dst net 138.0.184.136/32))),
	((dst port 3798) || (dst port 6391) || (dst port 6674) || (dst port 11640) || (dst port 50252)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.74.49/32) || (dst net 139.0.92.158/32) || (dst net 139.0.102.141/32) || (dst net 139.0.129.219/32) || (dst net 139.0.182.124/32))),
	((dst port 11045) || (dst port 14952) || (dst port 27875) || (dst port 36682) || (dst port 45624)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.45.12/32) || (dst net 140.0.137.112/32) || (dst net 140.0.209.132/32) || (dst net 140.0.232.81/32) || (dst net 140.0.248.158/32))),
	((dst port 17795) || (dst port 27200) || (dst port 38232) || (dst port 45940) || (dst port 46827)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.40.67/32) || (dst net 141.0.159.118/32) || (dst net 141.0.181.214/32) || (dst net 141.0.216.68/32) || (dst net 141.0.216.191/32))),
	((dst port 3534) || (dst port 4837) || (dst port 11445) || (dst port 12124) || (dst port 39283)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.120.49/32) || (dst net 142.0.169.194/32) || (dst net 142.0.182.187/32) || (dst net 142.0.193.126/32) || (dst net 142.0.225.44/32))),
	((dst port 3907) || (dst port 16713) || (dst port 25131) || (dst port 45726) || (dst port 57237)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.27.176/32) || (dst net 143.0.64.156/32) || (dst net 143.0.134.143/32) || (dst net 143.0.203.101/32) || (dst net 143.0.212.180/32))),
	((dst port 13551) || (dst port 16256) || (dst port 30753) || (dst port 38289) || (dst port 59649)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.6.195/32) || (dst net 144.0.15.189/32) || (dst net 144.0.95.18/32) || (dst net 144.0.108.20/32) || (dst net 144.0.109.119/32))),
	((dst port 1099) || (dst port 23318) || (dst port 28615) || (dst port 32000) || (dst port 57510)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.55.43/32) || (dst net 145.0.153.227/32) || (dst net 145.0.207.179/32) || (dst net 145.0.226.71/32) || (dst net 145.0.236.77/32))),
	((dst port 5745) || (dst port 13266) || (dst port 17189) || (dst port 33574) || (dst port 65293)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.34.151/32) || (dst net 146.0.69.228/32) || (dst net 146.0.83.168/32) || (dst net 146.0.103.191/32) || (dst net 146.0.246.118/32))),
	((dst port 11186) || (dst port 20264) || (dst port 45476) || (dst port 47783) || (dst port 61354)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.104.144/32) || (dst net 147.0.145.107/32) || (dst net 147.0.198.237/32) || (dst net 147.0.212.169/32) || (dst net 147.0.240.53/32))),
	((dst port 18439) || (dst port 38018) || (dst port 38937) || (dst port 46316) || (dst port 52545)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.20.236/32) || (dst net 148.0.49.183/32) || (dst net 148.0.115.120/32) || (dst net 148.0.168.27/32) || (dst net 148.0.209.239/32))),
	((dst port 2343) || (dst port 24033) || (dst port 26713) || (dst port 32502) || (dst port 56028)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.38.238/32) || (dst net 149.0.134.15/32) || (dst net 149.0.152.33/32) || (dst net 149.0.207.137/32) || (dst net 149.0.238.38/32))),
	((dst port 16645) || (dst port 20235) || (dst port 45706) || (dst port 50327) || (dst port 57909)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.10.154/32) || (dst net 150.0.43.228/32) || (dst net 150.0.142.12/32) || (dst net 150.0.171.154/32) || (dst net 150.0.171.243/32))),
	((dst port 5089) || (dst port 8173) || (dst port 10510) || (dst port 20571) || (dst port 40546)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.68.217/32) || (dst net 151.0.83.25/32) || (dst net 151.0.115.212/32) || (dst net 151.0.132.59/32) || (dst net 151.0.227.167/32))),
	((dst port 818) || (dst port 7453) || (dst port 11012) || (dst port 33987) || (dst port 65374)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.45.80/32) || (dst net 152.0.197.139/32) || (dst net 152.0.200.144/32) || (dst net 152.0.234.230/32) || (dst net 152.0.249.50/32))),
	((dst port 5789) || (dst port 14566) || (dst port 33286) || (dst port 46823) || (dst port 50320)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.45.187/32) || (dst net 153.0.90.118/32) || (dst net 153.0.141.231/32) || (dst net 153.0.229.119/32) || (dst net 153.0.253.91/32))),
	((dst port 3845) || (dst port 18907) || (dst port 45638) || (dst port 49913) || (dst port 63115)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.24.31/32) || (dst net 154.0.26.173/32) || (dst net 154.0.123.198/32) || (dst net 154.0.126.156/32) || (dst net 154.0.209.78/32))),
	((dst port 4016) || (dst port 19333) || (dst port 20236) || (dst port 40905) || (dst port 64626)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.69.107/32) || (dst net 155.0.84.162/32) || (dst net 155.0.185.210/32) || (dst net 155.0.193.207/32) || (dst net 155.0.198.167/32))),
	((dst port 25155) || (dst port 30118) || (dst port 46362) || (dst port 54963) || (dst port 64833)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.16.9/32) || (dst net 156.0.46.186/32) || (dst net 156.0.181.218/32) || (dst net 156.0.185.26/32) || (dst net 156.0.201.159/32))),
	((dst port 11272) || (dst port 22791) || (dst port 42310) || (dst port 51111) || (dst port 59326)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.4.231/32) || (dst net 157.0.7.11/32) || (dst net 157.0.44.9/32) || (dst net 157.0.65.83/32) || (dst net 157.0.113.100/32))),
	((dst port 1595) || (dst port 15347) || (dst port 19154) || (dst port 33823) || (dst port 57888)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.7.2/32) || (dst net 158.0.66.120/32) || (dst net 158.0.73.141/32) || (dst net 158.0.171.176/32) || (dst net 158.0.207.106/32))),
	((dst port 11167) || (dst port 19704) || (dst port 42750) || (dst port 58209) || (dst port 58973)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.76.196/32) || (dst net 159.0.133.152/32) || (dst net 159.0.160.221/32) || (dst net 159.0.223.48/32) || (dst net 159.0.237.55/32))),
	((dst port 31073) || (dst port 39199) || (dst port 42616) || (dst port 46390) || (dst port 59400)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.52.60/32) || (dst net 160.0.88.224/32) || (dst net 160.0.141.125/32) || (dst net 160.0.206.17/32) || (dst net 160.0.247.60/32))),
	((dst port 26192) || (dst port 41482) || (dst port 50406) || (dst port 51357) || (dst port 61493)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.147.211/32) || (dst net 161.0.197.65/32) || (dst net 161.0.214.49/32) || (dst net 161.0.216.207/32) || (dst net 161.0.255.191/32))),
	((dst port 34454) || (dst port 46320) || (dst port 53983) || (dst port 55619) || (dst port 55767)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.7.94/32) || (dst net 162.0.26.56/32) || (dst net 162.0.109.195/32) || (dst net 162.0.154.108/32) || (dst net 162.0.251.102/32))),
	((dst port 16826) || (dst port 37945) || (dst port 53295) || (dst port 57777) || (dst port 64406)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.46.23/32) || (dst net 163.0.85.83/32) || (dst net 163.0.166.96/32) || (dst net 163.0.192.141/32) || (dst net 163.0.228.27/32))),
	((dst port 5679) || (dst port 27572) || (dst port 28432) || (dst port 29157) || (dst port 64859)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.117.119/32) || (dst net 164.0.141.162/32) || (dst net 164.0.165.70/32) || (dst net 164.0.172.151/32) || (dst net 164.0.246.243/32))),
	((dst port 8864) || (dst port 20227) || (dst port 25177) || (dst port 34575) || (dst port 50389)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.80.11/32) || (dst net 165.0.107.24/32) || (dst net 165.0.173.101/32) || (dst net 165.0.229.236/32) || (dst net 165.0.253.89/32))),
	((dst port 4635) || (dst port 21625) || (dst port 35096) || (dst port 54841) || (dst port 62884)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.67.108/32) || (dst net 166.0.120.3/32) || (dst net 166.0.122.151/32) || (dst net 166.0.161.134/32) || (dst net 166.0.223.29/32))),
	((dst port 22788) || (dst port 33506) || (dst port 38664) || (dst port 62547) || (dst port 64779)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.34.170/32) || (dst net 167.0.148.143/32) || (dst net 167.0.173.199/32) || (dst net 167.0.197.225/32) || (dst net 167.0.243.91/32))),
	((dst port 6518) || (dst port 24241) || (dst port 26166) || (dst port 34880) || (dst port 46358)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.0.122/32) || (dst net 168.0.65.51/32) || (dst net 168.0.143.215/32) || (dst net 168.0.148.192/32) || (dst net 168.0.154.7/32))),
	((dst port 11203) || (dst port 42904) || (dst port 47168) || (dst port 53436) || (dst port 55195)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.2.60/32) || (dst net 169.0.51.83/32) || (dst net 169.0.136.131/32) || (dst net 169.0.161.215/32) || (dst net 169.0.180.17/32))),
	((dst port 11789) || (dst port 18254) || (dst port 26177) || (dst port 29285) || (dst port 41437)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.18.160/32) || (dst net 170.0.43.183/32) || (dst net 170.0.235.94/32) || (dst net 170.0.235.174/32) || (dst net 170.0.254.3/32))),
	((dst port 495) || (dst port 37871) || (dst port 45645) || (dst port 53878) || (dst port 62187)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.76.66/32) || (dst net 171.0.89.3/32) || (dst net 171.0.148.13/32) || (dst net 171.0.190.164/32) || (dst net 171.0.194.152/32))),
	((dst port 2945) || (dst port 15905) || (dst port 29236) || (dst port 52620) || (dst port 53044)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.2.186/32) || (dst net 172.0.34.160/32) || (dst net 172.0.36.164/32) || (dst net 172.0.45.244/32) || (dst net 172.0.137.69/32))),
	((dst port 1207) || (dst port 37348) || (dst port 47171) || (dst port 64604) || (dst port 64848)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.35.246/32) || (dst net 173.0.134.216/32) || (dst net 173.0.192.40/32) || (dst net 173.0.192.82/32) || (dst net 173.0.245.184/32))),
	((dst port 18142) || (dst port 24937) || (dst port 38088) || (dst port 48261) || (dst port 54222)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.13.114/32) || (dst net 174.0.14.180/32) || (dst net 174.0.114.128/32) || (dst net 174.0.120.73/32) || (dst net 174.0.194.242/32))),
	((dst port 2774) || (dst port 23087) || (dst port 30957) || (dst port 35246) || (dst port 50296)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.9.56/32) || (dst net 175.0.15.16/32) || (dst net 175.0.16.3/32) || (dst net 175.0.61.16/32) || (dst net 175.0.212.242/32))),
	((dst port 48000) || (dst port 49526) || (dst port 61325) || (dst port 62114) || (dst port 63220)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.23.90/32) || (dst net 176.0.70.46/32) || (dst net 176.0.140.81/32) || (dst net 176.0.147.255/32) || (dst net 176.0.193.15/32))),
	((dst port 13622) || (dst port 24101) || (dst port 42217) || (dst port 58195) || (dst port 64154)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.5.13/32) || (dst net 177.0.60.80/32) || (dst net 177.0.125.136/32) || (dst net 177.0.155.20/32) || (dst net 177.0.157.143/32))),
	((dst port 9950) || (dst port 27251) || (dst port 34592) || (dst port 46964) || (dst port 61265)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.11.203/32) || (dst net 178.0.34.207/32) || (dst net 178.0.81.95/32) || (dst net 178.0.97.59/32) || (dst net 178.0.163.50/32))),
	((dst port 8377) || (dst port 25853) || (dst port 41465) || (dst port 48133) || (dst port 63653)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.25.196/32) || (dst net 179.0.34.198/32) || (dst net 179.0.98.9/32) || (dst net 179.0.173.82/32) || (dst net 179.0.195.114/32))),
	((dst port 14537) || (dst port 22809) || (dst port 34694) || (dst port 44816) || (dst port 64283)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.61.137/32) || (dst net 180.0.117.246/32) || (dst net 180.0.149.158/32) || (dst net 180.0.156.90/32) || (dst net 180.0.245.24/32))),
	((dst port 2126) || (dst port 23797) || (dst port 27966) || (dst port 29995) || (dst port 46093)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.5.88/32) || (dst net 181.0.17.254/32) || (dst net 181.0.35.192/32) || (dst net 181.0.56.241/32) || (dst net 181.0.79.155/32))),
	((dst port 21844) || (dst port 35965) || (dst port 46637) || (dst port 55943) || (dst port 63556)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.43.197/32) || (dst net 182.0.118.18/32) || (dst net 182.0.134.217/32) || (dst net 182.0.192.1/32) || (dst net 182.0.230.183/32))),
	((dst port 17329) || (dst port 23995) || (dst port 29579) || (dst port 31980) || (dst port 38828)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.6.154/32) || (dst net 183.0.17.48/32) || (dst net 183.0.131.26/32) || (dst net 183.0.219.92/32) || (dst net 183.0.231.88/32))),
	((dst port 19305) || (dst port 48847) || (dst port 54431) || (dst port 58167) || (dst port 60360)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.6.245/32) || (dst net 184.0.36.225/32) || (dst net 184.0.40.117/32) || (dst net 184.0.53.13/32) || (dst net 184.0.240.148/32))),
	((dst port 2385) || (dst port 10357) || (dst port 13694) || (dst port 53426) || (dst port 54611)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.94.229/32) || (dst net 185.0.191.222/32) || (dst net 185.0.218.191/32) || (dst net 185.0.236.96/32) || (dst net 185.0.247.110/32))),
	((dst port 38662) || (dst port 56073) || (dst port 58666) || (dst port 60732) || (dst port 61025)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.21.106/32) || (dst net 186.0.51.15/32) || (dst net 186.0.125.34/32) || (dst net 186.0.215.53/32) || (dst net 186.0.249.15/32))),
	((dst port 24240) || (dst port 26325) || (dst port 29535) || (dst port 30921) || (dst port 50526)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.6.145/32) || (dst net 187.0.6.240/32) || (dst net 187.0.38.233/32) || (dst net 187.0.161.161/32) || (dst net 187.0.219.166/32))),
	((dst port 8995) || (dst port 23893) || (dst port 28698) || (dst port 46579) || (dst port 63156)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.9.167/32) || (dst net 188.0.199.5/32) || (dst net 188.0.229.112/32) || (dst net 188.0.232.97/32) || (dst net 188.0.255.184/32))),
	((dst port 18866) || (dst port 22206) || (dst port 23255) || (dst port 40676) || (dst port 49997)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.34.156/32) || (dst net 189.0.41.49/32) || (dst net 189.0.60.106/32) || (dst net 189.0.176.68/32) || (dst net 189.0.240.35/32))),
	((dst port 14566) || (dst port 35765) || (dst port 46525) || (dst port 51108) || (dst port 61157)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.79.199/32) || (dst net 190.0.86.239/32) || (dst net 190.0.102.75/32) || (dst net 190.0.146.134/32) || (dst net 190.0.225.148/32))),
	((dst port 16952) || (dst port 23618) || (dst port 35928) || (dst port 53236) || (dst port 63538)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.15.33/32) || (dst net 191.0.64.183/32) || (dst net 191.0.121.48/32) || (dst net 191.0.155.49/32) || (dst net 191.0.164.173/32))),
	((dst port 31595) || (dst port 35342) || (dst port 36630) || (dst port 49460) || (dst port 60957)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.18.118/32) || (dst net 192.0.103.207/32) || (dst net 192.0.135.143/32) || (dst net 192.0.165.242/32) || (dst net 192.0.254.169/32))),
	((dst port 3772) || (dst port 9286) || (dst port 19682) || (dst port 34920) || (dst port 40328)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.7.241/32) || (dst net 193.0.48.93/32) || (dst net 193.0.56.88/32) || (dst net 193.0.118.16/32) || (dst net 193.0.143.145/32))),
	((dst port 12559) || (dst port 14108) || (dst port 28798) || (dst port 31716) || (dst port 59000)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.28.7/32) || (dst net 194.0.44.123/32) || (dst net 194.0.65.237/32) || (dst net 194.0.86.189/32) || (dst net 194.0.114.121/32))),
	((dst port 11670) || (dst port 26378) || (dst port 44543) || (dst port 62804) || (dst port 63460)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.33.51/32) || (dst net 195.0.56.116/32) || (dst net 195.0.76.240/32) || (dst net 195.0.129.32/32) || (dst net 195.0.138.157/32))),
	((dst port 13345) || (dst port 20048) || (dst port 32065) || (dst port 33394) || (dst port 63885)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.120.77/32) || (dst net 196.0.155.85/32) || (dst net 196.0.157.175/32) || (dst net 196.0.189.87/32) || (dst net 196.0.221.249/32))),
	((dst port 2830) || (dst port 18054) || (dst port 29582) || (dst port 53182) || (dst port 64966)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.8.34/32) || (dst net 197.0.38.242/32) || (dst net 197.0.85.194/32) || (dst net 197.0.184.2/32) || (dst net 197.0.228.71/32))),
	((dst port 1119) || (dst port 8966) || (dst port 21326) || (dst port 28430) || (dst port 64157)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.110.176/32) || (dst net 198.0.121.106/32) || (dst net 198.0.147.213/32) || (dst net 198.0.199.137/32) || (dst net 198.0.250.73/32))),
	((dst port 34373) || (dst port 42074) || (dst port 50636) || (dst port 59172) || (dst port 61987)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.30.194/32) || (dst net 199.0.111.197/32) || (dst net 199.0.224.133/32) || (dst net 199.0.249.187/32) || (dst net 199.0.252.225/32))),
	((dst port 4490) || (dst port 14052) || (dst port 35947) || (dst port 45431) || (dst port 54549)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.38.236/32) || (dst net 200.0.86.255/32) || (dst net 200.0.90.149/32) || (dst net 200.0.145.209/32) || (dst net 200.0.221.235/32))),
	((dst port 34389) || (dst port 36644) || (dst port 37011) || (dst port 48694) || (dst port 61925)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.4.137/32) || (dst net 201.0.12.35/32) || (dst net 201.0.139.60/32) || (dst net 201.0.170.99/32) || (dst net 201.0.235.100/32))),
	((dst port 2113) || (dst port 15813) || (dst port 24158) || (dst port 39068) || (dst port 64786)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.65.162/32) || (dst net 202.0.166.38/32) || (dst net 202.0.169.73/32) || (dst net 202.0.224.97/32) || (dst net 202.0.246.65/32))),
	((dst port 634) || (dst port 12844) || (dst port 14638) || (dst port 51446) || (dst port 62004)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.19.26/32) || (dst net 203.0.67.239/32) || (dst net 203.0.116.137/32) || (dst net 203.0.157.109/32) || (dst net 203.0.227.151/32))),
	((dst port 23586) || (dst port 28040) || (dst port 39054) || (dst port 49653) || (dst port 51536)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.51.108/32) || (dst net 204.0.100.39/32) || (dst net 204.0.168.137/32) || (dst net 204.0.186.56/32) || (dst net 204.0.253.4/32))),
	((dst port 9758) || (dst port 28161) || (dst port 42763) || (dst port 43379) || (dst port 58909)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.28.144/32) || (dst net 205.0.47.94/32) || (dst net 205.0.62.210/32) || (dst net 205.0.113.251/32) || (dst net 205.0.213.6/32))),
	((dst port 23644) || (dst port 34272) || (dst port 43962) || (dst port 61097) || (dst port 62374)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.9.96/32) || (dst net 206.0.22.2/32) || (dst net 206.0.29.49/32) || (dst net 206.0.47.107/32) || (dst net 206.0.158.149/32))),
	((dst port 2930) || (dst port 20115) || (dst port 25828) || (dst port 40987) || (dst port 49368)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.43.184/32) || (dst net 207.0.46.204/32) || (dst net 207.0.108.49/32) || (dst net 207.0.171.34/32) || (dst net 207.0.254.9/32))),
	((dst port 10593) || (dst port 10879) || (dst port 26696) || (dst port 49589) || (dst port 61300)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.32.70/32) || (dst net 208.0.158.28/32) || (dst net 208.0.203.186/32) || (dst net 208.0.207.112/32) || (dst net 208.0.223.240/32))),
	((dst port 4014) || (dst port 6433) || (dst port 45151) || (dst port 61649) || (dst port 61653)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.23.232/32) || (dst net 209.0.87.5/32) || (dst net 209.0.101.28/32) || (dst net 209.0.130.9/32) || (dst net 209.0.250.104/32))),
	((dst port 38695) || (dst port 49058) || (dst port 49518) || (dst port 52337) || (dst port 63395)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.61.117/32) || (dst net 210.0.145.134/32) || (dst net 210.0.167.234/32) || (dst net 210.0.200.158/32) || (dst net 210.0.230.166/32))),
	((dst port 6135) || (dst port 16815) || (dst port 19075) || (dst port 50736) || (dst port 53148)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.81.28/32) || (dst net 211.0.107.237/32) || (dst net 211.0.121.68/32) || (dst net 211.0.141.61/32) || (dst net 211.0.253.230/32))),
	((dst port 8215) || (dst port 10548) || (dst port 15290) || (dst port 16730) || (dst port 55852)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.59.235/32) || (dst net 212.0.78.251/32) || (dst net 212.0.134.121/32) || (dst net 212.0.175.175/32) || (dst net 212.0.206.40/32))),
	((dst port 6929) || (dst port 21140) || (dst port 33878) || (dst port 57533) || (dst port 61812)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.37.53/32) || (dst net 213.0.73.241/32) || (dst net 213.0.75.234/32) || (dst net 213.0.146.196/32) || (dst net 213.0.211.206/32))),
	((dst port 9473) || (dst port 42738) || (dst port 42959) || (dst port 49868) || (dst port 52216)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.80.233/32) || (dst net 214.0.114.66/32) || (dst net 214.0.135.128/32) || (dst net 214.0.137.36/32) || (dst net 214.0.207.124/32))),
	((dst port 21609) || (dst port 23531) || (dst port 48023) || (dst port 48892) || (dst port 55901)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.13.144/32) || (dst net 215.0.104.168/32) || (dst net 215.0.115.230/32) || (dst net 215.0.140.113/32) || (dst net 215.0.243.204/32))),
	((dst port 2576) || (dst port 2817) || (dst port 12969) || (dst port 18862) || (dst port 27519)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.62.4/32) || (dst net 216.0.127.208/32) || (dst net 216.0.150.81/32) || (dst net 216.0.176.5/32) || (dst net 216.0.213.201/32))),
	((dst port 5616) || (dst port 18977) || (dst port 20325) || (dst port 34237) || (dst port 48794)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.23.107/32) || (dst net 217.0.96.203/32) || (dst net 217.0.133.135/32) || (dst net 217.0.175.60/32) || (dst net 217.0.178.239/32))),
	((dst port 17038) || (dst port 20863) || (dst port 28179) || (dst port 36394) || (dst port 37646)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.12.119/32) || (dst net 218.0.68.223/32) || (dst net 218.0.123.99/32) || (dst net 218.0.130.59/32) || (dst net 218.0.218.71/32))),
	((dst port 22327) || (dst port 35312) || (dst port 46306) || (dst port 51607) || (dst port 56882)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.43.164/32) || (dst net 219.0.67.129/32) || (dst net 219.0.116.140/32) || (dst net 219.0.131.46/32) || (dst net 219.0.182.173/32))),
	((dst port 15384) || (dst port 19748) || (dst port 32727) || (dst port 47814) || (dst port 53298)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.22.204/32) || (dst net 220.0.27.212/32) || (dst net 220.0.140.7/32) || (dst net 220.0.187.23/32) || (dst net 220.0.252.17/32))),
	((dst port 22428) || (dst port 53231) || (dst port 55095) || (dst port 63749) || (dst port 64703)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.11.161/32) || (dst net 221.0.97.5/32) || (dst net 221.0.99.160/32) || (dst net 221.0.119.138/32) || (dst net 221.0.126.47/32))),
	((dst port 2684) || (dst port 25098) || (dst port 36104) || (dst port 51086) || (dst port 51304)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.17.107/32) || (dst net 222.0.44.155/32) || (dst net 222.0.119.197/32) || (dst net 222.0.169.36/32) || (dst net 222.0.236.230/32))),
	((dst port 452) || (dst port 1194) || (dst port 9274) || (dst port 18787) || (dst port 26711)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.32.5/32) || (dst net 223.0.101.23/32) || (dst net 223.0.155.90/32) || (dst net 223.0.180.245/32) || (dst net 223.0.242.71/32))),
	((dst port 8494) || (dst port 20726) || (dst port 24852) || (dst port 27341) || (dst port 30682)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.26.130/32) || (dst net 224.0.48.198/32) || (dst net 224.0.90.74/32) || (dst net 224.0.149.159/32) || (dst net 224.0.179.81/32))),
	((dst port 8182) || (dst port 11968) || (dst port 23801) || (dst port 30494) || (dst port 50222)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.11.19/32) || (dst net 225.0.47.207/32) || (dst net 225.0.141.224/32) || (dst net 225.0.171.193/32) || (dst net 225.0.225.14/32))),
	((dst port 19155) || (dst port 30582) || (dst port 35256) || (dst port 41929) || (dst port 45723)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.26.159/32) || (dst net 226.0.40.31/32) || (dst net 226.0.94.167/32) || (dst net 226.0.106.79/32) || (dst net 226.0.208.82/32))),
	((dst port 3328) || (dst port 4346) || (dst port 9581) || (dst port 41931) || (dst port 43621)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.94.216/32) || (dst net 227.0.191.135/32) || (dst net 227.0.194.20/32) || (dst net 227.0.226.159/32) || (dst net 227.0.231.26/32))),
	((dst port 6315) || (dst port 12018) || (dst port 16189) || (dst port 40479) || (dst port 52815)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.109.143/32) || (dst net 228.0.131.152/32) || (dst net 228.0.180.114/32) || (dst net 228.0.195.183/32) || (dst net 228.0.204.135/32))),
	((dst port 23286) || (dst port 40709) || (dst port 53734) || (dst port 55445) || (dst port 63478)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.13.81/32) || (dst net 229.0.41.38/32) || (dst net 229.0.145.209/32) || (dst net 229.0.172.145/32) || (dst net 229.0.244.227/32))),
	((dst port 20831) || (dst port 23160) || (dst port 31798) || (dst port 35697) || (dst port 48019)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.113.5/32) || (dst net 230.0.179.21/32) || (dst net 230.0.190.77/32) || (dst net 230.0.198.155/32) || (dst net 230.0.249.231/32))),
	((dst port 4812) || (dst port 19305) || (dst port 24142) || (dst port 30088) || (dst port 47964)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.75.123/32) || (dst net 231.0.94.174/32) || (dst net 231.0.205.255/32) || (dst net 231.0.211.117/32) || (dst net 231.0.213.12/32))),
	((dst port 269) || (dst port 2074) || (dst port 38599) || (dst port 39383) || (dst port 55196)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.22.175/32) || (dst net 232.0.61.201/32) || (dst net 232.0.84.62/32) || (dst net 232.0.183.73/32) || (dst net 232.0.204.7/32))),
	((dst port 1653) || (dst port 5088) || (dst port 17563) || (dst port 53881) || (dst port 55248)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.6.97/32) || (dst net 233.0.7.92/32) || (dst net 233.0.22.114/32) || (dst net 233.0.89.23/32) || (dst net 233.0.203.222/32))),
	((dst port 9619) || (dst port 25843) || (dst port 34786) || (dst port 49734) || (dst port 64100)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.35.84/32) || (dst net 234.0.106.181/32) || (dst net 234.0.141.179/32) || (dst net 234.0.162.77/32) || (dst net 234.0.234.40/32))),
	((dst port 8884) || (dst port 19490) || (dst port 24286) || (dst port 46621) || (dst port 62084)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.18.163/32) || (dst net 235.0.120.105/32) || (dst net 235.0.132.111/32) || (dst net 235.0.135.213/32) || (dst net 235.0.144.249/32))),
	((dst port 1807) || (dst port 3000) || (dst port 31378) || (dst port 31974) || (dst port 42894)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.96.207/32) || (dst net 236.0.130.168/32) || (dst net 236.0.151.130/32) || (dst net 236.0.182.43/32) || (dst net 236.0.217.58/32))),
	((dst port 4389) || (dst port 31725) || (dst port 44909) || (dst port 53294) || (dst port 62305)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.143.170/32) || (dst net 237.0.186.11/32) || (dst net 237.0.191.199/32) || (dst net 237.0.219.16/32) || (dst net 237.0.253.39/32))),
	((dst port 8949) || (dst port 29186) || (dst port 46223) || (dst port 53173) || (dst port 64486)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.70.163/32) || (dst net 238.0.106.84/32) || (dst net 238.0.121.178/32) || (dst net 238.0.165.89/32) || (dst net 238.0.179.238/32))),
	((dst port 9701) || (dst port 24081) || (dst port 28731) || (dst port 48705) || (dst port 57027)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.30.132/32) || (dst net 239.0.50.101/32) || (dst net 239.0.137.47/32) || (dst net 239.0.151.212/32) || (dst net 239.0.172.44/32))),
	((dst port 1355) || (dst port 8872) || (dst port 27155) || (dst port 29971) || (dst port 33404)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.43.211/32) || (dst net 240.0.49.199/32) || (dst net 240.0.71.2/32) || (dst net 240.0.106.176/32) || (dst net 240.0.230.197/32))),
	((dst port 20340) || (dst port 26088) || (dst port 56566) || (dst port 58148) || (dst port 60292)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.23.161/32) || (dst net 241.0.127.91/32) || (dst net 241.0.146.155/32) || (dst net 241.0.168.207/32) || (dst net 241.0.249.88/32))),
	((dst port 3859) || (dst port 32412) || (dst port 50452) || (dst port 55203) || (dst port 64548)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.38.17/32) || (dst net 242.0.50.246/32) || (dst net 242.0.122.147/32) || (dst net 242.0.180.178/32) || (dst net 242.0.207.96/32))),
	((dst port 5415) || (dst port 9199) || (dst port 19566) || (dst port 43930) || (dst port 50374)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.62.174/32) || (dst net 243.0.66.1/32) || (dst net 243.0.82.74/32) || (dst net 243.0.94.188/32) || (dst net 243.0.110.127/32))),
	((dst port 7836) || (dst port 17891) || (dst port 17898) || (dst port 20157) || (dst port 37150)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.9.17/32) || (dst net 244.0.60.129/32) || (dst net 244.0.80.55/32) || (dst net 244.0.83.106/32) || (dst net 244.0.190.33/32))),
	((dst port 5011) || (dst port 5794) || (dst port 7792) || (dst port 14588) || (dst port 22574)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.4.241/32) || (dst net 245.0.34.236/32) || (dst net 245.0.109.121/32) || (dst net 245.0.189.70/32) || (dst net 245.0.225.174/32))),
	((dst port 2421) || (dst port 26606) || (dst port 29528) || (dst port 62223) || (dst port 63106)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.20.162/32) || (dst net 246.0.156.8/32) || (dst net 246.0.180.197/32) || (dst net 246.0.190.200/32) || (dst net 246.0.208.56/32))),
	((dst port 2847) || (dst port 4944) || (dst port 14178) || (dst port 35972) || (dst port 42771)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.7.228/32) || (dst net 247.0.13.89/32) || (dst net 247.0.131.169/32) || (dst net 247.0.196.87/32) || (dst net 247.0.220.21/32))),
	((dst port 19528) || (dst port 20321) || (dst port 28443) || (dst port 54375) || (dst port 60286)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.21.216/32) || (dst net 248.0.67.182/32) || (dst net 248.0.75.11/32) || (dst net 248.0.106.163/32) || (dst net 248.0.158.185/32))),
	((dst port 4452) || (dst port 12329) || (dst port 33949) || (dst port 39386) || (dst port 50338)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.26.13/32) || (dst net 249.0.65.205/32) || (dst net 249.0.106.228/32) || (dst net 249.0.119.127/32) || (dst net 249.0.254.20/32))),
	((dst port 6836) || (dst port 7179) || (dst port 11916) || (dst port 18932) || (dst port 41935)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.80.122/32) || (dst net 250.0.99.51/32) || (dst net 250.0.154.133/32) || (dst net 250.0.182.236/32) || (dst net 250.0.239.129/32))),
	((dst port 7537) || (dst port 34029) || (dst port 42153) || (dst port 54210) || (dst port 61505)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.22.187/32) || (dst net 251.0.37.195/32) || (dst net 251.0.55.87/32) || (dst net 251.0.183.74/32) || (dst net 251.0.233.137/32))),
	((dst port 3535) || (dst port 26811) || (dst port 38719) || (dst port 45162) || (dst port 58423)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.46.161/32) || (dst net 252.0.77.185/32) || (dst net 252.0.82.64/32) || (dst net 252.0.139.245/32) || (dst net 252.0.215.0/32))),
	((dst port 7651) || (dst port 14105) || (dst port 18379) || (dst port 24818) || (dst port 31571)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.29.98/32) || (dst net 253.0.35.55/32) || (dst net 253.0.55.212/32) || (dst net 253.0.104.166/32) || (dst net 253.0.134.199/32))),
	((dst port 8162) || (dst port 13545) || (dst port 22637) || (dst port 26068) || (dst port 41888)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.83.49/32) || (dst net 254.0.87.152/32) || (dst net 254.0.150.100/32) || (dst net 254.0.180.67/32) || (dst net 254.0.183.142/32))),
	((dst port 6953) || (dst port 19310) || (dst port 21968) || (dst port 42801) || (dst port 49332)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.37.69/32) || (dst net 255.0.88.208/32) || (dst net 255.0.94.90/32) || (dst net 255.0.165.167/32) || (dst net 255.0.254.12/32))),
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
getIPClas128 :: CycleCountAccum;
getIPClas129 :: CycleCountAccum;
getIPClas130 :: CycleCountAccum;
getIPClas131 :: CycleCountAccum;
getIPClas132 :: CycleCountAccum;
getIPClas133 :: CycleCountAccum;
getIPClas134 :: CycleCountAccum;
getIPClas135 :: CycleCountAccum;
getIPClas136 :: CycleCountAccum;
getIPClas137 :: CycleCountAccum;
getIPClas138 :: CycleCountAccum;
getIPClas139 :: CycleCountAccum;
getIPClas140 :: CycleCountAccum;
getIPClas141 :: CycleCountAccum;
getIPClas142 :: CycleCountAccum;
getIPClas143 :: CycleCountAccum;
getIPClas144 :: CycleCountAccum;
getIPClas145 :: CycleCountAccum;
getIPClas146 :: CycleCountAccum;
getIPClas147 :: CycleCountAccum;
getIPClas148 :: CycleCountAccum;
getIPClas149 :: CycleCountAccum;
getIPClas150 :: CycleCountAccum;
getIPClas151 :: CycleCountAccum;
getIPClas152 :: CycleCountAccum;
getIPClas153 :: CycleCountAccum;
getIPClas154 :: CycleCountAccum;
getIPClas155 :: CycleCountAccum;
getIPClas156 :: CycleCountAccum;
getIPClas157 :: CycleCountAccum;
getIPClas158 :: CycleCountAccum;
getIPClas159 :: CycleCountAccum;
getIPClas160 :: CycleCountAccum;
getIPClas161 :: CycleCountAccum;
getIPClas162 :: CycleCountAccum;
getIPClas163 :: CycleCountAccum;
getIPClas164 :: CycleCountAccum;
getIPClas165 :: CycleCountAccum;
getIPClas166 :: CycleCountAccum;
getIPClas167 :: CycleCountAccum;
getIPClas168 :: CycleCountAccum;
getIPClas169 :: CycleCountAccum;
getIPClas170 :: CycleCountAccum;
getIPClas171 :: CycleCountAccum;
getIPClas172 :: CycleCountAccum;
getIPClas173 :: CycleCountAccum;
getIPClas174 :: CycleCountAccum;
getIPClas175 :: CycleCountAccum;
getIPClas176 :: CycleCountAccum;
getIPClas177 :: CycleCountAccum;
getIPClas178 :: CycleCountAccum;
getIPClas179 :: CycleCountAccum;
getIPClas180 :: CycleCountAccum;
getIPClas181 :: CycleCountAccum;
getIPClas182 :: CycleCountAccum;
getIPClas183 :: CycleCountAccum;
getIPClas184 :: CycleCountAccum;
getIPClas185 :: CycleCountAccum;
getIPClas186 :: CycleCountAccum;
getIPClas187 :: CycleCountAccum;
getIPClas188 :: CycleCountAccum;
getIPClas189 :: CycleCountAccum;
getIPClas190 :: CycleCountAccum;
getIPClas191 :: CycleCountAccum;
getIPClas192 :: CycleCountAccum;
getIPClas193 :: CycleCountAccum;
getIPClas194 :: CycleCountAccum;
getIPClas195 :: CycleCountAccum;
getIPClas196 :: CycleCountAccum;
getIPClas197 :: CycleCountAccum;
getIPClas198 :: CycleCountAccum;
getIPClas199 :: CycleCountAccum;
getIPClas200 :: CycleCountAccum;
getIPClas201 :: CycleCountAccum;
getIPClas202 :: CycleCountAccum;
getIPClas203 :: CycleCountAccum;
getIPClas204 :: CycleCountAccum;
getIPClas205 :: CycleCountAccum;
getIPClas206 :: CycleCountAccum;
getIPClas207 :: CycleCountAccum;
getIPClas208 :: CycleCountAccum;
getIPClas209 :: CycleCountAccum;
getIPClas210 :: CycleCountAccum;
getIPClas211 :: CycleCountAccum;
getIPClas212 :: CycleCountAccum;
getIPClas213 :: CycleCountAccum;
getIPClas214 :: CycleCountAccum;
getIPClas215 :: CycleCountAccum;
getIPClas216 :: CycleCountAccum;
getIPClas217 :: CycleCountAccum;
getIPClas218 :: CycleCountAccum;
getIPClas219 :: CycleCountAccum;
getIPClas220 :: CycleCountAccum;
getIPClas221 :: CycleCountAccum;
getIPClas222 :: CycleCountAccum;
getIPClas223 :: CycleCountAccum;
getIPClas224 :: CycleCountAccum;
getIPClas225 :: CycleCountAccum;
getIPClas226 :: CycleCountAccum;
getIPClas227 :: CycleCountAccum;
getIPClas228 :: CycleCountAccum;
getIPClas229 :: CycleCountAccum;
getIPClas230 :: CycleCountAccum;
getIPClas231 :: CycleCountAccum;
getIPClas232 :: CycleCountAccum;
getIPClas233 :: CycleCountAccum;
getIPClas234 :: CycleCountAccum;
getIPClas235 :: CycleCountAccum;
getIPClas236 :: CycleCountAccum;
getIPClas237 :: CycleCountAccum;
getIPClas238 :: CycleCountAccum;
getIPClas239 :: CycleCountAccum;
getIPClas240 :: CycleCountAccum;
getIPClas241 :: CycleCountAccum;
getIPClas242 :: CycleCountAccum;
getIPClas243 :: CycleCountAccum;
getIPClas244 :: CycleCountAccum;
getIPClas245 :: CycleCountAccum;
getIPClas246 :: CycleCountAccum;
getIPClas247 :: CycleCountAccum;
getIPClas248 :: CycleCountAccum;
getIPClas249 :: CycleCountAccum;
getIPClas250 :: CycleCountAccum;
getIPClas251 :: CycleCountAccum;
getIPClas252 :: CycleCountAccum;
getIPClas253 :: CycleCountAccum;
getIPClas254 :: CycleCountAccum;
getIPClas255 :: CycleCountAccum;

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
ipclassifier[128] -> getIPClas128 -> Discard ();
ipclassifier[129] -> getIPClas129 -> Discard ();
ipclassifier[130] -> getIPClas130 -> Discard ();
ipclassifier[131] -> getIPClas131 -> Discard ();
ipclassifier[132] -> getIPClas132 -> Discard ();
ipclassifier[133] -> getIPClas133 -> Discard ();
ipclassifier[134] -> getIPClas134 -> Discard ();
ipclassifier[135] -> getIPClas135 -> Discard ();
ipclassifier[136] -> getIPClas136 -> Discard ();
ipclassifier[137] -> getIPClas137 -> Discard ();
ipclassifier[138] -> getIPClas138 -> Discard ();
ipclassifier[139] -> getIPClas139 -> Discard ();
ipclassifier[140] -> getIPClas140 -> Discard ();
ipclassifier[141] -> getIPClas141 -> Discard ();
ipclassifier[142] -> getIPClas142 -> Discard ();
ipclassifier[143] -> getIPClas143 -> Discard ();
ipclassifier[144] -> getIPClas144 -> Discard ();
ipclassifier[145] -> getIPClas145 -> Discard ();
ipclassifier[146] -> getIPClas146 -> Discard ();
ipclassifier[147] -> getIPClas147 -> Discard ();
ipclassifier[148] -> getIPClas148 -> Discard ();
ipclassifier[149] -> getIPClas149 -> Discard ();
ipclassifier[150] -> getIPClas150 -> Discard ();
ipclassifier[151] -> getIPClas151 -> Discard ();
ipclassifier[152] -> getIPClas152 -> Discard ();
ipclassifier[153] -> getIPClas153 -> Discard ();
ipclassifier[154] -> getIPClas154 -> Discard ();
ipclassifier[155] -> getIPClas155 -> Discard ();
ipclassifier[156] -> getIPClas156 -> Discard ();
ipclassifier[157] -> getIPClas157 -> Discard ();
ipclassifier[158] -> getIPClas158 -> Discard ();
ipclassifier[159] -> getIPClas159 -> Discard ();
ipclassifier[160] -> getIPClas160 -> Discard ();
ipclassifier[161] -> getIPClas161 -> Discard ();
ipclassifier[162] -> getIPClas162 -> Discard ();
ipclassifier[163] -> getIPClas163 -> Discard ();
ipclassifier[164] -> getIPClas164 -> Discard ();
ipclassifier[165] -> getIPClas165 -> Discard ();
ipclassifier[166] -> getIPClas166 -> Discard ();
ipclassifier[167] -> getIPClas167 -> Discard ();
ipclassifier[168] -> getIPClas168 -> Discard ();
ipclassifier[169] -> getIPClas169 -> Discard ();
ipclassifier[170] -> getIPClas170 -> Discard ();
ipclassifier[171] -> getIPClas171 -> Discard ();
ipclassifier[172] -> getIPClas172 -> Discard ();
ipclassifier[173] -> getIPClas173 -> Discard ();
ipclassifier[174] -> getIPClas174 -> Discard ();
ipclassifier[175] -> getIPClas175 -> Discard ();
ipclassifier[176] -> getIPClas176 -> Discard ();
ipclassifier[177] -> getIPClas177 -> Discard ();
ipclassifier[178] -> getIPClas178 -> Discard ();
ipclassifier[179] -> getIPClas179 -> Discard ();
ipclassifier[180] -> getIPClas180 -> Discard ();
ipclassifier[181] -> getIPClas181 -> Discard ();
ipclassifier[182] -> getIPClas182 -> Discard ();
ipclassifier[183] -> getIPClas183 -> Discard ();
ipclassifier[184] -> getIPClas184 -> Discard ();
ipclassifier[185] -> getIPClas185 -> Discard ();
ipclassifier[186] -> getIPClas186 -> Discard ();
ipclassifier[187] -> getIPClas187 -> Discard ();
ipclassifier[188] -> getIPClas188 -> Discard ();
ipclassifier[189] -> getIPClas189 -> Discard ();
ipclassifier[190] -> getIPClas190 -> Discard ();
ipclassifier[191] -> getIPClas191 -> Discard ();
ipclassifier[192] -> getIPClas192 -> Discard ();
ipclassifier[193] -> getIPClas193 -> Discard ();
ipclassifier[194] -> getIPClas194 -> Discard ();
ipclassifier[195] -> getIPClas195 -> Discard ();
ipclassifier[196] -> getIPClas196 -> Discard ();
ipclassifier[197] -> getIPClas197 -> Discard ();
ipclassifier[198] -> getIPClas198 -> Discard ();
ipclassifier[199] -> getIPClas199 -> Discard ();
ipclassifier[200] -> getIPClas200 -> Discard ();
ipclassifier[201] -> getIPClas201 -> Discard ();
ipclassifier[202] -> getIPClas202 -> Discard ();
ipclassifier[203] -> getIPClas203 -> Discard ();
ipclassifier[204] -> getIPClas204 -> Discard ();
ipclassifier[205] -> getIPClas205 -> Discard ();
ipclassifier[206] -> getIPClas206 -> Discard ();
ipclassifier[207] -> getIPClas207 -> Discard ();
ipclassifier[208] -> getIPClas208 -> Discard ();
ipclassifier[209] -> getIPClas209 -> Discard ();
ipclassifier[210] -> getIPClas210 -> Discard ();
ipclassifier[211] -> getIPClas211 -> Discard ();
ipclassifier[212] -> getIPClas212 -> Discard ();
ipclassifier[213] -> getIPClas213 -> Discard ();
ipclassifier[214] -> getIPClas214 -> Discard ();
ipclassifier[215] -> getIPClas215 -> Discard ();
ipclassifier[216] -> getIPClas216 -> Discard ();
ipclassifier[217] -> getIPClas217 -> Discard ();
ipclassifier[218] -> getIPClas218 -> Discard ();
ipclassifier[219] -> getIPClas219 -> Discard ();
ipclassifier[220] -> getIPClas220 -> Discard ();
ipclassifier[221] -> getIPClas221 -> Discard ();
ipclassifier[222] -> getIPClas222 -> Discard ();
ipclassifier[223] -> getIPClas223 -> Discard ();
ipclassifier[224] -> getIPClas224 -> Discard ();
ipclassifier[225] -> getIPClas225 -> Discard ();
ipclassifier[226] -> getIPClas226 -> Discard ();
ipclassifier[227] -> getIPClas227 -> Discard ();
ipclassifier[228] -> getIPClas228 -> Discard ();
ipclassifier[229] -> getIPClas229 -> Discard ();
ipclassifier[230] -> getIPClas230 -> Discard ();
ipclassifier[231] -> getIPClas231 -> Discard ();
ipclassifier[232] -> getIPClas232 -> Discard ();
ipclassifier[233] -> getIPClas233 -> Discard ();
ipclassifier[234] -> getIPClas234 -> Discard ();
ipclassifier[235] -> getIPClas235 -> Discard ();
ipclassifier[236] -> getIPClas236 -> Discard ();
ipclassifier[237] -> getIPClas237 -> Discard ();
ipclassifier[238] -> getIPClas238 -> Discard ();
ipclassifier[239] -> getIPClas239 -> Discard ();
ipclassifier[240] -> getIPClas240 -> Discard ();
ipclassifier[241] -> getIPClas241 -> Discard ();
ipclassifier[242] -> getIPClas242 -> Discard ();
ipclassifier[243] -> getIPClas243 -> Discard ();
ipclassifier[244] -> getIPClas244 -> Discard ();
ipclassifier[245] -> getIPClas245 -> Discard ();
ipclassifier[246] -> getIPClas246 -> Discard ();
ipclassifier[247] -> getIPClas247 -> Discard ();
ipclassifier[248] -> getIPClas248 -> Discard ();
ipclassifier[249] -> getIPClas249 -> Discard ();
ipclassifier[250] -> getIPClas250 -> Discard ();
ipclassifier[251] -> getIPClas251 -> Discard ();
ipclassifier[252] -> getIPClas252 -> Discard ();
ipclassifier[253] -> getIPClas253 -> Discard ();
ipclassifier[254] -> getIPClas254 -> Discard ();
ipclassifier[255] -> getIPClas255 -> Discard ();
	
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
