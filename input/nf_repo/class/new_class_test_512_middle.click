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
	((dst port 21940) || (dst port 34516) || (dst port 47133) || (dst port 56416) || (dst port 57795)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.38.43/32) || (dst net 0.0.115.88/32) || (dst net 0.0.132.146/32) || (dst net 0.0.143.78/32) || (dst net 0.0.251.176/32))),
	((dst port 2450) || (dst port 23812) || (dst port 34802) || (dst port 53603) || (dst port 63876)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.2.128/32) || (dst net 1.0.17.128/32) || (dst net 1.0.78.106/32) || (dst net 1.0.150.133/32) || (dst net 1.0.221.106/32))),
	((dst port 8222) || (dst port 12979) || (dst port 31967) || (dst port 38796) || (dst port 46556)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.24.243/32) || (dst net 2.0.116.70/32) || (dst net 2.0.181.130/32) || (dst net 2.0.197.145/32) || (dst net 2.0.242.208/32))),
	((dst port 3710) || (dst port 10015) || (dst port 25613) || (dst port 35037) || (dst port 36709)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.4.74/32) || (dst net 3.0.60.128/32) || (dst net 3.0.63.4/32) || (dst net 3.0.185.50/32) || (dst net 3.0.227.14/32))),
	((dst port 689) || (dst port 40269) || (dst port 41071) || (dst port 43557) || (dst port 46651)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.31.110/32) || (dst net 4.0.42.46/32) || (dst net 4.0.42.67/32) || (dst net 4.0.74.46/32) || (dst net 4.0.127.100/32))),
	((dst port 52961) || (dst port 55537) || (dst port 59816) || (dst port 60706) || (dst port 61490)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.9.112/32) || (dst net 5.0.22.148/32) || (dst net 5.0.60.238/32) || (dst net 5.0.111.194/32) || (dst net 5.0.205.5/32))),
	((dst port 22404) || (dst port 31514) || (dst port 37842) || (dst port 44275) || (dst port 58079)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.19.219/32) || (dst net 6.0.122.149/32) || (dst net 6.0.142.108/32) || (dst net 6.0.184.133/32) || (dst net 6.0.220.142/32))),
	((dst port 22364) || (dst port 26477) || (dst port 30650) || (dst port 56842) || (dst port 62806)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.7.1/32) || (dst net 7.0.73.210/32) || (dst net 7.0.135.14/32) || (dst net 7.0.155.22/32) || (dst net 7.0.173.80/32))),
	((dst port 3579) || (dst port 25490) || (dst port 26814) || (dst port 52854) || (dst port 56303)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.4.125/32) || (dst net 8.0.52.24/32) || (dst net 8.0.112.87/32) || (dst net 8.0.173.208/32) || (dst net 8.0.244.92/32))),
	((dst port 14453) || (dst port 34136) || (dst port 38307) || (dst port 52254) || (dst port 55969)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.63.194/32) || (dst net 9.0.113.231/32) || (dst net 9.0.187.80/32) || (dst net 9.0.222.115/32) || (dst net 9.0.255.177/32))),
	((dst port 213) || (dst port 14665) || (dst port 20411) || (dst port 37757) || (dst port 50374)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.18.62/32) || (dst net 10.0.18.202/32) || (dst net 10.0.150.41/32) || (dst net 10.0.190.232/32) || (dst net 10.0.203.96/32))),
	((dst port 5534) || (dst port 28362) || (dst port 33718) || (dst port 38122) || (dst port 49512)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.89.120/32) || (dst net 11.0.99.184/32) || (dst net 11.0.188.97/32) || (dst net 11.0.208.29/32) || (dst net 11.0.216.182/32))),
	((dst port 24334) || (dst port 37179) || (dst port 37790) || (dst port 43056) || (dst port 50514)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.55.7/32) || (dst net 12.0.71.250/32) || (dst net 12.0.75.110/32) || (dst net 12.0.111.226/32) || (dst net 12.0.155.93/32))),
	((dst port 10223) || (dst port 18040) || (dst port 28410) || (dst port 43861) || (dst port 53347)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.9.11/32) || (dst net 13.0.77.151/32) || (dst net 13.0.101.52/32) || (dst net 13.0.184.10/32) || (dst net 13.0.230.56/32))),
	((dst port 19718) || (dst port 31911) || (dst port 38239) || (dst port 50433) || (dst port 63801)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.6.113/32) || (dst net 14.0.20.167/32) || (dst net 14.0.80.54/32) || (dst net 14.0.82.54/32) || (dst net 14.0.208.218/32))),
	((dst port 14004) || (dst port 17037) || (dst port 36850) || (dst port 46645) || (dst port 65321)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.31.159/32) || (dst net 15.0.147.176/32) || (dst net 15.0.192.154/32) || (dst net 15.0.249.98/32) || (dst net 15.0.251.114/32))),
	((dst port 1716) || (dst port 3846) || (dst port 35457) || (dst port 52572) || (dst port 54802)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.80.89/32) || (dst net 16.0.88.218/32) || (dst net 16.0.172.18/32) || (dst net 16.0.175.74/32) || (dst net 16.0.229.14/32))),
	((dst port 9969) || (dst port 16935) || (dst port 41434) || (dst port 47303) || (dst port 50484)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.5.87/32) || (dst net 17.0.20.120/32) || (dst net 17.0.66.129/32) || (dst net 17.0.147.145/32) || (dst net 17.0.225.198/32))),
	((dst port 602) || (dst port 7059) || (dst port 11947) || (dst port 24918) || (dst port 36351)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.4.199/32) || (dst net 18.0.153.215/32) || (dst net 18.0.195.200/32) || (dst net 18.0.197.7/32) || (dst net 18.0.209.244/32))),
	((dst port 1058) || (dst port 14907) || (dst port 16930) || (dst port 43561) || (dst port 45669)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.73.70/32) || (dst net 19.0.89.22/32) || (dst net 19.0.112.58/32) || (dst net 19.0.144.255/32) || (dst net 19.0.223.195/32))),
	((dst port 17444) || (dst port 20933) || (dst port 32505) || (dst port 50319) || (dst port 63862)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.41.66/32) || (dst net 20.0.89.194/32) || (dst net 20.0.162.208/32) || (dst net 20.0.204.16/32) || (dst net 20.0.246.226/32))),
	((dst port 9257) || (dst port 9489) || (dst port 22226) || (dst port 28334) || (dst port 51621)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.18.90/32) || (dst net 21.0.81.61/32) || (dst net 21.0.103.144/32) || (dst net 21.0.226.82/32) || (dst net 21.0.251.216/32))),
	((dst port 5931) || (dst port 9776) || (dst port 31479) || (dst port 54218) || (dst port 58455)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.39.228/32) || (dst net 22.0.94.108/32) || (dst net 22.0.205.183/32) || (dst net 22.0.228.83/32) || (dst net 22.0.248.195/32))),
	((dst port 4001) || (dst port 16654) || (dst port 19181) || (dst port 33750) || (dst port 57923)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.25.97/32) || (dst net 23.0.60.34/32) || (dst net 23.0.116.144/32) || (dst net 23.0.185.31/32) || (dst net 23.0.211.243/32))),
	((dst port 2541) || (dst port 5812) || (dst port 31948) || (dst port 46305) || (dst port 64769)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.52.16/32) || (dst net 24.0.59.61/32) || (dst net 24.0.63.244/32) || (dst net 24.0.65.101/32) || (dst net 24.0.201.181/32))),
	((dst port 20470) || (dst port 35544) || (dst port 43615) || (dst port 49806) || (dst port 50078)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.58.199/32) || (dst net 25.0.97.78/32) || (dst net 25.0.184.115/32) || (dst net 25.0.218.163/32) || (dst net 25.0.239.188/32))),
	((dst port 11602) || (dst port 24667) || (dst port 33117) || (dst port 43870) || (dst port 62836)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.3.229/32) || (dst net 26.0.23.49/32) || (dst net 26.0.72.206/32) || (dst net 26.0.190.240/32) || (dst net 26.0.196.103/32))),
	((dst port 14867) || (dst port 30646) || (dst port 35070) || (dst port 40672) || (dst port 49867)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.67.89/32) || (dst net 27.0.105.166/32) || (dst net 27.0.164.217/32) || (dst net 27.0.234.90/32) || (dst net 27.0.251.11/32))),
	((dst port 21757) || (dst port 21840) || (dst port 40454) || (dst port 43994) || (dst port 61914)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.14.168/32) || (dst net 28.0.23.20/32) || (dst net 28.0.36.37/32) || (dst net 28.0.70.132/32) || (dst net 28.0.143.156/32))),
	((dst port 9996) || (dst port 25948) || (dst port 31593) || (dst port 36586) || (dst port 63312)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.30.59/32) || (dst net 29.0.173.246/32) || (dst net 29.0.204.47/32) || (dst net 29.0.226.93/32) || (dst net 29.0.231.182/32))),
	((dst port 9832) || (dst port 29445) || (dst port 36681) || (dst port 46455) || (dst port 48621)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.80.131/32) || (dst net 30.0.86.118/32) || (dst net 30.0.95.100/32) || (dst net 30.0.143.102/32) || (dst net 30.0.190.221/32))),
	((dst port 11673) || (dst port 24682) || (dst port 36283) || (dst port 38960) || (dst port 46876)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.68.84/32) || (dst net 31.0.96.215/32) || (dst net 31.0.129.142/32) || (dst net 31.0.187.19/32) || (dst net 31.0.240.145/32))),
	((dst port 13318) || (dst port 25465) || (dst port 27815) || (dst port 58812) || (dst port 60628)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.38.11/32) || (dst net 32.0.158.190/32) || (dst net 32.0.177.170/32) || (dst net 32.0.188.128/32) || (dst net 32.0.206.151/32))),
	((dst port 604) || (dst port 2496) || (dst port 9736) || (dst port 16542) || (dst port 22106)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.15.20/32) || (dst net 33.0.35.197/32) || (dst net 33.0.41.9/32) || (dst net 33.0.46.33/32) || (dst net 33.0.147.146/32))),
	((dst port 7221) || (dst port 11303) || (dst port 22169) || (dst port 29169) || (dst port 53260)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.44.144/32) || (dst net 34.0.48.4/32) || (dst net 34.0.103.181/32) || (dst net 34.0.139.139/32) || (dst net 34.0.203.195/32))),
	((dst port 5510) || (dst port 13586) || (dst port 16260) || (dst port 21165) || (dst port 53804)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.40.83/32) || (dst net 35.0.97.35/32) || (dst net 35.0.106.29/32) || (dst net 35.0.169.62/32) || (dst net 35.0.221.88/32))),
	((dst port 41430) || (dst port 45798) || (dst port 51604) || (dst port 54941) || (dst port 60838)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.5.46/32) || (dst net 36.0.56.133/32) || (dst net 36.0.69.234/32) || (dst net 36.0.80.86/32) || (dst net 36.0.228.238/32))),
	((dst port 12346) || (dst port 14714) || (dst port 19621) || (dst port 25440) || (dst port 56024)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.40.43/32) || (dst net 37.0.43.16/32) || (dst net 37.0.44.221/32) || (dst net 37.0.50.158/32) || (dst net 37.0.154.183/32))),
	((dst port 21512) || (dst port 33674) || (dst port 48055) || (dst port 53104) || (dst port 57843)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.28.115/32) || (dst net 38.0.29.239/32) || (dst net 38.0.67.229/32) || (dst net 38.0.133.197/32) || (dst net 38.0.184.243/32))),
	((dst port 314) || (dst port 19294) || (dst port 39354) || (dst port 42202) || (dst port 60359)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.5.39/32) || (dst net 39.0.25.222/32) || (dst net 39.0.59.206/32) || (dst net 39.0.85.174/32) || (dst net 39.0.196.96/32))),
	((dst port 2919) || (dst port 10064) || (dst port 22370) || (dst port 42286) || (dst port 63826)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.10.225/32) || (dst net 40.0.35.187/32) || (dst net 40.0.57.101/32) || (dst net 40.0.104.37/32) || (dst net 40.0.227.106/32))),
	((dst port 6083) || (dst port 7810) || (dst port 11238) || (dst port 11254) || (dst port 65235)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.44.146/32) || (dst net 41.0.46.207/32) || (dst net 41.0.142.75/32) || (dst net 41.0.176.228/32) || (dst net 41.0.200.103/32))),
	((dst port 5858) || (dst port 29417) || (dst port 42659) || (dst port 48571) || (dst port 56946)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.38.228/32) || (dst net 42.0.72.34/32) || (dst net 42.0.123.228/32) || (dst net 42.0.124.216/32) || (dst net 42.0.135.100/32))),
	((dst port 2577) || (dst port 3043) || (dst port 34245) || (dst port 48302) || (dst port 56574)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.7.46/32) || (dst net 43.0.42.94/32) || (dst net 43.0.118.249/32) || (dst net 43.0.145.46/32) || (dst net 43.0.173.223/32))),
	((dst port 9796) || (dst port 14585) || (dst port 19250) || (dst port 39457) || (dst port 45186)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.54.154/32) || (dst net 44.0.112.40/32) || (dst net 44.0.190.67/32) || (dst net 44.0.220.26/32) || (dst net 44.0.225.38/32))),
	((dst port 25271) || (dst port 50135) || (dst port 63546) || (dst port 63767) || (dst port 65534)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.1.106/32) || (dst net 45.0.24.100/32) || (dst net 45.0.105.22/32) || (dst net 45.0.217.46/32) || (dst net 45.0.233.193/32))),
	((dst port 1037) || (dst port 8658) || (dst port 32595) || (dst port 41607) || (dst port 64797)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.7.18/32) || (dst net 46.0.56.20/32) || (dst net 46.0.121.24/32) || (dst net 46.0.146.134/32) || (dst net 46.0.222.12/32))),
	((dst port 16583) || (dst port 35819) || (dst port 46920) || (dst port 59370) || (dst port 60896)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.42.250/32) || (dst net 47.0.138.163/32) || (dst net 47.0.159.106/32) || (dst net 47.0.161.221/32) || (dst net 47.0.182.111/32))),
	((dst port 17102) || (dst port 18074) || (dst port 32274) || (dst port 37743) || (dst port 59909)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.47.157/32) || (dst net 48.0.156.115/32) || (dst net 48.0.215.67/32) || (dst net 48.0.217.33/32) || (dst net 48.0.223.99/32))),
	((dst port 29739) || (dst port 35101) || (dst port 36116) || (dst port 56506) || (dst port 56808)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.25.71/32) || (dst net 49.0.62.9/32) || (dst net 49.0.119.126/32) || (dst net 49.0.202.79/32) || (dst net 49.0.209.168/32))),
	((dst port 11540) || (dst port 14101) || (dst port 27715) || (dst port 29329) || (dst port 32855)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.5.177/32) || (dst net 50.0.14.193/32) || (dst net 50.0.185.233/32) || (dst net 50.0.199.252/32) || (dst net 50.0.230.149/32))),
	((dst port 8799) || (dst port 16101) || (dst port 22847) || (dst port 31418) || (dst port 38820)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.121.123/32) || (dst net 51.0.123.95/32) || (dst net 51.0.159.114/32) || (dst net 51.0.177.209/32) || (dst net 51.0.244.10/32))),
	((dst port 7857) || (dst port 9296) || (dst port 23642) || (dst port 64130) || (dst port 64371)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.14.182/32) || (dst net 52.0.18.62/32) || (dst net 52.0.71.253/32) || (dst net 52.0.163.48/32) || (dst net 52.0.210.64/32))),
	((dst port 23955) || (dst port 25751) || (dst port 27657) || (dst port 46289) || (dst port 58107)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.16.152/32) || (dst net 53.0.37.208/32) || (dst net 53.0.63.178/32) || (dst net 53.0.164.154/32) || (dst net 53.0.170.111/32))),
	((dst port 497) || (dst port 15328) || (dst port 23284) || (dst port 34174) || (dst port 59748)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.26.177/32) || (dst net 54.0.128.221/32) || (dst net 54.0.136.136/32) || (dst net 54.0.143.64/32) || (dst net 54.0.170.216/32))),
	((dst port 23076) || (dst port 28623) || (dst port 46622) || (dst port 56824) || (dst port 61922)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.89.181/32) || (dst net 55.0.118.39/32) || (dst net 55.0.175.31/32) || (dst net 55.0.210.121/32) || (dst net 55.0.239.128/32))),
	((dst port 17652) || (dst port 20951) || (dst port 53343) || (dst port 54795) || (dst port 59171)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.19.16/32) || (dst net 56.0.52.114/32) || (dst net 56.0.55.21/32) || (dst net 56.0.150.12/32) || (dst net 56.0.218.79/32))),
	((dst port 12797) || (dst port 37669) || (dst port 41314) || (dst port 55309) || (dst port 59035)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.32.189/32) || (dst net 57.0.40.97/32) || (dst net 57.0.54.94/32) || (dst net 57.0.57.130/32) || (dst net 57.0.72.204/32))),
	((dst port 11436) || (dst port 34208) || (dst port 40490) || (dst port 50379) || (dst port 58193)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.17.246/32) || (dst net 58.0.81.77/32) || (dst net 58.0.140.61/32) || (dst net 58.0.200.58/32) || (dst net 58.0.255.36/32))),
	((dst port 11479) || (dst port 19514) || (dst port 29702) || (dst port 38352) || (dst port 59609)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.158.226/32) || (dst net 59.0.187.113/32) || (dst net 59.0.197.88/32) || (dst net 59.0.210.47/32) || (dst net 59.0.214.133/32))),
	((dst port 12512) || (dst port 47732) || (dst port 48781) || (dst port 52872) || (dst port 65428)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.14.172/32) || (dst net 60.0.45.221/32) || (dst net 60.0.47.142/32) || (dst net 60.0.61.212/32) || (dst net 60.0.139.190/32))),
	((dst port 5434) || (dst port 41297) || (dst port 46013) || (dst port 50761) || (dst port 65452)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.36.189/32) || (dst net 61.0.93.213/32) || (dst net 61.0.109.181/32) || (dst net 61.0.178.2/32) || (dst net 61.0.253.179/32))),
	((dst port 4404) || (dst port 16739) || (dst port 29655) || (dst port 31313) || (dst port 48425)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.12.224/32) || (dst net 62.0.38.9/32) || (dst net 62.0.53.2/32) || (dst net 62.0.93.140/32) || (dst net 62.0.141.209/32))),
	((dst port 9235) || (dst port 30910) || (dst port 52547) || (dst port 53590) || (dst port 60144)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.128.248/32) || (dst net 63.0.156.179/32) || (dst net 63.0.199.71/32) || (dst net 63.0.205.153/32) || (dst net 63.0.250.195/32))),
	((dst port 21663) || (dst port 25932) || (dst port 44550) || (dst port 47572) || (dst port 59592)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.11.186/32) || (dst net 64.0.106.243/32) || (dst net 64.0.125.30/32) || (dst net 64.0.184.225/32) || (dst net 64.0.227.54/32))),
	((dst port 849) || (dst port 19521) || (dst port 19824) || (dst port 54710) || (dst port 55291)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.4.171/32) || (dst net 65.0.123.183/32) || (dst net 65.0.174.45/32) || (dst net 65.0.228.33/32) || (dst net 65.0.249.233/32))),
	((dst port 4993) || (dst port 12954) || (dst port 29173) || (dst port 37968) || (dst port 62591)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.9.129/32) || (dst net 66.0.24.50/32) || (dst net 66.0.65.100/32) || (dst net 66.0.172.194/32) || (dst net 66.0.217.242/32))),
	((dst port 13535) || (dst port 16385) || (dst port 19903) || (dst port 48089) || (dst port 57894)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.50.55/32) || (dst net 67.0.58.173/32) || (dst net 67.0.106.245/32) || (dst net 67.0.214.58/32) || (dst net 67.0.248.6/32))),
	((dst port 32059) || (dst port 34080) || (dst port 48385) || (dst port 48898) || (dst port 57819)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.13.109/32) || (dst net 68.0.118.254/32) || (dst net 68.0.142.165/32) || (dst net 68.0.238.36/32) || (dst net 68.0.243.44/32))),
	((dst port 9314) || (dst port 17392) || (dst port 29126) || (dst port 42310) || (dst port 42622)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.8.122/32) || (dst net 69.0.70.15/32) || (dst net 69.0.132.233/32) || (dst net 69.0.175.195/32) || (dst net 69.0.219.72/32))),
	((dst port 2533) || (dst port 10825) || (dst port 37031) || (dst port 40332) || (dst port 49182)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.77.77/32) || (dst net 70.0.102.251/32) || (dst net 70.0.150.116/32) || (dst net 70.0.188.186/32) || (dst net 70.0.251.59/32))),
	((dst port 12229) || (dst port 16835) || (dst port 21931) || (dst port 29030) || (dst port 55605)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.17.205/32) || (dst net 71.0.25.136/32) || (dst net 71.0.166.241/32) || (dst net 71.0.202.32/32) || (dst net 71.0.253.212/32))),
	((dst port 2990) || (dst port 5992) || (dst port 9834) || (dst port 31246) || (dst port 44715)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.2.91/32) || (dst net 72.0.151.170/32) || (dst net 72.0.222.29/32) || (dst net 72.0.224.229/32) || (dst net 72.0.251.36/32))),
	((dst port 5429) || (dst port 22995) || (dst port 29608) || (dst port 54013) || (dst port 59142)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.7.246/32) || (dst net 73.0.40.71/32) || (dst net 73.0.54.26/32) || (dst net 73.0.175.1/32) || (dst net 73.0.223.203/32))),
	((dst port 2312) || (dst port 6565) || (dst port 19181) || (dst port 44270) || (dst port 62341)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.6.215/32) || (dst net 74.0.10.5/32) || (dst net 74.0.180.144/32) || (dst net 74.0.185.99/32) || (dst net 74.0.217.255/32))),
	((dst port 10854) || (dst port 10907) || (dst port 17592) || (dst port 35637) || (dst port 40593)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.86.104/32) || (dst net 75.0.179.174/32) || (dst net 75.0.193.92/32) || (dst net 75.0.216.235/32) || (dst net 75.0.229.132/32))),
	((dst port 10841) || (dst port 11287) || (dst port 42772) || (dst port 49876) || (dst port 50451)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.2.17/32) || (dst net 76.0.19.205/32) || (dst net 76.0.34.122/32) || (dst net 76.0.150.25/32) || (dst net 76.0.171.221/32))),
	((dst port 7777) || (dst port 16966) || (dst port 17844) || (dst port 31765) || (dst port 51349)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.41.201/32) || (dst net 77.0.86.241/32) || (dst net 77.0.214.186/32) || (dst net 77.0.231.205/32) || (dst net 77.0.237.228/32))),
	((dst port 3211) || (dst port 14602) || (dst port 36723) || (dst port 47698) || (dst port 48951)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.26.245/32) || (dst net 78.0.126.187/32) || (dst net 78.0.157.99/32) || (dst net 78.0.200.194/32) || (dst net 78.0.251.251/32))),
	((dst port 17429) || (dst port 19534) || (dst port 33719) || (dst port 44570) || (dst port 50726)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.87.39/32) || (dst net 79.0.150.125/32) || (dst net 79.0.155.74/32) || (dst net 79.0.191.230/32) || (dst net 79.0.235.190/32))),
	((dst port 5778) || (dst port 7858) || (dst port 8536) || (dst port 24465) || (dst port 53519)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.125.72/32) || (dst net 80.0.158.182/32) || (dst net 80.0.200.81/32) || (dst net 80.0.217.146/32) || (dst net 80.0.236.72/32))),
	((dst port 18249) || (dst port 19289) || (dst port 30253) || (dst port 47923) || (dst port 49925)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.140.53/32) || (dst net 81.0.172.43/32) || (dst net 81.0.204.19/32) || (dst net 81.0.230.145/32) || (dst net 81.0.246.79/32))),
	((dst port 8144) || (dst port 36127) || (dst port 58137) || (dst port 58626) || (dst port 60819)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.16.234/32) || (dst net 82.0.22.1/32) || (dst net 82.0.123.70/32) || (dst net 82.0.187.55/32) || (dst net 82.0.205.224/32))),
	((dst port 19168) || (dst port 34814) || (dst port 43960) || (dst port 46550) || (dst port 54336)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.15.231/32) || (dst net 83.0.59.150/32) || (dst net 83.0.153.56/32) || (dst net 83.0.185.67/32) || (dst net 83.0.233.141/32))),
	((dst port 10311) || (dst port 16237) || (dst port 23458) || (dst port 31165) || (dst port 52861)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.10.22/32) || (dst net 84.0.11.145/32) || (dst net 84.0.19.178/32) || (dst net 84.0.87.208/32) || (dst net 84.0.248.77/32))),
	((dst port 10935) || (dst port 13799) || (dst port 20816) || (dst port 28973) || (dst port 60809)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.21.66/32) || (dst net 85.0.152.151/32) || (dst net 85.0.178.247/32) || (dst net 85.0.186.113/32) || (dst net 85.0.240.228/32))),
	((dst port 21234) || (dst port 24276) || (dst port 29682) || (dst port 51317) || (dst port 64786)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.60.99/32) || (dst net 86.0.67.214/32) || (dst net 86.0.118.107/32) || (dst net 86.0.145.25/32) || (dst net 86.0.147.252/32))),
	((dst port 2694) || (dst port 45813) || (dst port 51445) || (dst port 60763) || (dst port 61732)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.49.203/32) || (dst net 87.0.134.66/32) || (dst net 87.0.160.100/32) || (dst net 87.0.207.106/32) || (dst net 87.0.214.83/32))),
	((dst port 14871) || (dst port 24523) || (dst port 45472) || (dst port 52375) || (dst port 65332)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.89.92/32) || (dst net 88.0.96.156/32) || (dst net 88.0.140.239/32) || (dst net 88.0.174.47/32) || (dst net 88.0.238.104/32))),
	((dst port 4980) || (dst port 13381) || (dst port 41126) || (dst port 46781) || (dst port 49661)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.10.219/32) || (dst net 89.0.102.242/32) || (dst net 89.0.127.181/32) || (dst net 89.0.181.191/32) || (dst net 89.0.231.213/32))),
	((dst port 16617) || (dst port 26320) || (dst port 38596) || (dst port 49416) || (dst port 56486)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.12.223/32) || (dst net 90.0.18.80/32) || (dst net 90.0.113.10/32) || (dst net 90.0.207.216/32) || (dst net 90.0.247.117/32))),
	((dst port 2668) || (dst port 13444) || (dst port 53319) || (dst port 58979) || (dst port 65062)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.50.43/32) || (dst net 91.0.54.139/32) || (dst net 91.0.154.97/32) || (dst net 91.0.175.1/32) || (dst net 91.0.235.190/32))),
	((dst port 9231) || (dst port 12368) || (dst port 12832) || (dst port 48958) || (dst port 50198)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.66.75/32) || (dst net 92.0.139.36/32) || (dst net 92.0.161.43/32) || (dst net 92.0.169.185/32) || (dst net 92.0.221.111/32))),
	((dst port 3766) || (dst port 23087) || (dst port 57298) || (dst port 64010) || (dst port 64707)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.51.182/32) || (dst net 93.0.65.23/32) || (dst net 93.0.122.235/32) || (dst net 93.0.168.142/32) || (dst net 93.0.172.188/32))),
	((dst port 1459) || (dst port 12655) || (dst port 20837) || (dst port 44095) || (dst port 46425)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.18.20/32) || (dst net 94.0.147.9/32) || (dst net 94.0.156.154/32) || (dst net 94.0.204.81/32) || (dst net 94.0.254.40/32))),
	((dst port 4662) || (dst port 10868) || (dst port 35492) || (dst port 42086) || (dst port 54183)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.6.98/32) || (dst net 95.0.29.230/32) || (dst net 95.0.140.194/32) || (dst net 95.0.216.156/32) || (dst net 95.0.251.120/32))),
	((dst port 4227) || (dst port 12416) || (dst port 18231) || (dst port 32714) || (dst port 33707)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.58.30/32) || (dst net 96.0.59.198/32) || (dst net 96.0.156.28/32) || (dst net 96.0.204.224/32) || (dst net 96.0.218.159/32))),
	((dst port 32839) || (dst port 33639) || (dst port 43637) || (dst port 51151) || (dst port 52041)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.88.29/32) || (dst net 97.0.123.135/32) || (dst net 97.0.206.77/32) || (dst net 97.0.225.47/32) || (dst net 97.0.235.92/32))),
	((dst port 14572) || (dst port 43968) || (dst port 49382) || (dst port 58303) || (dst port 61758)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.146.34/32) || (dst net 98.0.163.95/32) || (dst net 98.0.204.124/32) || (dst net 98.0.224.59/32) || (dst net 98.0.245.30/32))),
	((dst port 4134) || (dst port 17849) || (dst port 34930) || (dst port 41131) || (dst port 44655)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.5.116/32) || (dst net 99.0.37.72/32) || (dst net 99.0.147.13/32) || (dst net 99.0.167.113/32) || (dst net 99.0.193.204/32))),
	((dst port 3933) || (dst port 8068) || (dst port 33620) || (dst port 40357) || (dst port 61568)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.38.215/32) || (dst net 100.0.57.223/32) || (dst net 100.0.93.142/32) || (dst net 100.0.106.59/32) || (dst net 100.0.252.17/32))),
	((dst port 10289) || (dst port 18478) || (dst port 46758) || (dst port 51195) || (dst port 64602)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.39.125/32) || (dst net 101.0.132.64/32) || (dst net 101.0.153.227/32) || (dst net 101.0.189.32/32) || (dst net 101.0.215.170/32))),
	((dst port 5523) || (dst port 20920) || (dst port 37342) || (dst port 56195) || (dst port 65205)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.25.66/32) || (dst net 102.0.54.187/32) || (dst net 102.0.65.97/32) || (dst net 102.0.97.212/32) || (dst net 102.0.160.59/32))),
	((dst port 13771) || (dst port 15366) || (dst port 37340) || (dst port 44224) || (dst port 55271)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.99.8/32) || (dst net 103.0.118.152/32) || (dst net 103.0.124.88/32) || (dst net 103.0.140.222/32) || (dst net 103.0.185.164/32))),
	((dst port 28893) || (dst port 41809) || (dst port 46507) || (dst port 63887) || (dst port 64832)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.37.128/32) || (dst net 104.0.74.149/32) || (dst net 104.0.102.156/32) || (dst net 104.0.142.147/32) || (dst net 104.0.240.184/32))),
	((dst port 13358) || (dst port 29674) || (dst port 50220) || (dst port 52536) || (dst port 54483)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.5.235/32) || (dst net 105.0.62.196/32) || (dst net 105.0.155.32/32) || (dst net 105.0.196.144/32) || (dst net 105.0.200.94/32))),
	((dst port 12815) || (dst port 17572) || (dst port 18651) || (dst port 45302) || (dst port 46763)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.63.22/32) || (dst net 106.0.132.116/32) || (dst net 106.0.176.36/32) || (dst net 106.0.194.79/32) || (dst net 106.0.198.44/32))),
	((dst port 7934) || (dst port 17723) || (dst port 41231) || (dst port 43177) || (dst port 58993)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.19.160/32) || (dst net 107.0.108.237/32) || (dst net 107.0.137.246/32) || (dst net 107.0.150.245/32) || (dst net 107.0.151.188/32))),
	((dst port 4584) || (dst port 44425) || (dst port 46897) || (dst port 47619) || (dst port 52614)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.0.105/32) || (dst net 108.0.39.250/32) || (dst net 108.0.128.24/32) || (dst net 108.0.129.0/32) || (dst net 108.0.160.210/32))),
	((dst port 18162) || (dst port 25039) || (dst port 36861) || (dst port 44448) || (dst port 60626)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.63.29/32) || (dst net 109.0.120.178/32) || (dst net 109.0.148.237/32) || (dst net 109.0.176.117/32) || (dst net 109.0.211.50/32))),
	((dst port 14842) || (dst port 21307) || (dst port 23132) || (dst port 37314) || (dst port 39429)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.17.60/32) || (dst net 110.0.47.222/32) || (dst net 110.0.92.82/32) || (dst net 110.0.134.23/32) || (dst net 110.0.165.145/32))),
	((dst port 1096) || (dst port 18589) || (dst port 20210) || (dst port 34959) || (dst port 45789)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.25.130/32) || (dst net 111.0.55.101/32) || (dst net 111.0.180.230/32) || (dst net 111.0.191.1/32) || (dst net 111.0.194.9/32))),
	((dst port 11153) || (dst port 25769) || (dst port 33546) || (dst port 37129) || (dst port 54438)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.68.246/32) || (dst net 112.0.75.9/32) || (dst net 112.0.89.99/32) || (dst net 112.0.113.62/32) || (dst net 112.0.126.153/32))),
	((dst port 22689) || (dst port 29615) || (dst port 41817) || (dst port 44868) || (dst port 60128)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.10.201/32) || (dst net 113.0.14.1/32) || (dst net 113.0.99.62/32) || (dst net 113.0.131.206/32) || (dst net 113.0.173.183/32))),
	((dst port 8710) || (dst port 27936) || (dst port 28323) || (dst port 35336) || (dst port 43465)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.79.199/32) || (dst net 114.0.161.77/32) || (dst net 114.0.170.182/32) || (dst net 114.0.186.155/32) || (dst net 114.0.204.175/32))),
	((dst port 8382) || (dst port 22254) || (dst port 22746) || (dst port 38748) || (dst port 53022)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.46.98/32) || (dst net 115.0.48.94/32) || (dst net 115.0.127.80/32) || (dst net 115.0.155.45/32) || (dst net 115.0.238.147/32))),
	((dst port 13676) || (dst port 24813) || (dst port 28445) || (dst port 31512) || (dst port 56608)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.49.181/32) || (dst net 116.0.74.93/32) || (dst net 116.0.77.84/32) || (dst net 116.0.130.100/32) || (dst net 116.0.165.183/32))),
	((dst port 11735) || (dst port 25947) || (dst port 30136) || (dst port 30390) || (dst port 33080)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.17.9/32) || (dst net 117.0.30.95/32) || (dst net 117.0.137.59/32) || (dst net 117.0.191.58/32) || (dst net 117.0.238.241/32))),
	((dst port 30165) || (dst port 55212) || (dst port 56291) || (dst port 56950) || (dst port 57715)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.97.2/32) || (dst net 118.0.135.80/32) || (dst net 118.0.156.180/32) || (dst net 118.0.201.116/32) || (dst net 118.0.222.66/32))),
	((dst port 10698) || (dst port 37152) || (dst port 40935) || (dst port 53953) || (dst port 55935)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.5.253/32) || (dst net 119.0.70.70/32) || (dst net 119.0.131.216/32) || (dst net 119.0.144.164/32) || (dst net 119.0.202.215/32))),
	((dst port 6971) || (dst port 14937) || (dst port 20352) || (dst port 23935) || (dst port 58871)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.25.113/32) || (dst net 120.0.42.76/32) || (dst net 120.0.164.196/32) || (dst net 120.0.168.104/32) || (dst net 120.0.209.96/32))),
	((dst port 9555) || (dst port 11154) || (dst port 15143) || (dst port 28002) || (dst port 43370)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.9.6/32) || (dst net 121.0.124.121/32) || (dst net 121.0.147.52/32) || (dst net 121.0.176.133/32) || (dst net 121.0.204.146/32))),
	((dst port 7799) || (dst port 14019) || (dst port 17002) || (dst port 28744) || (dst port 36596)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.25.109/32) || (dst net 122.0.76.39/32) || (dst net 122.0.96.206/32) || (dst net 122.0.113.159/32) || (dst net 122.0.150.25/32))),
	((dst port 8097) || (dst port 25999) || (dst port 29981) || (dst port 30638) || (dst port 48401)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.31.6/32) || (dst net 123.0.56.61/32) || (dst net 123.0.67.210/32) || (dst net 123.0.118.48/32) || (dst net 123.0.212.130/32))),
	((dst port 36296) || (dst port 43629) || (dst port 46029) || (dst port 62499) || (dst port 65463)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.38.21/32) || (dst net 124.0.42.202/32) || (dst net 124.0.52.245/32) || (dst net 124.0.69.197/32) || (dst net 124.0.105.15/32))),
	((dst port 5066) || (dst port 17644) || (dst port 22810) || (dst port 34452) || (dst port 38778)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.40.193/32) || (dst net 125.0.132.46/32) || (dst net 125.0.163.200/32) || (dst net 125.0.164.95/32) || (dst net 125.0.168.215/32))),
	((dst port 39800) || (dst port 41001) || (dst port 47720) || (dst port 57035) || (dst port 60366)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.148.29/32) || (dst net 126.0.169.253/32) || (dst net 126.0.202.172/32) || (dst net 126.0.203.19/32) || (dst net 126.0.246.139/32))),
	((dst port 3375) || (dst port 27372) || (dst port 30004) || (dst port 37494) || (dst port 47526)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.1.43/32) || (dst net 127.0.57.18/32) || (dst net 127.0.144.17/32) || (dst net 127.0.202.55/32) || (dst net 127.0.220.198/32))),
	((dst port 21682) || (dst port 30306) || (dst port 36242) || (dst port 53004) || (dst port 58015)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.21.158/32) || (dst net 128.0.24.97/32) || (dst net 128.0.67.135/32) || (dst net 128.0.74.167/32) || (dst net 128.0.165.194/32))),
	((dst port 37460) || (dst port 43060) || (dst port 53132) || (dst port 53160) || (dst port 61227)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.70.136/32) || (dst net 129.0.118.24/32) || (dst net 129.0.139.132/32) || (dst net 129.0.159.172/32) || (dst net 129.0.240.142/32))),
	((dst port 8709) || (dst port 33785) || (dst port 34454) || (dst port 43562) || (dst port 48761)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.50.58/32) || (dst net 130.0.91.126/32) || (dst net 130.0.148.88/32) || (dst net 130.0.151.0/32) || (dst net 130.0.255.188/32))),
	((dst port 9458) || (dst port 37657) || (dst port 46106) || (dst port 46193) || (dst port 59406)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.16.231/32) || (dst net 131.0.166.31/32) || (dst net 131.0.188.46/32) || (dst net 131.0.238.7/32) || (dst net 131.0.244.227/32))),
	((dst port 8137) || (dst port 26270) || (dst port 30726) || (dst port 43382) || (dst port 61701)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.17.213/32) || (dst net 132.0.42.122/32) || (dst net 132.0.172.121/32) || (dst net 132.0.203.232/32) || (dst net 132.0.221.178/32))),
	((dst port 1779) || (dst port 20566) || (dst port 21776) || (dst port 29224) || (dst port 39127)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.122.187/32) || (dst net 133.0.177.241/32) || (dst net 133.0.193.168/32) || (dst net 133.0.218.42/32) || (dst net 133.0.250.136/32))),
	((dst port 17908) || (dst port 28352) || (dst port 29263) || (dst port 43553) || (dst port 64587)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.14.58/32) || (dst net 134.0.21.205/32) || (dst net 134.0.30.109/32) || (dst net 134.0.107.76/32) || (dst net 134.0.149.234/32))),
	((dst port 19995) || (dst port 28060) || (dst port 47459) || (dst port 51142) || (dst port 55696)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.6.89/32) || (dst net 135.0.71.12/32) || (dst net 135.0.98.254/32) || (dst net 135.0.194.12/32) || (dst net 135.0.227.55/32))),
	((dst port 6680) || (dst port 8265) || (dst port 10798) || (dst port 16980) || (dst port 36168)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.92.81/32) || (dst net 136.0.100.80/32) || (dst net 136.0.184.227/32) || (dst net 136.0.196.182/32) || (dst net 136.0.231.129/32))),
	((dst port 187) || (dst port 1361) || (dst port 13169) || (dst port 14401) || (dst port 22545)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.16.82/32) || (dst net 137.0.100.58/32) || (dst net 137.0.116.159/32) || (dst net 137.0.119.131/32) || (dst net 137.0.179.54/32))),
	((dst port 25657) || (dst port 27191) || (dst port 49076) || (dst port 54137) || (dst port 54723)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.120.92/32) || (dst net 138.0.140.194/32) || (dst net 138.0.162.78/32) || (dst net 138.0.186.44/32) || (dst net 138.0.205.192/32))),
	((dst port 22610) || (dst port 25898) || (dst port 29427) || (dst port 35387) || (dst port 43585)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.24.225/32) || (dst net 139.0.34.213/32) || (dst net 139.0.62.46/32) || (dst net 139.0.70.228/32) || (dst net 139.0.247.88/32))),
	((dst port 7215) || (dst port 12903) || (dst port 27367) || (dst port 33498) || (dst port 37970)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.32.51/32) || (dst net 140.0.36.81/32) || (dst net 140.0.52.114/32) || (dst net 140.0.99.186/32) || (dst net 140.0.226.32/32))),
	((dst port 2751) || (dst port 40764) || (dst port 55005) || (dst port 57119) || (dst port 62894)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.124.102/32) || (dst net 141.0.127.136/32) || (dst net 141.0.187.164/32) || (dst net 141.0.217.9/32) || (dst net 141.0.239.207/32))),
	((dst port 20894) || (dst port 23840) || (dst port 34316) || (dst port 45956) || (dst port 52336)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.43.189/32) || (dst net 142.0.117.154/32) || (dst net 142.0.164.88/32) || (dst net 142.0.205.224/32) || (dst net 142.0.208.142/32))),
	((dst port 12641) || (dst port 38693) || (dst port 39476) || (dst port 51925) || (dst port 60839)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.16.242/32) || (dst net 143.0.52.76/32) || (dst net 143.0.77.186/32) || (dst net 143.0.98.181/32) || (dst net 143.0.210.5/32))),
	((dst port 4514) || (dst port 9304) || (dst port 24020) || (dst port 46868) || (dst port 59281)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.28.154/32) || (dst net 144.0.155.211/32) || (dst net 144.0.175.70/32) || (dst net 144.0.215.174/32) || (dst net 144.0.230.249/32))),
	((dst port 4779) || (dst port 20842) || (dst port 33938) || (dst port 42024) || (dst port 48140)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.20.119/32) || (dst net 145.0.93.180/32) || (dst net 145.0.147.155/32) || (dst net 145.0.167.142/32) || (dst net 145.0.191.149/32))),
	((dst port 4302) || (dst port 25076) || (dst port 28814) || (dst port 50816) || (dst port 55326)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.0.96/32) || (dst net 146.0.20.89/32) || (dst net 146.0.25.79/32) || (dst net 146.0.171.252/32) || (dst net 146.0.186.133/32))),
	((dst port 147) || (dst port 12518) || (dst port 15792) || (dst port 37633) || (dst port 62154)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.8.20/32) || (dst net 147.0.54.50/32) || (dst net 147.0.54.131/32) || (dst net 147.0.151.226/32) || (dst net 147.0.189.57/32))),
	((dst port 1576) || (dst port 18010) || (dst port 23187) || (dst port 42194) || (dst port 56662)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.34.166/32) || (dst net 148.0.148.147/32) || (dst net 148.0.178.207/32) || (dst net 148.0.185.71/32) || (dst net 148.0.246.112/32))),
	((dst port 18961) || (dst port 33094) || (dst port 55874) || (dst port 58701) || (dst port 61165)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.74.228/32) || (dst net 149.0.169.109/32) || (dst net 149.0.185.87/32) || (dst net 149.0.213.158/32) || (dst net 149.0.221.255/32))),
	((dst port 2235) || (dst port 10972) || (dst port 39946) || (dst port 40238) || (dst port 58817)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.37.212/32) || (dst net 150.0.76.137/32) || (dst net 150.0.162.69/32) || (dst net 150.0.168.130/32) || (dst net 150.0.204.134/32))),
	((dst port 8155) || (dst port 14899) || (dst port 30544) || (dst port 61334) || (dst port 62184)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.32.142/32) || (dst net 151.0.34.20/32) || (dst net 151.0.78.40/32) || (dst net 151.0.84.30/32) || (dst net 151.0.137.35/32))),
	((dst port 13417) || (dst port 29543) || (dst port 41410) || (dst port 43301) || (dst port 55612)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.18.214/32) || (dst net 152.0.48.128/32) || (dst net 152.0.174.240/32) || (dst net 152.0.226.146/32) || (dst net 152.0.247.52/32))),
	((dst port 2303) || (dst port 18469) || (dst port 35063) || (dst port 45637) || (dst port 51559)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.55.73/32) || (dst net 153.0.72.99/32) || (dst net 153.0.138.199/32) || (dst net 153.0.157.38/32) || (dst net 153.0.236.151/32))),
	((dst port 3224) || (dst port 12007) || (dst port 17181) || (dst port 34266) || (dst port 60092)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.30.68/32) || (dst net 154.0.127.246/32) || (dst net 154.0.128.102/32) || (dst net 154.0.192.168/32) || (dst net 154.0.246.82/32))),
	((dst port 2633) || (dst port 26788) || (dst port 29661) || (dst port 32899) || (dst port 46717)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.5.59/32) || (dst net 155.0.40.39/32) || (dst net 155.0.94.106/32) || (dst net 155.0.122.81/32) || (dst net 155.0.154.125/32))),
	((dst port 5711) || (dst port 23740) || (dst port 24437) || (dst port 50294) || (dst port 55303)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.92.86/32) || (dst net 156.0.93.182/32) || (dst net 156.0.108.37/32) || (dst net 156.0.232.192/32) || (dst net 156.0.238.170/32))),
	((dst port 738) || (dst port 22957) || (dst port 25072) || (dst port 30428) || (dst port 51236)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.1.201/32) || (dst net 157.0.60.32/32) || (dst net 157.0.123.159/32) || (dst net 157.0.125.115/32) || (dst net 157.0.205.66/32))),
	((dst port 770) || (dst port 19929) || (dst port 44877) || (dst port 48200) || (dst port 60757)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.32.239/32) || (dst net 158.0.63.138/32) || (dst net 158.0.86.217/32) || (dst net 158.0.123.122/32) || (dst net 158.0.207.200/32))),
	((dst port 22474) || (dst port 26053) || (dst port 27140) || (dst port 32121) || (dst port 35479)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.12.27/32) || (dst net 159.0.91.198/32) || (dst net 159.0.159.23/32) || (dst net 159.0.193.210/32) || (dst net 159.0.237.173/32))),
	((dst port 488) || (dst port 4687) || (dst port 5318) || (dst port 15976) || (dst port 20094)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.33.209/32) || (dst net 160.0.44.202/32) || (dst net 160.0.77.78/32) || (dst net 160.0.110.134/32) || (dst net 160.0.123.36/32))),
	((dst port 4963) || (dst port 33835) || (dst port 39092) || (dst port 57858) || (dst port 61762)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.5.247/32) || (dst net 161.0.132.181/32) || (dst net 161.0.198.203/32) || (dst net 161.0.210.159/32) || (dst net 161.0.240.61/32))),
	((dst port 1954) || (dst port 2754) || (dst port 15324) || (dst port 22206) || (dst port 51114)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.9.222/32) || (dst net 162.0.30.162/32) || (dst net 162.0.75.254/32) || (dst net 162.0.198.168/32) || (dst net 162.0.254.187/32))),
	((dst port 28009) || (dst port 32566) || (dst port 45233) || (dst port 59269) || (dst port 60803)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.18.22/32) || (dst net 163.0.79.249/32) || (dst net 163.0.100.60/32) || (dst net 163.0.150.145/32) || (dst net 163.0.195.0/32))),
	((dst port 47264) || (dst port 50197) || (dst port 51908) || (dst port 57114) || (dst port 60946)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.24.220/32) || (dst net 164.0.34.40/32) || (dst net 164.0.42.138/32) || (dst net 164.0.103.234/32) || (dst net 164.0.196.131/32))),
	((dst port 14352) || (dst port 24351) || (dst port 47906) || (dst port 49912) || (dst port 50533)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.2.25/32) || (dst net 165.0.62.18/32) || (dst net 165.0.148.228/32) || (dst net 165.0.172.20/32) || (dst net 165.0.206.119/32))),
	((dst port 16135) || (dst port 35246) || (dst port 47743) || (dst port 50280) || (dst port 62399)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.80.104/32) || (dst net 166.0.180.178/32) || (dst net 166.0.235.59/32) || (dst net 166.0.252.81/32) || (dst net 166.0.254.105/32))),
	((dst port 20833) || (dst port 25536) || (dst port 43316) || (dst port 43880) || (dst port 61528)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.56.73/32) || (dst net 167.0.68.247/32) || (dst net 167.0.81.249/32) || (dst net 167.0.152.251/32) || (dst net 167.0.166.223/32))),
	((dst port 17741) || (dst port 44033) || (dst port 54989) || (dst port 62687) || (dst port 63623)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.16.86/32) || (dst net 168.0.124.191/32) || (dst net 168.0.193.83/32) || (dst net 168.0.204.99/32) || (dst net 168.0.229.123/32))),
	((dst port 430) || (dst port 26028) || (dst port 28543) || (dst port 40550) || (dst port 60498)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.27.244/32) || (dst net 169.0.37.148/32) || (dst net 169.0.50.77/32) || (dst net 169.0.60.20/32) || (dst net 169.0.99.10/32))),
	((dst port 10857) || (dst port 19900) || (dst port 29059) || (dst port 43591) || (dst port 55708)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.5.43/32) || (dst net 170.0.45.63/32) || (dst net 170.0.71.108/32) || (dst net 170.0.230.162/32) || (dst net 170.0.241.90/32))),
	((dst port 1891) || (dst port 10066) || (dst port 12185) || (dst port 54588) || (dst port 62590)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.17.186/32) || (dst net 171.0.88.57/32) || (dst net 171.0.207.24/32) || (dst net 171.0.207.148/32) || (dst net 171.0.254.81/32))),
	((dst port 5241) || (dst port 7130) || (dst port 11461) || (dst port 15196) || (dst port 52709)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.49.232/32) || (dst net 172.0.103.199/32) || (dst net 172.0.134.84/32) || (dst net 172.0.202.17/32) || (dst net 172.0.216.223/32))),
	((dst port 1932) || (dst port 13542) || (dst port 20649) || (dst port 32393) || (dst port 41306)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.96.167/32) || (dst net 173.0.110.92/32) || (dst net 173.0.136.247/32) || (dst net 173.0.167.22/32) || (dst net 173.0.221.3/32))),
	((dst port 14207) || (dst port 25387) || (dst port 28757) || (dst port 33163) || (dst port 40169)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.23.114/32) || (dst net 174.0.55.140/32) || (dst net 174.0.190.205/32) || (dst net 174.0.205.123/32) || (dst net 174.0.238.151/32))),
	((dst port 10614) || (dst port 12119) || (dst port 43315) || (dst port 60828) || (dst port 64370)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.46.16/32) || (dst net 175.0.66.46/32) || (dst net 175.0.68.194/32) || (dst net 175.0.202.30/32) || (dst net 175.0.221.75/32))),
	((dst port 8746) || (dst port 17212) || (dst port 17727) || (dst port 34355) || (dst port 38871)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.5.131/32) || (dst net 176.0.21.63/32) || (dst net 176.0.91.243/32) || (dst net 176.0.98.68/32) || (dst net 176.0.242.128/32))),
	((dst port 20121) || (dst port 20346) || (dst port 23393) || (dst port 25351) || (dst port 44197)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.1.183/32) || (dst net 177.0.33.132/32) || (dst net 177.0.151.24/32) || (dst net 177.0.155.133/32) || (dst net 177.0.203.201/32))),
	((dst port 14104) || (dst port 22060) || (dst port 39317) || (dst port 60100) || (dst port 62440)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.41.182/32) || (dst net 178.0.46.128/32) || (dst net 178.0.134.130/32) || (dst net 178.0.168.38/32) || (dst net 178.0.196.81/32))),
	((dst port 12762) || (dst port 30196) || (dst port 47771) || (dst port 57412) || (dst port 63108)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.28.4/32) || (dst net 179.0.108.254/32) || (dst net 179.0.157.94/32) || (dst net 179.0.165.173/32) || (dst net 179.0.199.150/32))),
	((dst port 4960) || (dst port 23758) || (dst port 29504) || (dst port 57170) || (dst port 58298)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.0.50/32) || (dst net 180.0.2.82/32) || (dst net 180.0.84.149/32) || (dst net 180.0.139.235/32) || (dst net 180.0.219.46/32))),
	((dst port 2724) || (dst port 5767) || (dst port 37633) || (dst port 49874) || (dst port 61922)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.80.96/32) || (dst net 181.0.98.127/32) || (dst net 181.0.107.147/32) || (dst net 181.0.132.228/32) || (dst net 181.0.252.72/32))),
	((dst port 6443) || (dst port 18961) || (dst port 25597) || (dst port 27870) || (dst port 36711)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.107.239/32) || (dst net 182.0.109.126/32) || (dst net 182.0.192.208/32) || (dst net 182.0.216.235/32) || (dst net 182.0.244.67/32))),
	((dst port 3775) || (dst port 4182) || (dst port 10019) || (dst port 32162) || (dst port 35785)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.85.130/32) || (dst net 183.0.97.156/32) || (dst net 183.0.128.12/32) || (dst net 183.0.187.152/32) || (dst net 183.0.187.235/32))),
	((dst port 3076) || (dst port 9992) || (dst port 27573) || (dst port 31532) || (dst port 39244)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.23.120/32) || (dst net 184.0.35.124/32) || (dst net 184.0.106.160/32) || (dst net 184.0.198.61/32) || (dst net 184.0.221.119/32))),
	((dst port 7855) || (dst port 16177) || (dst port 33586) || (dst port 39977) || (dst port 51593)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.17.236/32) || (dst net 185.0.23.88/32) || (dst net 185.0.34.113/32) || (dst net 185.0.150.118/32) || (dst net 185.0.231.124/32))),
	((dst port 10159) || (dst port 22133) || (dst port 26217) || (dst port 27702) || (dst port 42595)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.90.3/32) || (dst net 186.0.118.155/32) || (dst net 186.0.122.175/32) || (dst net 186.0.161.198/32) || (dst net 186.0.222.129/32))),
	((dst port 2659) || (dst port 17624) || (dst port 38230) || (dst port 49575) || (dst port 60087)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.2.178/32) || (dst net 187.0.20.167/32) || (dst net 187.0.60.126/32) || (dst net 187.0.92.152/32) || (dst net 187.0.122.202/32))),
	((dst port 6837) || (dst port 21393) || (dst port 33318) || (dst port 57384) || (dst port 61673)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.3.123/32) || (dst net 188.0.3.177/32) || (dst net 188.0.42.119/32) || (dst net 188.0.93.153/32) || (dst net 188.0.179.197/32))),
	((dst port 17924) || (dst port 29580) || (dst port 49647) || (dst port 54414) || (dst port 65508)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.41.45/32) || (dst net 189.0.89.25/32) || (dst net 189.0.100.151/32) || (dst net 189.0.116.178/32) || (dst net 189.0.220.74/32))),
	((dst port 7726) || (dst port 27992) || (dst port 32358) || (dst port 44662) || (dst port 52273)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.2.12/32) || (dst net 190.0.17.105/32) || (dst net 190.0.85.42/32) || (dst net 190.0.148.150/32) || (dst net 190.0.195.19/32))),
	((dst port 27351) || (dst port 33774) || (dst port 43207) || (dst port 55944) || (dst port 64484)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.55.208/32) || (dst net 191.0.90.17/32) || (dst net 191.0.115.122/32) || (dst net 191.0.117.142/32) || (dst net 191.0.174.75/32))),
	((dst port 10079) || (dst port 23074) || (dst port 24925) || (dst port 36554) || (dst port 59258)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.11.86/32) || (dst net 192.0.49.125/32) || (dst net 192.0.74.67/32) || (dst net 192.0.87.115/32) || (dst net 192.0.123.192/32))),
	((dst port 18957) || (dst port 24380) || (dst port 33469) || (dst port 37755) || (dst port 48507)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.38.156/32) || (dst net 193.0.42.86/32) || (dst net 193.0.156.153/32) || (dst net 193.0.195.187/32) || (dst net 193.0.251.42/32))),
	((dst port 9595) || (dst port 18961) || (dst port 35828) || (dst port 42801) || (dst port 46131)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.52.27/32) || (dst net 194.0.96.40/32) || (dst net 194.0.143.215/32) || (dst net 194.0.215.3/32) || (dst net 194.0.255.49/32))),
	((dst port 3065) || (dst port 6565) || (dst port 9689) || (dst port 34253) || (dst port 52274)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.58.155/32) || (dst net 195.0.78.190/32) || (dst net 195.0.137.219/32) || (dst net 195.0.175.180/32) || (dst net 195.0.253.252/32))),
	((dst port 8919) || (dst port 10777) || (dst port 32537) || (dst port 49933) || (dst port 59686)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.19.227/32) || (dst net 196.0.161.113/32) || (dst net 196.0.168.29/32) || (dst net 196.0.226.35/32) || (dst net 196.0.241.90/32))),
	((dst port 4679) || (dst port 10590) || (dst port 14074) || (dst port 16151) || (dst port 52210)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.8.255/32) || (dst net 197.0.94.181/32) || (dst net 197.0.114.137/32) || (dst net 197.0.177.77/32) || (dst net 197.0.184.72/32))),
	((dst port 2741) || (dst port 16143) || (dst port 50552) || (dst port 57925) || (dst port 65477)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.93.54/32) || (dst net 198.0.105.159/32) || (dst net 198.0.137.2/32) || (dst net 198.0.158.35/32) || (dst net 198.0.238.41/32))),
	((dst port 16778) || (dst port 23959) || (dst port 29568) || (dst port 43409) || (dst port 44521)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.21.60/32) || (dst net 199.0.24.118/32) || (dst net 199.0.135.46/32) || (dst net 199.0.208.170/32) || (dst net 199.0.234.102/32))),
	((dst port 7305) || (dst port 10361) || (dst port 14195) || (dst port 29359) || (dst port 33673)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.65.48/32) || (dst net 200.0.92.9/32) || (dst net 200.0.92.49/32) || (dst net 200.0.163.230/32) || (dst net 200.0.198.189/32))),
	((dst port 29848) || (dst port 33784) || (dst port 40151) || (dst port 62229) || (dst port 63746)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.41.195/32) || (dst net 201.0.86.146/32) || (dst net 201.0.124.91/32) || (dst net 201.0.143.67/32) || (dst net 201.0.211.248/32))),
	((dst port 11960) || (dst port 13205) || (dst port 23194) || (dst port 28189) || (dst port 40404)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.90.251/32) || (dst net 202.0.106.21/32) || (dst net 202.0.215.4/32) || (dst net 202.0.238.228/32) || (dst net 202.0.252.126/32))),
	((dst port 13455) || (dst port 25821) || (dst port 38851) || (dst port 45493) || (dst port 56084)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.24.178/32) || (dst net 203.0.71.46/32) || (dst net 203.0.91.77/32) || (dst net 203.0.148.125/32) || (dst net 203.0.238.90/32))),
	((dst port 19596) || (dst port 20992) || (dst port 25524) || (dst port 38972) || (dst port 49087)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.100.123/32) || (dst net 204.0.123.251/32) || (dst net 204.0.152.150/32) || (dst net 204.0.180.2/32) || (dst net 204.0.181.7/32))),
	((dst port 3236) || (dst port 24869) || (dst port 43092) || (dst port 59409) || (dst port 65372)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.47.83/32) || (dst net 205.0.56.220/32) || (dst net 205.0.101.169/32) || (dst net 205.0.117.168/32) || (dst net 205.0.230.155/32))),
	((dst port 38287) || (dst port 45455) || (dst port 51663) || (dst port 56448) || (dst port 60459)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.0.225/32) || (dst net 206.0.98.152/32) || (dst net 206.0.164.196/32) || (dst net 206.0.182.66/32) || (dst net 206.0.217.1/32))),
	((dst port 1404) || (dst port 19324) || (dst port 46024) || (dst port 47158) || (dst port 64726)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.6.208/32) || (dst net 207.0.16.72/32) || (dst net 207.0.32.32/32) || (dst net 207.0.38.188/32) || (dst net 207.0.96.130/32))),
	((dst port 7380) || (dst port 13621) || (dst port 27210) || (dst port 50815) || (dst port 63511)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.16.215/32) || (dst net 208.0.154.236/32) || (dst net 208.0.180.108/32) || (dst net 208.0.207.200/32) || (dst net 208.0.247.181/32))),
	((dst port 2149) || (dst port 10104) || (dst port 20702) || (dst port 37657) || (dst port 65532)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.59.192/32) || (dst net 209.0.147.90/32) || (dst net 209.0.175.178/32) || (dst net 209.0.200.166/32) || (dst net 209.0.210.216/32))),
	((dst port 3144) || (dst port 9839) || (dst port 14128) || (dst port 20811) || (dst port 27847)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.46.175/32) || (dst net 210.0.91.184/32) || (dst net 210.0.130.152/32) || (dst net 210.0.162.198/32) || (dst net 210.0.207.165/32))),
	((dst port 5906) || (dst port 45677) || (dst port 50639) || (dst port 58390) || (dst port 61411)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.21.251/32) || (dst net 211.0.28.203/32) || (dst net 211.0.59.198/32) || (dst net 211.0.59.220/32) || (dst net 211.0.106.133/32))),
	((dst port 11630) || (dst port 25777) || (dst port 29697) || (dst port 41500) || (dst port 56246)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.69.228/32) || (dst net 212.0.120.108/32) || (dst net 212.0.134.195/32) || (dst net 212.0.136.27/32) || (dst net 212.0.253.27/32))),
	((dst port 3591) || (dst port 6483) || (dst port 15286) || (dst port 23070) || (dst port 46833)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.7.84/32) || (dst net 213.0.36.119/32) || (dst net 213.0.43.151/32) || (dst net 213.0.85.233/32) || (dst net 213.0.178.224/32))),
	((dst port 4758) || (dst port 11494) || (dst port 12542) || (dst port 39746) || (dst port 54206)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.0.27/32) || (dst net 214.0.14.29/32) || (dst net 214.0.146.209/32) || (dst net 214.0.149.121/32) || (dst net 214.0.202.248/32))),
	((dst port 28636) || (dst port 31431) || (dst port 49134) || (dst port 49690) || (dst port 54898)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.19.87/32) || (dst net 215.0.53.201/32) || (dst net 215.0.97.83/32) || (dst net 215.0.109.184/32) || (dst net 215.0.125.250/32))),
	((dst port 10137) || (dst port 37666) || (dst port 42266) || (dst port 47025) || (dst port 59547)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.66.206/32) || (dst net 216.0.93.247/32) || (dst net 216.0.133.54/32) || (dst net 216.0.217.119/32) || (dst net 216.0.219.218/32))),
	((dst port 11072) || (dst port 16655) || (dst port 21595) || (dst port 27270) || (dst port 30338)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.67.18/32) || (dst net 217.0.87.214/32) || (dst net 217.0.94.106/32) || (dst net 217.0.163.15/32) || (dst net 217.0.242.69/32))),
	((dst port 15158) || (dst port 28714) || (dst port 29491) || (dst port 48233) || (dst port 59719)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.4.164/32) || (dst net 218.0.8.12/32) || (dst net 218.0.42.90/32) || (dst net 218.0.83.15/32) || (dst net 218.0.227.9/32))),
	((dst port 23871) || (dst port 33342) || (dst port 33720) || (dst port 38933) || (dst port 44408)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.19.7/32) || (dst net 219.0.36.47/32) || (dst net 219.0.57.117/32) || (dst net 219.0.241.164/32) || (dst net 219.0.249.82/32))),
	((dst port 6563) || (dst port 12116) || (dst port 13617) || (dst port 20605) || (dst port 62442)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.20.185/32) || (dst net 220.0.34.97/32) || (dst net 220.0.76.73/32) || (dst net 220.0.90.134/32) || (dst net 220.0.165.185/32))),
	((dst port 1374) || (dst port 27081) || (dst port 35078) || (dst port 38555) || (dst port 51077)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.42.219/32) || (dst net 221.0.50.196/32) || (dst net 221.0.179.110/32) || (dst net 221.0.210.205/32) || (dst net 221.0.223.143/32))),
	((dst port 13342) || (dst port 18199) || (dst port 18680) || (dst port 39914) || (dst port 55166)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.12.75/32) || (dst net 222.0.46.168/32) || (dst net 222.0.68.114/32) || (dst net 222.0.175.137/32) || (dst net 222.0.179.233/32))),
	((dst port 7141) || (dst port 9877) || (dst port 18842) || (dst port 22666) || (dst port 63023)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.24.110/32) || (dst net 223.0.160.62/32) || (dst net 223.0.170.95/32) || (dst net 223.0.244.47/32) || (dst net 223.0.248.219/32))),
	((dst port 21866) || (dst port 30783) || (dst port 37237) || (dst port 38264) || (dst port 46080)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.77.220/32) || (dst net 224.0.129.193/32) || (dst net 224.0.160.65/32) || (dst net 224.0.168.241/32) || (dst net 224.0.187.26/32))),
	((dst port 7755) || (dst port 27296) || (dst port 52909) || (dst port 54291) || (dst port 62401)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.10.141/32) || (dst net 225.0.34.164/32) || (dst net 225.0.96.75/32) || (dst net 225.0.107.201/32) || (dst net 225.0.214.124/32))),
	((dst port 6366) || (dst port 11811) || (dst port 49010) || (dst port 50067) || (dst port 55801)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.14.124/32) || (dst net 226.0.27.120/32) || (dst net 226.0.56.68/32) || (dst net 226.0.115.226/32) || (dst net 226.0.153.127/32))),
	((dst port 1472) || (dst port 6326) || (dst port 22260) || (dst port 33886) || (dst port 43639)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.43.3/32) || (dst net 227.0.67.146/32) || (dst net 227.0.130.75/32) || (dst net 227.0.234.91/32) || (dst net 227.0.240.160/32))),
	((dst port 30078) || (dst port 30367) || (dst port 49967) || (dst port 57389) || (dst port 63307)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.6.236/32) || (dst net 228.0.18.185/32) || (dst net 228.0.91.11/32) || (dst net 228.0.133.142/32) || (dst net 228.0.187.56/32))),
	((dst port 13635) || (dst port 39013) || (dst port 45196) || (dst port 52775) || (dst port 61167)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.88.61/32) || (dst net 229.0.101.203/32) || (dst net 229.0.200.192/32) || (dst net 229.0.227.139/32) || (dst net 229.0.249.46/32))),
	((dst port 11475) || (dst port 26633) || (dst port 34649) || (dst port 44704) || (dst port 63058)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.27.72/32) || (dst net 230.0.33.22/32) || (dst net 230.0.45.97/32) || (dst net 230.0.47.233/32) || (dst net 230.0.94.66/32))),
	((dst port 1656) || (dst port 2532) || (dst port 26255) || (dst port 37280) || (dst port 47160)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.50.242/32) || (dst net 231.0.155.138/32) || (dst net 231.0.198.248/32) || (dst net 231.0.200.229/32) || (dst net 231.0.221.93/32))),
	((dst port 4972) || (dst port 19233) || (dst port 25247) || (dst port 42951) || (dst port 51637)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.27.45/32) || (dst net 232.0.69.118/32) || (dst net 232.0.71.143/32) || (dst net 232.0.78.28/32) || (dst net 232.0.126.102/32))),
	((dst port 13063) || (dst port 14614) || (dst port 35150) || (dst port 38513) || (dst port 63664)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.61.34/32) || (dst net 233.0.96.41/32) || (dst net 233.0.101.182/32) || (dst net 233.0.141.214/32) || (dst net 233.0.171.250/32))),
	((dst port 11124) || (dst port 40994) || (dst port 47466) || (dst port 52555) || (dst port 59549)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.32.173/32) || (dst net 234.0.67.137/32) || (dst net 234.0.168.65/32) || (dst net 234.0.226.8/32) || (dst net 234.0.231.122/32))),
	((dst port 16346) || (dst port 44808) || (dst port 56298) || (dst port 60717) || (dst port 65410)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.2.10/32) || (dst net 235.0.43.176/32) || (dst net 235.0.52.162/32) || (dst net 235.0.101.184/32) || (dst net 235.0.129.76/32))),
	((dst port 819) || (dst port 7325) || (dst port 31328) || (dst port 37057) || (dst port 61273)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.53.253/32) || (dst net 236.0.81.24/32) || (dst net 236.0.143.96/32) || (dst net 236.0.182.7/32) || (dst net 236.0.235.200/32))),
	((dst port 15121) || (dst port 27166) || (dst port 53470) || (dst port 58862) || (dst port 64681)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.48.49/32) || (dst net 237.0.52.107/32) || (dst net 237.0.91.54/32) || (dst net 237.0.244.188/32) || (dst net 237.0.251.151/32))),
	((dst port 31966) || (dst port 37879) || (dst port 38255) || (dst port 41294) || (dst port 62611)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.27.54/32) || (dst net 238.0.63.84/32) || (dst net 238.0.80.250/32) || (dst net 238.0.153.62/32) || (dst net 238.0.164.227/32))),
	((dst port 24168) || (dst port 35878) || (dst port 46894) || (dst port 58040) || (dst port 65072)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.5.163/32) || (dst net 239.0.33.63/32) || (dst net 239.0.208.6/32) || (dst net 239.0.226.210/32) || (dst net 239.0.245.102/32))),
	((dst port 19886) || (dst port 21523) || (dst port 45466) || (dst port 49611) || (dst port 55919)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.11.102/32) || (dst net 240.0.79.136/32) || (dst net 240.0.102.249/32) || (dst net 240.0.132.193/32) || (dst net 240.0.224.1/32))),
	((dst port 3654) || (dst port 13835) || (dst port 47776) || (dst port 62542) || (dst port 64177)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.42.206/32) || (dst net 241.0.48.187/32) || (dst net 241.0.61.205/32) || (dst net 241.0.79.80/32) || (dst net 241.0.174.54/32))),
	((dst port 3841) || (dst port 8025) || (dst port 14903) || (dst port 29651) || (dst port 62547)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.8.82/32) || (dst net 242.0.20.50/32) || (dst net 242.0.73.95/32) || (dst net 242.0.112.236/32) || (dst net 242.0.230.72/32))),
	((dst port 8) || (dst port 16901) || (dst port 25481) || (dst port 40911) || (dst port 42321)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.24.203/32) || (dst net 243.0.127.39/32) || (dst net 243.0.162.236/32) || (dst net 243.0.176.31/32) || (dst net 243.0.192.181/32))),
	((dst port 2037) || (dst port 38166) || (dst port 38307) || (dst port 55079) || (dst port 64538)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.28.243/32) || (dst net 244.0.71.23/32) || (dst net 244.0.72.79/32) || (dst net 244.0.73.143/32) || (dst net 244.0.167.142/32))),
	((dst port 4447) || (dst port 36306) || (dst port 38242) || (dst port 55827) || (dst port 56930)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.65.72/32) || (dst net 245.0.114.70/32) || (dst net 245.0.147.38/32) || (dst net 245.0.165.255/32) || (dst net 245.0.233.78/32))),
	((dst port 5512) || (dst port 10732) || (dst port 27347) || (dst port 39981) || (dst port 48429)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.80.19/32) || (dst net 246.0.116.161/32) || (dst net 246.0.175.228/32) || (dst net 246.0.230.4/32) || (dst net 246.0.251.131/32))),
	((dst port 5262) || (dst port 14707) || (dst port 31184) || (dst port 42709) || (dst port 51937)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.38.203/32) || (dst net 247.0.77.188/32) || (dst net 247.0.233.147/32) || (dst net 247.0.234.244/32) || (dst net 247.0.246.42/32))),
	((dst port 4824) || (dst port 13791) || (dst port 29398) || (dst port 43172) || (dst port 53590)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.60.184/32) || (dst net 248.0.71.174/32) || (dst net 248.0.90.88/32) || (dst net 248.0.187.92/32) || (dst net 248.0.206.73/32))),
	((dst port 13037) || (dst port 23951) || (dst port 39836) || (dst port 45048) || (dst port 55450)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.11.25/32) || (dst net 249.0.58.94/32) || (dst net 249.0.74.190/32) || (dst net 249.0.184.11/32) || (dst net 249.0.254.140/32))),
	((dst port 15822) || (dst port 30193) || (dst port 33055) || (dst port 35732) || (dst port 65238)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.23.48/32) || (dst net 250.0.40.117/32) || (dst net 250.0.66.59/32) || (dst net 250.0.70.170/32) || (dst net 250.0.73.33/32))),
	((dst port 30889) || (dst port 41648) || (dst port 43263) || (dst port 52435) || (dst port 64062)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.16.71/32) || (dst net 251.0.33.15/32) || (dst net 251.0.87.116/32) || (dst net 251.0.177.14/32) || (dst net 251.0.213.177/32))),
	((dst port 12912) || (dst port 15442) || (dst port 16780) || (dst port 20087) || (dst port 28610)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.4.88/32) || (dst net 252.0.76.200/32) || (dst net 252.0.143.159/32) || (dst net 252.0.153.100/32) || (dst net 252.0.233.39/32))),
	((dst port 8018) || (dst port 12185) || (dst port 12763) || (dst port 14744) || (dst port 33804)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.22.26/32) || (dst net 253.0.34.239/32) || (dst net 253.0.122.104/32) || (dst net 253.0.126.146/32) || (dst net 253.0.252.247/32))),
	((dst port 21696) || (dst port 33908) || (dst port 43813) || (dst port 61160) || (dst port 64351)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.69.6/32) || (dst net 254.0.114.139/32) || (dst net 254.0.181.213/32) || (dst net 254.0.231.238/32) || (dst net 254.0.241.42/32))),
	((dst port 275) || (dst port 8615) || (dst port 24830) || (dst port 34744) || (dst port 50980)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.98.244/32) || (dst net 255.0.101.114/32) || (dst net 255.0.156.89/32) || (dst net 255.0.190.128/32) || (dst net 255.0.197.88/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 1309) || (dst port 2100) || (dst port 23856) || (dst port 34159) || (dst port 41078)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.27.159/32) || (dst net 1.0.126.190/32) || (dst net 1.0.136.109/32) || (dst net 1.0.193.148/32) || (dst net 1.0.201.145/32))),
	((dst port 3191) || (dst port 10078) || (dst port 28140) || (dst port 35103) || (dst port 58106)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.42.154/32) || (dst net 2.0.73.212/32) || (dst net 2.0.197.57/32) || (dst net 2.0.249.246/32) || (dst net 2.0.251.253/32))),
	((dst port 1698) || (dst port 30832) || (dst port 36209) || (dst port 41648) || (dst port 57637)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.35.187/32) || (dst net 3.0.95.163/32) || (dst net 3.0.141.205/32) || (dst net 3.0.184.111/32) || (dst net 3.0.246.204/32))),
	((dst port 20648) || (dst port 23549) || (dst port 40785) || (dst port 55811) || (dst port 62468)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.44.87/32) || (dst net 4.0.52.84/32) || (dst net 4.0.102.229/32) || (dst net 4.0.228.119/32) || (dst net 4.0.228.163/32))),
	((dst port 32122) || (dst port 41220) || (dst port 51367) || (dst port 59501) || (dst port 62776)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.0.72/32) || (dst net 5.0.10.132/32) || (dst net 5.0.46.222/32) || (dst net 5.0.166.147/32) || (dst net 5.0.200.163/32))),
	((dst port 1094) || (dst port 13182) || (dst port 15785) || (dst port 45498) || (dst port 58687)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.31.117/32) || (dst net 6.0.139.20/32) || (dst net 6.0.148.67/32) || (dst net 6.0.178.73/32) || (dst net 6.0.200.86/32))),
	((dst port 15680) || (dst port 16913) || (dst port 22344) || (dst port 25739) || (dst port 55884)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.9.242/32) || (dst net 7.0.37.100/32) || (dst net 7.0.149.104/32) || (dst net 7.0.186.117/32) || (dst net 7.0.187.209/32))),
	((dst port 14008) || (dst port 32926) || (dst port 35830) || (dst port 40336) || (dst port 51814)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.88.236/32) || (dst net 8.0.155.82/32) || (dst net 8.0.192.135/32) || (dst net 8.0.217.120/32) || (dst net 8.0.235.57/32))),
	((dst port 17901) || (dst port 25516) || (dst port 29937) || (dst port 39136) || (dst port 48910)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.37.94/32) || (dst net 9.0.64.100/32) || (dst net 9.0.95.80/32) || (dst net 9.0.123.60/32) || (dst net 9.0.152.200/32))),
	((dst port 7885) || (dst port 13452) || (dst port 19789) || (dst port 44708) || (dst port 53510)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.18.61/32) || (dst net 10.0.54.128/32) || (dst net 10.0.97.222/32) || (dst net 10.0.141.149/32) || (dst net 10.0.217.145/32))),
	((dst port 2988) || (dst port 27411) || (dst port 31380) || (dst port 39914) || (dst port 65450)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.19.48/32) || (dst net 11.0.31.163/32) || (dst net 11.0.37.58/32) || (dst net 11.0.206.148/32) || (dst net 11.0.233.166/32))),
	((dst port 11487) || (dst port 14693) || (dst port 58185) || (dst port 61958) || (dst port 64480)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.26.57/32) || (dst net 12.0.43.106/32) || (dst net 12.0.85.174/32) || (dst net 12.0.139.185/32) || (dst net 12.0.221.216/32))),
	((dst port 33420) || (dst port 38649) || (dst port 43816) || (dst port 45218) || (dst port 55561)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.40.13/32) || (dst net 13.0.94.189/32) || (dst net 13.0.149.205/32) || (dst net 13.0.154.217/32) || (dst net 13.0.203.211/32))),
	((dst port 8972) || (dst port 9218) || (dst port 11692) || (dst port 30311) || (dst port 38452)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.24.135/32) || (dst net 14.0.56.149/32) || (dst net 14.0.116.229/32) || (dst net 14.0.164.85/32) || (dst net 14.0.197.111/32))),
	((dst port 10485) || (dst port 47612) || (dst port 56050) || (dst port 59943) || (dst port 64211)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.55.51/32) || (dst net 15.0.211.25/32) || (dst net 15.0.223.74/32) || (dst net 15.0.224.195/32) || (dst net 15.0.236.239/32))),
	((dst port 14941) || (dst port 26782) || (dst port 36780) || (dst port 46453) || (dst port 52001)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.60.95/32) || (dst net 16.0.93.191/32) || (dst net 16.0.138.68/32) || (dst net 16.0.139.17/32) || (dst net 16.0.208.0/32))),
	((dst port 8511) || (dst port 41457) || (dst port 42133) || (dst port 44512) || (dst port 55628)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.41.127/32) || (dst net 17.0.54.204/32) || (dst net 17.0.86.171/32) || (dst net 17.0.168.148/32) || (dst net 17.0.250.11/32))),
	((dst port 17118) || (dst port 23998) || (dst port 32863) || (dst port 43173) || (dst port 52643)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.46.37/32) || (dst net 18.0.136.75/32) || (dst net 18.0.182.63/32) || (dst net 18.0.183.37/32) || (dst net 18.0.230.103/32))),
	((dst port 8397) || (dst port 20673) || (dst port 21034) || (dst port 33626) || (dst port 40995)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.4.174/32) || (dst net 19.0.70.16/32) || (dst net 19.0.77.156/32) || (dst net 19.0.199.235/32) || (dst net 19.0.214.27/32))),
	((dst port 627) || (dst port 2864) || (dst port 25738) || (dst port 31788) || (dst port 34841)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.10.18/32) || (dst net 20.0.23.253/32) || (dst net 20.0.69.127/32) || (dst net 20.0.87.174/32) || (dst net 20.0.148.168/32))),
	((dst port 35398) || (dst port 40493) || (dst port 47602) || (dst port 51948) || (dst port 60995)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.18.212/32) || (dst net 21.0.20.37/32) || (dst net 21.0.30.66/32) || (dst net 21.0.48.194/32) || (dst net 21.0.138.149/32))),
	((dst port 3650) || (dst port 4610) || (dst port 25178) || (dst port 40339) || (dst port 65493)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.27.214/32) || (dst net 22.0.124.98/32) || (dst net 22.0.135.236/32) || (dst net 22.0.199.114/32) || (dst net 22.0.212.106/32))),
	((dst port 22154) || (dst port 25552) || (dst port 48372) || (dst port 55267) || (dst port 64851)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.19.23/32) || (dst net 23.0.46.9/32) || (dst net 23.0.66.188/32) || (dst net 23.0.76.202/32) || (dst net 23.0.113.96/32))),
	((dst port 8037) || (dst port 13710) || (dst port 46435) || (dst port 62882) || (dst port 64207)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.12.48/32) || (dst net 24.0.12.96/32) || (dst net 24.0.76.224/32) || (dst net 24.0.86.23/32) || (dst net 24.0.173.151/32))),
	((dst port 6555) || (dst port 6772) || (dst port 13497) || (dst port 27815) || (dst port 28806)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.4.220/32) || (dst net 25.0.16.185/32) || (dst net 25.0.59.50/32) || (dst net 25.0.81.41/32) || (dst net 25.0.104.239/32))),
	((dst port 2887) || (dst port 19454) || (dst port 37933) || (dst port 56258) || (dst port 58631)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.81.197/32) || (dst net 26.0.83.206/32) || (dst net 26.0.120.223/32) || (dst net 26.0.165.160/32) || (dst net 26.0.189.73/32))),
	((dst port 28875) || (dst port 37025) || (dst port 38330) || (dst port 41179) || (dst port 61262)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.63.151/32) || (dst net 27.0.142.242/32) || (dst net 27.0.199.81/32) || (dst net 27.0.220.134/32) || (dst net 27.0.226.85/32))),
	((dst port 16492) || (dst port 22167) || (dst port 23403) || (dst port 37202) || (dst port 46525)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.6.29/32) || (dst net 28.0.118.237/32) || (dst net 28.0.187.143/32) || (dst net 28.0.240.19/32) || (dst net 28.0.252.238/32))),
	((dst port 7758) || (dst port 20249) || (dst port 48584) || (dst port 60496) || (dst port 61474)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.51.100/32) || (dst net 29.0.180.100/32) || (dst net 29.0.203.53/32) || (dst net 29.0.204.72/32) || (dst net 29.0.243.8/32))),
	((dst port 18657) || (dst port 19183) || (dst port 38664) || (dst port 41834) || (dst port 48975)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.4.218/32) || (dst net 30.0.57.73/32) || (dst net 30.0.99.136/32) || (dst net 30.0.180.137/32) || (dst net 30.0.210.17/32))),
	((dst port 14371) || (dst port 20466) || (dst port 32820) || (dst port 38406) || (dst port 50366)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.89.143/32) || (dst net 31.0.147.168/32) || (dst net 31.0.160.229/32) || (dst net 31.0.206.119/32) || (dst net 31.0.255.161/32))),
	((dst port 7533) || (dst port 35195) || (dst port 48954) || (dst port 58351) || (dst port 64274)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.41.70/32) || (dst net 32.0.86.184/32) || (dst net 32.0.137.99/32) || (dst net 32.0.219.189/32) || (dst net 32.0.255.76/32))),
	((dst port 20507) || (dst port 23984) || (dst port 40789) || (dst port 45426) || (dst port 64503)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.39.241/32) || (dst net 33.0.48.220/32) || (dst net 33.0.193.68/32) || (dst net 33.0.251.26/32) || (dst net 33.0.254.101/32))),
	((dst port 3356) || (dst port 30254) || (dst port 37226) || (dst port 41656) || (dst port 47512)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.19.143/32) || (dst net 34.0.36.106/32) || (dst net 34.0.53.123/32) || (dst net 34.0.165.146/32) || (dst net 34.0.217.186/32))),
	((dst port 9596) || (dst port 13321) || (dst port 14521) || (dst port 20063) || (dst port 58075)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.45.22/32) || (dst net 35.0.106.115/32) || (dst net 35.0.131.117/32) || (dst net 35.0.175.254/32) || (dst net 35.0.234.12/32))),
	((dst port 8857) || (dst port 28371) || (dst port 46097) || (dst port 47349) || (dst port 60285)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.51.194/32) || (dst net 36.0.172.253/32) || (dst net 36.0.180.133/32) || (dst net 36.0.246.68/32) || (dst net 36.0.248.196/32))),
	((dst port 7415) || (dst port 14044) || (dst port 38837) || (dst port 52959) || (dst port 56834)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.37.30/32) || (dst net 37.0.75.178/32) || (dst net 37.0.144.102/32) || (dst net 37.0.150.21/32) || (dst net 37.0.236.96/32))),
	((dst port 7778) || (dst port 8187) || (dst port 34726) || (dst port 45567) || (dst port 57365)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.135.18/32) || (dst net 38.0.144.208/32) || (dst net 38.0.147.229/32) || (dst net 38.0.174.190/32) || (dst net 38.0.252.64/32))),
	((dst port 6244) || (dst port 23435) || (dst port 27804) || (dst port 52694) || (dst port 61525)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.138.62/32) || (dst net 39.0.148.224/32) || (dst net 39.0.164.62/32) || (dst net 39.0.195.45/32) || (dst net 39.0.198.202/32))),
	((dst port 8059) || (dst port 9994) || (dst port 22535) || (dst port 47480) || (dst port 59639)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.97.104/32) || (dst net 40.0.133.239/32) || (dst net 40.0.188.55/32) || (dst net 40.0.234.9/32) || (dst net 40.0.245.71/32))),
	((dst port 3219) || (dst port 13616) || (dst port 36501) || (dst port 39061) || (dst port 58942)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.7.24/32) || (dst net 41.0.32.92/32) || (dst net 41.0.114.124/32) || (dst net 41.0.137.16/32) || (dst net 41.0.223.241/32))),
	((dst port 352) || (dst port 28858) || (dst port 32539) || (dst port 40335) || (dst port 44050)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.31.156/32) || (dst net 42.0.106.14/32) || (dst net 42.0.145.38/32) || (dst net 42.0.167.234/32) || (dst net 42.0.184.249/32))),
	((dst port 6388) || (dst port 21736) || (dst port 21856) || (dst port 25372) || (dst port 52550)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.126.229/32) || (dst net 43.0.141.244/32) || (dst net 43.0.174.162/32) || (dst net 43.0.192.69/32) || (dst net 43.0.219.66/32))),
	((dst port 2980) || (dst port 4065) || (dst port 39096) || (dst port 39160) || (dst port 43904)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.5.12/32) || (dst net 44.0.31.250/32) || (dst net 44.0.99.219/32) || (dst net 44.0.102.232/32) || (dst net 44.0.121.150/32))),
	((dst port 13564) || (dst port 14892) || (dst port 15601) || (dst port 31374) || (dst port 60286)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.31.137/32) || (dst net 45.0.85.108/32) || (dst net 45.0.99.72/32) || (dst net 45.0.198.188/32) || (dst net 45.0.248.177/32))),
	((dst port 26117) || (dst port 32559) || (dst port 37032) || (dst port 51256) || (dst port 55369)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.127.81/32) || (dst net 46.0.163.68/32) || (dst net 46.0.163.181/32) || (dst net 46.0.168.137/32) || (dst net 46.0.238.42/32))),
	((dst port 10634) || (dst port 14262) || (dst port 24867) || (dst port 28362) || (dst port 42685)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.6.57/32) || (dst net 47.0.196.1/32) || (dst net 47.0.198.254/32) || (dst net 47.0.241.67/32) || (dst net 47.0.247.176/32))),
	((dst port 6737) || (dst port 28897) || (dst port 46269) || (dst port 46778) || (dst port 47391)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.34.33/32) || (dst net 48.0.46.245/32) || (dst net 48.0.98.196/32) || (dst net 48.0.187.128/32) || (dst net 48.0.249.227/32))),
	((dst port 1936) || (dst port 13458) || (dst port 29564) || (dst port 37960) || (dst port 43556)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.74.77/32) || (dst net 49.0.97.50/32) || (dst net 49.0.219.38/32) || (dst net 49.0.240.112/32) || (dst net 49.0.254.70/32))),
	((dst port 4305) || (dst port 19801) || (dst port 24675) || (dst port 55899) || (dst port 59049)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.139.165/32) || (dst net 50.0.212.136/32) || (dst net 50.0.227.137/32) || (dst net 50.0.228.1/32) || (dst net 50.0.228.152/32))),
	((dst port 4325) || (dst port 21796) || (dst port 22044) || (dst port 36008) || (dst port 55380)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.3.68/32) || (dst net 51.0.25.122/32) || (dst net 51.0.32.125/32) || (dst net 51.0.106.194/32) || (dst net 51.0.186.105/32))),
	((dst port 12617) || (dst port 13001) || (dst port 22028) || (dst port 35007) || (dst port 40778)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.30.140/32) || (dst net 52.0.54.130/32) || (dst net 52.0.95.75/32) || (dst net 52.0.121.53/32) || (dst net 52.0.128.62/32))),
	((dst port 8413) || (dst port 38893) || (dst port 50589) || (dst port 53294) || (dst port 64765)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.56.180/32) || (dst net 53.0.132.223/32) || (dst net 53.0.135.230/32) || (dst net 53.0.137.56/32) || (dst net 53.0.169.154/32))),
	((dst port 2372) || (dst port 3025) || (dst port 26795) || (dst port 31645) || (dst port 62558)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.13.67/32) || (dst net 54.0.25.88/32) || (dst net 54.0.98.153/32) || (dst net 54.0.207.16/32) || (dst net 54.0.238.32/32))),
	((dst port 19709) || (dst port 25047) || (dst port 29180) || (dst port 36286) || (dst port 45446)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.77.243/32) || (dst net 55.0.144.88/32) || (dst net 55.0.156.223/32) || (dst net 55.0.159.169/32) || (dst net 55.0.238.3/32))),
	((dst port 50977) || (dst port 53146) || (dst port 53327) || (dst port 59707) || (dst port 62109)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.104.250/32) || (dst net 56.0.153.172/32) || (dst net 56.0.172.128/32) || (dst net 56.0.175.190/32) || (dst net 56.0.242.121/32))),
	((dst port 11699) || (dst port 25513) || (dst port 38038) || (dst port 47488) || (dst port 51938)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.56.141/32) || (dst net 57.0.65.152/32) || (dst net 57.0.94.200/32) || (dst net 57.0.175.249/32) || (dst net 57.0.200.250/32))),
	((dst port 21016) || (dst port 28781) || (dst port 39020) || (dst port 43925) || (dst port 45423)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.23.243/32) || (dst net 58.0.98.231/32) || (dst net 58.0.102.44/32) || (dst net 58.0.162.11/32) || (dst net 58.0.182.67/32))),
	((dst port 17386) || (dst port 20835) || (dst port 39178) || (dst port 43317) || (dst port 55775)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.5.174/32) || (dst net 59.0.65.49/32) || (dst net 59.0.197.59/32) || (dst net 59.0.250.234/32) || (dst net 59.0.255.140/32))),
	((dst port 11504) || (dst port 12350) || (dst port 12826) || (dst port 20528) || (dst port 35331)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.18.150/32) || (dst net 60.0.93.121/32) || (dst net 60.0.166.143/32) || (dst net 60.0.175.148/32) || (dst net 60.0.235.145/32))),
	((dst port 6295) || (dst port 15797) || (dst port 23956) || (dst port 27663) || (dst port 36199)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.28.113/32) || (dst net 61.0.100.235/32) || (dst net 61.0.141.207/32) || (dst net 61.0.210.232/32) || (dst net 61.0.225.29/32))),
	((dst port 1168) || (dst port 39832) || (dst port 45711) || (dst port 53991) || (dst port 63353)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.46.76/32) || (dst net 62.0.54.172/32) || (dst net 62.0.65.239/32) || (dst net 62.0.104.232/32) || (dst net 62.0.174.156/32))),
	((dst port 16534) || (dst port 19234) || (dst port 41994) || (dst port 42401) || (dst port 52768)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.11.25/32) || (dst net 63.0.92.190/32) || (dst net 63.0.151.18/32) || (dst net 63.0.152.103/32) || (dst net 63.0.199.32/32))),
	((dst port 1837) || (dst port 28254) || (dst port 38557) || (dst port 55093) || (dst port 58819)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.83.197/32) || (dst net 64.0.85.117/32) || (dst net 64.0.107.233/32) || (dst net 64.0.138.245/32) || (dst net 64.0.193.233/32))),
	((dst port 3414) || (dst port 8045) || (dst port 8204) || (dst port 17937) || (dst port 42171)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.34.68/32) || (dst net 65.0.47.14/32) || (dst net 65.0.87.80/32) || (dst net 65.0.107.193/32) || (dst net 65.0.160.208/32))),
	((dst port 29725) || (dst port 31279) || (dst port 39908) || (dst port 47668) || (dst port 62214)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.18.54/32) || (dst net 66.0.28.112/32) || (dst net 66.0.105.61/32) || (dst net 66.0.172.123/32) || (dst net 66.0.176.85/32))),
	((dst port 12403) || (dst port 14410) || (dst port 34312) || (dst port 56658) || (dst port 64292)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.6.135/32) || (dst net 67.0.82.255/32) || (dst net 67.0.172.225/32) || (dst net 67.0.181.134/32) || (dst net 67.0.187.196/32))),
	((dst port 7542) || (dst port 10414) || (dst port 10439) || (dst port 57809) || (dst port 60730)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.89.152/32) || (dst net 68.0.95.208/32) || (dst net 68.0.147.82/32) || (dst net 68.0.150.191/32) || (dst net 68.0.220.215/32))),
	((dst port 2851) || (dst port 9402) || (dst port 11362) || (dst port 29256) || (dst port 55537)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.49.147/32) || (dst net 69.0.76.249/32) || (dst net 69.0.79.151/32) || (dst net 69.0.129.95/32) || (dst net 69.0.208.194/32))),
	((dst port 1104) || (dst port 15919) || (dst port 22917) || (dst port 28787) || (dst port 37685)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.94.107/32) || (dst net 70.0.99.128/32) || (dst net 70.0.109.244/32) || (dst net 70.0.194.125/32) || (dst net 70.0.210.171/32))),
	((dst port 24454) || (dst port 25325) || (dst port 31236) || (dst port 37625) || (dst port 55721)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.81.197/32) || (dst net 71.0.113.218/32) || (dst net 71.0.137.43/32) || (dst net 71.0.149.230/32) || (dst net 71.0.234.153/32))),
	((dst port 23351) || (dst port 26852) || (dst port 40647) || (dst port 55612) || (dst port 60544)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.97.45/32) || (dst net 72.0.136.185/32) || (dst net 72.0.163.243/32) || (dst net 72.0.211.5/32) || (dst net 72.0.253.28/32))),
	((dst port 16769) || (dst port 26994) || (dst port 32721) || (dst port 38612) || (dst port 46965)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.22.16/32) || (dst net 73.0.26.39/32) || (dst net 73.0.54.89/32) || (dst net 73.0.169.109/32) || (dst net 73.0.236.70/32))),
	((dst port 9216) || (dst port 9698) || (dst port 27984) || (dst port 31068) || (dst port 34319)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.22.14/32) || (dst net 74.0.22.173/32) || (dst net 74.0.88.89/32) || (dst net 74.0.195.129/32) || (dst net 74.0.235.146/32))),
	((dst port 10907) || (dst port 19884) || (dst port 38778) || (dst port 43604) || (dst port 51857)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.27.86/32) || (dst net 75.0.96.204/32) || (dst net 75.0.115.84/32) || (dst net 75.0.191.63/32) || (dst net 75.0.234.138/32))),
	((dst port 2241) || (dst port 4566) || (dst port 43315) || (dst port 48145) || (dst port 57253)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.50.221/32) || (dst net 76.0.57.178/32) || (dst net 76.0.76.11/32) || (dst net 76.0.118.35/32) || (dst net 76.0.242.217/32))),
	((dst port 11058) || (dst port 11227) || (dst port 13265) || (dst port 56137) || (dst port 62493)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.19.131/32) || (dst net 77.0.21.222/32) || (dst net 77.0.101.251/32) || (dst net 77.0.166.226/32) || (dst net 77.0.197.243/32))),
	((dst port 6881) || (dst port 38757) || (dst port 41024) || (dst port 54361) || (dst port 62011)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.146.205/32) || (dst net 78.0.193.64/32) || (dst net 78.0.198.112/32) || (dst net 78.0.238.178/32) || (dst net 78.0.238.206/32))),
	((dst port 12039) || (dst port 15322) || (dst port 19445) || (dst port 31360) || (dst port 48895)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.124.78/32) || (dst net 79.0.161.110/32) || (dst net 79.0.183.205/32) || (dst net 79.0.207.101/32) || (dst net 79.0.255.167/32))),
	((dst port 1333) || (dst port 7667) || (dst port 20666) || (dst port 28524) || (dst port 53941)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.120.102/32) || (dst net 80.0.187.114/32) || (dst net 80.0.210.167/32) || (dst net 80.0.220.73/32) || (dst net 80.0.249.81/32))),
	((dst port 15419) || (dst port 17831) || (dst port 19153) || (dst port 47640) || (dst port 55520)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.130.90/32) || (dst net 81.0.142.121/32) || (dst net 81.0.176.53/32) || (dst net 81.0.216.44/32) || (dst net 81.0.239.129/32))),
	((dst port 15194) || (dst port 35762) || (dst port 36533) || (dst port 44021) || (dst port 64775)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.83.61/32) || (dst net 82.0.87.159/32) || (dst net 82.0.106.145/32) || (dst net 82.0.154.8/32) || (dst net 82.0.251.117/32))),
	((dst port 17677) || (dst port 28538) || (dst port 33639) || (dst port 34777) || (dst port 52180)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.22.86/32) || (dst net 83.0.113.153/32) || (dst net 83.0.114.181/32) || (dst net 83.0.158.252/32) || (dst net 83.0.233.139/32))),
	((dst port 3844) || (dst port 49815) || (dst port 54976) || (dst port 58390) || (dst port 61361)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.63.84/32) || (dst net 84.0.94.135/32) || (dst net 84.0.137.209/32) || (dst net 84.0.205.143/32) || (dst net 84.0.217.215/32))),
	((dst port 644) || (dst port 12772) || (dst port 22769) || (dst port 23455) || (dst port 30400)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.21.42/32) || (dst net 85.0.59.143/32) || (dst net 85.0.99.194/32) || (dst net 85.0.150.95/32) || (dst net 85.0.237.20/32))),
	((dst port 10721) || (dst port 28453) || (dst port 38343) || (dst port 46626) || (dst port 59846)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.29.95/32) || (dst net 86.0.62.197/32) || (dst net 86.0.112.179/32) || (dst net 86.0.211.101/32) || (dst net 86.0.216.216/32))),
	((dst port 10019) || (dst port 19854) || (dst port 35766) || (dst port 42634) || (dst port 57412)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.9.249/32) || (dst net 87.0.188.10/32) || (dst net 87.0.234.88/32) || (dst net 87.0.243.221/32) || (dst net 87.0.254.100/32))),
	((dst port 24603) || (dst port 27146) || (dst port 28588) || (dst port 29227) || (dst port 61363)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.80.140/32) || (dst net 88.0.84.18/32) || (dst net 88.0.84.154/32) || (dst net 88.0.94.199/32) || (dst net 88.0.111.12/32))),
	((dst port 6941) || (dst port 10933) || (dst port 16303) || (dst port 42119) || (dst port 61882)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.18.135/32) || (dst net 89.0.122.9/32) || (dst net 89.0.139.154/32) || (dst net 89.0.173.213/32) || (dst net 89.0.242.232/32))),
	((dst port 3695) || (dst port 37905) || (dst port 42617) || (dst port 42990) || (dst port 62292)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.8.73/32) || (dst net 90.0.69.123/32) || (dst net 90.0.121.98/32) || (dst net 90.0.134.105/32) || (dst net 90.0.154.219/32))),
	((dst port 3302) || (dst port 15484) || (dst port 20597) || (dst port 24103) || (dst port 54523)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.72.198/32) || (dst net 91.0.161.2/32) || (dst net 91.0.205.10/32) || (dst net 91.0.230.133/32) || (dst net 91.0.235.32/32))),
	((dst port 3738) || (dst port 12412) || (dst port 27715) || (dst port 39568) || (dst port 50214)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.8.208/32) || (dst net 92.0.97.169/32) || (dst net 92.0.118.119/32) || (dst net 92.0.163.247/32) || (dst net 92.0.186.185/32))),
	((dst port 19730) || (dst port 26390) || (dst port 34137) || (dst port 39928) || (dst port 47968)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.29.157/32) || (dst net 93.0.51.7/32) || (dst net 93.0.56.65/32) || (dst net 93.0.57.68/32) || (dst net 93.0.85.7/32))),
	((dst port 11093) || (dst port 11556) || (dst port 41221) || (dst port 52538) || (dst port 53068)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.32.81/32) || (dst net 94.0.90.131/32) || (dst net 94.0.93.40/32) || (dst net 94.0.198.244/32) || (dst net 94.0.229.78/32))),
	((dst port 5836) || (dst port 20663) || (dst port 39618) || (dst port 49079) || (dst port 64576)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.7.135/32) || (dst net 95.0.76.74/32) || (dst net 95.0.96.197/32) || (dst net 95.0.130.56/32) || (dst net 95.0.247.19/32))),
	((dst port 25080) || (dst port 31381) || (dst port 34718) || (dst port 36286) || (dst port 59495)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.102.54/32) || (dst net 96.0.108.1/32) || (dst net 96.0.110.212/32) || (dst net 96.0.155.230/32) || (dst net 96.0.251.47/32))),
	((dst port 4342) || (dst port 37149) || (dst port 38997) || (dst port 45699) || (dst port 49690)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.123.208/32) || (dst net 97.0.148.134/32) || (dst net 97.0.179.199/32) || (dst net 97.0.229.179/32) || (dst net 97.0.255.54/32))),
	((dst port 23160) || (dst port 23403) || (dst port 31448) || (dst port 51610) || (dst port 61327)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.109.168/32) || (dst net 98.0.118.31/32) || (dst net 98.0.219.245/32) || (dst net 98.0.233.175/32) || (dst net 98.0.252.41/32))),
	((dst port 23610) || (dst port 29474) || (dst port 33868) || (dst port 42537) || (dst port 52605)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.61.66/32) || (dst net 99.0.91.39/32) || (dst net 99.0.98.100/32) || (dst net 99.0.100.58/32) || (dst net 99.0.238.2/32))),
	((dst port 5940) || (dst port 13488) || (dst port 17946) || (dst port 19471) || (dst port 33700)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.56.123/32) || (dst net 100.0.99.26/32) || (dst net 100.0.114.247/32) || (dst net 100.0.184.92/32) || (dst net 100.0.225.183/32))),
	((dst port 14308) || (dst port 17913) || (dst port 23091) || (dst port 44957) || (dst port 59336)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.40.223/32) || (dst net 101.0.77.93/32) || (dst net 101.0.94.14/32) || (dst net 101.0.112.130/32) || (dst net 101.0.208.116/32))),
	((dst port 6128) || (dst port 15254) || (dst port 25004) || (dst port 32210) || (dst port 47898)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.111.130/32) || (dst net 102.0.114.188/32) || (dst net 102.0.129.9/32) || (dst net 102.0.141.73/32) || (dst net 102.0.141.131/32))),
	((dst port 1471) || (dst port 39353) || (dst port 49830) || (dst port 52613) || (dst port 53078)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.64.235/32) || (dst net 103.0.97.208/32) || (dst net 103.0.130.121/32) || (dst net 103.0.246.50/32) || (dst net 103.0.248.23/32))),
	((dst port 16368) || (dst port 27642) || (dst port 31752) || (dst port 49976) || (dst port 62178)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.43.29/32) || (dst net 104.0.100.152/32) || (dst net 104.0.131.224/32) || (dst net 104.0.191.76/32) || (dst net 104.0.220.235/32))),
	((dst port 198) || (dst port 48208) || (dst port 56772) || (dst port 57355) || (dst port 62128)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.4.126/32) || (dst net 105.0.9.140/32) || (dst net 105.0.23.242/32) || (dst net 105.0.143.93/32) || (dst net 105.0.229.179/32))),
	((dst port 19000) || (dst port 44043) || (dst port 45090) || (dst port 56291) || (dst port 57278)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.1.255/32) || (dst net 106.0.74.87/32) || (dst net 106.0.111.207/32) || (dst net 106.0.150.178/32) || (dst net 106.0.163.74/32))),
	((dst port 4498) || (dst port 33866) || (dst port 34215) || (dst port 34625) || (dst port 34697)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.99.99/32) || (dst net 107.0.178.74/32) || (dst net 107.0.215.232/32) || (dst net 107.0.234.42/32) || (dst net 107.0.248.212/32))),
	((dst port 12981) || (dst port 20491) || (dst port 37646) || (dst port 62735) || (dst port 64042)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.3.186/32) || (dst net 108.0.134.134/32) || (dst net 108.0.155.61/32) || (dst net 108.0.175.104/32) || (dst net 108.0.185.223/32))),
	((dst port 20693) || (dst port 27985) || (dst port 51438) || (dst port 54610) || (dst port 57599)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.19.48/32) || (dst net 109.0.76.133/32) || (dst net 109.0.154.133/32) || (dst net 109.0.187.95/32) || (dst net 109.0.233.221/32))),
	((dst port 20335) || (dst port 28908) || (dst port 38126) || (dst port 64114) || (dst port 64615)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.29.73/32) || (dst net 110.0.33.228/32) || (dst net 110.0.49.146/32) || (dst net 110.0.101.217/32) || (dst net 110.0.194.202/32))),
	((dst port 4958) || (dst port 14814) || (dst port 23118) || (dst port 34846) || (dst port 45250)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.38.135/32) || (dst net 111.0.52.55/32) || (dst net 111.0.105.255/32) || (dst net 111.0.153.162/32) || (dst net 111.0.232.191/32))),
	((dst port 2251) || (dst port 16699) || (dst port 35873) || (dst port 36034) || (dst port 36056)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.8.215/32) || (dst net 112.0.17.94/32) || (dst net 112.0.42.12/32) || (dst net 112.0.133.49/32) || (dst net 112.0.137.46/32))),
	((dst port 15413) || (dst port 16236) || (dst port 23576) || (dst port 53486) || (dst port 60021)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.0.8/32) || (dst net 113.0.27.134/32) || (dst net 113.0.41.169/32) || (dst net 113.0.104.175/32) || (dst net 113.0.171.148/32))),
	((dst port 11750) || (dst port 18908) || (dst port 27584) || (dst port 36941) || (dst port 59595)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.73.78/32) || (dst net 114.0.77.238/32) || (dst net 114.0.78.208/32) || (dst net 114.0.132.40/32) || (dst net 114.0.171.75/32))),
	((dst port 14559) || (dst port 17680) || (dst port 32541) || (dst port 52878) || (dst port 53956)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.57.108/32) || (dst net 115.0.114.7/32) || (dst net 115.0.189.227/32) || (dst net 115.0.239.59/32) || (dst net 115.0.244.119/32))),
	((dst port 1617) || (dst port 12413) || (dst port 52521) || (dst port 59198) || (dst port 63123)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.87.83/32) || (dst net 116.0.128.37/32) || (dst net 116.0.213.118/32) || (dst net 116.0.216.233/32) || (dst net 116.0.255.178/32))),
	((dst port 4064) || (dst port 19826) || (dst port 26693) || (dst port 28686) || (dst port 33583)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.15.221/32) || (dst net 117.0.134.182/32) || (dst net 117.0.154.186/32) || (dst net 117.0.235.82/32) || (dst net 117.0.255.55/32))),
	((dst port 19196) || (dst port 33973) || (dst port 40672) || (dst port 52060) || (dst port 54605)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.58.129/32) || (dst net 118.0.135.237/32) || (dst net 118.0.168.33/32) || (dst net 118.0.193.27/32) || (dst net 118.0.217.16/32))),
	((dst port 5540) || (dst port 11628) || (dst port 38526) || (dst port 58903) || (dst port 64516)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.50.45/32) || (dst net 119.0.51.115/32) || (dst net 119.0.98.157/32) || (dst net 119.0.174.74/32) || (dst net 119.0.195.245/32))),
	((dst port 5179) || (dst port 12909) || (dst port 25769) || (dst port 29309) || (dst port 33487)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.23.133/32) || (dst net 120.0.60.25/32) || (dst net 120.0.171.60/32) || (dst net 120.0.201.195/32) || (dst net 120.0.225.197/32))),
	((dst port 12229) || (dst port 15436) || (dst port 20495) || (dst port 48459) || (dst port 51399)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.56.101/32) || (dst net 121.0.73.71/32) || (dst net 121.0.83.32/32) || (dst net 121.0.107.76/32) || (dst net 121.0.197.20/32))),
	((dst port 205) || (dst port 2325) || (dst port 15324) || (dst port 15895) || (dst port 18433)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.32.243/32) || (dst net 122.0.39.40/32) || (dst net 122.0.77.64/32) || (dst net 122.0.183.136/32) || (dst net 122.0.198.220/32))),
	((dst port 4798) || (dst port 44884) || (dst port 50883) || (dst port 52696) || (dst port 63409)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.42.21/32) || (dst net 123.0.107.229/32) || (dst net 123.0.117.144/32) || (dst net 123.0.137.231/32) || (dst net 123.0.152.150/32))),
	((dst port 9563) || (dst port 34144) || (dst port 38413) || (dst port 38692) || (dst port 63321)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.16.51/32) || (dst net 124.0.26.183/32) || (dst net 124.0.103.173/32) || (dst net 124.0.124.182/32) || (dst net 124.0.135.149/32))),
	((dst port 17381) || (dst port 32204) || (dst port 39759) || (dst port 55956) || (dst port 60588)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.33.212/32) || (dst net 125.0.117.247/32) || (dst net 125.0.141.81/32) || (dst net 125.0.169.28/32) || (dst net 125.0.248.114/32))),
	((dst port 32254) || (dst port 34720) || (dst port 36617) || (dst port 49450) || (dst port 65228)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.155.82/32) || (dst net 126.0.170.181/32) || (dst net 126.0.220.236/32) || (dst net 126.0.250.238/32) || (dst net 126.0.253.112/32))),
	((dst port 12484) || (dst port 18566) || (dst port 21350) || (dst port 24446) || (dst port 27850)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.5.66/32) || (dst net 127.0.44.44/32) || (dst net 127.0.126.6/32) || (dst net 127.0.159.192/32) || (dst net 127.0.198.13/32))),
	((dst port 9492) || (dst port 19632) || (dst port 29270) || (dst port 32499) || (dst port 43725)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.7.232/32) || (dst net 128.0.53.77/32) || (dst net 128.0.91.9/32) || (dst net 128.0.156.169/32) || (dst net 128.0.236.9/32))),
	((dst port 10925) || (dst port 26794) || (dst port 42512) || (dst port 52965) || (dst port 59156)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.43.170/32) || (dst net 129.0.92.59/32) || (dst net 129.0.96.136/32) || (dst net 129.0.137.23/32) || (dst net 129.0.252.72/32))),
	((dst port 29549) || (dst port 39193) || (dst port 39887) || (dst port 49057) || (dst port 64455)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.25.36/32) || (dst net 130.0.110.169/32) || (dst net 130.0.185.118/32) || (dst net 130.0.185.120/32) || (dst net 130.0.232.248/32))),
	((dst port 2189) || (dst port 3298) || (dst port 32984) || (dst port 33634) || (dst port 49226)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.25.137/32) || (dst net 131.0.40.8/32) || (dst net 131.0.41.161/32) || (dst net 131.0.148.184/32) || (dst net 131.0.174.74/32))),
	((dst port 18511) || (dst port 19203) || (dst port 31673) || (dst port 35341) || (dst port 50734)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.46.236/32) || (dst net 132.0.73.131/32) || (dst net 132.0.146.37/32) || (dst net 132.0.170.167/32) || (dst net 132.0.196.53/32))),
	((dst port 10088) || (dst port 10605) || (dst port 23023) || (dst port 45628) || (dst port 56944)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.139.246/32) || (dst net 133.0.162.110/32) || (dst net 133.0.174.189/32) || (dst net 133.0.189.42/32) || (dst net 133.0.209.244/32))),
	((dst port 11298) || (dst port 18615) || (dst port 28025) || (dst port 64426) || (dst port 65098)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.49.50/32) || (dst net 134.0.110.86/32) || (dst net 134.0.170.61/32) || (dst net 134.0.191.110/32) || (dst net 134.0.206.246/32))),
	((dst port 14150) || (dst port 20797) || (dst port 28365) || (dst port 53131) || (dst port 59569)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.74.12/32) || (dst net 135.0.96.103/32) || (dst net 135.0.102.186/32) || (dst net 135.0.122.183/32) || (dst net 135.0.232.236/32))),
	((dst port 2729) || (dst port 5380) || (dst port 9491) || (dst port 15356) || (dst port 44854)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.22.140/32) || (dst net 136.0.116.9/32) || (dst net 136.0.133.193/32) || (dst net 136.0.195.78/32) || (dst net 136.0.223.13/32))),
	((dst port 4001) || (dst port 4107) || (dst port 8207) || (dst port 30771) || (dst port 48887)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.55.97/32) || (dst net 137.0.57.189/32) || (dst net 137.0.209.249/32) || (dst net 137.0.227.127/32) || (dst net 137.0.250.252/32))),
	((dst port 4181) || (dst port 16104) || (dst port 28945) || (dst port 29527) || (dst port 58813)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.14.198/32) || (dst net 138.0.77.32/32) || (dst net 138.0.125.248/32) || (dst net 138.0.131.133/32) || (dst net 138.0.170.232/32))),
	((dst port 13432) || (dst port 27349) || (dst port 38092) || (dst port 39677) || (dst port 47313)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.22.48/32) || (dst net 139.0.118.92/32) || (dst net 139.0.159.93/32) || (dst net 139.0.181.97/32) || (dst net 139.0.195.77/32))),
	((dst port 808) || (dst port 10555) || (dst port 20657) || (dst port 47811) || (dst port 54844)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.17.100/32) || (dst net 140.0.74.96/32) || (dst net 140.0.197.233/32) || (dst net 140.0.207.197/32) || (dst net 140.0.210.188/32))),
	((dst port 2816) || (dst port 12436) || (dst port 18849) || (dst port 55454) || (dst port 56873)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.77.248/32) || (dst net 141.0.106.240/32) || (dst net 141.0.110.65/32) || (dst net 141.0.167.104/32) || (dst net 141.0.188.17/32))),
	((dst port 8616) || (dst port 10187) || (dst port 23089) || (dst port 31618) || (dst port 46549)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.33.145/32) || (dst net 142.0.78.18/32) || (dst net 142.0.101.71/32) || (dst net 142.0.170.14/32) || (dst net 142.0.249.59/32))),
	((dst port 21501) || (dst port 22023) || (dst port 43741) || (dst port 57095) || (dst port 65045)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.30.59/32) || (dst net 143.0.45.26/32) || (dst net 143.0.117.78/32) || (dst net 143.0.122.210/32) || (dst net 143.0.176.159/32))),
	((dst port 29252) || (dst port 38791) || (dst port 43078) || (dst port 54820) || (dst port 55449)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.3.175/32) || (dst net 144.0.18.89/32) || (dst net 144.0.31.104/32) || (dst net 144.0.165.17/32) || (dst net 144.0.217.214/32))),
	((dst port 19929) || (dst port 22965) || (dst port 35342) || (dst port 44762) || (dst port 61574)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.8.140/32) || (dst net 145.0.92.111/32) || (dst net 145.0.138.77/32) || (dst net 145.0.226.132/32) || (dst net 145.0.247.16/32))),
	((dst port 10332) || (dst port 22756) || (dst port 28956) || (dst port 47637) || (dst port 51934)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.30.161/32) || (dst net 146.0.88.253/32) || (dst net 146.0.164.115/32) || (dst net 146.0.210.227/32) || (dst net 146.0.252.244/32))),
	((dst port 36306) || (dst port 39078) || (dst port 49279) || (dst port 51070) || (dst port 62882)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.89.151/32) || (dst net 147.0.133.167/32) || (dst net 147.0.164.227/32) || (dst net 147.0.230.214/32) || (dst net 147.0.252.178/32))),
	((dst port 11111) || (dst port 14029) || (dst port 35400) || (dst port 40722) || (dst port 61227)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.50.106/32) || (dst net 148.0.157.136/32) || (dst net 148.0.179.117/32) || (dst net 148.0.186.123/32) || (dst net 148.0.230.123/32))),
	((dst port 993) || (dst port 34341) || (dst port 38252) || (dst port 53872) || (dst port 54610)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.23.44/32) || (dst net 149.0.62.113/32) || (dst net 149.0.107.192/32) || (dst net 149.0.109.2/32) || (dst net 149.0.153.208/32))),
	((dst port 8958) || (dst port 26790) || (dst port 31645) || (dst port 50486) || (dst port 64546)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.64.186/32) || (dst net 150.0.105.244/32) || (dst net 150.0.179.91/32) || (dst net 150.0.213.65/32) || (dst net 150.0.225.9/32))),
	((dst port 17697) || (dst port 21731) || (dst port 29091) || (dst port 58230) || (dst port 60994)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.33.23/32) || (dst net 151.0.111.157/32) || (dst net 151.0.112.153/32) || (dst net 151.0.130.117/32) || (dst net 151.0.164.99/32))),
	((dst port 3509) || (dst port 21436) || (dst port 22683) || (dst port 48787) || (dst port 57063)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.52.144/32) || (dst net 152.0.74.4/32) || (dst net 152.0.119.237/32) || (dst net 152.0.188.63/32) || (dst net 152.0.232.19/32))),
	((dst port 5149) || (dst port 28477) || (dst port 39296) || (dst port 49331) || (dst port 55007)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.10.58/32) || (dst net 153.0.98.248/32) || (dst net 153.0.105.63/32) || (dst net 153.0.160.189/32) || (dst net 153.0.164.7/32))),
	((dst port 14143) || (dst port 25046) || (dst port 41087) || (dst port 50709) || (dst port 51623)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.35.178/32) || (dst net 154.0.52.175/32) || (dst net 154.0.89.145/32) || (dst net 154.0.138.17/32) || (dst net 154.0.194.249/32))),
	((dst port 10900) || (dst port 23302) || (dst port 45833) || (dst port 48055) || (dst port 53144)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.45.226/32) || (dst net 155.0.88.19/32) || (dst net 155.0.100.24/32) || (dst net 155.0.121.231/32) || (dst net 155.0.253.128/32))),
	((dst port 841) || (dst port 7178) || (dst port 26032) || (dst port 50343) || (dst port 52225)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.45.43/32) || (dst net 156.0.57.164/32) || (dst net 156.0.107.238/32) || (dst net 156.0.115.213/32) || (dst net 156.0.197.230/32))),
	((dst port 1756) || (dst port 27816) || (dst port 37106) || (dst port 56308) || (dst port 58237)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.3.98/32) || (dst net 157.0.59.56/32) || (dst net 157.0.59.146/32) || (dst net 157.0.242.205/32) || (dst net 157.0.243.219/32))),
	((dst port 7408) || (dst port 10291) || (dst port 14986) || (dst port 37190) || (dst port 58458)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.19.217/32) || (dst net 158.0.47.120/32) || (dst net 158.0.57.138/32) || (dst net 158.0.114.34/32) || (dst net 158.0.175.231/32))),
	((dst port 966) || (dst port 10062) || (dst port 42721) || (dst port 50122) || (dst port 52955)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.28.166/32) || (dst net 159.0.56.46/32) || (dst net 159.0.58.169/32) || (dst net 159.0.100.223/32) || (dst net 159.0.119.143/32))),
	((dst port 476) || (dst port 10416) || (dst port 12602) || (dst port 17500) || (dst port 57646)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.67.44/32) || (dst net 160.0.111.251/32) || (dst net 160.0.147.178/32) || (dst net 160.0.182.161/32) || (dst net 160.0.236.97/32))),
	((dst port 2963) || (dst port 20653) || (dst port 37080) || (dst port 59057) || (dst port 63979)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.11.18/32) || (dst net 161.0.50.56/32) || (dst net 161.0.204.228/32) || (dst net 161.0.208.228/32) || (dst net 161.0.236.48/32))),
	((dst port 1387) || (dst port 11209) || (dst port 36865) || (dst port 50821) || (dst port 59536)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.24.46/32) || (dst net 162.0.24.107/32) || (dst net 162.0.107.122/32) || (dst net 162.0.114.144/32) || (dst net 162.0.244.69/32))),
	((dst port 15530) || (dst port 23130) || (dst port 43627) || (dst port 46225) || (dst port 49034)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.76.0/32) || (dst net 163.0.82.25/32) || (dst net 163.0.110.244/32) || (dst net 163.0.180.219/32) || (dst net 163.0.218.89/32))),
	((dst port 28114) || (dst port 35987) || (dst port 39152) || (dst port 52699) || (dst port 54469)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.56.242/32) || (dst net 164.0.184.103/32) || (dst net 164.0.187.5/32) || (dst net 164.0.220.71/32) || (dst net 164.0.230.231/32))),
	((dst port 3891) || (dst port 17703) || (dst port 29543) || (dst port 50275) || (dst port 59261)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.34.244/32) || (dst net 165.0.88.11/32) || (dst net 165.0.128.2/32) || (dst net 165.0.179.183/32) || (dst net 165.0.250.65/32))),
	((dst port 999) || (dst port 13676) || (dst port 27666) || (dst port 28483) || (dst port 32008)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.28.31/32) || (dst net 166.0.65.32/32) || (dst net 166.0.146.46/32) || (dst net 166.0.196.31/32) || (dst net 166.0.243.30/32))),
	((dst port 12612) || (dst port 19393) || (dst port 21157) || (dst port 35911) || (dst port 51368)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.52.80/32) || (dst net 167.0.71.202/32) || (dst net 167.0.76.50/32) || (dst net 167.0.105.157/32) || (dst net 167.0.157.144/32))),
	((dst port 16944) || (dst port 17302) || (dst port 26492) || (dst port 37424) || (dst port 57373)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.46.62/32) || (dst net 168.0.104.165/32) || (dst net 168.0.179.94/32) || (dst net 168.0.228.255/32) || (dst net 168.0.254.167/32))),
	((dst port 15178) || (dst port 22794) || (dst port 25097) || (dst port 30507) || (dst port 33302)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.36.63/32) || (dst net 169.0.179.126/32) || (dst net 169.0.204.9/32) || (dst net 169.0.210.90/32) || (dst net 169.0.252.87/32))),
	((dst port 6644) || (dst port 34085) || (dst port 37901) || (dst port 47996) || (dst port 62074)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.92.49/32) || (dst net 170.0.136.245/32) || (dst net 170.0.138.226/32) || (dst net 170.0.143.232/32) || (dst net 170.0.237.13/32))),
	((dst port 7402) || (dst port 28848) || (dst port 48132) || (dst port 62550) || (dst port 63033)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.79.244/32) || (dst net 171.0.183.122/32) || (dst net 171.0.201.117/32) || (dst net 171.0.220.92/32) || (dst net 171.0.220.221/32))),
	((dst port 19799) || (dst port 25837) || (dst port 34612) || (dst port 56518) || (dst port 58938)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.32.15/32) || (dst net 172.0.79.66/32) || (dst net 172.0.86.50/32) || (dst net 172.0.200.220/32) || (dst net 172.0.228.206/32))),
	((dst port 2154) || (dst port 24628) || (dst port 26635) || (dst port 39771) || (dst port 61896)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.47.189/32) || (dst net 173.0.59.40/32) || (dst net 173.0.172.105/32) || (dst net 173.0.172.253/32) || (dst net 173.0.234.97/32))),
	((dst port 5950) || (dst port 20595) || (dst port 42703) || (dst port 45379) || (dst port 64743)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.128.138/32) || (dst net 174.0.173.140/32) || (dst net 174.0.222.242/32) || (dst net 174.0.225.52/32) || (dst net 174.0.236.24/32))),
	((dst port 19094) || (dst port 45000) || (dst port 49416) || (dst port 52513) || (dst port 52699)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.94.232/32) || (dst net 175.0.130.155/32) || (dst net 175.0.135.45/32) || (dst net 175.0.182.84/32) || (dst net 175.0.232.15/32))),
	((dst port 19189) || (dst port 19351) || (dst port 30670) || (dst port 41947) || (dst port 65009)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.3.130/32) || (dst net 176.0.80.128/32) || (dst net 176.0.181.247/32) || (dst net 176.0.185.108/32) || (dst net 176.0.243.68/32))),
	((dst port 18200) || (dst port 20356) || (dst port 24270) || (dst port 50639) || (dst port 65365)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.5.171/32) || (dst net 177.0.21.168/32) || (dst net 177.0.98.211/32) || (dst net 177.0.162.22/32) || (dst net 177.0.210.39/32))),
	((dst port 11603) || (dst port 29424) || (dst port 44559) || (dst port 49501) || (dst port 52428)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.45.194/32) || (dst net 178.0.47.207/32) || (dst net 178.0.116.79/32) || (dst net 178.0.196.211/32) || (dst net 178.0.213.103/32))),
	((dst port 2729) || (dst port 4944) || (dst port 6828) || (dst port 13387) || (dst port 55848)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.63.76/32) || (dst net 179.0.136.228/32) || (dst net 179.0.184.191/32) || (dst net 179.0.197.156/32) || (dst net 179.0.252.69/32))),
	((dst port 11697) || (dst port 37531) || (dst port 44055) || (dst port 51473) || (dst port 59359)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.14.2/32) || (dst net 180.0.30.103/32) || (dst net 180.0.85.40/32) || (dst net 180.0.179.89/32) || (dst net 180.0.245.162/32))),
	((dst port 3891) || (dst port 21357) || (dst port 27578) || (dst port 31739) || (dst port 62451)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.176.86/32) || (dst net 181.0.178.224/32) || (dst net 181.0.185.134/32) || (dst net 181.0.207.153/32) || (dst net 181.0.230.129/32))),
	((dst port 17410) || (dst port 22513) || (dst port 27628) || (dst port 41010) || (dst port 64158)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.71.55/32) || (dst net 182.0.97.48/32) || (dst net 182.0.116.125/32) || (dst net 182.0.133.39/32) || (dst net 182.0.136.170/32))),
	((dst port 647) || (dst port 5201) || (dst port 43786) || (dst port 53956) || (dst port 64737)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.40.144/32) || (dst net 183.0.77.53/32) || (dst net 183.0.210.45/32) || (dst net 183.0.227.246/32) || (dst net 183.0.251.113/32))),
	((dst port 7113) || (dst port 10529) || (dst port 24127) || (dst port 27700) || (dst port 43978)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.9.198/32) || (dst net 184.0.38.148/32) || (dst net 184.0.78.126/32) || (dst net 184.0.203.24/32) || (dst net 184.0.210.252/32))),
	((dst port 6717) || (dst port 17878) || (dst port 42235) || (dst port 52451) || (dst port 64775)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.45.30/32) || (dst net 185.0.82.203/32) || (dst net 185.0.117.141/32) || (dst net 185.0.131.209/32) || (dst net 185.0.253.99/32))),
	((dst port 7551) || (dst port 23011) || (dst port 36805) || (dst port 50783) || (dst port 60268)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.39.117/32) || (dst net 186.0.146.166/32) || (dst net 186.0.152.124/32) || (dst net 186.0.167.169/32) || (dst net 186.0.173.200/32))),
	((dst port 4460) || (dst port 20946) || (dst port 40065) || (dst port 50595) || (dst port 54839)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.33.179/32) || (dst net 187.0.94.72/32) || (dst net 187.0.94.121/32) || (dst net 187.0.110.189/32) || (dst net 187.0.170.151/32))),
	((dst port 3438) || (dst port 19114) || (dst port 44172) || (dst port 55208) || (dst port 62103)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.67.149/32) || (dst net 188.0.71.38/32) || (dst net 188.0.96.30/32) || (dst net 188.0.238.197/32) || (dst net 188.0.239.77/32))),
	((dst port 9701) || (dst port 16654) || (dst port 39467) || (dst port 52536) || (dst port 61274)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.18.46/32) || (dst net 189.0.47.119/32) || (dst net 189.0.106.33/32) || (dst net 189.0.147.56/32) || (dst net 189.0.180.67/32))),
	((dst port 7955) || (dst port 13637) || (dst port 14865) || (dst port 18359) || (dst port 21609)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.14.153/32) || (dst net 190.0.78.140/32) || (dst net 190.0.108.253/32) || (dst net 190.0.117.191/32) || (dst net 190.0.161.244/32))),
	((dst port 9199) || (dst port 17113) || (dst port 19499) || (dst port 41822) || (dst port 43566)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.113.73/32) || (dst net 191.0.135.177/32) || (dst net 191.0.147.195/32) || (dst net 191.0.165.67/32) || (dst net 191.0.168.1/32))),
	((dst port 2382) || (dst port 2608) || (dst port 17832) || (dst port 56136) || (dst port 60771)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.28.136/32) || (dst net 192.0.111.140/32) || (dst net 192.0.119.16/32) || (dst net 192.0.190.138/32) || (dst net 192.0.255.142/32))),
	((dst port 6022) || (dst port 8115) || (dst port 28598) || (dst port 32602) || (dst port 56773)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.5.184/32) || (dst net 193.0.58.52/32) || (dst net 193.0.119.26/32) || (dst net 193.0.152.214/32) || (dst net 193.0.225.232/32))),
	((dst port 39449) || (dst port 44012) || (dst port 50734) || (dst port 62276) || (dst port 62617)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.139.251/32) || (dst net 194.0.238.168/32) || (dst net 194.0.241.180/32) || (dst net 194.0.248.87/32) || (dst net 194.0.250.46/32))),
	((dst port 2783) || (dst port 31928) || (dst port 49497) || (dst port 58443) || (dst port 64859)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.9.40/32) || (dst net 195.0.26.113/32) || (dst net 195.0.35.1/32) || (dst net 195.0.71.11/32) || (dst net 195.0.187.213/32))),
	((dst port 16414) || (dst port 28675) || (dst port 31331) || (dst port 49777) || (dst port 62681)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.34.70/32) || (dst net 196.0.44.191/32) || (dst net 196.0.121.44/32) || (dst net 196.0.173.128/32) || (dst net 196.0.191.145/32))),
	((dst port 23777) || (dst port 25381) || (dst port 41737) || (dst port 55428) || (dst port 57823)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.25.214/32) || (dst net 197.0.29.26/32) || (dst net 197.0.80.105/32) || (dst net 197.0.91.182/32) || (dst net 197.0.191.99/32))),
	((dst port 3017) || (dst port 13434) || (dst port 17615) || (dst port 46907) || (dst port 49082)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.10.148/32) || (dst net 198.0.100.186/32) || (dst net 198.0.161.14/32) || (dst net 198.0.170.102/32) || (dst net 198.0.235.152/32))),
	((dst port 26451) || (dst port 33354) || (dst port 34266) || (dst port 37086) || (dst port 44463)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.62.244/32) || (dst net 199.0.126.84/32) || (dst net 199.0.149.177/32) || (dst net 199.0.177.234/32) || (dst net 199.0.239.20/32))),
	((dst port 23485) || (dst port 26828) || (dst port 45893) || (dst port 58260) || (dst port 62505)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.31.12/32) || (dst net 200.0.97.81/32) || (dst net 200.0.137.32/32) || (dst net 200.0.166.82/32) || (dst net 200.0.239.179/32))),
	((dst port 2955) || (dst port 11680) || (dst port 19514) || (dst port 28672) || (dst port 53968)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.55.104/32) || (dst net 201.0.55.129/32) || (dst net 201.0.139.65/32) || (dst net 201.0.223.194/32) || (dst net 201.0.234.19/32))),
	((dst port 11481) || (dst port 24619) || (dst port 26525) || (dst port 46749) || (dst port 62130)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.11.214/32) || (dst net 202.0.20.65/32) || (dst net 202.0.105.95/32) || (dst net 202.0.179.116/32) || (dst net 202.0.216.169/32))),
	((dst port 3621) || (dst port 20474) || (dst port 37220) || (dst port 43823) || (dst port 54977)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.12.122/32) || (dst net 203.0.98.62/32) || (dst net 203.0.182.26/32) || (dst net 203.0.183.54/32) || (dst net 203.0.247.155/32))),
	((dst port 5467) || (dst port 14431) || (dst port 20829) || (dst port 57143) || (dst port 61697)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.0.98/32) || (dst net 204.0.38.28/32) || (dst net 204.0.59.25/32) || (dst net 204.0.95.149/32) || (dst net 204.0.120.223/32))),
	((dst port 334) || (dst port 593) || (dst port 16743) || (dst port 30723) || (dst port 45083)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.66.140/32) || (dst net 205.0.106.51/32) || (dst net 205.0.168.44/32) || (dst net 205.0.185.136/32) || (dst net 205.0.247.239/32))),
	((dst port 14066) || (dst port 23793) || (dst port 45439) || (dst port 47593) || (dst port 53869)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.35.155/32) || (dst net 206.0.87.254/32) || (dst net 206.0.156.229/32) || (dst net 206.0.190.68/32) || (dst net 206.0.213.148/32))),
	((dst port 2116) || (dst port 21848) || (dst port 51431) || (dst port 56197) || (dst port 60141)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.120.38/32) || (dst net 207.0.138.232/32) || (dst net 207.0.206.81/32) || (dst net 207.0.243.220/32) || (dst net 207.0.246.50/32))),
	((dst port 8393) || (dst port 10420) || (dst port 25506) || (dst port 34130) || (dst port 41897)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.23.40/32) || (dst net 208.0.78.53/32) || (dst net 208.0.97.230/32) || (dst net 208.0.169.237/32) || (dst net 208.0.202.147/32))),
	((dst port 5573) || (dst port 15852) || (dst port 26308) || (dst port 51196) || (dst port 53698)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.109.62/32) || (dst net 209.0.111.173/32) || (dst net 209.0.123.56/32) || (dst net 209.0.203.54/32) || (dst net 209.0.215.240/32))),
	((dst port 1682) || (dst port 29884) || (dst port 32337) || (dst port 45258) || (dst port 57702)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.40.249/32) || (dst net 210.0.99.137/32) || (dst net 210.0.172.249/32) || (dst net 210.0.183.174/32) || (dst net 210.0.218.149/32))),
	((dst port 27606) || (dst port 28097) || (dst port 29130) || (dst port 33548) || (dst port 34477)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.7.232/32) || (dst net 211.0.16.201/32) || (dst net 211.0.47.167/32) || (dst net 211.0.140.243/32) || (dst net 211.0.149.8/32))),
	((dst port 6542) || (dst port 10312) || (dst port 28753) || (dst port 44420) || (dst port 46396)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.12.131/32) || (dst net 212.0.113.114/32) || (dst net 212.0.122.82/32) || (dst net 212.0.164.1/32) || (dst net 212.0.239.147/32))),
	((dst port 5440) || (dst port 6973) || (dst port 18577) || (dst port 22041) || (dst port 22872)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.15.177/32) || (dst net 213.0.52.139/32) || (dst net 213.0.75.212/32) || (dst net 213.0.182.81/32) || (dst net 213.0.187.40/32))),
	((dst port 11693) || (dst port 30071) || (dst port 32012) || (dst port 42088) || (dst port 46580)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.6.70/32) || (dst net 214.0.134.191/32) || (dst net 214.0.179.196/32) || (dst net 214.0.224.247/32) || (dst net 214.0.246.68/32))),
	((dst port 12835) || (dst port 19898) || (dst port 25659) || (dst port 42704) || (dst port 54341)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.43.19/32) || (dst net 215.0.75.40/32) || (dst net 215.0.113.253/32) || (dst net 215.0.141.131/32) || (dst net 215.0.219.124/32))),
	((dst port 12553) || (dst port 25812) || (dst port 26875) || (dst port 31791) || (dst port 56283)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.3.87/32) || (dst net 216.0.147.141/32) || (dst net 216.0.177.116/32) || (dst net 216.0.204.71/32) || (dst net 216.0.221.120/32))),
	((dst port 1486) || (dst port 4833) || (dst port 31000) || (dst port 41874) || (dst port 48848)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.54.196/32) || (dst net 217.0.142.243/32) || (dst net 217.0.176.173/32) || (dst net 217.0.178.249/32) || (dst net 217.0.239.38/32))),
	((dst port 24998) || (dst port 35253) || (dst port 45538) || (dst port 53435) || (dst port 56232)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.34.64/32) || (dst net 218.0.122.216/32) || (dst net 218.0.128.173/32) || (dst net 218.0.187.97/32) || (dst net 218.0.203.196/32))),
	((dst port 17531) || (dst port 25515) || (dst port 26162) || (dst port 29688) || (dst port 32983)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.13.223/32) || (dst net 219.0.68.57/32) || (dst net 219.0.170.40/32) || (dst net 219.0.174.223/32) || (dst net 219.0.231.208/32))),
	((dst port 9338) || (dst port 15333) || (dst port 30772) || (dst port 42435) || (dst port 46760)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.154.162/32) || (dst net 220.0.180.78/32) || (dst net 220.0.190.157/32) || (dst net 220.0.239.102/32) || (dst net 220.0.243.197/32))),
	((dst port 16103) || (dst port 30142) || (dst port 37284) || (dst port 48809) || (dst port 59581)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.24.140/32) || (dst net 221.0.114.249/32) || (dst net 221.0.132.46/32) || (dst net 221.0.213.9/32) || (dst net 221.0.255.169/32))),
	((dst port 2977) || (dst port 10175) || (dst port 22104) || (dst port 32460) || (dst port 38815)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.6.125/32) || (dst net 222.0.24.42/32) || (dst net 222.0.117.229/32) || (dst net 222.0.140.36/32) || (dst net 222.0.232.125/32))),
	((dst port 2025) || (dst port 25081) || (dst port 46216) || (dst port 61876) || (dst port 63260)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.1.115/32) || (dst net 223.0.82.71/32) || (dst net 223.0.100.188/32) || (dst net 223.0.139.68/32) || (dst net 223.0.191.99/32))),
	((dst port 3382) || (dst port 6410) || (dst port 18998) || (dst port 21496) || (dst port 37888)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.31.67/32) || (dst net 224.0.120.224/32) || (dst net 224.0.130.141/32) || (dst net 224.0.148.201/32) || (dst net 224.0.224.190/32))),
	((dst port 2555) || (dst port 4654) || (dst port 23299) || (dst port 23954) || (dst port 35742)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.19.247/32) || (dst net 225.0.25.31/32) || (dst net 225.0.201.239/32) || (dst net 225.0.218.32/32) || (dst net 225.0.252.140/32))),
	((dst port 3095) || (dst port 27938) || (dst port 43884) || (dst port 46046) || (dst port 57472)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.2.66/32) || (dst net 226.0.39.14/32) || (dst net 226.0.110.142/32) || (dst net 226.0.150.127/32) || (dst net 226.0.254.223/32))),
	((dst port 23582) || (dst port 29931) || (dst port 36037) || (dst port 45523) || (dst port 50745)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.15.185/32) || (dst net 227.0.33.78/32) || (dst net 227.0.47.91/32) || (dst net 227.0.175.116/32) || (dst net 227.0.200.51/32))),
	((dst port 3198) || (dst port 7385) || (dst port 20597) || (dst port 45994) || (dst port 63958)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.92.104/32) || (dst net 228.0.138.101/32) || (dst net 228.0.155.152/32) || (dst net 228.0.229.194/32) || (dst net 228.0.235.107/32))),
	((dst port 474) || (dst port 22068) || (dst port 29596) || (dst port 37772) || (dst port 48685)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.29.111/32) || (dst net 229.0.63.16/32) || (dst net 229.0.80.61/32) || (dst net 229.0.85.117/32) || (dst net 229.0.122.19/32))),
	((dst port 3580) || (dst port 15858) || (dst port 46575) || (dst port 54466) || (dst port 58358)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.39.211/32) || (dst net 230.0.107.3/32) || (dst net 230.0.150.10/32) || (dst net 230.0.166.161/32) || (dst net 230.0.178.142/32))),
	((dst port 8241) || (dst port 23059) || (dst port 26633) || (dst port 31777) || (dst port 35193)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.24.69/32) || (dst net 231.0.53.188/32) || (dst net 231.0.118.188/32) || (dst net 231.0.185.138/32) || (dst net 231.0.232.17/32))),
	((dst port 8467) || (dst port 19228) || (dst port 27936) || (dst port 35795) || (dst port 44208)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.5.68/32) || (dst net 232.0.60.7/32) || (dst net 232.0.97.212/32) || (dst net 232.0.122.206/32) || (dst net 232.0.241.186/32))),
	((dst port 9967) || (dst port 14516) || (dst port 57547) || (dst port 64804) || (dst port 65484)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.2.242/32) || (dst net 233.0.121.113/32) || (dst net 233.0.135.248/32) || (dst net 233.0.250.36/32) || (dst net 233.0.251.96/32))),
	((dst port 3485) || (dst port 22676) || (dst port 52571) || (dst port 57385) || (dst port 57657)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.113.238/32) || (dst net 234.0.149.158/32) || (dst net 234.0.150.27/32) || (dst net 234.0.173.243/32) || (dst net 234.0.190.78/32))),
	((dst port 4860) || (dst port 35633) || (dst port 52318) || (dst port 58892) || (dst port 62032)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.62.198/32) || (dst net 235.0.81.246/32) || (dst net 235.0.101.49/32) || (dst net 235.0.107.54/32) || (dst net 235.0.118.208/32))),
	((dst port 31588) || (dst port 33779) || (dst port 42492) || (dst port 44100) || (dst port 44131)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.7.103/32) || (dst net 236.0.10.71/32) || (dst net 236.0.38.101/32) || (dst net 236.0.235.98/32) || (dst net 236.0.246.156/32))),
	((dst port 2888) || (dst port 6150) || (dst port 24021) || (dst port 24207) || (dst port 40579)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.3.0/32) || (dst net 237.0.8.251/32) || (dst net 237.0.80.124/32) || (dst net 237.0.86.145/32) || (dst net 237.0.183.118/32))),
	((dst port 2521) || (dst port 11080) || (dst port 28784) || (dst port 38440) || (dst port 46832)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.48.217/32) || (dst net 238.0.54.234/32) || (dst net 238.0.64.189/32) || (dst net 238.0.229.196/32) || (dst net 238.0.247.63/32))),
	((dst port 1567) || (dst port 2980) || (dst port 24106) || (dst port 47891) || (dst port 62936)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.14.152/32) || (dst net 239.0.79.153/32) || (dst net 239.0.133.107/32) || (dst net 239.0.168.125/32) || (dst net 239.0.199.110/32))),
	((dst port 2123) || (dst port 3280) || (dst port 22320) || (dst port 24435) || (dst port 30540)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.25.113/32) || (dst net 240.0.77.225/32) || (dst net 240.0.83.168/32) || (dst net 240.0.165.107/32) || (dst net 240.0.252.56/32))),
	((dst port 446) || (dst port 33956) || (dst port 34032) || (dst port 41466) || (dst port 55705)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.137.221/32) || (dst net 241.0.164.125/32) || (dst net 241.0.186.182/32) || (dst net 241.0.188.196/32) || (dst net 241.0.244.210/32))),
	((dst port 5298) || (dst port 14682) || (dst port 21123) || (dst port 35302) || (dst port 59570)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.86.220/32) || (dst net 242.0.98.220/32) || (dst net 242.0.138.211/32) || (dst net 242.0.213.11/32) || (dst net 242.0.248.110/32))),
	((dst port 11886) || (dst port 14381) || (dst port 28990) || (dst port 33146) || (dst port 42478)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.33.118/32) || (dst net 243.0.199.127/32) || (dst net 243.0.215.102/32) || (dst net 243.0.242.118/32) || (dst net 243.0.254.75/32))),
	((dst port 17113) || (dst port 17667) || (dst port 47063) || (dst port 50050) || (dst port 64521)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.3.201/32) || (dst net 244.0.31.98/32) || (dst net 244.0.65.139/32) || (dst net 244.0.135.63/32) || (dst net 244.0.144.205/32))),
	((dst port 11579) || (dst port 13279) || (dst port 25192) || (dst port 33898) || (dst port 40340)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.29.251/32) || (dst net 245.0.73.156/32) || (dst net 245.0.84.134/32) || (dst net 245.0.176.32/32) || (dst net 245.0.200.149/32))),
	((dst port 15046) || (dst port 26339) || (dst port 26673) || (dst port 46224) || (dst port 64307)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.58.131/32) || (dst net 246.0.85.59/32) || (dst net 246.0.136.120/32) || (dst net 246.0.153.204/32) || (dst net 246.0.245.166/32))),
	((dst port 2511) || (dst port 8938) || (dst port 14494) || (dst port 17933) || (dst port 28295)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.36.56/32) || (dst net 247.0.71.45/32) || (dst net 247.0.127.165/32) || (dst net 247.0.182.253/32) || (dst net 247.0.239.131/32))),
	((dst port 23493) || (dst port 36627) || (dst port 49353) || (dst port 52785) || (dst port 59494)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.7.21/32) || (dst net 248.0.95.111/32) || (dst net 248.0.207.157/32) || (dst net 248.0.228.39/32) || (dst net 248.0.245.150/32))),
	((dst port 1535) || (dst port 22893) || (dst port 32179) || (dst port 56070) || (dst port 56935)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.57.223/32) || (dst net 249.0.104.198/32) || (dst net 249.0.128.17/32) || (dst net 249.0.165.133/32) || (dst net 249.0.209.108/32))),
	((dst port 12656) || (dst port 17299) || (dst port 27439) || (dst port 48691) || (dst port 52935)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.3.14/32) || (dst net 250.0.6.165/32) || (dst net 250.0.53.158/32) || (dst net 250.0.80.219/32) || (dst net 250.0.175.227/32))),
	((dst port 8130) || (dst port 9911) || (dst port 25510) || (dst port 45856) || (dst port 54500)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.87.133/32) || (dst net 251.0.105.20/32) || (dst net 251.0.148.21/32) || (dst net 251.0.196.120/32) || (dst net 251.0.207.10/32))),
	((dst port 1635) || (dst port 14949) || (dst port 23204) || (dst port 44384) || (dst port 52201)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.85.187/32) || (dst net 252.0.97.147/32) || (dst net 252.0.114.67/32) || (dst net 252.0.179.128/32) || (dst net 252.0.186.108/32))),
	((dst port 24456) || (dst port 54981) || (dst port 56754) || (dst port 57382) || (dst port 57988)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.17.246/32) || (dst net 253.0.65.189/32) || (dst net 253.0.185.10/32) || (dst net 253.0.228.209/32) || (dst net 253.0.254.224/32))),
	((dst port 33159) || (dst port 47720) || (dst port 50328) || (dst port 61057) || (dst port 61516)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.28.55/32) || (dst net 254.0.131.154/32) || (dst net 254.0.163.18/32) || (dst net 254.0.186.233/32) || (dst net 254.0.220.101/32))),
	((dst port 639) || (dst port 4751) || (dst port 32157) || (dst port 33780) || (dst port 37099)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.5.168/32) || (dst net 255.0.142.119/32) || (dst net 255.0.144.203/32) || (dst net 255.0.168.242/32) || (dst net 255.0.228.200/32))),
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
getIPClas256 :: CycleCountAccum;
getIPClas257 :: CycleCountAccum;
getIPClas258 :: CycleCountAccum;
getIPClas259 :: CycleCountAccum;
getIPClas260 :: CycleCountAccum;
getIPClas261 :: CycleCountAccum;
getIPClas262 :: CycleCountAccum;
getIPClas263 :: CycleCountAccum;
getIPClas264 :: CycleCountAccum;
getIPClas265 :: CycleCountAccum;
getIPClas266 :: CycleCountAccum;
getIPClas267 :: CycleCountAccum;
getIPClas268 :: CycleCountAccum;
getIPClas269 :: CycleCountAccum;
getIPClas270 :: CycleCountAccum;
getIPClas271 :: CycleCountAccum;
getIPClas272 :: CycleCountAccum;
getIPClas273 :: CycleCountAccum;
getIPClas274 :: CycleCountAccum;
getIPClas275 :: CycleCountAccum;
getIPClas276 :: CycleCountAccum;
getIPClas277 :: CycleCountAccum;
getIPClas278 :: CycleCountAccum;
getIPClas279 :: CycleCountAccum;
getIPClas280 :: CycleCountAccum;
getIPClas281 :: CycleCountAccum;
getIPClas282 :: CycleCountAccum;
getIPClas283 :: CycleCountAccum;
getIPClas284 :: CycleCountAccum;
getIPClas285 :: CycleCountAccum;
getIPClas286 :: CycleCountAccum;
getIPClas287 :: CycleCountAccum;
getIPClas288 :: CycleCountAccum;
getIPClas289 :: CycleCountAccum;
getIPClas290 :: CycleCountAccum;
getIPClas291 :: CycleCountAccum;
getIPClas292 :: CycleCountAccum;
getIPClas293 :: CycleCountAccum;
getIPClas294 :: CycleCountAccum;
getIPClas295 :: CycleCountAccum;
getIPClas296 :: CycleCountAccum;
getIPClas297 :: CycleCountAccum;
getIPClas298 :: CycleCountAccum;
getIPClas299 :: CycleCountAccum;
getIPClas300 :: CycleCountAccum;
getIPClas301 :: CycleCountAccum;
getIPClas302 :: CycleCountAccum;
getIPClas303 :: CycleCountAccum;
getIPClas304 :: CycleCountAccum;
getIPClas305 :: CycleCountAccum;
getIPClas306 :: CycleCountAccum;
getIPClas307 :: CycleCountAccum;
getIPClas308 :: CycleCountAccum;
getIPClas309 :: CycleCountAccum;
getIPClas310 :: CycleCountAccum;
getIPClas311 :: CycleCountAccum;
getIPClas312 :: CycleCountAccum;
getIPClas313 :: CycleCountAccum;
getIPClas314 :: CycleCountAccum;
getIPClas315 :: CycleCountAccum;
getIPClas316 :: CycleCountAccum;
getIPClas317 :: CycleCountAccum;
getIPClas318 :: CycleCountAccum;
getIPClas319 :: CycleCountAccum;
getIPClas320 :: CycleCountAccum;
getIPClas321 :: CycleCountAccum;
getIPClas322 :: CycleCountAccum;
getIPClas323 :: CycleCountAccum;
getIPClas324 :: CycleCountAccum;
getIPClas325 :: CycleCountAccum;
getIPClas326 :: CycleCountAccum;
getIPClas327 :: CycleCountAccum;
getIPClas328 :: CycleCountAccum;
getIPClas329 :: CycleCountAccum;
getIPClas330 :: CycleCountAccum;
getIPClas331 :: CycleCountAccum;
getIPClas332 :: CycleCountAccum;
getIPClas333 :: CycleCountAccum;
getIPClas334 :: CycleCountAccum;
getIPClas335 :: CycleCountAccum;
getIPClas336 :: CycleCountAccum;
getIPClas337 :: CycleCountAccum;
getIPClas338 :: CycleCountAccum;
getIPClas339 :: CycleCountAccum;
getIPClas340 :: CycleCountAccum;
getIPClas341 :: CycleCountAccum;
getIPClas342 :: CycleCountAccum;
getIPClas343 :: CycleCountAccum;
getIPClas344 :: CycleCountAccum;
getIPClas345 :: CycleCountAccum;
getIPClas346 :: CycleCountAccum;
getIPClas347 :: CycleCountAccum;
getIPClas348 :: CycleCountAccum;
getIPClas349 :: CycleCountAccum;
getIPClas350 :: CycleCountAccum;
getIPClas351 :: CycleCountAccum;
getIPClas352 :: CycleCountAccum;
getIPClas353 :: CycleCountAccum;
getIPClas354 :: CycleCountAccum;
getIPClas355 :: CycleCountAccum;
getIPClas356 :: CycleCountAccum;
getIPClas357 :: CycleCountAccum;
getIPClas358 :: CycleCountAccum;
getIPClas359 :: CycleCountAccum;
getIPClas360 :: CycleCountAccum;
getIPClas361 :: CycleCountAccum;
getIPClas362 :: CycleCountAccum;
getIPClas363 :: CycleCountAccum;
getIPClas364 :: CycleCountAccum;
getIPClas365 :: CycleCountAccum;
getIPClas366 :: CycleCountAccum;
getIPClas367 :: CycleCountAccum;
getIPClas368 :: CycleCountAccum;
getIPClas369 :: CycleCountAccum;
getIPClas370 :: CycleCountAccum;
getIPClas371 :: CycleCountAccum;
getIPClas372 :: CycleCountAccum;
getIPClas373 :: CycleCountAccum;
getIPClas374 :: CycleCountAccum;
getIPClas375 :: CycleCountAccum;
getIPClas376 :: CycleCountAccum;
getIPClas377 :: CycleCountAccum;
getIPClas378 :: CycleCountAccum;
getIPClas379 :: CycleCountAccum;
getIPClas380 :: CycleCountAccum;
getIPClas381 :: CycleCountAccum;
getIPClas382 :: CycleCountAccum;
getIPClas383 :: CycleCountAccum;
getIPClas384 :: CycleCountAccum;
getIPClas385 :: CycleCountAccum;
getIPClas386 :: CycleCountAccum;
getIPClas387 :: CycleCountAccum;
getIPClas388 :: CycleCountAccum;
getIPClas389 :: CycleCountAccum;
getIPClas390 :: CycleCountAccum;
getIPClas391 :: CycleCountAccum;
getIPClas392 :: CycleCountAccum;
getIPClas393 :: CycleCountAccum;
getIPClas394 :: CycleCountAccum;
getIPClas395 :: CycleCountAccum;
getIPClas396 :: CycleCountAccum;
getIPClas397 :: CycleCountAccum;
getIPClas398 :: CycleCountAccum;
getIPClas399 :: CycleCountAccum;
getIPClas400 :: CycleCountAccum;
getIPClas401 :: CycleCountAccum;
getIPClas402 :: CycleCountAccum;
getIPClas403 :: CycleCountAccum;
getIPClas404 :: CycleCountAccum;
getIPClas405 :: CycleCountAccum;
getIPClas406 :: CycleCountAccum;
getIPClas407 :: CycleCountAccum;
getIPClas408 :: CycleCountAccum;
getIPClas409 :: CycleCountAccum;
getIPClas410 :: CycleCountAccum;
getIPClas411 :: CycleCountAccum;
getIPClas412 :: CycleCountAccum;
getIPClas413 :: CycleCountAccum;
getIPClas414 :: CycleCountAccum;
getIPClas415 :: CycleCountAccum;
getIPClas416 :: CycleCountAccum;
getIPClas417 :: CycleCountAccum;
getIPClas418 :: CycleCountAccum;
getIPClas419 :: CycleCountAccum;
getIPClas420 :: CycleCountAccum;
getIPClas421 :: CycleCountAccum;
getIPClas422 :: CycleCountAccum;
getIPClas423 :: CycleCountAccum;
getIPClas424 :: CycleCountAccum;
getIPClas425 :: CycleCountAccum;
getIPClas426 :: CycleCountAccum;
getIPClas427 :: CycleCountAccum;
getIPClas428 :: CycleCountAccum;
getIPClas429 :: CycleCountAccum;
getIPClas430 :: CycleCountAccum;
getIPClas431 :: CycleCountAccum;
getIPClas432 :: CycleCountAccum;
getIPClas433 :: CycleCountAccum;
getIPClas434 :: CycleCountAccum;
getIPClas435 :: CycleCountAccum;
getIPClas436 :: CycleCountAccum;
getIPClas437 :: CycleCountAccum;
getIPClas438 :: CycleCountAccum;
getIPClas439 :: CycleCountAccum;
getIPClas440 :: CycleCountAccum;
getIPClas441 :: CycleCountAccum;
getIPClas442 :: CycleCountAccum;
getIPClas443 :: CycleCountAccum;
getIPClas444 :: CycleCountAccum;
getIPClas445 :: CycleCountAccum;
getIPClas446 :: CycleCountAccum;
getIPClas447 :: CycleCountAccum;
getIPClas448 :: CycleCountAccum;
getIPClas449 :: CycleCountAccum;
getIPClas450 :: CycleCountAccum;
getIPClas451 :: CycleCountAccum;
getIPClas452 :: CycleCountAccum;
getIPClas453 :: CycleCountAccum;
getIPClas454 :: CycleCountAccum;
getIPClas455 :: CycleCountAccum;
getIPClas456 :: CycleCountAccum;
getIPClas457 :: CycleCountAccum;
getIPClas458 :: CycleCountAccum;
getIPClas459 :: CycleCountAccum;
getIPClas460 :: CycleCountAccum;
getIPClas461 :: CycleCountAccum;
getIPClas462 :: CycleCountAccum;
getIPClas463 :: CycleCountAccum;
getIPClas464 :: CycleCountAccum;
getIPClas465 :: CycleCountAccum;
getIPClas466 :: CycleCountAccum;
getIPClas467 :: CycleCountAccum;
getIPClas468 :: CycleCountAccum;
getIPClas469 :: CycleCountAccum;
getIPClas470 :: CycleCountAccum;
getIPClas471 :: CycleCountAccum;
getIPClas472 :: CycleCountAccum;
getIPClas473 :: CycleCountAccum;
getIPClas474 :: CycleCountAccum;
getIPClas475 :: CycleCountAccum;
getIPClas476 :: CycleCountAccum;
getIPClas477 :: CycleCountAccum;
getIPClas478 :: CycleCountAccum;
getIPClas479 :: CycleCountAccum;
getIPClas480 :: CycleCountAccum;
getIPClas481 :: CycleCountAccum;
getIPClas482 :: CycleCountAccum;
getIPClas483 :: CycleCountAccum;
getIPClas484 :: CycleCountAccum;
getIPClas485 :: CycleCountAccum;
getIPClas486 :: CycleCountAccum;
getIPClas487 :: CycleCountAccum;
getIPClas488 :: CycleCountAccum;
getIPClas489 :: CycleCountAccum;
getIPClas490 :: CycleCountAccum;
getIPClas491 :: CycleCountAccum;
getIPClas492 :: CycleCountAccum;
getIPClas493 :: CycleCountAccum;
getIPClas494 :: CycleCountAccum;
getIPClas495 :: CycleCountAccum;
getIPClas496 :: CycleCountAccum;
getIPClas497 :: CycleCountAccum;
getIPClas498 :: CycleCountAccum;
getIPClas499 :: CycleCountAccum;
getIPClas500 :: CycleCountAccum;
getIPClas501 :: CycleCountAccum;
getIPClas502 :: CycleCountAccum;
getIPClas503 :: CycleCountAccum;
getIPClas504 :: CycleCountAccum;
getIPClas505 :: CycleCountAccum;
getIPClas506 :: CycleCountAccum;
getIPClas507 :: CycleCountAccum;
getIPClas508 :: CycleCountAccum;
getIPClas509 :: CycleCountAccum;
getIPClas510 :: CycleCountAccum;
getIPClas511 :: CycleCountAccum;

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
ipclassifier[256] -> getIPClas256 -> Discard ();
ipclassifier[257] -> getIPClas257 -> Discard ();
ipclassifier[258] -> getIPClas258 -> Discard ();
ipclassifier[259] -> getIPClas259 -> Discard ();
ipclassifier[260] -> getIPClas260 -> Discard ();
ipclassifier[261] -> getIPClas261 -> Discard ();
ipclassifier[262] -> getIPClas262 -> Discard ();
ipclassifier[263] -> getIPClas263 -> Discard ();
ipclassifier[264] -> getIPClas264 -> Discard ();
ipclassifier[265] -> getIPClas265 -> Discard ();
ipclassifier[266] -> getIPClas266 -> Discard ();
ipclassifier[267] -> getIPClas267 -> Discard ();
ipclassifier[268] -> getIPClas268 -> Discard ();
ipclassifier[269] -> getIPClas269 -> Discard ();
ipclassifier[270] -> getIPClas270 -> Discard ();
ipclassifier[271] -> getIPClas271 -> Discard ();
ipclassifier[272] -> getIPClas272 -> Discard ();
ipclassifier[273] -> getIPClas273 -> Discard ();
ipclassifier[274] -> getIPClas274 -> Discard ();
ipclassifier[275] -> getIPClas275 -> Discard ();
ipclassifier[276] -> getIPClas276 -> Discard ();
ipclassifier[277] -> getIPClas277 -> Discard ();
ipclassifier[278] -> getIPClas278 -> Discard ();
ipclassifier[279] -> getIPClas279 -> Discard ();
ipclassifier[280] -> getIPClas280 -> Discard ();
ipclassifier[281] -> getIPClas281 -> Discard ();
ipclassifier[282] -> getIPClas282 -> Discard ();
ipclassifier[283] -> getIPClas283 -> Discard ();
ipclassifier[284] -> getIPClas284 -> Discard ();
ipclassifier[285] -> getIPClas285 -> Discard ();
ipclassifier[286] -> getIPClas286 -> Discard ();
ipclassifier[287] -> getIPClas287 -> Discard ();
ipclassifier[288] -> getIPClas288 -> Discard ();
ipclassifier[289] -> getIPClas289 -> Discard ();
ipclassifier[290] -> getIPClas290 -> Discard ();
ipclassifier[291] -> getIPClas291 -> Discard ();
ipclassifier[292] -> getIPClas292 -> Discard ();
ipclassifier[293] -> getIPClas293 -> Discard ();
ipclassifier[294] -> getIPClas294 -> Discard ();
ipclassifier[295] -> getIPClas295 -> Discard ();
ipclassifier[296] -> getIPClas296 -> Discard ();
ipclassifier[297] -> getIPClas297 -> Discard ();
ipclassifier[298] -> getIPClas298 -> Discard ();
ipclassifier[299] -> getIPClas299 -> Discard ();
ipclassifier[300] -> getIPClas300 -> Discard ();
ipclassifier[301] -> getIPClas301 -> Discard ();
ipclassifier[302] -> getIPClas302 -> Discard ();
ipclassifier[303] -> getIPClas303 -> Discard ();
ipclassifier[304] -> getIPClas304 -> Discard ();
ipclassifier[305] -> getIPClas305 -> Discard ();
ipclassifier[306] -> getIPClas306 -> Discard ();
ipclassifier[307] -> getIPClas307 -> Discard ();
ipclassifier[308] -> getIPClas308 -> Discard ();
ipclassifier[309] -> getIPClas309 -> Discard ();
ipclassifier[310] -> getIPClas310 -> Discard ();
ipclassifier[311] -> getIPClas311 -> Discard ();
ipclassifier[312] -> getIPClas312 -> Discard ();
ipclassifier[313] -> getIPClas313 -> Discard ();
ipclassifier[314] -> getIPClas314 -> Discard ();
ipclassifier[315] -> getIPClas315 -> Discard ();
ipclassifier[316] -> getIPClas316 -> Discard ();
ipclassifier[317] -> getIPClas317 -> Discard ();
ipclassifier[318] -> getIPClas318 -> Discard ();
ipclassifier[319] -> getIPClas319 -> Discard ();
ipclassifier[320] -> getIPClas320 -> Discard ();
ipclassifier[321] -> getIPClas321 -> Discard ();
ipclassifier[322] -> getIPClas322 -> Discard ();
ipclassifier[323] -> getIPClas323 -> Discard ();
ipclassifier[324] -> getIPClas324 -> Discard ();
ipclassifier[325] -> getIPClas325 -> Discard ();
ipclassifier[326] -> getIPClas326 -> Discard ();
ipclassifier[327] -> getIPClas327 -> Discard ();
ipclassifier[328] -> getIPClas328 -> Discard ();
ipclassifier[329] -> getIPClas329 -> Discard ();
ipclassifier[330] -> getIPClas330 -> Discard ();
ipclassifier[331] -> getIPClas331 -> Discard ();
ipclassifier[332] -> getIPClas332 -> Discard ();
ipclassifier[333] -> getIPClas333 -> Discard ();
ipclassifier[334] -> getIPClas334 -> Discard ();
ipclassifier[335] -> getIPClas335 -> Discard ();
ipclassifier[336] -> getIPClas336 -> Discard ();
ipclassifier[337] -> getIPClas337 -> Discard ();
ipclassifier[338] -> getIPClas338 -> Discard ();
ipclassifier[339] -> getIPClas339 -> Discard ();
ipclassifier[340] -> getIPClas340 -> Discard ();
ipclassifier[341] -> getIPClas341 -> Discard ();
ipclassifier[342] -> getIPClas342 -> Discard ();
ipclassifier[343] -> getIPClas343 -> Discard ();
ipclassifier[344] -> getIPClas344 -> Discard ();
ipclassifier[345] -> getIPClas345 -> Discard ();
ipclassifier[346] -> getIPClas346 -> Discard ();
ipclassifier[347] -> getIPClas347 -> Discard ();
ipclassifier[348] -> getIPClas348 -> Discard ();
ipclassifier[349] -> getIPClas349 -> Discard ();
ipclassifier[350] -> getIPClas350 -> Discard ();
ipclassifier[351] -> getIPClas351 -> Discard ();
ipclassifier[352] -> getIPClas352 -> Discard ();
ipclassifier[353] -> getIPClas353 -> Discard ();
ipclassifier[354] -> getIPClas354 -> Discard ();
ipclassifier[355] -> getIPClas355 -> Discard ();
ipclassifier[356] -> getIPClas356 -> Discard ();
ipclassifier[357] -> getIPClas357 -> Discard ();
ipclassifier[358] -> getIPClas358 -> Discard ();
ipclassifier[359] -> getIPClas359 -> Discard ();
ipclassifier[360] -> getIPClas360 -> Discard ();
ipclassifier[361] -> getIPClas361 -> Discard ();
ipclassifier[362] -> getIPClas362 -> Discard ();
ipclassifier[363] -> getIPClas363 -> Discard ();
ipclassifier[364] -> getIPClas364 -> Discard ();
ipclassifier[365] -> getIPClas365 -> Discard ();
ipclassifier[366] -> getIPClas366 -> Discard ();
ipclassifier[367] -> getIPClas367 -> Discard ();
ipclassifier[368] -> getIPClas368 -> Discard ();
ipclassifier[369] -> getIPClas369 -> Discard ();
ipclassifier[370] -> getIPClas370 -> Discard ();
ipclassifier[371] -> getIPClas371 -> Discard ();
ipclassifier[372] -> getIPClas372 -> Discard ();
ipclassifier[373] -> getIPClas373 -> Discard ();
ipclassifier[374] -> getIPClas374 -> Discard ();
ipclassifier[375] -> getIPClas375 -> Discard ();
ipclassifier[376] -> getIPClas376 -> Discard ();
ipclassifier[377] -> getIPClas377 -> Discard ();
ipclassifier[378] -> getIPClas378 -> Discard ();
ipclassifier[379] -> getIPClas379 -> Discard ();
ipclassifier[380] -> getIPClas380 -> Discard ();
ipclassifier[381] -> getIPClas381 -> Discard ();
ipclassifier[382] -> getIPClas382 -> Discard ();
ipclassifier[383] -> getIPClas383 -> Discard ();
ipclassifier[384] -> getIPClas384 -> Discard ();
ipclassifier[385] -> getIPClas385 -> Discard ();
ipclassifier[386] -> getIPClas386 -> Discard ();
ipclassifier[387] -> getIPClas387 -> Discard ();
ipclassifier[388] -> getIPClas388 -> Discard ();
ipclassifier[389] -> getIPClas389 -> Discard ();
ipclassifier[390] -> getIPClas390 -> Discard ();
ipclassifier[391] -> getIPClas391 -> Discard ();
ipclassifier[392] -> getIPClas392 -> Discard ();
ipclassifier[393] -> getIPClas393 -> Discard ();
ipclassifier[394] -> getIPClas394 -> Discard ();
ipclassifier[395] -> getIPClas395 -> Discard ();
ipclassifier[396] -> getIPClas396 -> Discard ();
ipclassifier[397] -> getIPClas397 -> Discard ();
ipclassifier[398] -> getIPClas398 -> Discard ();
ipclassifier[399] -> getIPClas399 -> Discard ();
ipclassifier[400] -> getIPClas400 -> Discard ();
ipclassifier[401] -> getIPClas401 -> Discard ();
ipclassifier[402] -> getIPClas402 -> Discard ();
ipclassifier[403] -> getIPClas403 -> Discard ();
ipclassifier[404] -> getIPClas404 -> Discard ();
ipclassifier[405] -> getIPClas405 -> Discard ();
ipclassifier[406] -> getIPClas406 -> Discard ();
ipclassifier[407] -> getIPClas407 -> Discard ();
ipclassifier[408] -> getIPClas408 -> Discard ();
ipclassifier[409] -> getIPClas409 -> Discard ();
ipclassifier[410] -> getIPClas410 -> Discard ();
ipclassifier[411] -> getIPClas411 -> Discard ();
ipclassifier[412] -> getIPClas412 -> Discard ();
ipclassifier[413] -> getIPClas413 -> Discard ();
ipclassifier[414] -> getIPClas414 -> Discard ();
ipclassifier[415] -> getIPClas415 -> Discard ();
ipclassifier[416] -> getIPClas416 -> Discard ();
ipclassifier[417] -> getIPClas417 -> Discard ();
ipclassifier[418] -> getIPClas418 -> Discard ();
ipclassifier[419] -> getIPClas419 -> Discard ();
ipclassifier[420] -> getIPClas420 -> Discard ();
ipclassifier[421] -> getIPClas421 -> Discard ();
ipclassifier[422] -> getIPClas422 -> Discard ();
ipclassifier[423] -> getIPClas423 -> Discard ();
ipclassifier[424] -> getIPClas424 -> Discard ();
ipclassifier[425] -> getIPClas425 -> Discard ();
ipclassifier[426] -> getIPClas426 -> Discard ();
ipclassifier[427] -> getIPClas427 -> Discard ();
ipclassifier[428] -> getIPClas428 -> Discard ();
ipclassifier[429] -> getIPClas429 -> Discard ();
ipclassifier[430] -> getIPClas430 -> Discard ();
ipclassifier[431] -> getIPClas431 -> Discard ();
ipclassifier[432] -> getIPClas432 -> Discard ();
ipclassifier[433] -> getIPClas433 -> Discard ();
ipclassifier[434] -> getIPClas434 -> Discard ();
ipclassifier[435] -> getIPClas435 -> Discard ();
ipclassifier[436] -> getIPClas436 -> Discard ();
ipclassifier[437] -> getIPClas437 -> Discard ();
ipclassifier[438] -> getIPClas438 -> Discard ();
ipclassifier[439] -> getIPClas439 -> Discard ();
ipclassifier[440] -> getIPClas440 -> Discard ();
ipclassifier[441] -> getIPClas441 -> Discard ();
ipclassifier[442] -> getIPClas442 -> Discard ();
ipclassifier[443] -> getIPClas443 -> Discard ();
ipclassifier[444] -> getIPClas444 -> Discard ();
ipclassifier[445] -> getIPClas445 -> Discard ();
ipclassifier[446] -> getIPClas446 -> Discard ();
ipclassifier[447] -> getIPClas447 -> Discard ();
ipclassifier[448] -> getIPClas448 -> Discard ();
ipclassifier[449] -> getIPClas449 -> Discard ();
ipclassifier[450] -> getIPClas450 -> Discard ();
ipclassifier[451] -> getIPClas451 -> Discard ();
ipclassifier[452] -> getIPClas452 -> Discard ();
ipclassifier[453] -> getIPClas453 -> Discard ();
ipclassifier[454] -> getIPClas454 -> Discard ();
ipclassifier[455] -> getIPClas455 -> Discard ();
ipclassifier[456] -> getIPClas456 -> Discard ();
ipclassifier[457] -> getIPClas457 -> Discard ();
ipclassifier[458] -> getIPClas458 -> Discard ();
ipclassifier[459] -> getIPClas459 -> Discard ();
ipclassifier[460] -> getIPClas460 -> Discard ();
ipclassifier[461] -> getIPClas461 -> Discard ();
ipclassifier[462] -> getIPClas462 -> Discard ();
ipclassifier[463] -> getIPClas463 -> Discard ();
ipclassifier[464] -> getIPClas464 -> Discard ();
ipclassifier[465] -> getIPClas465 -> Discard ();
ipclassifier[466] -> getIPClas466 -> Discard ();
ipclassifier[467] -> getIPClas467 -> Discard ();
ipclassifier[468] -> getIPClas468 -> Discard ();
ipclassifier[469] -> getIPClas469 -> Discard ();
ipclassifier[470] -> getIPClas470 -> Discard ();
ipclassifier[471] -> getIPClas471 -> Discard ();
ipclassifier[472] -> getIPClas472 -> Discard ();
ipclassifier[473] -> getIPClas473 -> Discard ();
ipclassifier[474] -> getIPClas474 -> Discard ();
ipclassifier[475] -> getIPClas475 -> Discard ();
ipclassifier[476] -> getIPClas476 -> Discard ();
ipclassifier[477] -> getIPClas477 -> Discard ();
ipclassifier[478] -> getIPClas478 -> Discard ();
ipclassifier[479] -> getIPClas479 -> Discard ();
ipclassifier[480] -> getIPClas480 -> Discard ();
ipclassifier[481] -> getIPClas481 -> Discard ();
ipclassifier[482] -> getIPClas482 -> Discard ();
ipclassifier[483] -> getIPClas483 -> Discard ();
ipclassifier[484] -> getIPClas484 -> Discard ();
ipclassifier[485] -> getIPClas485 -> Discard ();
ipclassifier[486] -> getIPClas486 -> Discard ();
ipclassifier[487] -> getIPClas487 -> Discard ();
ipclassifier[488] -> getIPClas488 -> Discard ();
ipclassifier[489] -> getIPClas489 -> Discard ();
ipclassifier[490] -> getIPClas490 -> Discard ();
ipclassifier[491] -> getIPClas491 -> Discard ();
ipclassifier[492] -> getIPClas492 -> Discard ();
ipclassifier[493] -> getIPClas493 -> Discard ();
ipclassifier[494] -> getIPClas494 -> Discard ();
ipclassifier[495] -> getIPClas495 -> Discard ();
ipclassifier[496] -> getIPClas496 -> Discard ();
ipclassifier[497] -> getIPClas497 -> Discard ();
ipclassifier[498] -> getIPClas498 -> Discard ();
ipclassifier[499] -> getIPClas499 -> Discard ();
ipclassifier[500] -> getIPClas500 -> Discard ();
ipclassifier[501] -> getIPClas501 -> Discard ();
ipclassifier[502] -> getIPClas502 -> Discard ();
ipclassifier[503] -> getIPClas503 -> Discard ();
ipclassifier[504] -> getIPClas504 -> Discard ();
ipclassifier[505] -> getIPClas505 -> Discard ();
ipclassifier[506] -> getIPClas506 -> Discard ();
ipclassifier[507] -> getIPClas507 -> Discard ();
ipclassifier[508] -> getIPClas508 -> Discard ();
ipclassifier[509] -> getIPClas509 -> Discard ();
ipclassifier[510] -> getIPClas510 -> Discard ();
ipclassifier[511] -> getIPClas511 -> Discard ();
	
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
