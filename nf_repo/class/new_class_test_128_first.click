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
	((dst port 11023) || (dst port 35064) || (dst port 51907) || (dst port 52001) || (dst port 54969)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.15.27/32) || (dst net 1.0.67.84/32) || (dst net 1.0.75.70/32) || (dst net 1.0.145.46/32) || (dst net 1.0.196.17/32))),
	((dst port 19730) || (dst port 29638) || (dst port 39399) || (dst port 54293) || (dst port 58241)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.68.178/32) || (dst net 2.0.141.86/32) || (dst net 2.0.203.172/32) || (dst net 2.0.224.113/32) || (dst net 2.0.226.40/32))),
	((dst port 11553) || (dst port 50042) || (dst port 50504) || (dst port 51046) || (dst port 63152)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.71.37/32) || (dst net 3.0.129.187/32) || (dst net 3.0.222.70/32) || (dst net 3.0.225.251/32) || (dst net 3.0.232.138/32))),
	((dst port 8787) || (dst port 32944) || (dst port 35473) || (dst port 39476) || (dst port 54586)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.66.116/32) || (dst net 4.0.90.73/32) || (dst net 4.0.178.202/32) || (dst net 4.0.196.236/32) || (dst net 4.0.254.201/32))),
	((dst port 9173) || (dst port 29022) || (dst port 37098) || (dst port 53685) || (dst port 64610)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.55.123/32) || (dst net 5.0.86.171/32) || (dst net 5.0.99.3/32) || (dst net 5.0.102.38/32) || (dst net 5.0.253.83/32))),
	((dst port 370) || (dst port 6290) || (dst port 11499) || (dst port 60457) || (dst port 65307)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.69.196/32) || (dst net 6.0.83.70/32) || (dst net 6.0.220.96/32) || (dst net 6.0.232.130/32) || (dst net 6.0.241.199/32))),
	((dst port 1824) || (dst port 6258) || (dst port 19879) || (dst port 29196) || (dst port 64954)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.9.167/32) || (dst net 7.0.171.115/32) || (dst net 7.0.178.192/32) || (dst net 7.0.185.83/32) || (dst net 7.0.220.247/32))),
	((dst port 6038) || (dst port 19586) || (dst port 21562) || (dst port 32616) || (dst port 64099)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.21.172/32) || (dst net 8.0.23.66/32) || (dst net 8.0.119.120/32) || (dst net 8.0.220.171/32) || (dst net 8.0.227.108/32))),
	((dst port 4835) || (dst port 10078) || (dst port 34532) || (dst port 40979) || (dst port 63561)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.45.119/32) || (dst net 9.0.102.217/32) || (dst net 9.0.172.77/32) || (dst net 9.0.186.161/32) || (dst net 9.0.241.171/32))),
	((dst port 4356) || (dst port 6085) || (dst port 32831) || (dst port 37462) || (dst port 54132)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.50.62/32) || (dst net 10.0.60.225/32) || (dst net 10.0.136.243/32) || (dst net 10.0.199.88/32) || (dst net 10.0.239.186/32))),
	((dst port 5492) || (dst port 24767) || (dst port 34277) || (dst port 38992) || (dst port 40162)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.11.98/32) || (dst net 11.0.45.131/32) || (dst net 11.0.113.154/32) || (dst net 11.0.114.192/32) || (dst net 11.0.132.224/32))),
	((dst port 33228) || (dst port 33998) || (dst port 57882) || (dst port 58908) || (dst port 59312)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.16.67/32) || (dst net 12.0.95.127/32) || (dst net 12.0.137.167/32) || (dst net 12.0.171.8/32) || (dst net 12.0.180.181/32))),
	((dst port 13584) || (dst port 18904) || (dst port 49815) || (dst port 64685) || (dst port 65172)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.14.91/32) || (dst net 13.0.28.49/32) || (dst net 13.0.87.251/32) || (dst net 13.0.139.253/32) || (dst net 13.0.234.120/32))),
	((dst port 5731) || (dst port 50349) || (dst port 60024) || (dst port 61560) || (dst port 62246)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.54.80/32) || (dst net 14.0.61.91/32) || (dst net 14.0.76.176/32) || (dst net 14.0.154.80/32) || (dst net 14.0.218.25/32))),
	((dst port 15697) || (dst port 17560) || (dst port 33247) || (dst port 47516) || (dst port 55191)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.39.175/32) || (dst net 15.0.63.216/32) || (dst net 15.0.114.146/32) || (dst net 15.0.115.97/32) || (dst net 15.0.166.164/32))),
	((dst port 27501) || (dst port 31162) || (dst port 38430) || (dst port 38548) || (dst port 43943)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.121.19/32) || (dst net 16.0.172.136/32) || (dst net 16.0.213.9/32) || (dst net 16.0.243.17/32) || (dst net 16.0.255.253/32))),
	((dst port 18589) || (dst port 20740) || (dst port 45977) || (dst port 48354) || (dst port 56340)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.27.105/32) || (dst net 17.0.77.158/32) || (dst net 17.0.161.159/32) || (dst net 17.0.175.83/32) || (dst net 17.0.191.200/32))),
	((dst port 8210) || (dst port 19420) || (dst port 21362) || (dst port 31935) || (dst port 42497)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.5.206/32) || (dst net 18.0.70.160/32) || (dst net 18.0.89.178/32) || (dst net 18.0.161.254/32) || (dst net 18.0.168.54/32))),
	((dst port 16808) || (dst port 26854) || (dst port 30367) || (dst port 41468) || (dst port 48720)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.38.93/32) || (dst net 19.0.94.105/32) || (dst net 19.0.147.8/32) || (dst net 19.0.200.190/32) || (dst net 19.0.208.118/32))),
	((dst port 14979) || (dst port 20315) || (dst port 23506) || (dst port 35361) || (dst port 55647)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.17.213/32) || (dst net 20.0.121.240/32) || (dst net 20.0.129.246/32) || (dst net 20.0.168.231/32) || (dst net 20.0.220.13/32))),
	((dst port 4077) || (dst port 7190) || (dst port 9391) || (dst port 26573) || (dst port 46205)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.104.149/32) || (dst net 21.0.152.131/32) || (dst net 21.0.159.204/32) || (dst net 21.0.223.125/32) || (dst net 21.0.254.36/32))),
	((dst port 3671) || (dst port 6366) || (dst port 34186) || (dst port 37372) || (dst port 57856)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.45.152/32) || (dst net 22.0.84.70/32) || (dst net 22.0.155.43/32) || (dst net 22.0.204.117/32) || (dst net 22.0.205.38/32))),
	((dst port 29959) || (dst port 33294) || (dst port 49532) || (dst port 54474) || (dst port 62120)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.21.211/32) || (dst net 23.0.131.159/32) || (dst net 23.0.181.143/32) || (dst net 23.0.189.248/32) || (dst net 23.0.227.250/32))),
	((dst port 3062) || (dst port 8384) || (dst port 17564) || (dst port 29558) || (dst port 62582)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.32.111/32) || (dst net 24.0.96.252/32) || (dst net 24.0.106.229/32) || (dst net 24.0.109.156/32) || (dst net 24.0.231.63/32))),
	((dst port 13318) || (dst port 16017) || (dst port 34160) || (dst port 42048) || (dst port 52952)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.28.106/32) || (dst net 25.0.44.180/32) || (dst net 25.0.127.35/32) || (dst net 25.0.197.31/32) || (dst net 25.0.200.252/32))),
	((dst port 33803) || (dst port 41382) || (dst port 46901) || (dst port 56365) || (dst port 59570)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.1.0/32) || (dst net 26.0.88.6/32) || (dst net 26.0.146.243/32) || (dst net 26.0.156.222/32) || (dst net 26.0.191.255/32))),
	((dst port 6611) || (dst port 11854) || (dst port 15068) || (dst port 22199) || (dst port 34499)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.3.180/32) || (dst net 27.0.4.67/32) || (dst net 27.0.32.225/32) || (dst net 27.0.121.118/32) || (dst net 27.0.186.156/32))),
	((dst port 22396) || (dst port 23434) || (dst port 31703) || (dst port 32533) || (dst port 38449)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.13.54/32) || (dst net 28.0.21.254/32) || (dst net 28.0.47.101/32) || (dst net 28.0.124.224/32) || (dst net 28.0.240.77/32))),
	((dst port 14699) || (dst port 21017) || (dst port 35065) || (dst port 55874) || (dst port 56262)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.8.110/32) || (dst net 29.0.43.114/32) || (dst net 29.0.74.248/32) || (dst net 29.0.120.46/32) || (dst net 29.0.250.251/32))),
	((dst port 20939) || (dst port 25659) || (dst port 28127) || (dst port 36859) || (dst port 64896)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.89.147/32) || (dst net 30.0.138.131/32) || (dst net 30.0.176.39/32) || (dst net 30.0.195.2/32) || (dst net 30.0.195.229/32))),
	((dst port 12558) || (dst port 18158) || (dst port 31312) || (dst port 41475) || (dst port 61775)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.63.154/32) || (dst net 31.0.65.11/32) || (dst net 31.0.133.50/32) || (dst net 31.0.145.118/32) || (dst net 31.0.183.12/32))),
	((dst port 9349) || (dst port 19731) || (dst port 36890) || (dst port 38036) || (dst port 39729)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.44.106/32) || (dst net 32.0.180.130/32) || (dst net 32.0.210.75/32) || (dst net 32.0.231.216/32) || (dst net 32.0.232.101/32))),
	((dst port 22892) || (dst port 42458) || (dst port 50068) || (dst port 53183) || (dst port 65244)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.59.154/32) || (dst net 33.0.77.17/32) || (dst net 33.0.102.54/32) || (dst net 33.0.220.82/32) || (dst net 33.0.244.94/32))),
	((dst port 16170) || (dst port 31582) || (dst port 49166) || (dst port 51047) || (dst port 55293)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.49.81/32) || (dst net 34.0.154.159/32) || (dst net 34.0.172.206/32) || (dst net 34.0.200.172/32) || (dst net 34.0.255.210/32))),
	((dst port 5703) || (dst port 34798) || (dst port 40043) || (dst port 61077) || (dst port 62110)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.16.0/32) || (dst net 35.0.36.41/32) || (dst net 35.0.131.223/32) || (dst net 35.0.152.246/32) || (dst net 35.0.245.20/32))),
	((dst port 24240) || (dst port 26026) || (dst port 31803) || (dst port 33255) || (dst port 64147)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.11.93/32) || (dst net 36.0.56.5/32) || (dst net 36.0.56.106/32) || (dst net 36.0.182.206/32) || (dst net 36.0.207.251/32))),
	((dst port 33383) || (dst port 47887) || (dst port 54423) || (dst port 58861) || (dst port 64878)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.32.239/32) || (dst net 37.0.44.8/32) || (dst net 37.0.68.148/32) || (dst net 37.0.103.233/32) || (dst net 37.0.219.100/32))),
	((dst port 11917) || (dst port 17219) || (dst port 58367) || (dst port 58660) || (dst port 58725)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.48.62/32) || (dst net 38.0.69.101/32) || (dst net 38.0.84.137/32) || (dst net 38.0.181.134/32) || (dst net 38.0.253.220/32))),
	((dst port 825) || (dst port 37808) || (dst port 47899) || (dst port 58521) || (dst port 63108)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.26.141/32) || (dst net 39.0.46.188/32) || (dst net 39.0.94.1/32) || (dst net 39.0.102.33/32) || (dst net 39.0.214.108/32))),
	((dst port 6767) || (dst port 17952) || (dst port 25383) || (dst port 49695) || (dst port 50353)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.59.80/32) || (dst net 40.0.98.38/32) || (dst net 40.0.155.87/32) || (dst net 40.0.182.3/32) || (dst net 40.0.240.107/32))),
	((dst port 660) || (dst port 7219) || (dst port 10092) || (dst port 24223) || (dst port 27012)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.14.198/32) || (dst net 41.0.32.82/32) || (dst net 41.0.76.111/32) || (dst net 41.0.93.14/32) || (dst net 41.0.146.196/32))),
	((dst port 6587) || (dst port 12923) || (dst port 20531) || (dst port 34409) || (dst port 57292)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.43.38/32) || (dst net 42.0.73.141/32) || (dst net 42.0.111.41/32) || (dst net 42.0.175.204/32) || (dst net 42.0.205.198/32))),
	((dst port 8602) || (dst port 11369) || (dst port 26799) || (dst port 50251) || (dst port 50698)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.12.10/32) || (dst net 43.0.47.157/32) || (dst net 43.0.49.204/32) || (dst net 43.0.122.169/32) || (dst net 43.0.180.19/32))),
	((dst port 15) || (dst port 6727) || (dst port 7231) || (dst port 19162) || (dst port 34538)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.52.197/32) || (dst net 44.0.91.178/32) || (dst net 44.0.95.174/32) || (dst net 44.0.166.180/32) || (dst net 44.0.191.62/32))),
	((dst port 752) || (dst port 15764) || (dst port 28069) || (dst port 33628) || (dst port 48300)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.54.19/32) || (dst net 45.0.74.36/32) || (dst net 45.0.96.73/32) || (dst net 45.0.97.122/32) || (dst net 45.0.254.144/32))),
	((dst port 12089) || (dst port 19824) || (dst port 28625) || (dst port 56164) || (dst port 59323)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.17.251/32) || (dst net 46.0.117.96/32) || (dst net 46.0.140.40/32) || (dst net 46.0.155.209/32) || (dst net 46.0.239.85/32))),
	((dst port 4730) || (dst port 14507) || (dst port 21317) || (dst port 24395) || (dst port 27547)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.52.143/32) || (dst net 47.0.76.173/32) || (dst net 47.0.155.92/32) || (dst net 47.0.206.190/32) || (dst net 47.0.210.205/32))),
	((dst port 470) || (dst port 5638) || (dst port 46072) || (dst port 53691) || (dst port 59567)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.47.55/32) || (dst net 48.0.85.224/32) || (dst net 48.0.183.131/32) || (dst net 48.0.191.168/32) || (dst net 48.0.212.192/32))),
	((dst port 19058) || (dst port 30214) || (dst port 32644) || (dst port 41934) || (dst port 51548)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.4.219/32) || (dst net 49.0.112.109/32) || (dst net 49.0.152.18/32) || (dst net 49.0.154.157/32) || (dst net 49.0.230.140/32))),
	((dst port 19194) || (dst port 23959) || (dst port 28976) || (dst port 58588) || (dst port 61543)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.17.219/32) || (dst net 50.0.129.27/32) || (dst net 50.0.146.178/32) || (dst net 50.0.202.117/32) || (dst net 50.0.239.129/32))),
	((dst port 10843) || (dst port 21460) || (dst port 50547) || (dst port 50690) || (dst port 60882)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.0.6/32) || (dst net 51.0.6.40/32) || (dst net 51.0.88.147/32) || (dst net 51.0.140.186/32) || (dst net 51.0.172.199/32))),
	((dst port 10174) || (dst port 18294) || (dst port 30474) || (dst port 43135) || (dst port 65001)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.41.30/32) || (dst net 52.0.89.252/32) || (dst net 52.0.121.155/32) || (dst net 52.0.161.64/32) || (dst net 52.0.174.116/32))),
	((dst port 23079) || (dst port 36147) || (dst port 43304) || (dst port 45495) || (dst port 55971)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.83.87/32) || (dst net 53.0.127.145/32) || (dst net 53.0.132.53/32) || (dst net 53.0.208.184/32) || (dst net 53.0.245.241/32))),
	((dst port 20319) || (dst port 32495) || (dst port 37994) || (dst port 39063) || (dst port 64708)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.15.91/32) || (dst net 54.0.37.204/32) || (dst net 54.0.114.219/32) || (dst net 54.0.115.104/32) || (dst net 54.0.137.185/32))),
	((dst port 39609) || (dst port 46441) || (dst port 48644) || (dst port 50118) || (dst port 55347)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.19.86/32) || (dst net 55.0.77.194/32) || (dst net 55.0.101.62/32) || (dst net 55.0.106.178/32) || (dst net 55.0.152.196/32))),
	((dst port 9471) || (dst port 16860) || (dst port 27382) || (dst port 37904) || (dst port 62483)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.66.68/32) || (dst net 56.0.101.192/32) || (dst net 56.0.146.192/32) || (dst net 56.0.159.71/32) || (dst net 56.0.190.70/32))),
	((dst port 2078) || (dst port 5433) || (dst port 31983) || (dst port 53568) || (dst port 64964)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.52.150/32) || (dst net 57.0.67.115/32) || (dst net 57.0.103.47/32) || (dst net 57.0.203.38/32) || (dst net 57.0.209.168/32))),
	((dst port 16014) || (dst port 24306) || (dst port 25051) || (dst port 53162) || (dst port 59344)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.28.122/32) || (dst net 58.0.32.205/32) || (dst net 58.0.131.55/32) || (dst net 58.0.138.63/32) || (dst net 58.0.191.54/32))),
	((dst port 31642) || (dst port 34192) || (dst port 47360) || (dst port 47409) || (dst port 64187)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.46.1/32) || (dst net 59.0.51.88/32) || (dst net 59.0.97.179/32) || (dst net 59.0.238.116/32) || (dst net 59.0.248.248/32))),
	((dst port 6035) || (dst port 42907) || (dst port 54989) || (dst port 57691) || (dst port 64986)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.18.149/32) || (dst net 60.0.38.173/32) || (dst net 60.0.141.100/32) || (dst net 60.0.142.36/32) || (dst net 60.0.167.114/32))),
	((dst port 13690) || (dst port 16147) || (dst port 51516) || (dst port 55509) || (dst port 61654)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.24.246/32) || (dst net 61.0.92.253/32) || (dst net 61.0.134.133/32) || (dst net 61.0.180.7/32) || (dst net 61.0.200.76/32))),
	((dst port 2164) || (dst port 6928) || (dst port 11541) || (dst port 46032) || (dst port 53703)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.1.200/32) || (dst net 62.0.41.16/32) || (dst net 62.0.139.255/32) || (dst net 62.0.240.129/32) || (dst net 62.0.242.144/32))),
	((dst port 5728) || (dst port 31047) || (dst port 40853) || (dst port 52510) || (dst port 62522)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.8.85/32) || (dst net 63.0.22.105/32) || (dst net 63.0.35.228/32) || (dst net 63.0.111.120/32) || (dst net 63.0.186.24/32))),
	((dst port 2957) || (dst port 36393) || (dst port 51936) || (dst port 57786) || (dst port 65241)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.82.56/32) || (dst net 64.0.97.59/32) || (dst net 64.0.232.116/32) || (dst net 64.0.250.120/32) || (dst net 64.0.251.112/32))),
	((dst port 3476) || (dst port 14783) || (dst port 19777) || (dst port 29959) || (dst port 41877)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.40.83/32) || (dst net 65.0.56.186/32) || (dst net 65.0.72.43/32) || (dst net 65.0.105.19/32) || (dst net 65.0.254.250/32))),
	((dst port 8048) || (dst port 14086) || (dst port 26865) || (dst port 31847) || (dst port 62076)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.38.37/32) || (dst net 66.0.39.21/32) || (dst net 66.0.65.34/32) || (dst net 66.0.205.73/32) || (dst net 66.0.223.242/32))),
	((dst port 17774) || (dst port 31986) || (dst port 39194) || (dst port 48351) || (dst port 52562)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.73.120/32) || (dst net 67.0.96.7/32) || (dst net 67.0.100.248/32) || (dst net 67.0.102.187/32) || (dst net 67.0.103.149/32))),
	((dst port 6388) || (dst port 7839) || (dst port 9597) || (dst port 24091) || (dst port 25732)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.45.227/32) || (dst net 68.0.126.151/32) || (dst net 68.0.186.3/32) || (dst net 68.0.197.183/32) || (dst net 68.0.206.9/32))),
	((dst port 5703) || (dst port 26792) || (dst port 35901) || (dst port 51098) || (dst port 60729)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.36.33/32) || (dst net 69.0.36.65/32) || (dst net 69.0.160.28/32) || (dst net 69.0.217.196/32) || (dst net 69.0.241.47/32))),
	((dst port 10931) || (dst port 21866) || (dst port 36998) || (dst port 38706) || (dst port 54317)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.31.252/32) || (dst net 70.0.136.12/32) || (dst net 70.0.158.120/32) || (dst net 70.0.183.140/32) || (dst net 70.0.195.170/32))),
	((dst port 41991) || (dst port 42553) || (dst port 43750) || (dst port 49697) || (dst port 51820)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.39.126/32) || (dst net 71.0.56.96/32) || (dst net 71.0.57.4/32) || (dst net 71.0.60.113/32) || (dst net 71.0.204.179/32))),
	((dst port 3561) || (dst port 4452) || (dst port 32439) || (dst port 42899) || (dst port 51250)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.14.54/32) || (dst net 72.0.49.169/32) || (dst net 72.0.53.94/32) || (dst net 72.0.61.19/32) || (dst net 72.0.185.2/32))),
	((dst port 6814) || (dst port 8121) || (dst port 18424) || (dst port 30615) || (dst port 65401)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.110.195/32) || (dst net 73.0.129.136/32) || (dst net 73.0.203.186/32) || (dst net 73.0.232.25/32) || (dst net 73.0.232.87/32))),
	((dst port 9236) || (dst port 32032) || (dst port 43118) || (dst port 48905) || (dst port 49036)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.8.247/32) || (dst net 74.0.58.110/32) || (dst net 74.0.75.14/32) || (dst net 74.0.152.36/32) || (dst net 74.0.204.165/32))),
	((dst port 5260) || (dst port 20491) || (dst port 28546) || (dst port 32663) || (dst port 36488)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.59.222/32) || (dst net 75.0.125.163/32) || (dst net 75.0.131.24/32) || (dst net 75.0.139.117/32) || (dst net 75.0.180.13/32))),
	((dst port 3385) || (dst port 13505) || (dst port 21543) || (dst port 44133) || (dst port 58376)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.22.121/32) || (dst net 76.0.38.250/32) || (dst net 76.0.96.105/32) || (dst net 76.0.156.224/32) || (dst net 76.0.211.50/32))),
	((dst port 9756) || (dst port 19024) || (dst port 23923) || (dst port 46079) || (dst port 61987)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.20.63/32) || (dst net 77.0.28.51/32) || (dst net 77.0.86.59/32) || (dst net 77.0.93.141/32) || (dst net 77.0.194.77/32))),
	((dst port 4043) || (dst port 4702) || (dst port 19553) || (dst port 22625) || (dst port 31476)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.21.97/32) || (dst net 78.0.22.140/32) || (dst net 78.0.71.54/32) || (dst net 78.0.157.135/32) || (dst net 78.0.237.250/32))),
	((dst port 15065) || (dst port 27884) || (dst port 33002) || (dst port 48326) || (dst port 51350)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.176.228/32) || (dst net 79.0.177.123/32) || (dst net 79.0.238.194/32) || (dst net 79.0.248.21/32) || (dst net 79.0.250.110/32))),
	((dst port 13750) || (dst port 14596) || (dst port 20896) || (dst port 25784) || (dst port 33334)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.66.56/32) || (dst net 80.0.88.141/32) || (dst net 80.0.148.41/32) || (dst net 80.0.156.202/32) || (dst net 80.0.212.147/32))),
	((dst port 5848) || (dst port 29612) || (dst port 31090) || (dst port 31727) || (dst port 57152)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.8.241/32) || (dst net 81.0.26.55/32) || (dst net 81.0.42.87/32) || (dst net 81.0.184.169/32) || (dst net 81.0.188.71/32))),
	((dst port 12854) || (dst port 17873) || (dst port 35357) || (dst port 37437) || (dst port 41710)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.6.166/32) || (dst net 82.0.100.39/32) || (dst net 82.0.134.225/32) || (dst net 82.0.206.21/32) || (dst net 82.0.234.216/32))),
	((dst port 17521) || (dst port 24319) || (dst port 29986) || (dst port 39986) || (dst port 60887)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.38.116/32) || (dst net 83.0.136.247/32) || (dst net 83.0.142.156/32) || (dst net 83.0.185.46/32) || (dst net 83.0.241.233/32))),
	((dst port 24389) || (dst port 45034) || (dst port 53002) || (dst port 55540) || (dst port 57352)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.14.51/32) || (dst net 84.0.63.201/32) || (dst net 84.0.154.41/32) || (dst net 84.0.182.154/32) || (dst net 84.0.182.174/32))),
	((dst port 3604) || (dst port 22874) || (dst port 29573) || (dst port 30848) || (dst port 62708)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.24.134/32) || (dst net 85.0.103.166/32) || (dst net 85.0.166.212/32) || (dst net 85.0.249.230/32) || (dst net 85.0.252.21/32))),
	((dst port 21194) || (dst port 21982) || (dst port 24931) || (dst port 42234) || (dst port 43468)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.7.241/32) || (dst net 86.0.36.0/32) || (dst net 86.0.111.92/32) || (dst net 86.0.118.38/32) || (dst net 86.0.163.188/32))),
	((dst port 3567) || (dst port 24712) || (dst port 35613) || (dst port 58472) || (dst port 61912)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.98.185/32) || (dst net 87.0.146.127/32) || (dst net 87.0.168.157/32) || (dst net 87.0.173.155/32) || (dst net 87.0.218.186/32))),
	((dst port 3395) || (dst port 3450) || (dst port 53449) || (dst port 54370) || (dst port 56804)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.81.242/32) || (dst net 88.0.94.205/32) || (dst net 88.0.104.33/32) || (dst net 88.0.213.28/32) || (dst net 88.0.224.123/32))),
	((dst port 7620) || (dst port 8166) || (dst port 20371) || (dst port 21210) || (dst port 26196)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.55.78/32) || (dst net 89.0.100.199/32) || (dst net 89.0.114.132/32) || (dst net 89.0.201.172/32) || (dst net 89.0.222.4/32))),
	((dst port 5543) || (dst port 19553) || (dst port 28243) || (dst port 44867) || (dst port 47476)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.7.207/32) || (dst net 90.0.73.34/32) || (dst net 90.0.108.25/32) || (dst net 90.0.146.23/32) || (dst net 90.0.215.201/32))),
	((dst port 8660) || (dst port 19004) || (dst port 29284) || (dst port 53017) || (dst port 56398)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.27.63/32) || (dst net 91.0.123.58/32) || (dst net 91.0.151.90/32) || (dst net 91.0.230.152/32) || (dst net 91.0.253.54/32))),
	((dst port 268) || (dst port 5688) || (dst port 52995) || (dst port 54018) || (dst port 55037)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.53.125/32) || (dst net 92.0.139.73/32) || (dst net 92.0.171.181/32) || (dst net 92.0.220.151/32) || (dst net 92.0.233.130/32))),
	((dst port 5519) || (dst port 22089) || (dst port 28847) || (dst port 33469) || (dst port 55545)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.46.26/32) || (dst net 93.0.123.62/32) || (dst net 93.0.165.33/32) || (dst net 93.0.222.207/32) || (dst net 93.0.255.196/32))),
	((dst port 12230) || (dst port 18618) || (dst port 45057) || (dst port 48231) || (dst port 53076)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.0.179/32) || (dst net 94.0.14.152/32) || (dst net 94.0.59.177/32) || (dst net 94.0.188.226/32) || (dst net 94.0.219.111/32))),
	((dst port 16255) || (dst port 46692) || (dst port 47135) || (dst port 49576) || (dst port 62692)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.34.24/32) || (dst net 95.0.108.98/32) || (dst net 95.0.142.137/32) || (dst net 95.0.149.144/32) || (dst net 95.0.181.60/32))),
	((dst port 4704) || (dst port 5446) || (dst port 8941) || (dst port 22525) || (dst port 51492)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.31.193/32) || (dst net 96.0.155.186/32) || (dst net 96.0.173.200/32) || (dst net 96.0.193.25/32) || (dst net 96.0.249.205/32))),
	((dst port 14063) || (dst port 33678) || (dst port 38730) || (dst port 49954) || (dst port 58724)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.43.192/32) || (dst net 97.0.59.46/32) || (dst net 97.0.115.27/32) || (dst net 97.0.168.194/32) || (dst net 97.0.173.234/32))),
	((dst port 2253) || (dst port 38730) || (dst port 48246) || (dst port 51261) || (dst port 54977)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.1.49/32) || (dst net 98.0.8.112/32) || (dst net 98.0.89.108/32) || (dst net 98.0.164.75/32) || (dst net 98.0.181.122/32))),
	((dst port 4251) || (dst port 7458) || (dst port 16713) || (dst port 52041) || (dst port 57197)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.24.210/32) || (dst net 99.0.51.212/32) || (dst net 99.0.133.72/32) || (dst net 99.0.143.98/32) || (dst net 99.0.161.92/32))),
	((dst port 4040) || (dst port 12360) || (dst port 18254) || (dst port 21157) || (dst port 53711)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.11.37/32) || (dst net 100.0.52.199/32) || (dst net 100.0.78.213/32) || (dst net 100.0.126.223/32) || (dst net 100.0.167.181/32))),
	((dst port 7176) || (dst port 19918) || (dst port 31288) || (dst port 31427) || (dst port 31934)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.81.171/32) || (dst net 101.0.100.231/32) || (dst net 101.0.145.51/32) || (dst net 101.0.165.194/32) || (dst net 101.0.196.253/32))),
	((dst port 102) || (dst port 3781) || (dst port 13915) || (dst port 36436) || (dst port 56865)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.119.156/32) || (dst net 102.0.200.26/32) || (dst net 102.0.210.129/32) || (dst net 102.0.247.165/32) || (dst net 102.0.255.72/32))),
	((dst port 17034) || (dst port 21893) || (dst port 23413) || (dst port 28181) || (dst port 28404)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.20.129/32) || (dst net 103.0.29.17/32) || (dst net 103.0.134.68/32) || (dst net 103.0.145.188/32) || (dst net 103.0.178.219/32))),
	((dst port 760) || (dst port 10541) || (dst port 25245) || (dst port 63362) || (dst port 65140)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.4.213/32) || (dst net 104.0.107.59/32) || (dst net 104.0.186.101/32) || (dst net 104.0.214.131/32) || (dst net 104.0.239.71/32))),
	((dst port 20574) || (dst port 23458) || (dst port 42976) || (dst port 49481) || (dst port 64031)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.37.28/32) || (dst net 105.0.58.31/32) || (dst net 105.0.107.101/32) || (dst net 105.0.174.160/32) || (dst net 105.0.185.64/32))),
	((dst port 8180) || (dst port 13414) || (dst port 22020) || (dst port 35449) || (dst port 63364)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.0.162/32) || (dst net 106.0.16.154/32) || (dst net 106.0.146.219/32) || (dst net 106.0.171.14/32) || (dst net 106.0.247.4/32))),
	((dst port 2947) || (dst port 13774) || (dst port 27896) || (dst port 54914) || (dst port 62091)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.86.228/32) || (dst net 107.0.120.77/32) || (dst net 107.0.219.243/32) || (dst net 107.0.220.55/32) || (dst net 107.0.226.152/32))),
	((dst port 5619) || (dst port 10481) || (dst port 38519) || (dst port 56931) || (dst port 64481)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.62.110/32) || (dst net 108.0.131.201/32) || (dst net 108.0.189.249/32) || (dst net 108.0.195.227/32) || (dst net 108.0.201.93/32))),
	((dst port 14713) || (dst port 23228) || (dst port 33751) || (dst port 45890) || (dst port 49983)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.57.76/32) || (dst net 109.0.85.137/32) || (dst net 109.0.85.234/32) || (dst net 109.0.133.70/32) || (dst net 109.0.144.228/32))),
	((dst port 11319) || (dst port 12594) || (dst port 46829) || (dst port 57734) || (dst port 61302)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.44.185/32) || (dst net 110.0.59.110/32) || (dst net 110.0.158.109/32) || (dst net 110.0.209.184/32) || (dst net 110.0.236.67/32))),
	((dst port 5136) || (dst port 20380) || (dst port 32263) || (dst port 46041) || (dst port 49093)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.19.220/32) || (dst net 111.0.134.124/32) || (dst net 111.0.156.230/32) || (dst net 111.0.186.72/32) || (dst net 111.0.245.235/32))),
	((dst port 1727) || (dst port 6770) || (dst port 23724) || (dst port 43825) || (dst port 61547)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.128.79/32) || (dst net 112.0.131.54/32) || (dst net 112.0.134.184/32) || (dst net 112.0.181.85/32) || (dst net 112.0.225.8/32))),
	((dst port 33447) || (dst port 37098) || (dst port 45344) || (dst port 54318) || (dst port 61465)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.149.222/32) || (dst net 113.0.210.239/32) || (dst net 113.0.218.62/32) || (dst net 113.0.221.140/32) || (dst net 113.0.221.198/32))),
	((dst port 10430) || (dst port 11899) || (dst port 32412) || (dst port 32709) || (dst port 48970)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.3.247/32) || (dst net 114.0.61.227/32) || (dst net 114.0.121.232/32) || (dst net 114.0.177.26/32) || (dst net 114.0.248.164/32))),
	((dst port 24018) || (dst port 33382) || (dst port 37818) || (dst port 42456) || (dst port 61901)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.65.61/32) || (dst net 115.0.92.9/32) || (dst net 115.0.105.78/32) || (dst net 115.0.126.162/32) || (dst net 115.0.238.232/32))),
	((dst port 3742) || (dst port 14962) || (dst port 16760) || (dst port 41957) || (dst port 43105)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.27.54/32) || (dst net 116.0.138.207/32) || (dst net 116.0.209.35/32) || (dst net 116.0.243.167/32) || (dst net 116.0.254.5/32))),
	((dst port 20759) || (dst port 36771) || (dst port 48375) || (dst port 54317) || (dst port 58692)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.113.177/32) || (dst net 117.0.125.167/32) || (dst net 117.0.208.141/32) || (dst net 117.0.229.158/32) || (dst net 117.0.243.237/32))),
	((dst port 27342) || (dst port 35904) || (dst port 37472) || (dst port 50866) || (dst port 57101)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.52.79/32) || (dst net 118.0.57.75/32) || (dst net 118.0.101.53/32) || (dst net 118.0.104.154/32) || (dst net 118.0.153.186/32))),
	((dst port 2848) || (dst port 25260) || (dst port 35960) || (dst port 51361) || (dst port 54240)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.16.196/32) || (dst net 119.0.121.170/32) || (dst net 119.0.134.101/32) || (dst net 119.0.164.3/32) || (dst net 119.0.188.130/32))),
	((dst port 29507) || (dst port 40623) || (dst port 42842) || (dst port 47567) || (dst port 53732)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.42.138/32) || (dst net 120.0.93.201/32) || (dst net 120.0.148.172/32) || (dst net 120.0.221.137/32) || (dst net 120.0.222.250/32))),
	((dst port 17277) || (dst port 20315) || (dst port 33060) || (dst port 42189) || (dst port 57094)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.24.222/32) || (dst net 121.0.51.81/32) || (dst net 121.0.183.18/32) || (dst net 121.0.198.178/32) || (dst net 121.0.210.12/32))),
	((dst port 11019) || (dst port 20225) || (dst port 45979) || (dst port 57567) || (dst port 60398)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.20.161/32) || (dst net 122.0.88.75/32) || (dst net 122.0.155.144/32) || (dst net 122.0.173.53/32) || (dst net 122.0.235.219/32))),
	((dst port 2999) || (dst port 14527) || (dst port 29147) || (dst port 32147) || (dst port 54073)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.21.233/32) || (dst net 123.0.75.234/32) || (dst net 123.0.157.42/32) || (dst net 123.0.238.245/32) || (dst net 123.0.250.135/32))),
	((dst port 9316) || (dst port 14387) || (dst port 40596) || (dst port 50519) || (dst port 58319)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.53.72/32) || (dst net 124.0.72.113/32) || (dst net 124.0.143.36/32) || (dst net 124.0.237.101/32) || (dst net 124.0.244.194/32))),
	((dst port 5961) || (dst port 9477) || (dst port 37703) || (dst port 48318) || (dst port 61829)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.19.80/32) || (dst net 125.0.83.231/32) || (dst net 125.0.103.202/32) || (dst net 125.0.158.41/32) || (dst net 125.0.221.169/32))),
	((dst port 6546) || (dst port 40078) || (dst port 52626) || (dst port 60592) || (dst port 61174)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.10.216/32) || (dst net 126.0.11.126/32) || (dst net 126.0.19.116/32) || (dst net 126.0.88.65/32) || (dst net 126.0.139.35/32))),
	((dst port 2513) || (dst port 24102) || (dst port 30766) || (dst port 32035) || (dst port 61299)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.15.125/32) || (dst net 127.0.15.135/32) || (dst net 127.0.103.61/32) || (dst net 127.0.183.39/32) || (dst net 127.0.236.253/32))),
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
