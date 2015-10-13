ipclassifier :: IPClassifier(
	((dst port 7128) || (dst port 12897) || (dst port 34318) || (dst port 40496) || (dst port 49190)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.38.57/32) || (dst net 0.0.48.150/32) || (dst net 0.0.199.143/32) || (dst net 0.0.226.85/32) || (dst net 0.0.234.159/32))),
	((dst port 4450) || (dst port 15421) || (dst port 30224) || (dst port 57461) || (dst port 58309)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.43.46/32) || (dst net 1.0.117.51/32) || (dst net 1.0.215.102/32) || (dst net 1.0.221.156/32) || (dst net 1.0.254.110/32))),
	((dst port 5244) || (dst port 13633) || (dst port 51472) || (dst port 55805) || (dst port 61330)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.12.175/32) || (dst net 2.0.42.178/32) || (dst net 2.0.57.18/32) || (dst net 2.0.191.62/32) || (dst net 2.0.196.215/32))),
	((dst port 5043) || (dst port 13790) || (dst port 26095) || (dst port 33218) || (dst port 33812)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.42.153/32) || (dst net 3.0.76.20/32) || (dst net 3.0.162.6/32) || (dst net 3.0.193.77/32) || (dst net 3.0.249.246/32))),
	((dst port 1494) || (dst port 3178) || (dst port 14501) || (dst port 38144) || (dst port 64970)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.10.135/32) || (dst net 4.0.52.116/32) || (dst net 4.0.148.158/32) || (dst net 4.0.177.218/32) || (dst net 4.0.243.120/32))),
	((dst port 5971) || (dst port 17210) || (dst port 33631) || (dst port 45344) || (dst port 51652)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.68.50/32) || (dst net 5.0.85.200/32) || (dst net 5.0.193.119/32) || (dst net 5.0.210.45/32) || (dst net 5.0.226.170/32))),
	((dst port 4179) || (dst port 11260) || (dst port 24019) || (dst port 41264) || (dst port 48256)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.21.33/32) || (dst net 6.0.33.121/32) || (dst net 6.0.60.19/32) || (dst net 6.0.88.226/32) || (dst net 6.0.186.91/32))),
	((dst port 8418) || (dst port 15988) || (dst port 19270) || (dst port 61662) || (dst port 62390)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.66.32/32) || (dst net 7.0.106.206/32) || (dst net 7.0.141.96/32) || (dst net 7.0.210.159/32) || (dst net 7.0.224.56/32))),
	((dst port 97) || (dst port 2194) || (dst port 44971) || (dst port 56416) || (dst port 64434)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.181.172/32) || (dst net 8.0.196.36/32) || (dst net 8.0.215.249/32) || (dst net 8.0.220.253/32) || (dst net 8.0.247.152/32))),
	((dst port 6499) || (dst port 19440) || (dst port 21669) || (dst port 33801) || (dst port 58637)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.3.160/32) || (dst net 9.0.10.205/32) || (dst net 9.0.178.144/32) || (dst net 9.0.201.246/32) || (dst net 9.0.218.186/32))),
	((dst port 18471) || (dst port 20977) || (dst port 35585) || (dst port 48720) || (dst port 59565)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.1.84/32) || (dst net 10.0.14.35/32) || (dst net 10.0.76.111/32) || (dst net 10.0.77.195/32) || (dst net 10.0.251.14/32))),
	((dst port 8390) || (dst port 11563) || (dst port 12412) || (dst port 44068) || (dst port 53343)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.77.18/32) || (dst net 11.0.85.12/32) || (dst net 11.0.115.142/32) || (dst net 11.0.185.170/32) || (dst net 11.0.254.183/32))),
	((dst port 4406) || (dst port 6275) || (dst port 26709) || (dst port 41474) || (dst port 60465)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.19.84/32) || (dst net 12.0.101.239/32) || (dst net 12.0.189.66/32) || (dst net 12.0.233.137/32) || (dst net 12.0.235.27/32))),
	((dst port 20719) || (dst port 37203) || (dst port 50271) || (dst port 54406) || (dst port 58202)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.66.204/32) || (dst net 13.0.70.198/32) || (dst net 13.0.115.128/32) || (dst net 13.0.161.222/32) || (dst net 13.0.193.157/32))),
	((dst port 7470) || (dst port 45810) || (dst port 55570) || (dst port 58007) || (dst port 61347)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.22.48/32) || (dst net 14.0.25.120/32) || (dst net 14.0.159.61/32) || (dst net 14.0.166.70/32) || (dst net 14.0.195.92/32))),
	((dst port 7457) || (dst port 11301) || (dst port 11496) || (dst port 27989) || (dst port 61232)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.48.27/32) || (dst net 15.0.62.109/32) || (dst net 15.0.129.158/32) || (dst net 15.0.141.9/32) || (dst net 15.0.164.11/32))),
	((dst port 632) || (dst port 11396) || (dst port 34532) || (dst port 38926) || (dst port 56785)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.19.14/32) || (dst net 16.0.129.207/32) || (dst net 16.0.190.159/32) || (dst net 16.0.249.202/32) || (dst net 16.0.253.177/32))),
	((dst port 1328) || (dst port 9990) || (dst port 36743) || (dst port 44030) || (dst port 53095)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.56.237/32) || (dst net 17.0.100.127/32) || (dst net 17.0.116.8/32) || (dst net 17.0.166.14/32) || (dst net 17.0.178.153/32))),
	((dst port 892) || (dst port 34705) || (dst port 36252) || (dst port 50679) || (dst port 60958)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.43.131/32) || (dst net 18.0.171.231/32) || (dst net 18.0.185.128/32) || (dst net 18.0.192.3/32) || (dst net 18.0.198.15/32))),
	((dst port 17659) || (dst port 22138) || (dst port 23562) || (dst port 38784) || (dst port 39323)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.6.102/32) || (dst net 19.0.119.177/32) || (dst net 19.0.135.109/32) || (dst net 19.0.232.169/32) || (dst net 19.0.233.40/32))),
	((dst port 2356) || (dst port 16016) || (dst port 17051) || (dst port 22995) || (dst port 55094)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.41.64/32) || (dst net 20.0.83.130/32) || (dst net 20.0.94.224/32) || (dst net 20.0.111.112/32) || (dst net 20.0.180.134/32))),
	((dst port 5105) || (dst port 17681) || (dst port 25694) || (dst port 25819) || (dst port 47362)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.32.24/32) || (dst net 21.0.125.3/32) || (dst net 21.0.231.125/32) || (dst net 21.0.240.193/32) || (dst net 21.0.254.53/32))),
	((dst port 1145) || (dst port 2411) || (dst port 10313) || (dst port 30700) || (dst port 47355)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.53.147/32) || (dst net 22.0.56.107/32) || (dst net 22.0.74.141/32) || (dst net 22.0.84.97/32) || (dst net 22.0.155.130/32))),
	((dst port 2943) || (dst port 26021) || (dst port 35203) || (dst port 50087) || (dst port 50226)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.11.233/32) || (dst net 23.0.36.7/32) || (dst net 23.0.94.63/32) || (dst net 23.0.229.242/32) || (dst net 23.0.244.83/32))),
	((dst port 546) || (dst port 7881) || (dst port 8365) || (dst port 16181) || (dst port 62250)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.40.65/32) || (dst net 24.0.118.35/32) || (dst net 24.0.196.13/32) || (dst net 24.0.201.25/32) || (dst net 24.0.221.190/32))),
	((dst port 9437) || (dst port 16070) || (dst port 16126) || (dst port 41531) || (dst port 42556)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.78.128/32) || (dst net 25.0.106.13/32) || (dst net 25.0.116.104/32) || (dst net 25.0.161.56/32) || (dst net 25.0.168.179/32))),
	((dst port 7469) || (dst port 18692) || (dst port 34331) || (dst port 42578) || (dst port 58695)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.38.17/32) || (dst net 26.0.39.50/32) || (dst net 26.0.53.217/32) || (dst net 26.0.80.225/32) || (dst net 26.0.140.152/32))),
	((dst port 14001) || (dst port 15559) || (dst port 44768) || (dst port 51083) || (dst port 54351)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.40.10/32) || (dst net 27.0.51.113/32) || (dst net 27.0.107.47/32) || (dst net 27.0.114.36/32) || (dst net 27.0.206.5/32))),
	((dst port 9648) || (dst port 16729) || (dst port 40344) || (dst port 46745) || (dst port 56033)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.24.68/32) || (dst net 28.0.62.188/32) || (dst net 28.0.64.236/32) || (dst net 28.0.142.203/32) || (dst net 28.0.149.128/32))),
	((dst port 11136) || (dst port 32164) || (dst port 40328) || (dst port 47680) || (dst port 52668)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.6.17/32) || (dst net 29.0.78.179/32) || (dst net 29.0.130.113/32) || (dst net 29.0.160.206/32) || (dst net 29.0.209.147/32))),
	((dst port 2605) || (dst port 16111) || (dst port 23034) || (dst port 29288) || (dst port 41881)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.43.188/32) || (dst net 30.0.148.138/32) || (dst net 30.0.183.135/32) || (dst net 30.0.207.219/32) || (dst net 30.0.255.71/32))),
	((dst port 3189) || (dst port 13984) || (dst port 36403) || (dst port 39762) || (dst port 53649)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.9.100/32) || (dst net 31.0.49.223/32) || (dst net 31.0.69.252/32) || (dst net 31.0.108.77/32) || (dst net 31.0.152.181/32))),
	((dst port 3611) || (dst port 7820) || (dst port 17511) || (dst port 39197) || (dst port 43705)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.15.194/32) || (dst net 32.0.43.144/32) || (dst net 32.0.45.186/32) || (dst net 32.0.52.154/32) || (dst net 32.0.115.157/32))),
	((dst port 5075) || (dst port 19145) || (dst port 31557) || (dst port 49404) || (dst port 60575)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.41.142/32) || (dst net 33.0.51.213/32) || (dst net 33.0.134.202/32) || (dst net 33.0.200.187/32) || (dst net 33.0.215.38/32))),
	((dst port 9123) || (dst port 19183) || (dst port 39973) || (dst port 50986) || (dst port 65485)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.18.203/32) || (dst net 34.0.116.201/32) || (dst net 34.0.117.70/32) || (dst net 34.0.172.201/32) || (dst net 34.0.254.12/32))),
	((dst port 2586) || (dst port 9543) || (dst port 24689) || (dst port 32786) || (dst port 64618)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.55.88/32) || (dst net 35.0.93.123/32) || (dst net 35.0.101.73/32) || (dst net 35.0.124.45/32) || (dst net 35.0.126.144/32))),
	((dst port 26886) || (dst port 44740) || (dst port 45847) || (dst port 53101) || (dst port 54641)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.65.49/32) || (dst net 36.0.101.106/32) || (dst net 36.0.150.135/32) || (dst net 36.0.239.153/32) || (dst net 36.0.252.40/32))),
	((dst port 112) || (dst port 8228) || (dst port 40712) || (dst port 46157) || (dst port 49718)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.62.94/32) || (dst net 37.0.115.131/32) || (dst net 37.0.135.200/32) || (dst net 37.0.152.244/32) || (dst net 37.0.154.28/32))),
	((dst port 817) || (dst port 4188) || (dst port 46617) || (dst port 53843) || (dst port 64683)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.12.1/32) || (dst net 38.0.52.112/32) || (dst net 38.0.52.178/32) || (dst net 38.0.154.14/32) || (dst net 38.0.213.212/32))),
	((dst port 9774) || (dst port 17917) || (dst port 31586) || (dst port 39394) || (dst port 40110)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.14.14/32) || (dst net 39.0.26.143/32) || (dst net 39.0.164.59/32) || (dst net 39.0.188.135/32) || (dst net 39.0.252.102/32))),
	((dst port 35422) || (dst port 44085) || (dst port 47010) || (dst port 60078) || (dst port 61247)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.85.181/32) || (dst net 40.0.89.41/32) || (dst net 40.0.202.214/32) || (dst net 40.0.238.187/32) || (dst net 40.0.242.148/32))),
	((dst port 9715) || (dst port 10232) || (dst port 11316) || (dst port 41335) || (dst port 55279)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.7.94/32) || (dst net 41.0.39.28/32) || (dst net 41.0.133.127/32) || (dst net 41.0.197.127/32) || (dst net 41.0.236.52/32))),
	((dst port 7898) || (dst port 24962) || (dst port 38605) || (dst port 38645) || (dst port 40828)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.23.126/32) || (dst net 42.0.31.218/32) || (dst net 42.0.72.188/32) || (dst net 42.0.77.109/32) || (dst net 42.0.116.155/32))),
	((dst port 10488) || (dst port 30587) || (dst port 48404) || (dst port 54884) || (dst port 59386)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.7.76/32) || (dst net 43.0.11.150/32) || (dst net 43.0.45.96/32) || (dst net 43.0.45.179/32) || (dst net 43.0.232.94/32))),
	((dst port 3557) || (dst port 18113) || (dst port 18407) || (dst port 36545) || (dst port 57463)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.16.159/32) || (dst net 44.0.31.175/32) || (dst net 44.0.72.138/32) || (dst net 44.0.95.58/32) || (dst net 44.0.216.221/32))),
	((dst port 5081) || (dst port 6676) || (dst port 14642) || (dst port 39642) || (dst port 58667)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.30.101/32) || (dst net 45.0.45.140/32) || (dst net 45.0.61.224/32) || (dst net 45.0.75.196/32) || (dst net 45.0.86.230/32))),
	((dst port 4857) || (dst port 15492) || (dst port 27607) || (dst port 44883) || (dst port 61145)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.20.165/32) || (dst net 46.0.35.67/32) || (dst net 46.0.139.160/32) || (dst net 46.0.167.12/32) || (dst net 46.0.224.53/32))),
	((dst port 10847) || (dst port 29003) || (dst port 48924) || (dst port 52688) || (dst port 56509)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.37.233/32) || (dst net 47.0.71.226/32) || (dst net 47.0.156.50/32) || (dst net 47.0.194.3/32) || (dst net 47.0.235.210/32))),
	((dst port 4970) || (dst port 13709) || (dst port 35477) || (dst port 43567) || (dst port 45697)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.9.77/32) || (dst net 48.0.85.182/32) || (dst net 48.0.90.120/32) || (dst net 48.0.106.17/32) || (dst net 48.0.214.8/32))),
	((dst port 7604) || (dst port 17778) || (dst port 26735) || (dst port 30240) || (dst port 62466)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.34.95/32) || (dst net 49.0.139.4/32) || (dst net 49.0.181.129/32) || (dst net 49.0.183.148/32) || (dst net 49.0.235.92/32))),
	((dst port 9654) || (dst port 28193) || (dst port 29165) || (dst port 32023) || (dst port 52842)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.20.167/32) || (dst net 50.0.70.16/32) || (dst net 50.0.168.141/32) || (dst net 50.0.189.78/32) || (dst net 50.0.225.44/32))),
	((dst port 10846) || (dst port 14534) || (dst port 19415) || (dst port 26657) || (dst port 53957)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.43.144/32) || (dst net 51.0.52.5/32) || (dst net 51.0.103.53/32) || (dst net 51.0.196.241/32) || (dst net 51.0.254.119/32))),
	((dst port 19660) || (dst port 25828) || (dst port 42659) || (dst port 51949) || (dst port 64380)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.24.131/32) || (dst net 52.0.62.95/32) || (dst net 52.0.122.95/32) || (dst net 52.0.196.108/32) || (dst net 52.0.234.198/32))),
	((dst port 24132) || (dst port 50786) || (dst port 62839) || (dst port 63519) || (dst port 63806)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.71.127/32) || (dst net 53.0.119.122/32) || (dst net 53.0.207.69/32) || (dst net 53.0.219.91/32) || (dst net 53.0.246.245/32))),
	((dst port 4861) || (dst port 42219) || (dst port 49412) || (dst port 51879) || (dst port 63728)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.15.206/32) || (dst net 54.0.103.233/32) || (dst net 54.0.157.104/32) || (dst net 54.0.221.50/32) || (dst net 54.0.223.192/32))),
	((dst port 2626) || (dst port 10218) || (dst port 11967) || (dst port 28291) || (dst port 63627)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.96.140/32) || (dst net 55.0.125.16/32) || (dst net 55.0.134.234/32) || (dst net 55.0.142.36/32) || (dst net 55.0.193.81/32))),
	((dst port 8338) || (dst port 11871) || (dst port 22012) || (dst port 22265) || (dst port 33131)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.30.46/32) || (dst net 56.0.104.77/32) || (dst net 56.0.133.166/32) || (dst net 56.0.143.173/32) || (dst net 56.0.153.197/32))),
	((dst port 26822) || (dst port 31700) || (dst port 33251) || (dst port 34328) || (dst port 63710)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.18.237/32) || (dst net 57.0.39.247/32) || (dst net 57.0.134.195/32) || (dst net 57.0.206.77/32) || (dst net 57.0.210.196/32))),
	((dst port 15943) || (dst port 21989) || (dst port 28208) || (dst port 51361) || (dst port 56336)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.28.80/32) || (dst net 58.0.127.124/32) || (dst net 58.0.136.157/32) || (dst net 58.0.225.113/32) || (dst net 58.0.233.198/32))),
	((dst port 8061) || (dst port 14429) || (dst port 14600) || (dst port 26432) || (dst port 37045)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.2.173/32) || (dst net 59.0.37.89/32) || (dst net 59.0.59.53/32) || (dst net 59.0.65.194/32) || (dst net 59.0.230.45/32))),
	((dst port 3555) || (dst port 9046) || (dst port 38008) || (dst port 55035) || (dst port 57834)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.26.1/32) || (dst net 60.0.35.180/32) || (dst net 60.0.100.26/32) || (dst net 60.0.115.227/32) || (dst net 60.0.193.37/32))),
	((dst port 582) || (dst port 22922) || (dst port 26546) || (dst port 49682) || (dst port 50022)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.40.197/32) || (dst net 61.0.130.199/32) || (dst net 61.0.145.221/32) || (dst net 61.0.167.112/32) || (dst net 61.0.174.193/32))),
	((dst port 34814) || (dst port 38431) || (dst port 47614) || (dst port 62167) || (dst port 62628)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.19.25/32) || (dst net 62.0.84.149/32) || (dst net 62.0.129.79/32) || (dst net 62.0.167.23/32) || (dst net 62.0.238.237/32))),
	((dst port 13081) || (dst port 29784) || (dst port 32672) || (dst port 43658) || (dst port 49946)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.54.83/32) || (dst net 63.0.148.241/32) || (dst net 63.0.155.147/32) || (dst net 63.0.167.245/32) || (dst net 63.0.217.247/32))),
	((dst port 6133) || (dst port 8727) || (dst port 25245) || (dst port 52355) || (dst port 57275)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.19.255/32) || (dst net 64.0.36.73/32) || (dst net 64.0.98.180/32) || (dst net 64.0.239.48/32) || (dst net 64.0.244.83/32))),
	((dst port 24492) || (dst port 24948) || (dst port 25960) || (dst port 26010) || (dst port 65301)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.27.80/32) || (dst net 65.0.48.93/32) || (dst net 65.0.73.183/32) || (dst net 65.0.119.78/32) || (dst net 65.0.156.112/32))),
	((dst port 4245) || (dst port 44339) || (dst port 47292) || (dst port 54937) || (dst port 55254)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.9.92/32) || (dst net 66.0.27.230/32) || (dst net 66.0.150.20/32) || (dst net 66.0.153.24/32) || (dst net 66.0.218.176/32))),
	((dst port 602) || (dst port 16942) || (dst port 34187) || (dst port 51293) || (dst port 59765)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.139.40/32) || (dst net 67.0.173.25/32) || (dst net 67.0.204.172/32) || (dst net 67.0.236.59/32) || (dst net 67.0.248.45/32))),
	((dst port 4591) || (dst port 8083) || (dst port 27101) || (dst port 41772) || (dst port 53966)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.8.170/32) || (dst net 68.0.41.31/32) || (dst net 68.0.186.229/32) || (dst net 68.0.221.198/32) || (dst net 68.0.227.67/32))),
	((dst port 8945) || (dst port 12034) || (dst port 27639) || (dst port 41268) || (dst port 60498)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.64.139/32) || (dst net 69.0.77.25/32) || (dst net 69.0.132.116/32) || (dst net 69.0.141.150/32) || (dst net 69.0.213.69/32))),
	((dst port 4494) || (dst port 27530) || (dst port 38494) || (dst port 44572) || (dst port 50028)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.13.142/32) || (dst net 70.0.40.211/32) || (dst net 70.0.62.158/32) || (dst net 70.0.210.102/32) || (dst net 70.0.228.243/32))),
	((dst port 27524) || (dst port 38431) || (dst port 39847) || (dst port 43667) || (dst port 48297)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.160.88/32) || (dst net 71.0.166.71/32) || (dst net 71.0.167.183/32) || (dst net 71.0.190.223/32) || (dst net 71.0.214.247/32))),
	((dst port 13327) || (dst port 18078) || (dst port 39190) || (dst port 44633) || (dst port 55164)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.4.55/32) || (dst net 72.0.57.154/32) || (dst net 72.0.80.146/32) || (dst net 72.0.184.141/32) || (dst net 72.0.212.32/32))),
	((dst port 4003) || (dst port 8198) || (dst port 23083) || (dst port 50294) || (dst port 63467)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.40.64/32) || (dst net 73.0.46.59/32) || (dst net 73.0.96.193/32) || (dst net 73.0.139.2/32) || (dst net 73.0.252.64/32))),
	((dst port 703) || (dst port 5980) || (dst port 31588) || (dst port 44668) || (dst port 46244)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.90.214/32) || (dst net 74.0.153.147/32) || (dst net 74.0.161.82/32) || (dst net 74.0.223.15/32) || (dst net 74.0.250.44/32))),
	((dst port 29556) || (dst port 45827) || (dst port 57249) || (dst port 59891) || (dst port 64710)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.38.162/32) || (dst net 75.0.54.59/32) || (dst net 75.0.82.177/32) || (dst net 75.0.94.92/32) || (dst net 75.0.187.232/32))),
	((dst port 17068) || (dst port 25246) || (dst port 30348) || (dst port 50654) || (dst port 64630)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.66.156/32) || (dst net 76.0.97.200/32) || (dst net 76.0.131.190/32) || (dst net 76.0.170.237/32) || (dst net 76.0.248.130/32))),
	((dst port 16286) || (dst port 16690) || (dst port 33214) || (dst port 42161) || (dst port 64189)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.12.72/32) || (dst net 77.0.15.200/32) || (dst net 77.0.89.228/32) || (dst net 77.0.113.63/32) || (dst net 77.0.208.123/32))),
	((dst port 14176) || (dst port 22521) || (dst port 27890) || (dst port 37856) || (dst port 58719)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.0.23/32) || (dst net 78.0.4.129/32) || (dst net 78.0.18.71/32) || (dst net 78.0.47.151/32) || (dst net 78.0.133.150/32))),
	((dst port 12353) || (dst port 18441) || (dst port 22206) || (dst port 33091) || (dst port 47816)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.58.248/32) || (dst net 79.0.86.161/32) || (dst net 79.0.86.177/32) || (dst net 79.0.115.84/32) || (dst net 79.0.123.208/32))),
	((dst port 7819) || (dst port 18089) || (dst port 21126) || (dst port 45772) || (dst port 56859)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.44.66/32) || (dst net 80.0.74.197/32) || (dst net 80.0.170.250/32) || (dst net 80.0.193.41/32) || (dst net 80.0.245.218/32))),
	((dst port 3884) || (dst port 10884) || (dst port 23262) || (dst port 41926) || (dst port 62962)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.4.150/32) || (dst net 81.0.70.146/32) || (dst net 81.0.78.224/32) || (dst net 81.0.123.103/32) || (dst net 81.0.126.58/32))),
	((dst port 13906) || (dst port 23107) || (dst port 31315) || (dst port 54347) || (dst port 61994)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.36.239/32) || (dst net 82.0.44.213/32) || (dst net 82.0.97.70/32) || (dst net 82.0.130.236/32) || (dst net 82.0.219.159/32))),
	((dst port 7790) || (dst port 18366) || (dst port 24263) || (dst port 45750) || (dst port 62838)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.7.124/32) || (dst net 83.0.38.68/32) || (dst net 83.0.43.230/32) || (dst net 83.0.98.135/32) || (dst net 83.0.133.154/32))),
	((dst port 22354) || (dst port 30023) || (dst port 41452) || (dst port 44978) || (dst port 52116)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.24.104/32) || (dst net 84.0.126.2/32) || (dst net 84.0.128.254/32) || (dst net 84.0.162.221/32) || (dst net 84.0.176.156/32))),
	((dst port 27660) || (dst port 32175) || (dst port 34837) || (dst port 55473) || (dst port 58828)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.33.202/32) || (dst net 85.0.125.118/32) || (dst net 85.0.137.139/32) || (dst net 85.0.186.232/32) || (dst net 85.0.225.141/32))),
	((dst port 109) || (dst port 8613) || (dst port 30236) || (dst port 36679) || (dst port 56424)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.52.89/32) || (dst net 86.0.64.90/32) || (dst net 86.0.107.107/32) || (dst net 86.0.177.204/32) || (dst net 86.0.211.187/32))),
	((dst port 15322) || (dst port 19061) || (dst port 22743) || (dst port 29820) || (dst port 39501)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.16.15/32) || (dst net 87.0.113.113/32) || (dst net 87.0.142.192/32) || (dst net 87.0.185.173/32) || (dst net 87.0.214.27/32))),
	((dst port 5201) || (dst port 7658) || (dst port 29081) || (dst port 56117) || (dst port 57122)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.1.182/32) || (dst net 88.0.27.18/32) || (dst net 88.0.91.151/32) || (dst net 88.0.131.125/32) || (dst net 88.0.250.9/32))),
	((dst port 4933) || (dst port 19007) || (dst port 21882) || (dst port 22017) || (dst port 37542)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.0.226/32) || (dst net 89.0.146.234/32) || (dst net 89.0.216.188/32) || (dst net 89.0.224.176/32) || (dst net 89.0.239.35/32))),
	((dst port 4391) || (dst port 5555) || (dst port 39657) || (dst port 63606) || (dst port 63993)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.12.250/32) || (dst net 90.0.131.119/32) || (dst net 90.0.138.105/32) || (dst net 90.0.213.128/32) || (dst net 90.0.216.119/32))),
	((dst port 6740) || (dst port 14843) || (dst port 25309) || (dst port 32866) || (dst port 38207)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.27.31/32) || (dst net 91.0.44.9/32) || (dst net 91.0.89.176/32) || (dst net 91.0.166.106/32) || (dst net 91.0.175.141/32))),
	((dst port 2672) || (dst port 23079) || (dst port 25529) || (dst port 43765) || (dst port 47759)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.17.180/32) || (dst net 92.0.118.249/32) || (dst net 92.0.127.107/32) || (dst net 92.0.213.231/32) || (dst net 92.0.220.175/32))),
	((dst port 2915) || (dst port 6510) || (dst port 31312) || (dst port 50170) || (dst port 59650)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.6.24/32) || (dst net 93.0.21.219/32) || (dst net 93.0.22.173/32) || (dst net 93.0.64.64/32) || (dst net 93.0.238.44/32))),
	((dst port 2419) || (dst port 9104) || (dst port 25393) || (dst port 31860) || (dst port 58075)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.14.32/32) || (dst net 94.0.55.214/32) || (dst net 94.0.131.113/32) || (dst net 94.0.176.61/32) || (dst net 94.0.231.178/32))),
	((dst port 8891) || (dst port 18774) || (dst port 27093) || (dst port 31006) || (dst port 52398)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.19.218/32) || (dst net 95.0.61.80/32) || (dst net 95.0.66.215/32) || (dst net 95.0.90.8/32) || (dst net 95.0.133.26/32))),
	((dst port 16188) || (dst port 30850) || (dst port 33882) || (dst port 39069) || (dst port 61229)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.22.223/32) || (dst net 96.0.72.174/32) || (dst net 96.0.119.240/32) || (dst net 96.0.140.176/32) || (dst net 96.0.182.187/32))),
	((dst port 5875) || (dst port 8593) || (dst port 42422) || (dst port 45233) || (dst port 46928)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.15.63/32) || (dst net 97.0.87.117/32) || (dst net 97.0.89.25/32) || (dst net 97.0.104.18/32) || (dst net 97.0.238.95/32))),
	((dst port 30668) || (dst port 33841) || (dst port 43285) || (dst port 53331) || (dst port 63388)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.54.12/32) || (dst net 98.0.59.247/32) || (dst net 98.0.163.174/32) || (dst net 98.0.196.165/32) || (dst net 98.0.228.237/32))),
	((dst port 8447) || (dst port 17725) || (dst port 26365) || (dst port 34080) || (dst port 50845)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.28.98/32) || (dst net 99.0.96.18/32) || (dst net 99.0.144.109/32) || (dst net 99.0.218.158/32) || (dst net 99.0.221.145/32))),
	((dst port 3079) || (dst port 11202) || (dst port 34288) || (dst port 60708) || (dst port 60901)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.2.26/32) || (dst net 100.0.41.80/32) || (dst net 100.0.69.134/32) || (dst net 100.0.71.148/32) || (dst net 100.0.95.98/32))),
	((dst port 12503) || (dst port 27951) || (dst port 28044) || (dst port 34178) || (dst port 54492)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.171.195/32) || (dst net 101.0.190.125/32) || (dst net 101.0.202.10/32) || (dst net 101.0.223.2/32) || (dst net 101.0.253.94/32))),
	((dst port 23138) || (dst port 24210) || (dst port 25546) || (dst port 48089) || (dst port 48966)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.6.137/32) || (dst net 102.0.53.57/32) || (dst net 102.0.64.10/32) || (dst net 102.0.97.200/32) || (dst net 102.0.101.244/32))),
	((dst port 5939) || (dst port 6995) || (dst port 12147) || (dst port 55322) || (dst port 55480)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.49.61/32) || (dst net 103.0.132.175/32) || (dst net 103.0.156.130/32) || (dst net 103.0.215.87/32) || (dst net 103.0.229.16/32))),
	((dst port 24168) || (dst port 25749) || (dst port 59432) || (dst port 61049) || (dst port 61154)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.32.45/32) || (dst net 104.0.35.99/32) || (dst net 104.0.93.223/32) || (dst net 104.0.171.198/32) || (dst net 104.0.194.68/32))),
	((dst port 25672) || (dst port 37139) || (dst port 38557) || (dst port 39148) || (dst port 64461)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.73.226/32) || (dst net 105.0.74.238/32) || (dst net 105.0.115.198/32) || (dst net 105.0.126.11/32) || (dst net 105.0.226.235/32))),
	((dst port 695) || (dst port 23188) || (dst port 36415) || (dst port 42191) || (dst port 63506)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.69.233/32) || (dst net 106.0.152.61/32) || (dst net 106.0.178.225/32) || (dst net 106.0.208.102/32) || (dst net 106.0.214.90/32))),
	((dst port 24720) || (dst port 27235) || (dst port 28909) || (dst port 43963) || (dst port 64452)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.17.136/32) || (dst net 107.0.28.177/32) || (dst net 107.0.190.238/32) || (dst net 107.0.205.158/32) || (dst net 107.0.218.254/32))),
	((dst port 34165) || (dst port 44059) || (dst port 48122) || (dst port 55787) || (dst port 63189)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.4.201/32) || (dst net 108.0.56.47/32) || (dst net 108.0.143.135/32) || (dst net 108.0.171.159/32) || (dst net 108.0.183.95/32))),
	((dst port 5054) || (dst port 24474) || (dst port 29845) || (dst port 30942) || (dst port 43043)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.28.156/32) || (dst net 109.0.99.109/32) || (dst net 109.0.114.4/32) || (dst net 109.0.196.25/32) || (dst net 109.0.247.13/32))),
	((dst port 26482) || (dst port 31763) || (dst port 31942) || (dst port 38685) || (dst port 43347)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.10.81/32) || (dst net 110.0.46.54/32) || (dst net 110.0.103.244/32) || (dst net 110.0.162.205/32) || (dst net 110.0.212.48/32))),
	((dst port 8015) || (dst port 13518) || (dst port 40457) || (dst port 47311) || (dst port 61196)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.88.78/32) || (dst net 111.0.96.19/32) || (dst net 111.0.119.98/32) || (dst net 111.0.121.231/32) || (dst net 111.0.143.71/32))),
	((dst port 18722) || (dst port 20186) || (dst port 22252) || (dst port 32013) || (dst port 44657)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.65.196/32) || (dst net 112.0.157.248/32) || (dst net 112.0.159.126/32) || (dst net 112.0.204.162/32) || (dst net 112.0.232.21/32))),
	((dst port 17560) || (dst port 18689) || (dst port 45764) || (dst port 56650) || (dst port 57370)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.25.62/32) || (dst net 113.0.85.188/32) || (dst net 113.0.118.124/32) || (dst net 113.0.175.158/32) || (dst net 113.0.210.138/32))),
	((dst port 1416) || (dst port 25048) || (dst port 31664) || (dst port 32161) || (dst port 38440)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.21.73/32) || (dst net 114.0.41.252/32) || (dst net 114.0.91.123/32) || (dst net 114.0.152.215/32) || (dst net 114.0.224.192/32))),
	((dst port 10706) || (dst port 45576) || (dst port 48943) || (dst port 58776) || (dst port 59500)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.5.34/32) || (dst net 115.0.47.226/32) || (dst net 115.0.50.200/32) || (dst net 115.0.96.233/32) || (dst net 115.0.197.89/32))),
	((dst port 2106) || (dst port 4710) || (dst port 7081) || (dst port 19701) || (dst port 38581)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.32.11/32) || (dst net 116.0.43.160/32) || (dst net 116.0.115.85/32) || (dst net 116.0.132.83/32) || (dst net 116.0.166.1/32))),
	((dst port 29852) || (dst port 33321) || (dst port 42093) || (dst port 45104) || (dst port 56239)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.21.249/32) || (dst net 117.0.78.252/32) || (dst net 117.0.114.55/32) || (dst net 117.0.123.121/32) || (dst net 117.0.187.151/32))),
	((dst port 11060) || (dst port 25088) || (dst port 32483) || (dst port 34702) || (dst port 62857)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.37.201/32) || (dst net 118.0.59.0/32) || (dst net 118.0.68.85/32) || (dst net 118.0.134.152/32) || (dst net 118.0.209.166/32))),
	((dst port 1643) || (dst port 9936) || (dst port 12138) || (dst port 31168) || (dst port 55619)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.70.167/32) || (dst net 119.0.102.250/32) || (dst net 119.0.115.191/32) || (dst net 119.0.147.123/32) || (dst net 119.0.253.48/32))),
	((dst port 15550) || (dst port 20193) || (dst port 42390) || (dst port 54191) || (dst port 63951)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.102.55/32) || (dst net 120.0.106.146/32) || (dst net 120.0.110.207/32) || (dst net 120.0.119.82/32) || (dst net 120.0.145.226/32))),
	((dst port 8607) || (dst port 21049) || (dst port 45802) || (dst port 49837) || (dst port 65154)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.15.120/32) || (dst net 121.0.130.28/32) || (dst net 121.0.169.134/32) || (dst net 121.0.235.145/32) || (dst net 121.0.242.30/32))),
	((dst port 6899) || (dst port 12619) || (dst port 20944) || (dst port 24989) || (dst port 38460)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.22.182/32) || (dst net 122.0.25.174/32) || (dst net 122.0.47.56/32) || (dst net 122.0.65.206/32) || (dst net 122.0.221.165/32))),
	((dst port 3524) || (dst port 26473) || (dst port 28926) || (dst port 54699) || (dst port 61659)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.53.114/32) || (dst net 123.0.61.211/32) || (dst net 123.0.187.53/32) || (dst net 123.0.227.32/32) || (dst net 123.0.228.242/32))),
	((dst port 902) || (dst port 13507) || (dst port 37396) || (dst port 45615) || (dst port 65082)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.94.36/32) || (dst net 124.0.141.101/32) || (dst net 124.0.165.157/32) || (dst net 124.0.190.156/32) || (dst net 124.0.192.54/32))),
	((dst port 2173) || (dst port 9343) || (dst port 9460) || (dst port 11558) || (dst port 28727)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.67.189/32) || (dst net 125.0.74.153/32) || (dst net 125.0.75.17/32) || (dst net 125.0.99.47/32) || (dst net 125.0.121.60/32))),
	((dst port 13103) || (dst port 18356) || (dst port 22780) || (dst port 56846) || (dst port 61174)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.9.220/32) || (dst net 126.0.45.53/32) || (dst net 126.0.69.203/32) || (dst net 126.0.72.185/32) || (dst net 126.0.255.74/32))),
	((dst port 11914) || (dst port 26810) || (dst port 35795) || (dst port 40425) || (dst port 59408)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.89.0/32) || (dst net 127.0.117.133/32) || (dst net 127.0.224.61/32) || (dst net 127.0.238.141/32) || (dst net 127.0.244.70/32))),
	((dst port 14743) || (dst port 18186) || (dst port 38227) || (dst port 51382) || (dst port 64495)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.2.171/32) || (dst net 128.0.20.215/32) || (dst net 128.0.73.52/32) || (dst net 128.0.74.63/32) || (dst net 128.0.240.97/32))),
	((dst port 10920) || (dst port 39691) || (dst port 44345) || (dst port 52726) || (dst port 55799)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.12.19/32) || (dst net 129.0.55.181/32) || (dst net 129.0.105.12/32) || (dst net 129.0.132.12/32) || (dst net 129.0.243.164/32))),
	((dst port 17816) || (dst port 59567) || (dst port 60083) || (dst port 61536) || (dst port 63819)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.17.123/32) || (dst net 130.0.33.142/32) || (dst net 130.0.114.73/32) || (dst net 130.0.149.123/32) || (dst net 130.0.202.201/32))),
	((dst port 16923) || (dst port 21179) || (dst port 25035) || (dst port 44536) || (dst port 61300)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.56.140/32) || (dst net 131.0.114.9/32) || (dst net 131.0.147.206/32) || (dst net 131.0.176.95/32) || (dst net 131.0.252.10/32))),
	((dst port 8082) || (dst port 19305) || (dst port 32966) || (dst port 46131) || (dst port 46834)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.44.28/32) || (dst net 132.0.102.134/32) || (dst net 132.0.111.32/32) || (dst net 132.0.149.232/32) || (dst net 132.0.229.79/32))),
	((dst port 9182) || (dst port 14790) || (dst port 29268) || (dst port 47055) || (dst port 58692)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.64.152/32) || (dst net 133.0.88.101/32) || (dst net 133.0.167.88/32) || (dst net 133.0.203.131/32) || (dst net 133.0.207.6/32))),
	((dst port 4738) || (dst port 9980) || (dst port 27022) || (dst port 38761) || (dst port 53219)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.135.18/32) || (dst net 134.0.149.182/32) || (dst net 134.0.178.119/32) || (dst net 134.0.189.42/32) || (dst net 134.0.222.117/32))),
	((dst port 239) || (dst port 23269) || (dst port 24578) || (dst port 31824) || (dst port 44560)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.52.119/32) || (dst net 135.0.58.185/32) || (dst net 135.0.59.153/32) || (dst net 135.0.105.206/32) || (dst net 135.0.168.157/32))),
	((dst port 6451) || (dst port 30979) || (dst port 35207) || (dst port 37814) || (dst port 48585)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.33.89/32) || (dst net 136.0.75.85/32) || (dst net 136.0.85.42/32) || (dst net 136.0.86.90/32) || (dst net 136.0.195.246/32))),
	((dst port 4581) || (dst port 31864) || (dst port 36687) || (dst port 38534) || (dst port 63165)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.109.27/32) || (dst net 137.0.110.74/32) || (dst net 137.0.185.212/32) || (dst net 137.0.199.70/32) || (dst net 137.0.212.224/32))),
	((dst port 2417) || (dst port 6498) || (dst port 45967) || (dst port 56283) || (dst port 58413)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.103.8/32) || (dst net 138.0.144.86/32) || (dst net 138.0.154.56/32) || (dst net 138.0.154.215/32) || (dst net 138.0.240.212/32))),
	((dst port 7628) || (dst port 26314) || (dst port 54237) || (dst port 56849) || (dst port 62457)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.32.93/32) || (dst net 139.0.35.200/32) || (dst net 139.0.146.39/32) || (dst net 139.0.174.115/32) || (dst net 139.0.207.145/32))),
	((dst port 6939) || (dst port 11299) || (dst port 13945) || (dst port 32459) || (dst port 38786)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.23.52/32) || (dst net 140.0.36.255/32) || (dst net 140.0.91.104/32) || (dst net 140.0.124.225/32) || (dst net 140.0.228.26/32))),
	((dst port 993) || (dst port 20080) || (dst port 26040) || (dst port 50194) || (dst port 57084)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.62.58/32) || (dst net 141.0.93.209/32) || (dst net 141.0.151.204/32) || (dst net 141.0.165.86/32) || (dst net 141.0.195.138/32))),
	((dst port 37) || (dst port 1993) || (dst port 9727) || (dst port 38304) || (dst port 38362)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.20.15/32) || (dst net 142.0.118.178/32) || (dst net 142.0.146.72/32) || (dst net 142.0.163.230/32) || (dst net 142.0.223.123/32))),
	((dst port 13121) || (dst port 15965) || (dst port 38803) || (dst port 47489) || (dst port 58463)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.46.157/32) || (dst net 143.0.61.248/32) || (dst net 143.0.120.82/32) || (dst net 143.0.136.126/32) || (dst net 143.0.207.228/32))),
	((dst port 1445) || (dst port 17754) || (dst port 21389) || (dst port 46053) || (dst port 64493)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.167.197/32) || (dst net 144.0.170.97/32) || (dst net 144.0.187.188/32) || (dst net 144.0.238.69/32) || (dst net 144.0.250.66/32))),
	((dst port 21535) || (dst port 30098) || (dst port 42053) || (dst port 50992) || (dst port 60126)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.38.151/32) || (dst net 145.0.122.161/32) || (dst net 145.0.168.137/32) || (dst net 145.0.216.220/32) || (dst net 145.0.242.71/32))),
	((dst port 13280) || (dst port 30063) || (dst port 42734) || (dst port 52472) || (dst port 65377)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.24.25/32) || (dst net 146.0.68.118/32) || (dst net 146.0.106.248/32) || (dst net 146.0.171.120/32) || (dst net 146.0.182.108/32))),
	((dst port 6667) || (dst port 23965) || (dst port 54304) || (dst port 57530) || (dst port 57718)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.12.111/32) || (dst net 147.0.46.164/32) || (dst net 147.0.158.175/32) || (dst net 147.0.160.86/32) || (dst net 147.0.209.88/32))),
	((dst port 1498) || (dst port 4386) || (dst port 20790) || (dst port 27768) || (dst port 63233)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.18.232/32) || (dst net 148.0.52.92/32) || (dst net 148.0.118.187/32) || (dst net 148.0.125.246/32) || (dst net 148.0.193.251/32))),
	((dst port 6951) || (dst port 7104) || (dst port 27593) || (dst port 37561) || (dst port 54635)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.65.182/32) || (dst net 149.0.72.117/32) || (dst net 149.0.165.229/32) || (dst net 149.0.242.155/32) || (dst net 149.0.255.67/32))),
	((dst port 6511) || (dst port 19315) || (dst port 26152) || (dst port 48768) || (dst port 53446)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.76.168/32) || (dst net 150.0.90.124/32) || (dst net 150.0.147.207/32) || (dst net 150.0.162.206/32) || (dst net 150.0.195.203/32))),
	((dst port 19523) || (dst port 33132) || (dst port 42741) || (dst port 53685) || (dst port 54320)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.2.155/32) || (dst net 151.0.41.75/32) || (dst net 151.0.51.231/32) || (dst net 151.0.78.181/32) || (dst net 151.0.90.77/32))),
	((dst port 11085) || (dst port 34185) || (dst port 46147) || (dst port 59685) || (dst port 63095)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.27.209/32) || (dst net 152.0.90.249/32) || (dst net 152.0.117.49/32) || (dst net 152.0.123.226/32) || (dst net 152.0.208.154/32))),
	((dst port 12009) || (dst port 28528) || (dst port 43278) || (dst port 47934) || (dst port 63752)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.56.75/32) || (dst net 153.0.77.25/32) || (dst net 153.0.137.130/32) || (dst net 153.0.185.93/32) || (dst net 153.0.196.43/32))),
	((dst port 6553) || (dst port 19352) || (dst port 22734) || (dst port 51821) || (dst port 61828)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.74.243/32) || (dst net 154.0.154.98/32) || (dst net 154.0.172.173/32) || (dst net 154.0.190.199/32) || (dst net 154.0.207.15/32))),
	((dst port 2156) || (dst port 3303) || (dst port 12698) || (dst port 30758) || (dst port 53625)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.42.176/32) || (dst net 155.0.134.172/32) || (dst net 155.0.176.247/32) || (dst net 155.0.194.140/32) || (dst net 155.0.225.87/32))),
	((dst port 16652) || (dst port 19382) || (dst port 29906) || (dst port 32141) || (dst port 36460)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.92.23/32) || (dst net 156.0.110.23/32) || (dst net 156.0.143.11/32) || (dst net 156.0.242.42/32) || (dst net 156.0.242.199/32))),
	((dst port 7264) || (dst port 23050) || (dst port 41781) || (dst port 51071) || (dst port 59952)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.61.65/32) || (dst net 157.0.75.77/32) || (dst net 157.0.153.207/32) || (dst net 157.0.173.10/32) || (dst net 157.0.192.75/32))),
	((dst port 14255) || (dst port 28352) || (dst port 30147) || (dst port 49872) || (dst port 52422)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.60.2/32) || (dst net 158.0.72.2/32) || (dst net 158.0.166.32/32) || (dst net 158.0.176.247/32) || (dst net 158.0.219.55/32))),
	((dst port 16973) || (dst port 17226) || (dst port 38803) || (dst port 53864) || (dst port 60489)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.0.232/32) || (dst net 159.0.76.53/32) || (dst net 159.0.146.254/32) || (dst net 159.0.149.29/32) || (dst net 159.0.149.171/32))),
	((dst port 18977) || (dst port 39798) || (dst port 40602) || (dst port 50995) || (dst port 58650)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.10.29/32) || (dst net 160.0.34.250/32) || (dst net 160.0.63.225/32) || (dst net 160.0.86.214/32) || (dst net 160.0.99.136/32))),
	((dst port 11944) || (dst port 15092) || (dst port 25418) || (dst port 31713) || (dst port 57061)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.17.185/32) || (dst net 161.0.84.130/32) || (dst net 161.0.177.221/32) || (dst net 161.0.209.32/32) || (dst net 161.0.215.42/32))),
	((dst port 2777) || (dst port 18934) || (dst port 23299) || (dst port 37140) || (dst port 40707)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.40.225/32) || (dst net 162.0.102.190/32) || (dst net 162.0.190.141/32) || (dst net 162.0.206.66/32) || (dst net 162.0.237.32/32))),
	((dst port 388) || (dst port 39782) || (dst port 40755) || (dst port 42130) || (dst port 56318)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.42.40/32) || (dst net 163.0.63.164/32) || (dst net 163.0.66.155/32) || (dst net 163.0.71.116/32) || (dst net 163.0.157.16/32))),
	((dst port 1135) || (dst port 3041) || (dst port 7434) || (dst port 9408) || (dst port 51387)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.40.120/32) || (dst net 164.0.43.150/32) || (dst net 164.0.131.42/32) || (dst net 164.0.131.149/32) || (dst net 164.0.236.146/32))),
	((dst port 2976) || (dst port 16303) || (dst port 49534) || (dst port 55780) || (dst port 56455)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.21.46/32) || (dst net 165.0.123.175/32) || (dst net 165.0.142.44/32) || (dst net 165.0.181.114/32) || (dst net 165.0.227.32/32))),
	((dst port 7053) || (dst port 27620) || (dst port 41147) || (dst port 42752) || (dst port 63484)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.23.225/32) || (dst net 166.0.27.31/32) || (dst net 166.0.164.67/32) || (dst net 166.0.187.187/32) || (dst net 166.0.236.57/32))),
	((dst port 798) || (dst port 18747) || (dst port 27043) || (dst port 28485) || (dst port 55818)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.12.30/32) || (dst net 167.0.76.212/32) || (dst net 167.0.117.219/32) || (dst net 167.0.190.147/32) || (dst net 167.0.202.248/32))),
	((dst port 5) || (dst port 19816) || (dst port 48458) || (dst port 52529) || (dst port 61569)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.43.166/32) || (dst net 168.0.121.148/32) || (dst net 168.0.168.203/32) || (dst net 168.0.177.171/32) || (dst net 168.0.207.128/32))),
	((dst port 7960) || (dst port 31985) || (dst port 33604) || (dst port 38489) || (dst port 45766)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.28.106/32) || (dst net 169.0.50.10/32) || (dst net 169.0.61.83/32) || (dst net 169.0.111.132/32) || (dst net 169.0.143.86/32))),
	((dst port 348) || (dst port 6140) || (dst port 17945) || (dst port 45853) || (dst port 63300)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.141.151/32) || (dst net 170.0.147.28/32) || (dst net 170.0.149.127/32) || (dst net 170.0.161.163/32) || (dst net 170.0.162.168/32))),
	((dst port 19913) || (dst port 38931) || (dst port 39292) || (dst port 43457) || (dst port 51979)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.21.198/32) || (dst net 171.0.23.152/32) || (dst net 171.0.41.222/32) || (dst net 171.0.73.138/32) || (dst net 171.0.211.190/32))),
	((dst port 10340) || (dst port 43292) || (dst port 52630) || (dst port 58214) || (dst port 63552)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.71.13/32) || (dst net 172.0.130.188/32) || (dst net 172.0.130.197/32) || (dst net 172.0.248.121/32) || (dst net 172.0.248.231/32))),
	((dst port 1285) || (dst port 39192) || (dst port 48145) || (dst port 53542) || (dst port 60090)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.10.234/32) || (dst net 173.0.42.2/32) || (dst net 173.0.90.239/32) || (dst net 173.0.145.74/32) || (dst net 173.0.214.62/32))),
	((dst port 28556) || (dst port 49073) || (dst port 56139) || (dst port 56395) || (dst port 58194)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.75.10/32) || (dst net 174.0.112.159/32) || (dst net 174.0.171.140/32) || (dst net 174.0.177.150/32) || (dst net 174.0.182.40/32))),
	((dst port 8603) || (dst port 19130) || (dst port 20734) || (dst port 27476) || (dst port 61629)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.83.119/32) || (dst net 175.0.119.173/32) || (dst net 175.0.164.198/32) || (dst net 175.0.188.100/32) || (dst net 175.0.217.185/32))),
	((dst port 347) || (dst port 5514) || (dst port 10513) || (dst port 14848) || (dst port 54717)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.92.108/32) || (dst net 176.0.159.186/32) || (dst net 176.0.171.55/32) || (dst net 176.0.180.46/32) || (dst net 176.0.246.104/32))),
	((dst port 8854) || (dst port 26754) || (dst port 36547) || (dst port 37900) || (dst port 50706)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.5.134/32) || (dst net 177.0.46.218/32) || (dst net 177.0.78.209/32) || (dst net 177.0.164.234/32) || (dst net 177.0.187.154/32))),
	((dst port 5867) || (dst port 26600) || (dst port 43590) || (dst port 52424) || (dst port 64202)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.37.140/32) || (dst net 178.0.57.227/32) || (dst net 178.0.103.39/32) || (dst net 178.0.109.210/32) || (dst net 178.0.210.95/32))),
	((dst port 7620) || (dst port 13321) || (dst port 13448) || (dst port 51464) || (dst port 58152)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.1.228/32) || (dst net 179.0.4.204/32) || (dst net 179.0.41.175/32) || (dst net 179.0.190.44/32) || (dst net 179.0.240.147/32))),
	((dst port 668) || (dst port 28566) || (dst port 31208) || (dst port 34964) || (dst port 44486)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.90.239/32) || (dst net 180.0.108.169/32) || (dst net 180.0.188.37/32) || (dst net 180.0.193.248/32) || (dst net 180.0.209.76/32))),
	((dst port 6445) || (dst port 20889) || (dst port 24735) || (dst port 41128) || (dst port 59788)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.57.10/32) || (dst net 181.0.64.205/32) || (dst net 181.0.138.25/32) || (dst net 181.0.164.83/32) || (dst net 181.0.248.200/32))),
	((dst port 15338) || (dst port 17948) || (dst port 32577) || (dst port 41575) || (dst port 53522)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.66.186/32) || (dst net 182.0.109.204/32) || (dst net 182.0.120.157/32) || (dst net 182.0.178.222/32) || (dst net 182.0.195.67/32))),
	((dst port 3342) || (dst port 13160) || (dst port 18633) || (dst port 32427) || (dst port 58469)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.141.71/32) || (dst net 183.0.158.222/32) || (dst net 183.0.188.196/32) || (dst net 183.0.205.117/32) || (dst net 183.0.255.159/32))),
	((dst port 4241) || (dst port 6547) || (dst port 18729) || (dst port 37529) || (dst port 50878)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.12.69/32) || (dst net 184.0.21.51/32) || (dst net 184.0.154.151/32) || (dst net 184.0.155.47/32) || (dst net 184.0.220.212/32))),
	((dst port 13236) || (dst port 17922) || (dst port 25890) || (dst port 35438) || (dst port 50678)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.28.2/32) || (dst net 185.0.157.139/32) || (dst net 185.0.173.66/32) || (dst net 185.0.214.169/32) || (dst net 185.0.234.146/32))),
	((dst port 23072) || (dst port 25012) || (dst port 53630) || (dst port 56935) || (dst port 60671)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.44.185/32) || (dst net 186.0.64.132/32) || (dst net 186.0.84.246/32) || (dst net 186.0.103.161/32) || (dst net 186.0.151.226/32))),
	((dst port 2488) || (dst port 15822) || (dst port 23545) || (dst port 28941) || (dst port 64697)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.82.208/32) || (dst net 187.0.83.28/32) || (dst net 187.0.189.60/32) || (dst net 187.0.230.12/32) || (dst net 187.0.233.182/32))),
	((dst port 15346) || (dst port 15687) || (dst port 34148) || (dst port 34421) || (dst port 58398)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.108.154/32) || (dst net 188.0.127.131/32) || (dst net 188.0.151.106/32) || (dst net 188.0.228.12/32) || (dst net 188.0.240.30/32))),
	((dst port 4766) || (dst port 5150) || (dst port 6048) || (dst port 51098) || (dst port 55692)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.18.197/32) || (dst net 189.0.25.10/32) || (dst net 189.0.37.152/32) || (dst net 189.0.43.133/32) || (dst net 189.0.60.4/32))),
	((dst port 10343) || (dst port 14098) || (dst port 28217) || (dst port 46187) || (dst port 47909)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.19.149/32) || (dst net 190.0.43.222/32) || (dst net 190.0.51.245/32) || (dst net 190.0.73.100/32) || (dst net 190.0.201.54/32))),
	((dst port 41559) || (dst port 46288) || (dst port 47604) || (dst port 53846) || (dst port 64799)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.55.61/32) || (dst net 191.0.117.188/32) || (dst net 191.0.123.174/32) || (dst net 191.0.125.97/32) || (dst net 191.0.164.124/32))),
	((dst port 893) || (dst port 28044) || (dst port 30314) || (dst port 48631) || (dst port 63519)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.33.133/32) || (dst net 192.0.134.158/32) || (dst net 192.0.150.250/32) || (dst net 192.0.209.43/32) || (dst net 192.0.232.14/32))),
	((dst port 22636) || (dst port 24921) || (dst port 47469) || (dst port 63315) || (dst port 64023)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.16.67/32) || (dst net 193.0.74.43/32) || (dst net 193.0.104.89/32) || (dst net 193.0.172.95/32) || (dst net 193.0.189.75/32))),
	((dst port 11233) || (dst port 18482) || (dst port 39139) || (dst port 55432) || (dst port 58765)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.38.91/32) || (dst net 194.0.60.153/32) || (dst net 194.0.98.35/32) || (dst net 194.0.129.205/32) || (dst net 194.0.131.12/32))),
	((dst port 9450) || (dst port 20745) || (dst port 21799) || (dst port 40703) || (dst port 40907)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.70.174/32) || (dst net 195.0.75.16/32) || (dst net 195.0.142.155/32) || (dst net 195.0.185.188/32) || (dst net 195.0.240.52/32))),
	((dst port 3368) || (dst port 7530) || (dst port 27420) || (dst port 42552) || (dst port 63037)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.21.245/32) || (dst net 196.0.141.98/32) || (dst net 196.0.153.60/32) || (dst net 196.0.159.121/32) || (dst net 196.0.240.179/32))),
	((dst port 13251) || (dst port 19233) || (dst port 31856) || (dst port 34064) || (dst port 65328)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.91.205/32) || (dst net 197.0.161.82/32) || (dst net 197.0.194.21/32) || (dst net 197.0.215.108/32) || (dst net 197.0.232.173/32))),
	((dst port 780) || (dst port 14175) || (dst port 32072) || (dst port 35882) || (dst port 61180)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.66.136/32) || (dst net 198.0.145.51/32) || (dst net 198.0.195.51/32) || (dst net 198.0.242.30/32) || (dst net 198.0.245.254/32))),
	((dst port 2034) || (dst port 4203) || (dst port 4852) || (dst port 31484) || (dst port 45346)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.6.12/32) || (dst net 199.0.54.36/32) || (dst net 199.0.80.140/32) || (dst net 199.0.93.167/32) || (dst net 199.0.130.170/32))),
	((dst port 5122) || (dst port 10984) || (dst port 45865) || (dst port 49402) || (dst port 60281)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.16.228/32) || (dst net 200.0.93.110/32) || (dst net 200.0.216.76/32) || (dst net 200.0.223.104/32) || (dst net 200.0.251.125/32))),
	((dst port 7113) || (dst port 17840) || (dst port 29600) || (dst port 43640) || (dst port 56807)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.66.76/32) || (dst net 201.0.128.83/32) || (dst net 201.0.160.65/32) || (dst net 201.0.219.170/32) || (dst net 201.0.244.205/32))),
	((dst port 18510) || (dst port 30929) || (dst port 33813) || (dst port 43000) || (dst port 64019)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.1.77/32) || (dst net 202.0.11.113/32) || (dst net 202.0.88.162/32) || (dst net 202.0.131.122/32) || (dst net 202.0.152.155/32))),
	((dst port 95) || (dst port 23673) || (dst port 26899) || (dst port 41560) || (dst port 58973)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.22.224/32) || (dst net 203.0.96.107/32) || (dst net 203.0.125.175/32) || (dst net 203.0.181.229/32) || (dst net 203.0.225.255/32))),
	((dst port 3402) || (dst port 9335) || (dst port 32100) || (dst port 43548) || (dst port 64206)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.3.116/32) || (dst net 204.0.40.113/32) || (dst net 204.0.179.193/32) || (dst net 204.0.194.241/32) || (dst net 204.0.255.253/32))),
	((dst port 5888) || (dst port 27178) || (dst port 42127) || (dst port 49437) || (dst port 61528)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.105.169/32) || (dst net 205.0.214.248/32) || (dst net 205.0.231.45/32) || (dst net 205.0.234.32/32) || (dst net 205.0.237.208/32))),
	((dst port 15952) || (dst port 30414) || (dst port 43929) || (dst port 44944) || (dst port 65145)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.38.41/32) || (dst net 206.0.109.84/32) || (dst net 206.0.126.137/32) || (dst net 206.0.136.17/32) || (dst net 206.0.219.121/32))),
	((dst port 18625) || (dst port 20033) || (dst port 20578) || (dst port 22459) || (dst port 39681)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.101.229/32) || (dst net 207.0.141.35/32) || (dst net 207.0.177.121/32) || (dst net 207.0.209.122/32) || (dst net 207.0.227.35/32))),
	((dst port 11418) || (dst port 13906) || (dst port 24580) || (dst port 25319) || (dst port 34999)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.68.216/32) || (dst net 208.0.111.70/32) || (dst net 208.0.175.143/32) || (dst net 208.0.202.64/32) || (dst net 208.0.217.110/32))),
	((dst port 4523) || (dst port 9019) || (dst port 59554) || (dst port 62769) || (dst port 65210)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.111.86/32) || (dst net 209.0.117.106/32) || (dst net 209.0.120.112/32) || (dst net 209.0.183.183/32) || (dst net 209.0.245.71/32))),
	((dst port 23572) || (dst port 23959) || (dst port 28093) || (dst port 45589) || (dst port 58927)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.71.204/32) || (dst net 210.0.162.118/32) || (dst net 210.0.183.210/32) || (dst net 210.0.190.86/32) || (dst net 210.0.191.86/32))),
	((dst port 10452) || (dst port 39748) || (dst port 61946) || (dst port 64314) || (dst port 64473)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.30.245/32) || (dst net 211.0.34.150/32) || (dst net 211.0.121.219/32) || (dst net 211.0.135.45/32) || (dst net 211.0.153.255/32))),
	((dst port 1517) || (dst port 8164) || (dst port 48130) || (dst port 51853) || (dst port 54123)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.21.156/32) || (dst net 212.0.66.152/32) || (dst net 212.0.92.59/32) || (dst net 212.0.205.209/32) || (dst net 212.0.235.161/32))),
	((dst port 6540) || (dst port 17849) || (dst port 37496) || (dst port 44857) || (dst port 52822)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.67.143/32) || (dst net 213.0.124.106/32) || (dst net 213.0.143.2/32) || (dst net 213.0.173.100/32) || (dst net 213.0.236.98/32))),
	((dst port 3573) || (dst port 13783) || (dst port 32198) || (dst port 43248) || (dst port 51000)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.27.202/32) || (dst net 214.0.90.225/32) || (dst net 214.0.98.254/32) || (dst net 214.0.118.104/32) || (dst net 214.0.155.201/32))),
	((dst port 25512) || (dst port 28371) || (dst port 41275) || (dst port 56364) || (dst port 63886)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.5.206/32) || (dst net 215.0.52.82/32) || (dst net 215.0.141.43/32) || (dst net 215.0.231.34/32) || (dst net 215.0.240.146/32))),
	((dst port 2722) || (dst port 22257) || (dst port 52437) || (dst port 53379) || (dst port 57361)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.38.170/32) || (dst net 216.0.79.102/32) || (dst net 216.0.173.67/32) || (dst net 216.0.176.49/32) || (dst net 216.0.193.98/32))),
	((dst port 5090) || (dst port 8500) || (dst port 28661) || (dst port 31580) || (dst port 49461)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.13.1/32) || (dst net 217.0.15.150/32) || (dst net 217.0.71.195/32) || (dst net 217.0.83.149/32) || (dst net 217.0.215.59/32))),
	((dst port 14345) || (dst port 17168) || (dst port 48762) || (dst port 57630) || (dst port 64560)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.81.67/32) || (dst net 218.0.153.10/32) || (dst net 218.0.184.237/32) || (dst net 218.0.206.108/32) || (dst net 218.0.221.254/32))),
	((dst port 27516) || (dst port 29108) || (dst port 34520) || (dst port 44182) || (dst port 52022)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.21.132/32) || (dst net 219.0.57.52/32) || (dst net 219.0.127.185/32) || (dst net 219.0.180.111/32) || (dst net 219.0.187.159/32))),
	((dst port 1942) || (dst port 17506) || (dst port 17666) || (dst port 23455) || (dst port 39268)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.48.212/32) || (dst net 220.0.110.105/32) || (dst net 220.0.164.178/32) || (dst net 220.0.203.63/32) || (dst net 220.0.229.54/32))),
	((dst port 7848) || (dst port 14935) || (dst port 27470) || (dst port 48062) || (dst port 52912)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.66.118/32) || (dst net 221.0.72.161/32) || (dst net 221.0.110.79/32) || (dst net 221.0.141.68/32) || (dst net 221.0.234.190/32))),
	((dst port 13286) || (dst port 23602) || (dst port 24551) || (dst port 47709) || (dst port 54281)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.11.193/32) || (dst net 222.0.42.191/32) || (dst net 222.0.116.95/32) || (dst net 222.0.152.48/32) || (dst net 222.0.181.206/32))),
	((dst port 340) || (dst port 9805) || (dst port 17680) || (dst port 30671) || (dst port 35222)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.17.242/32) || (dst net 223.0.19.232/32) || (dst net 223.0.23.43/32) || (dst net 223.0.67.231/32) || (dst net 223.0.250.17/32))),
	((dst port 13084) || (dst port 27626) || (dst port 31291) || (dst port 47430) || (dst port 54986)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.20.222/32) || (dst net 224.0.24.123/32) || (dst net 224.0.60.206/32) || (dst net 224.0.208.88/32) || (dst net 224.0.227.35/32))),
	((dst port 3582) || (dst port 9451) || (dst port 13601) || (dst port 47021) || (dst port 57993)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.3.216/32) || (dst net 225.0.113.47/32) || (dst net 225.0.148.26/32) || (dst net 225.0.153.50/32) || (dst net 225.0.179.41/32))),
	((dst port 2933) || (dst port 7880) || (dst port 13391) || (dst port 16783) || (dst port 17152)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.1.33/32) || (dst net 226.0.55.214/32) || (dst net 226.0.155.167/32) || (dst net 226.0.176.143/32) || (dst net 226.0.182.201/32))),
	((dst port 1963) || (dst port 4446) || (dst port 22722) || (dst port 25891) || (dst port 55595)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.51.165/32) || (dst net 227.0.64.146/32) || (dst net 227.0.162.241/32) || (dst net 227.0.167.105/32) || (dst net 227.0.196.248/32))),
	((dst port 24367) || (dst port 39376) || (dst port 51800) || (dst port 59867) || (dst port 61442)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.23.121/32) || (dst net 228.0.160.78/32) || (dst net 228.0.160.201/32) || (dst net 228.0.216.15/32) || (dst net 228.0.253.113/32))),
	((dst port 6698) || (dst port 25264) || (dst port 39666) || (dst port 52707) || (dst port 54232)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.69.37/32) || (dst net 229.0.130.176/32) || (dst net 229.0.213.126/32) || (dst net 229.0.229.188/32) || (dst net 229.0.240.53/32))),
	((dst port 355) || (dst port 3128) || (dst port 30667) || (dst port 41114) || (dst port 44504)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.35.77/32) || (dst net 230.0.142.173/32) || (dst net 230.0.154.187/32) || (dst net 230.0.183.181/32) || (dst net 230.0.241.10/32))),
	((dst port 11231) || (dst port 13556) || (dst port 20407) || (dst port 35903) || (dst port 37150)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.11.226/32) || (dst net 231.0.71.188/32) || (dst net 231.0.85.115/32) || (dst net 231.0.127.116/32) || (dst net 231.0.199.197/32))),
	((dst port 11232) || (dst port 23777) || (dst port 34470) || (dst port 36009) || (dst port 56991)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.50.31/32) || (dst net 232.0.116.22/32) || (dst net 232.0.140.138/32) || (dst net 232.0.175.152/32) || (dst net 232.0.243.168/32))),
	((dst port 3011) || (dst port 9701) || (dst port 21658) || (dst port 45490) || (dst port 51336)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.9.163/32) || (dst net 233.0.129.59/32) || (dst net 233.0.205.149/32) || (dst net 233.0.226.19/32) || (dst net 233.0.251.84/32))),
	((dst port 5351) || (dst port 13677) || (dst port 32768) || (dst port 40572) || (dst port 52498)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.21.119/32) || (dst net 234.0.109.61/32) || (dst net 234.0.176.92/32) || (dst net 234.0.224.248/32) || (dst net 234.0.225.228/32))),
	((dst port 14587) || (dst port 49701) || (dst port 52800) || (dst port 61902) || (dst port 63203)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.42.158/32) || (dst net 235.0.107.178/32) || (dst net 235.0.119.33/32) || (dst net 235.0.124.209/32) || (dst net 235.0.249.195/32))),
	((dst port 17284) || (dst port 35491) || (dst port 36755) || (dst port 46404) || (dst port 49432)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.12.49/32) || (dst net 236.0.46.59/32) || (dst net 236.0.108.103/32) || (dst net 236.0.133.210/32) || (dst net 236.0.227.64/32))),
	((dst port 21090) || (dst port 39048) || (dst port 50400) || (dst port 62045) || (dst port 62755)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.4.137/32) || (dst net 237.0.82.86/32) || (dst net 237.0.146.58/32) || (dst net 237.0.223.242/32) || (dst net 237.0.231.244/32))),
	((dst port 12159) || (dst port 16127) || (dst port 50575) || (dst port 52049) || (dst port 60360)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.14.30/32) || (dst net 238.0.124.121/32) || (dst net 238.0.139.136/32) || (dst net 238.0.212.187/32) || (dst net 238.0.255.116/32))),
	((dst port 1088) || (dst port 16910) || (dst port 34571) || (dst port 54007) || (dst port 63295)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.60.127/32) || (dst net 239.0.138.121/32) || (dst net 239.0.212.209/32) || (dst net 239.0.212.235/32) || (dst net 239.0.233.71/32))),
	((dst port 11490) || (dst port 15270) || (dst port 22073) || (dst port 44606) || (dst port 53329)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.9.27/32) || (dst net 240.0.14.186/32) || (dst net 240.0.37.54/32) || (dst net 240.0.40.20/32) || (dst net 240.0.242.198/32))),
	((dst port 18078) || (dst port 21238) || (dst port 30364) || (dst port 34651) || (dst port 51123)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.13.205/32) || (dst net 241.0.15.148/32) || (dst net 241.0.59.124/32) || (dst net 241.0.218.156/32) || (dst net 241.0.229.172/32))),
	((dst port 4789) || (dst port 17031) || (dst port 25658) || (dst port 50029) || (dst port 53240)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.20.23/32) || (dst net 242.0.32.70/32) || (dst net 242.0.119.110/32) || (dst net 242.0.231.245/32) || (dst net 242.0.252.185/32))),
	((dst port 17769) || (dst port 40270) || (dst port 55100) || (dst port 56474) || (dst port 62761)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.51.71/32) || (dst net 243.0.71.62/32) || (dst net 243.0.107.211/32) || (dst net 243.0.175.54/32) || (dst net 243.0.187.84/32))),
	((dst port 20468) || (dst port 47859) || (dst port 60218) || (dst port 60307) || (dst port 65381)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.38.197/32) || (dst net 244.0.86.53/32) || (dst net 244.0.108.203/32) || (dst net 244.0.143.176/32) || (dst net 244.0.153.249/32))),
	((dst port 4987) || (dst port 23244) || (dst port 32243) || (dst port 43638) || (dst port 62985)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.41.127/32) || (dst net 245.0.116.145/32) || (dst net 245.0.140.82/32) || (dst net 245.0.190.208/32) || (dst net 245.0.249.216/32))),
	((dst port 3245) || (dst port 21723) || (dst port 37883) || (dst port 44950) || (dst port 63473)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.22.189/32) || (dst net 246.0.77.83/32) || (dst net 246.0.172.60/32) || (dst net 246.0.244.63/32) || (dst net 246.0.253.47/32))),
	((dst port 17754) || (dst port 30537) || (dst port 43371) || (dst port 46678) || (dst port 48613)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.10.201/32) || (dst net 247.0.59.109/32) || (dst net 247.0.94.241/32) || (dst net 247.0.123.26/32) || (dst net 247.0.199.184/32))),
	((dst port 10592) || (dst port 10935) || (dst port 13800) || (dst port 29982) || (dst port 32525)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.0.12/32) || (dst net 248.0.10.220/32) || (dst net 248.0.13.127/32) || (dst net 248.0.32.219/32) || (dst net 248.0.63.94/32))),
	((dst port 17389) || (dst port 33170) || (dst port 37846) || (dst port 38899) || (dst port 48830)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.1.118/32) || (dst net 249.0.3.90/32) || (dst net 249.0.5.185/32) || (dst net 249.0.9.91/32) || (dst net 249.0.224.176/32))),
	((dst port 5965) || (dst port 18132) || (dst port 27048) || (dst port 33783) || (dst port 54539)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.44.141/32) || (dst net 250.0.86.219/32) || (dst net 250.0.108.105/32) || (dst net 250.0.141.123/32) || (dst net 250.0.252.103/32))),
	((dst port 5397) || (dst port 16880) || (dst port 51773) || (dst port 52917) || (dst port 63556)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.142.56/32) || (dst net 251.0.175.101/32) || (dst net 251.0.182.48/32) || (dst net 251.0.229.206/32) || (dst net 251.0.239.1/32))),
	((dst port 19242) || (dst port 44437) || (dst port 48737) || (dst port 50157) || (dst port 51714)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.11.98/32) || (dst net 252.0.47.118/32) || (dst net 252.0.67.13/32) || (dst net 252.0.121.208/32) || (dst net 252.0.253.115/32))),
	((dst port 23770) || (dst port 43470) || (dst port 50376) || (dst port 51639) || (dst port 60646)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.46.189/32) || (dst net 253.0.145.163/32) || (dst net 253.0.154.130/32) || (dst net 253.0.181.103/32) || (dst net 253.0.238.112/32))),
	((dst port 9404) || (dst port 12088) || (dst port 17145) || (dst port 49929) || (dst port 52524)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.22.50/32) || (dst net 254.0.44.149/32) || (dst net 254.0.200.125/32) || (dst net 254.0.237.181/32) || (dst net 254.0.252.109/32))),
	((dst port 6014) || (dst port 17156) || (dst port 26328) || (dst port 41413) || (dst port 52830)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.87.176/32) || (dst net 255.0.221.103/32) || (dst net 255.0.232.41/32) || (dst net 255.0.238.168/32) || (dst net 255.0.245.33/32))),
	((dst port 10002) || (dst port 16714) || (dst port 30269) || (dst port 35559) || (dst port 64653)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.14.253/32) || (dst net 0.0.16.233/32) || (dst net 0.0.50.228/32) || (dst net 0.0.78.40/32) || (dst net 0.0.207.21/32))),
	((dst port 21289) || (dst port 25096) || (dst port 33452) || (dst port 47457) || (dst port 52936)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.12.107/32) || (dst net 1.0.39.78/32) || (dst net 1.0.95.213/32) || (dst net 1.0.131.230/32) || (dst net 1.0.136.84/32))),
	((dst port 29412) || (dst port 35768) || (dst port 42162) || (dst port 59528) || (dst port 59765)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.80.184/32) || (dst net 2.0.100.232/32) || (dst net 2.0.172.58/32) || (dst net 2.0.173.244/32) || (dst net 2.0.191.227/32))),
	((dst port 22210) || (dst port 51815) || (dst port 53157) || (dst port 55424) || (dst port 59251)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.20.205/32) || (dst net 3.0.91.181/32) || (dst net 3.0.142.101/32) || (dst net 3.0.212.121/32) || (dst net 3.0.217.103/32))),
	((dst port 15482) || (dst port 33463) || (dst port 34614) || (dst port 44265) || (dst port 48938)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.13.222/32) || (dst net 4.0.42.207/32) || (dst net 4.0.102.170/32) || (dst net 4.0.154.84/32) || (dst net 4.0.193.202/32))),
	((dst port 5371) || (dst port 30505) || (dst port 37183) || (dst port 42852) || (dst port 52139)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.19.252/32) || (dst net 5.0.29.66/32) || (dst net 5.0.54.245/32) || (dst net 5.0.68.202/32) || (dst net 5.0.171.179/32))),
	((dst port 1724) || (dst port 3031) || (dst port 11257) || (dst port 32776) || (dst port 33635)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.10.206/32) || (dst net 6.0.21.74/32) || (dst net 6.0.83.230/32) || (dst net 6.0.96.139/32) || (dst net 6.0.204.36/32))),
	((dst port 6873) || (dst port 22850) || (dst port 35742) || (dst port 42639) || (dst port 45511)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.3.74/32) || (dst net 7.0.19.102/32) || (dst net 7.0.24.148/32) || (dst net 7.0.165.143/32) || (dst net 7.0.176.80/32))),
	((dst port 7643) || (dst port 12870) || (dst port 46753) || (dst port 48942) || (dst port 62089)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.44.148/32) || (dst net 8.0.49.175/32) || (dst net 8.0.186.254/32) || (dst net 8.0.201.75/32) || (dst net 8.0.212.136/32))),
	((dst port 8825) || (dst port 11221) || (dst port 21889) || (dst port 40185) || (dst port 52598)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.41.197/32) || (dst net 9.0.51.131/32) || (dst net 9.0.73.158/32) || (dst net 9.0.204.5/32) || (dst net 9.0.210.115/32))),
	((dst port 8491) || (dst port 32597) || (dst port 37725) || (dst port 39213) || (dst port 43992)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.14.211/32) || (dst net 10.0.58.32/32) || (dst net 10.0.100.66/32) || (dst net 10.0.100.211/32) || (dst net 10.0.254.204/32))),
	((dst port 402) || (dst port 10973) || (dst port 38049) || (dst port 44870) || (dst port 57183)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.52.210/32) || (dst net 11.0.104.215/32) || (dst net 11.0.208.109/32) || (dst net 11.0.221.107/32) || (dst net 11.0.227.180/32))),
	((dst port 4174) || (dst port 35539) || (dst port 39364) || (dst port 52107) || (dst port 58363)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.6.124/32) || (dst net 12.0.17.198/32) || (dst net 12.0.144.30/32) || (dst net 12.0.180.228/32) || (dst net 12.0.204.109/32))),
	((dst port 20669) || (dst port 24919) || (dst port 40025) || (dst port 41936) || (dst port 47290)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.31.21/32) || (dst net 13.0.50.248/32) || (dst net 13.0.153.32/32) || (dst net 13.0.214.238/32) || (dst net 13.0.224.133/32))),
	((dst port 130) || (dst port 24812) || (dst port 29602) || (dst port 32581) || (dst port 62189)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.85.240/32) || (dst net 14.0.127.94/32) || (dst net 14.0.198.132/32) || (dst net 14.0.201.95/32) || (dst net 14.0.244.59/32))),
	((dst port 75) || (dst port 20819) || (dst port 35864) || (dst port 38080) || (dst port 47064)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.60.111/32) || (dst net 15.0.106.119/32) || (dst net 15.0.108.210/32) || (dst net 15.0.124.45/32) || (dst net 15.0.164.198/32))),
	((dst port 10276) || (dst port 15836) || (dst port 52630) || (dst port 59645) || (dst port 63125)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.21.52/32) || (dst net 16.0.55.170/32) || (dst net 16.0.89.113/32) || (dst net 16.0.101.225/32) || (dst net 16.0.125.87/32))),
	((dst port 6490) || (dst port 13289) || (dst port 30941) || (dst port 48392) || (dst port 51294)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.55.81/32) || (dst net 17.0.117.80/32) || (dst net 17.0.183.207/32) || (dst net 17.0.188.53/32) || (dst net 17.0.233.63/32))),
	((dst port 34205) || (dst port 48648) || (dst port 50850) || (dst port 57578) || (dst port 61916)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.39.75/32) || (dst net 18.0.123.19/32) || (dst net 18.0.205.41/32) || (dst net 18.0.235.127/32) || (dst net 18.0.239.41/32))),
	((dst port 28931) || (dst port 31882) || (dst port 37738) || (dst port 55678) || (dst port 64276)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.9.62/32) || (dst net 19.0.81.202/32) || (dst net 19.0.154.151/32) || (dst net 19.0.204.67/32) || (dst net 19.0.239.76/32))),
	((dst port 37851) || (dst port 41574) || (dst port 47572) || (dst port 48799) || (dst port 57893)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.36.97/32) || (dst net 20.0.56.145/32) || (dst net 20.0.111.25/32) || (dst net 20.0.131.164/32) || (dst net 20.0.188.253/32))),
	((dst port 5231) || (dst port 8195) || (dst port 18635) || (dst port 23740) || (dst port 32413)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.78.9/32) || (dst net 21.0.87.87/32) || (dst net 21.0.135.177/32) || (dst net 21.0.145.51/32) || (dst net 21.0.250.115/32))),
	((dst port 13017) || (dst port 23956) || (dst port 38132) || (dst port 55016) || (dst port 57911)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.24.239/32) || (dst net 22.0.36.159/32) || (dst net 22.0.89.120/32) || (dst net 22.0.202.2/32) || (dst net 22.0.221.185/32))),
	((dst port 5168) || (dst port 15442) || (dst port 18042) || (dst port 22773) || (dst port 55786)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.26.158/32) || (dst net 23.0.44.79/32) || (dst net 23.0.51.147/32) || (dst net 23.0.110.240/32) || (dst net 23.0.236.213/32))),
	((dst port 19460) || (dst port 22115) || (dst port 27913) || (dst port 33957) || (dst port 45672)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.18.91/32) || (dst net 24.0.42.241/32) || (dst net 24.0.51.154/32) || (dst net 24.0.57.194/32) || (dst net 24.0.212.110/32))),
	((dst port 18512) || (dst port 26262) || (dst port 31170) || (dst port 44713) || (dst port 46553)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.6.149/32) || (dst net 25.0.41.2/32) || (dst net 25.0.58.238/32) || (dst net 25.0.67.236/32) || (dst net 25.0.255.180/32))),
	((dst port 22916) || (dst port 23322) || (dst port 29141) || (dst port 31575) || (dst port 56013)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.21.96/32) || (dst net 26.0.73.247/32) || (dst net 26.0.86.59/32) || (dst net 26.0.208.3/32) || (dst net 26.0.209.130/32))),
	((dst port 21226) || (dst port 23499) || (dst port 24786) || (dst port 31411) || (dst port 32323)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.101.12/32) || (dst net 27.0.199.95/32) || (dst net 27.0.221.193/32) || (dst net 27.0.229.240/32) || (dst net 27.0.250.121/32))),
	((dst port 10319) || (dst port 10472) || (dst port 33161) || (dst port 45461) || (dst port 48763)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.2.106/32) || (dst net 28.0.16.134/32) || (dst net 28.0.29.34/32) || (dst net 28.0.82.45/32) || (dst net 28.0.126.4/32))),
	((dst port 18248) || (dst port 37038) || (dst port 48912) || (dst port 49689) || (dst port 49894)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.9.190/32) || (dst net 29.0.12.32/32) || (dst net 29.0.45.178/32) || (dst net 29.0.101.210/32) || (dst net 29.0.142.34/32))),
	((dst port 5573) || (dst port 10011) || (dst port 11987) || (dst port 36647) || (dst port 64042)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.102.107/32) || (dst net 30.0.168.69/32) || (dst net 30.0.208.146/32) || (dst net 30.0.217.21/32) || (dst net 30.0.229.42/32))),
	((dst port 4328) || (dst port 17830) || (dst port 30496) || (dst port 34414) || (dst port 45514)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.29.192/32) || (dst net 31.0.47.76/32) || (dst net 31.0.69.133/32) || (dst net 31.0.134.101/32) || (dst net 31.0.254.171/32))),
	((dst port 3133) || (dst port 9330) || (dst port 13250) || (dst port 16062) || (dst port 58066)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.28.40/32) || (dst net 32.0.78.117/32) || (dst net 32.0.151.178/32) || (dst net 32.0.222.116/32) || (dst net 32.0.225.62/32))),
	((dst port 14075) || (dst port 24366) || (dst port 41945) || (dst port 50356) || (dst port 53594)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.154.185/32) || (dst net 33.0.171.165/32) || (dst net 33.0.185.226/32) || (dst net 33.0.207.8/32) || (dst net 33.0.208.157/32))),
	((dst port 20963) || (dst port 30676) || (dst port 33442) || (dst port 43414) || (dst port 62740)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.46.154/32) || (dst net 34.0.101.14/32) || (dst net 34.0.110.249/32) || (dst net 34.0.150.186/32) || (dst net 34.0.186.78/32))),
	((dst port 3553) || (dst port 8884) || (dst port 12541) || (dst port 26873) || (dst port 48487)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.38.204/32) || (dst net 35.0.106.141/32) || (dst net 35.0.166.239/32) || (dst net 35.0.230.152/32) || (dst net 35.0.239.111/32))),
	((dst port 666) || (dst port 18810) || (dst port 46340) || (dst port 56227) || (dst port 56877)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.61.226/32) || (dst net 36.0.104.100/32) || (dst net 36.0.129.87/32) || (dst net 36.0.143.19/32) || (dst net 36.0.247.229/32))),
	((dst port 17180) || (dst port 29150) || (dst port 31945) || (dst port 49870) || (dst port 62179)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.0.235/32) || (dst net 37.0.122.36/32) || (dst net 37.0.138.198/32) || (dst net 37.0.142.58/32) || (dst net 37.0.168.164/32))),
	((dst port 20465) || (dst port 20884) || (dst port 38465) || (dst port 53677) || (dst port 56637)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.21.138/32) || (dst net 38.0.41.120/32) || (dst net 38.0.159.68/32) || (dst net 38.0.213.55/32) || (dst net 38.0.229.245/32))),
	((dst port 3025) || (dst port 22757) || (dst port 37195) || (dst port 40398) || (dst port 64919)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.64.10/32) || (dst net 39.0.96.195/32) || (dst net 39.0.110.82/32) || (dst net 39.0.169.136/32) || (dst net 39.0.206.63/32))),
	((dst port 4949) || (dst port 5697) || (dst port 17708) || (dst port 21301) || (dst port 47983)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.103.46/32) || (dst net 40.0.148.111/32) || (dst net 40.0.200.192/32) || (dst net 40.0.215.88/32) || (dst net 40.0.245.30/32))),
	((dst port 11177) || (dst port 21646) || (dst port 33732) || (dst port 41576) || (dst port 46541)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.36.127/32) || (dst net 41.0.46.0/32) || (dst net 41.0.146.19/32) || (dst net 41.0.239.207/32) || (dst net 41.0.247.0/32))),
	((dst port 8745) || (dst port 13340) || (dst port 38119) || (dst port 38414) || (dst port 39133)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.8.51/32) || (dst net 42.0.28.163/32) || (dst net 42.0.48.53/32) || (dst net 42.0.130.4/32) || (dst net 42.0.165.184/32))),
	((dst port 1575) || (dst port 1618) || (dst port 15118) || (dst port 59701) || (dst port 60687)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.56.183/32) || (dst net 43.0.126.199/32) || (dst net 43.0.132.86/32) || (dst net 43.0.209.43/32) || (dst net 43.0.250.77/32))),
	((dst port 3435) || (dst port 25375) || (dst port 34186) || (dst port 59631) || (dst port 65237)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.31.198/32) || (dst net 44.0.54.47/32) || (dst net 44.0.83.152/32) || (dst net 44.0.120.59/32) || (dst net 44.0.253.120/32))),
	((dst port 8624) || (dst port 15524) || (dst port 22402) || (dst port 55096) || (dst port 62902)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.66.176/32) || (dst net 45.0.76.28/32) || (dst net 45.0.194.152/32) || (dst net 45.0.215.204/32) || (dst net 45.0.223.229/32))),
	((dst port 5327) || (dst port 6094) || (dst port 8720) || (dst port 29786) || (dst port 49441)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.7.37/32) || (dst net 46.0.14.105/32) || (dst net 46.0.78.207/32) || (dst net 46.0.98.62/32) || (dst net 46.0.173.85/32))),
	((dst port 14328) || (dst port 24522) || (dst port 33714) || (dst port 45677) || (dst port 63044)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.105.181/32) || (dst net 47.0.190.211/32) || (dst net 47.0.194.230/32) || (dst net 47.0.206.92/32) || (dst net 47.0.255.130/32))),
	((dst port 41352) || (dst port 42062) || (dst port 47525) || (dst port 51360) || (dst port 52188)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.13.232/32) || (dst net 48.0.42.216/32) || (dst net 48.0.216.173/32) || (dst net 48.0.236.130/32) || (dst net 48.0.246.222/32))),
	((dst port 9224) || (dst port 11922) || (dst port 34908) || (dst port 41571) || (dst port 65355)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.59.132/32) || (dst net 49.0.68.217/32) || (dst net 49.0.118.100/32) || (dst net 49.0.248.47/32) || (dst net 49.0.255.144/32))),
	((dst port 9159) || (dst port 19704) || (dst port 24060) || (dst port 41719) || (dst port 50565)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.46.28/32) || (dst net 50.0.86.206/32) || (dst net 50.0.88.165/32) || (dst net 50.0.116.139/32) || (dst net 50.0.197.223/32))),
	((dst port 10007) || (dst port 15704) || (dst port 25242) || (dst port 40978) || (dst port 47105)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.31.56/32) || (dst net 51.0.89.185/32) || (dst net 51.0.91.156/32) || (dst net 51.0.107.154/32) || (dst net 51.0.234.242/32))),
	((dst port 16445) || (dst port 18797) || (dst port 20417) || (dst port 21455) || (dst port 42286)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.70.111/32) || (dst net 52.0.100.41/32) || (dst net 52.0.127.65/32) || (dst net 52.0.197.9/32) || (dst net 52.0.254.136/32))),
	((dst port 13840) || (dst port 23891) || (dst port 40243) || (dst port 60140) || (dst port 64635)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.61.23/32) || (dst net 53.0.66.69/32) || (dst net 53.0.173.83/32) || (dst net 53.0.197.23/32) || (dst net 53.0.234.245/32))),
	((dst port 4677) || (dst port 7276) || (dst port 27640) || (dst port 33575) || (dst port 59618)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.36.158/32) || (dst net 54.0.211.139/32) || (dst net 54.0.212.112/32) || (dst net 54.0.216.122/32) || (dst net 54.0.253.216/32))),
	((dst port 17013) || (dst port 28771) || (dst port 49887) || (dst port 52146) || (dst port 53511)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.27.227/32) || (dst net 55.0.42.71/32) || (dst net 55.0.50.125/32) || (dst net 55.0.191.202/32) || (dst net 55.0.195.125/32))),
	((dst port 1698) || (dst port 13317) || (dst port 14361) || (dst port 17961) || (dst port 38784)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.29.45/32) || (dst net 56.0.39.168/32) || (dst net 56.0.108.255/32) || (dst net 56.0.138.236/32) || (dst net 56.0.163.74/32))),
	((dst port 15197) || (dst port 17514) || (dst port 22266) || (dst port 34283) || (dst port 55802)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.45.82/32) || (dst net 57.0.63.217/32) || (dst net 57.0.89.17/32) || (dst net 57.0.195.211/32) || (dst net 57.0.243.235/32))),
	((dst port 922) || (dst port 1269) || (dst port 5485) || (dst port 33500) || (dst port 39556)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.44.163/32) || (dst net 58.0.105.216/32) || (dst net 58.0.119.177/32) || (dst net 58.0.231.80/32) || (dst net 58.0.252.44/32))),
	((dst port 26954) || (dst port 32263) || (dst port 37636) || (dst port 44755) || (dst port 62073)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.100.190/32) || (dst net 59.0.112.152/32) || (dst net 59.0.180.176/32) || (dst net 59.0.240.111/32) || (dst net 59.0.243.196/32))),
	((dst port 11445) || (dst port 18189) || (dst port 19740) || (dst port 37505) || (dst port 46697)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.78.253/32) || (dst net 60.0.126.100/32) || (dst net 60.0.157.72/32) || (dst net 60.0.187.229/32) || (dst net 60.0.217.121/32))),
	((dst port 4962) || (dst port 10620) || (dst port 14864) || (dst port 32912) || (dst port 47768)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.11.79/32) || (dst net 61.0.45.178/32) || (dst net 61.0.70.67/32) || (dst net 61.0.187.254/32) || (dst net 61.0.196.53/32))),
	((dst port 16700) || (dst port 21375) || (dst port 32004) || (dst port 38990) || (dst port 50745)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.26.36/32) || (dst net 62.0.87.81/32) || (dst net 62.0.121.164/32) || (dst net 62.0.157.58/32) || (dst net 62.0.195.60/32))),
	((dst port 4941) || (dst port 15366) || (dst port 36607) || (dst port 43796) || (dst port 54885)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.51.13/32) || (dst net 63.0.56.173/32) || (dst net 63.0.100.78/32) || (dst net 63.0.202.61/32) || (dst net 63.0.254.184/32))),
	((dst port 19312) || (dst port 27966) || (dst port 36507) || (dst port 42883) || (dst port 57944)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.71.227/32) || (dst net 64.0.126.202/32) || (dst net 64.0.162.232/32) || (dst net 64.0.206.80/32) || (dst net 64.0.247.10/32))),
	((dst port 3061) || (dst port 3726) || (dst port 13234) || (dst port 16319) || (dst port 54273)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.31.62/32) || (dst net 65.0.32.42/32) || (dst net 65.0.116.221/32) || (dst net 65.0.144.93/32) || (dst net 65.0.190.206/32))),
	((dst port 4603) || (dst port 28940) || (dst port 45475) || (dst port 48619) || (dst port 62779)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.48.104/32) || (dst net 66.0.120.89/32) || (dst net 66.0.166.230/32) || (dst net 66.0.177.107/32) || (dst net 66.0.248.39/32))),
	((dst port 22607) || (dst port 23694) || (dst port 37502) || (dst port 53133) || (dst port 60516)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.0.156/32) || (dst net 67.0.56.239/32) || (dst net 67.0.78.171/32) || (dst net 67.0.150.211/32) || (dst net 67.0.218.98/32))),
	((dst port 44555) || (dst port 58713) || (dst port 61227) || (dst port 61263) || (dst port 64274)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.58.111/32) || (dst net 68.0.100.84/32) || (dst net 68.0.107.70/32) || (dst net 68.0.161.111/32) || (dst net 68.0.183.171/32))),
	((dst port 18751) || (dst port 34857) || (dst port 47487) || (dst port 58038) || (dst port 64661)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.47.124/32) || (dst net 69.0.138.114/32) || (dst net 69.0.158.147/32) || (dst net 69.0.158.213/32) || (dst net 69.0.227.152/32))),
	((dst port 10477) || (dst port 17853) || (dst port 18414) || (dst port 27281) || (dst port 62642)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.30.24/32) || (dst net 70.0.97.245/32) || (dst net 70.0.215.107/32) || (dst net 70.0.249.39/32) || (dst net 70.0.252.235/32))),
	((dst port 2427) || (dst port 27953) || (dst port 44048) || (dst port 44810) || (dst port 61317)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.12.210/32) || (dst net 71.0.145.68/32) || (dst net 71.0.152.109/32) || (dst net 71.0.189.115/32) || (dst net 71.0.239.166/32))),
	((dst port 24334) || (dst port 26369) || (dst port 35742) || (dst port 40299) || (dst port 62689)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.15.8/32) || (dst net 72.0.99.104/32) || (dst net 72.0.119.144/32) || (dst net 72.0.146.60/32) || (dst net 72.0.231.28/32))),
	((dst port 13595) || (dst port 15198) || (dst port 32067) || (dst port 40511) || (dst port 46724)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.74.240/32) || (dst net 73.0.137.156/32) || (dst net 73.0.141.127/32) || (dst net 73.0.180.239/32) || (dst net 73.0.218.84/32))),
	((dst port 17003) || (dst port 17939) || (dst port 26172) || (dst port 26918) || (dst port 36671)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.119.219/32) || (dst net 74.0.128.175/32) || (dst net 74.0.144.78/32) || (dst net 74.0.203.33/32) || (dst net 74.0.233.3/32))),
	((dst port 36566) || (dst port 36666) || (dst port 43617) || (dst port 53666) || (dst port 61146)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.12.30/32) || (dst net 75.0.88.143/32) || (dst net 75.0.189.38/32) || (dst net 75.0.197.104/32) || (dst net 75.0.254.39/32))),
	((dst port 26810) || (dst port 29660) || (dst port 39893) || (dst port 49669) || (dst port 62811)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.19.138/32) || (dst net 76.0.77.214/32) || (dst net 76.0.98.225/32) || (dst net 76.0.119.84/32) || (dst net 76.0.218.173/32))),
	((dst port 9862) || (dst port 15526) || (dst port 45101) || (dst port 55863) || (dst port 58391)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.104.233/32) || (dst net 77.0.108.111/32) || (dst net 77.0.108.251/32) || (dst net 77.0.208.119/32) || (dst net 77.0.214.129/32))),
	((dst port 25448) || (dst port 28816) || (dst port 39152) || (dst port 40528) || (dst port 54496)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.12.200/32) || (dst net 78.0.65.153/32) || (dst net 78.0.79.121/32) || (dst net 78.0.148.201/32) || (dst net 78.0.162.90/32))),
	((dst port 11973) || (dst port 23322) || (dst port 31263) || (dst port 44246) || (dst port 64107)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.2.48/32) || (dst net 79.0.25.65/32) || (dst net 79.0.111.114/32) || (dst net 79.0.140.189/32) || (dst net 79.0.171.106/32))),
	((dst port 6346) || (dst port 15946) || (dst port 28578) || (dst port 32589) || (dst port 58609)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.31.106/32) || (dst net 80.0.64.37/32) || (dst net 80.0.152.40/32) || (dst net 80.0.234.73/32) || (dst net 80.0.235.156/32))),
	((dst port 10981) || (dst port 16090) || (dst port 43540) || (dst port 45476) || (dst port 50098)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.88.176/32) || (dst net 81.0.118.37/32) || (dst net 81.0.141.226/32) || (dst net 81.0.147.191/32) || (dst net 81.0.181.53/32))),
	((dst port 2243) || (dst port 35445) || (dst port 37801) || (dst port 38275) || (dst port 50086)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.12.155/32) || (dst net 82.0.20.144/32) || (dst net 82.0.21.31/32) || (dst net 82.0.115.28/32) || (dst net 82.0.212.90/32))),
	((dst port 3467) || (dst port 12114) || (dst port 25250) || (dst port 29628) || (dst port 51762)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.63.32/32) || (dst net 83.0.91.153/32) || (dst net 83.0.122.192/32) || (dst net 83.0.148.115/32) || (dst net 83.0.206.64/32))),
	((dst port 2357) || (dst port 38037) || (dst port 49588) || (dst port 58975) || (dst port 65070)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.109.85/32) || (dst net 84.0.126.135/32) || (dst net 84.0.141.6/32) || (dst net 84.0.204.26/32) || (dst net 84.0.220.100/32))),
	((dst port 18110) || (dst port 20154) || (dst port 38788) || (dst port 45928) || (dst port 46449)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.77.176/32) || (dst net 85.0.98.226/32) || (dst net 85.0.119.106/32) || (dst net 85.0.151.12/32) || (dst net 85.0.193.123/32))),
	((dst port 10885) || (dst port 23380) || (dst port 32687) || (dst port 51466) || (dst port 57958)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.56.154/32) || (dst net 86.0.70.244/32) || (dst net 86.0.84.29/32) || (dst net 86.0.191.216/32) || (dst net 86.0.248.196/32))),
	((dst port 13321) || (dst port 20599) || (dst port 35998) || (dst port 53165) || (dst port 54055)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.53.36/32) || (dst net 87.0.53.96/32) || (dst net 87.0.59.161/32) || (dst net 87.0.165.136/32) || (dst net 87.0.190.6/32))),
	((dst port 27765) || (dst port 33185) || (dst port 39562) || (dst port 41472) || (dst port 58447)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.51.79/32) || (dst net 88.0.56.198/32) || (dst net 88.0.99.4/32) || (dst net 88.0.111.28/32) || (dst net 88.0.160.61/32))),
	((dst port 634) || (dst port 22747) || (dst port 29544) || (dst port 39543) || (dst port 44204)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.36.214/32) || (dst net 89.0.104.34/32) || (dst net 89.0.104.76/32) || (dst net 89.0.105.119/32) || (dst net 89.0.209.247/32))),
	((dst port 15542) || (dst port 17757) || (dst port 55282) || (dst port 60538) || (dst port 61900)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.8.179/32) || (dst net 90.0.74.221/32) || (dst net 90.0.94.117/32) || (dst net 90.0.186.231/32) || (dst net 90.0.254.167/32))),
	((dst port 12320) || (dst port 30997) || (dst port 32272) || (dst port 34141) || (dst port 39671)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.5.207/32) || (dst net 91.0.42.51/32) || (dst net 91.0.96.53/32) || (dst net 91.0.123.27/32) || (dst net 91.0.200.153/32))),
	((dst port 6771) || (dst port 17734) || (dst port 29857) || (dst port 31602) || (dst port 64863)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.27.93/32) || (dst net 92.0.32.158/32) || (dst net 92.0.46.160/32) || (dst net 92.0.121.215/32) || (dst net 92.0.239.232/32))),
	((dst port 27002) || (dst port 39960) || (dst port 40097) || (dst port 47879) || (dst port 65244)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.45.234/32) || (dst net 93.0.52.252/32) || (dst net 93.0.119.178/32) || (dst net 93.0.167.146/32) || (dst net 93.0.244.139/32))),
	((dst port 5277) || (dst port 19442) || (dst port 31382) || (dst port 52336) || (dst port 58974)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.32.75/32) || (dst net 94.0.61.250/32) || (dst net 94.0.63.235/32) || (dst net 94.0.176.252/32) || (dst net 94.0.252.110/32))),
	((dst port 980) || (dst port 31782) || (dst port 32517) || (dst port 36766) || (dst port 63637)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.36.79/32) || (dst net 95.0.95.180/32) || (dst net 95.0.224.2/32) || (dst net 95.0.232.38/32) || (dst net 95.0.236.53/32))),
	((dst port 7100) || (dst port 22724) || (dst port 24743) || (dst port 41564) || (dst port 61039)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.4.97/32) || (dst net 96.0.23.11/32) || (dst net 96.0.187.13/32) || (dst net 96.0.226.85/32) || (dst net 96.0.253.111/32))),
	((dst port 2671) || (dst port 14730) || (dst port 31634) || (dst port 36479) || (dst port 60579)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.68.239/32) || (dst net 97.0.144.140/32) || (dst net 97.0.159.53/32) || (dst net 97.0.161.84/32) || (dst net 97.0.172.123/32))),
	((dst port 26062) || (dst port 42300) || (dst port 46257) || (dst port 46725) || (dst port 64174)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.59.71/32) || (dst net 98.0.128.112/32) || (dst net 98.0.139.150/32) || (dst net 98.0.176.238/32) || (dst net 98.0.222.38/32))),
	((dst port 3240) || (dst port 5307) || (dst port 6635) || (dst port 44246) || (dst port 55109)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.114.206/32) || (dst net 99.0.139.52/32) || (dst net 99.0.152.111/32) || (dst net 99.0.168.20/32) || (dst net 99.0.232.52/32))),
	((dst port 17736) || (dst port 23181) || (dst port 43197) || (dst port 53676) || (dst port 60677)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.65.176/32) || (dst net 100.0.149.174/32) || (dst net 100.0.157.131/32) || (dst net 100.0.182.212/32) || (dst net 100.0.228.148/32))),
	((dst port 3341) || (dst port 19232) || (dst port 19474) || (dst port 31972) || (dst port 52953)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.45.102/32) || (dst net 101.0.120.198/32) || (dst net 101.0.179.30/32) || (dst net 101.0.197.219/32) || (dst net 101.0.255.174/32))),
	((dst port 8462) || (dst port 11306) || (dst port 39153) || (dst port 48657) || (dst port 51283)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.36.213/32) || (dst net 102.0.43.53/32) || (dst net 102.0.153.29/32) || (dst net 102.0.163.229/32) || (dst net 102.0.192.22/32))),
	((dst port 2411) || (dst port 6624) || (dst port 16367) || (dst port 20695) || (dst port 57064)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.37.15/32) || (dst net 103.0.41.126/32) || (dst net 103.0.93.42/32) || (dst net 103.0.93.65/32) || (dst net 103.0.134.39/32))),
	((dst port 650) || (dst port 18480) || (dst port 46527) || (dst port 51316) || (dst port 51863)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.40.141/32) || (dst net 104.0.67.141/32) || (dst net 104.0.78.32/32) || (dst net 104.0.171.56/32) || (dst net 104.0.231.103/32))),
	((dst port 14990) || (dst port 24353) || (dst port 47137) || (dst port 51206)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.1.37/32) || (dst net 105.0.36.254/32) || (dst net 105.0.89.182/32) || (dst net 105.0.194.84/32) || (dst net 105.0.227.196/32))),
	((dst port 344) || (dst port 7939) || (dst port 16027) || (dst port 16253) || (dst port 29635)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.72.45/32) || (dst net 106.0.118.95/32) || (dst net 106.0.123.64/32) || (dst net 106.0.126.223/32) || (dst net 106.0.157.87/32))),
	((dst port 7794) || (dst port 8285) || (dst port 39076) || (dst port 59994) || (dst port 64766)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.73.190/32) || (dst net 107.0.81.240/32) || (dst net 107.0.102.62/32) || (dst net 107.0.111.118/32) || (dst net 107.0.224.240/32))),
	((dst port 8936) || (dst port 31726) || (dst port 43641) || (dst port 43875) || (dst port 55533)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.30.200/32) || (dst net 108.0.67.182/32) || (dst net 108.0.113.179/32) || (dst net 108.0.143.246/32) || (dst net 108.0.161.198/32))),
	((dst port 5200) || (dst port 12271) || (dst port 17944) || (dst port 34549) || (dst port 51828)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.16.39/32) || (dst net 109.0.22.226/32) || (dst net 109.0.128.120/32) || (dst net 109.0.165.88/32) || (dst net 109.0.212.53/32))),
	((dst port 1959) || (dst port 8696) || (dst port 11824) || (dst port 28458) || (dst port 45140)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.0.5/32) || (dst net 110.0.5.64/32) || (dst net 110.0.51.81/32) || (dst net 110.0.113.108/32) || (dst net 110.0.212.34/32))),
	((dst port 11865) || (dst port 23802) || (dst port 26671) || (dst port 56738) || (dst port 61901)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.7.142/32) || (dst net 111.0.13.109/32) || (dst net 111.0.121.146/32) || (dst net 111.0.139.169/32) || (dst net 111.0.225.76/32))),
	((dst port 11919) || (dst port 43942) || (dst port 51998) || (dst port 58073) || (dst port 61842)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.129.101/32) || (dst net 112.0.134.185/32) || (dst net 112.0.176.254/32) || (dst net 112.0.189.230/32) || (dst net 112.0.230.34/32))),
	((dst port 10776) || (dst port 16387) || (dst port 29834) || (dst port 31341) || (dst port 31660)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.153.86/32) || (dst net 113.0.154.27/32) || (dst net 113.0.155.159/32) || (dst net 113.0.198.128/32) || (dst net 113.0.236.153/32))),
	((dst port 4573) || (dst port 4757) || (dst port 19520) || (dst port 53026) || (dst port 63471)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.65.109/32) || (dst net 114.0.134.25/32) || (dst net 114.0.145.237/32) || (dst net 114.0.150.62/32) || (dst net 114.0.223.243/32))),
	((dst port 3153) || (dst port 39860) || (dst port 43348) || (dst port 60991) || (dst port 65237)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.35.103/32) || (dst net 115.0.83.93/32) || (dst net 115.0.104.102/32) || (dst net 115.0.215.20/32) || (dst net 115.0.223.128/32))),
	((dst port 3008) || (dst port 16812) || (dst port 26813) || (dst port 33596) || (dst port 43775)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.191.26/32) || (dst net 116.0.238.137/32) || (dst net 116.0.240.190/32) || (dst net 116.0.241.226/32) || (dst net 116.0.248.204/32))),
	((dst port 29498) || (dst port 34256) || (dst port 38345) || (dst port 50192) || (dst port 57931)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.0.130/32) || (dst net 117.0.96.36/32) || (dst net 117.0.124.211/32) || (dst net 117.0.229.130/32) || (dst net 117.0.229.198/32))),
	((dst port 2794) || (dst port 9348) || (dst port 31096) || (dst port 35940) || (dst port 59973)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.30.98/32) || (dst net 118.0.156.6/32) || (dst net 118.0.183.240/32) || (dst net 118.0.195.239/32) || (dst net 118.0.218.209/32))),
	((dst port 16862) || (dst port 18130) || (dst port 27180) || (dst port 46176) || (dst port 50596)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.59.91/32) || (dst net 119.0.110.137/32) || (dst net 119.0.184.207/32) || (dst net 119.0.228.187/32) || (dst net 119.0.240.39/32))),
	((dst port 11322) || (dst port 12898) || (dst port 33905) || (dst port 56187) || (dst port 60990)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.46.127/32) || (dst net 120.0.74.62/32) || (dst net 120.0.107.49/32) || (dst net 120.0.138.78/32) || (dst net 120.0.202.160/32))),
	((dst port 16734) || (dst port 36033) || (dst port 42813) || (dst port 62119) || (dst port 63049)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.71.116/32) || (dst net 121.0.83.225/32) || (dst net 121.0.178.17/32) || (dst net 121.0.194.230/32) || (dst net 121.0.245.84/32))),
	((dst port 15336) || (dst port 24894) || (dst port 33047) || (dst port 62225) || (dst port 62665)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.18.138/32) || (dst net 122.0.28.163/32) || (dst net 122.0.56.113/32) || (dst net 122.0.112.125/32) || (dst net 122.0.250.243/32))),
	((dst port 16453) || (dst port 18789) || (dst port 28195) || (dst port 37560) || (dst port 42203)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.20.54/32) || (dst net 123.0.28.189/32) || (dst net 123.0.147.40/32) || (dst net 123.0.226.121/32) || (dst net 123.0.250.69/32))),
	((dst port 858) || (dst port 9735) || (dst port 14451) || (dst port 37428) || (dst port 49835)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.48.179/32) || (dst net 124.0.86.91/32) || (dst net 124.0.103.223/32) || (dst net 124.0.123.57/32) || (dst net 124.0.238.103/32))),
	((dst port 8189) || (dst port 28920) || (dst port 30630) || (dst port 58549) || (dst port 59351)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.74.38/32) || (dst net 125.0.161.199/32) || (dst net 125.0.164.238/32) || (dst net 125.0.207.230/32) || (dst net 125.0.224.128/32))),
	((dst port 7991) || (dst port 23796) || (dst port 29230) || (dst port 33259) || (dst port 57194)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.52.131/32) || (dst net 126.0.114.223/32) || (dst net 126.0.134.119/32) || (dst net 126.0.143.32/32) || (dst net 126.0.180.7/32))),
	((dst port 14602) || (dst port 22778) || (dst port 48206) || (dst port 55200) || (dst port 61658)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.40.130/32) || (dst net 127.0.86.143/32) || (dst net 127.0.126.81/32) || (dst net 127.0.158.52/32) || (dst net 127.0.205.200/32))),
	((dst port 39317) || (dst port 43077) || (dst port 52622) || (dst port 54727) || (dst port 60790)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.2.130/32) || (dst net 128.0.119.185/32) || (dst net 128.0.210.36/32) || (dst net 128.0.245.252/32) || (dst net 128.0.253.67/32))),
	((dst port 2178) || (dst port 39530) || (dst port 41090) || (dst port 42847) || (dst port 61746)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.14.234/32) || (dst net 129.0.39.251/32) || (dst net 129.0.74.105/32) || (dst net 129.0.159.17/32) || (dst net 129.0.204.93/32))),
	((dst port 23234) || (dst port 32284) || (dst port 41488) || (dst port 45887) || (dst port 52692)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.68.45/32) || (dst net 130.0.90.133/32) || (dst net 130.0.173.194/32) || (dst net 130.0.220.143/32) || (dst net 130.0.237.185/32))),
	((dst port 3974) || (dst port 27219) || (dst port 27775) || (dst port 37026) || (dst port 38439)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.42.224/32) || (dst net 131.0.53.69/32) || (dst net 131.0.86.57/32) || (dst net 131.0.102.89/32) || (dst net 131.0.240.191/32))),
	((dst port 91) || (dst port 15357) || (dst port 19882) || (dst port 20815) || (dst port 38063)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.48.128/32) || (dst net 132.0.58.80/32) || (dst net 132.0.75.173/32) || (dst net 132.0.95.84/32) || (dst net 132.0.147.162/32))),
	((dst port 14282) || (dst port 24492) || (dst port 41709) || (dst port 45316) || (dst port 62982)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.13.99/32) || (dst net 133.0.45.164/32) || (dst net 133.0.70.216/32) || (dst net 133.0.108.152/32) || (dst net 133.0.202.124/32))),
	((dst port 8317) || (dst port 18901) || (dst port 37583) || (dst port 45100) || (dst port 59059)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.113.230/32) || (dst net 134.0.122.140/32) || (dst net 134.0.126.17/32) || (dst net 134.0.185.156/32) || (dst net 134.0.240.173/32))),
	((dst port 24884) || (dst port 39059) || (dst port 39457) || (dst port 42700) || (dst port 48117)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.18.95/32) || (dst net 135.0.49.2/32) || (dst net 135.0.122.234/32) || (dst net 135.0.183.19/32) || (dst net 135.0.233.195/32))),
	((dst port 9959) || (dst port 12190) || (dst port 32256) || (dst port 46814) || (dst port 48687)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.24.243/32) || (dst net 136.0.51.57/32) || (dst net 136.0.197.51/32) || (dst net 136.0.212.98/32) || (dst net 136.0.241.167/32))),
	((dst port 4845) || (dst port 32817) || (dst port 41536) || (dst port 62141) || (dst port 64627)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.1.153/32) || (dst net 137.0.26.157/32) || (dst net 137.0.64.235/32) || (dst net 137.0.90.66/32) || (dst net 137.0.251.222/32))),
	((dst port 13771) || (dst port 29209) || (dst port 34734) || (dst port 48274) || (dst port 54684)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.28.79/32) || (dst net 138.0.119.108/32) || (dst net 138.0.130.48/32) || (dst net 138.0.220.225/32) || (dst net 138.0.251.159/32))),
	((dst port 6751) || (dst port 14343) || (dst port 24486) || (dst port 30864) || (dst port 31878)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.69.103/32) || (dst net 139.0.142.94/32) || (dst net 139.0.179.17/32) || (dst net 139.0.202.87/32) || (dst net 139.0.204.209/32))),
	((dst port 9026) || (dst port 24894) || (dst port 42092) || (dst port 57264) || (dst port 59189)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.18.179/32) || (dst net 140.0.63.100/32) || (dst net 140.0.142.22/32) || (dst net 140.0.164.101/32) || (dst net 140.0.168.196/32))),
	((dst port 14845) || (dst port 19868) || (dst port 35916) || (dst port 38912) || (dst port 63647)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.65.202/32) || (dst net 141.0.72.34/32) || (dst net 141.0.80.154/32) || (dst net 141.0.146.99/32) || (dst net 141.0.169.122/32))),
	((dst port 18871) || (dst port 38009) || (dst port 42833) || (dst port 51561) || (dst port 54041)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.16.165/32) || (dst net 142.0.34.91/32) || (dst net 142.0.126.201/32) || (dst net 142.0.143.5/32) || (dst net 142.0.172.59/32))),
	((dst port 6276) || (dst port 21422) || (dst port 40032) || (dst port 45713) || (dst port 50520)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.9.69/32) || (dst net 143.0.15.170/32) || (dst net 143.0.95.47/32) || (dst net 143.0.147.223/32) || (dst net 143.0.242.2/32))),
	((dst port 10251) || (dst port 19439) || (dst port 27199) || (dst port 40123) || (dst port 58494)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.68.110/32) || (dst net 144.0.157.191/32) || (dst net 144.0.178.183/32) || (dst net 144.0.231.205/32) || (dst net 144.0.234.130/32))),
	((dst port 5458) || (dst port 21988) || (dst port 39607) || (dst port 50406) || (dst port 60695)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.12.151/32) || (dst net 145.0.15.84/32) || (dst net 145.0.73.185/32) || (dst net 145.0.193.56/32) || (dst net 145.0.198.17/32))),
	((dst port 9884) || (dst port 34155) || (dst port 39199) || (dst port 45703) || (dst port 49724)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.84.242/32) || (dst net 146.0.86.198/32) || (dst net 146.0.157.164/32) || (dst net 146.0.176.250/32) || (dst net 146.0.187.164/32))),
	((dst port 13483) || (dst port 17734) || (dst port 28116) || (dst port 55436) || (dst port 63595)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.100.30/32) || (dst net 147.0.120.184/32) || (dst net 147.0.199.28/32) || (dst net 147.0.214.58/32) || (dst net 147.0.221.209/32))),
	((dst port 13841) || (dst port 15403) || (dst port 20528) || (dst port 22735) || (dst port 33555)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.182.166/32) || (dst net 148.0.184.142/32) || (dst net 148.0.207.117/32) || (dst net 148.0.215.249/32) || (dst net 148.0.239.40/32))),
	((dst port 5801) || (dst port 15309) || (dst port 29953) || (dst port 58565) || (dst port 65262)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.9.255/32) || (dst net 149.0.49.203/32) || (dst net 149.0.75.36/32) || (dst net 149.0.122.149/32) || (dst net 149.0.161.231/32))),
	((dst port 13408) || (dst port 15220) || (dst port 29219) || (dst port 29611) || (dst port 51876)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.104.223/32) || (dst net 150.0.146.54/32) || (dst net 150.0.207.221/32) || (dst net 150.0.240.139/32) || (dst net 150.0.244.7/32))),
	((dst port 275) || (dst port 24178) || (dst port 27131) || (dst port 41014) || (dst port 52348)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.89.213/32) || (dst net 151.0.93.229/32) || (dst net 151.0.131.199/32) || (dst net 151.0.145.184/32) || (dst net 151.0.168.210/32))),
	((dst port 984) || (dst port 41224) || (dst port 42015) || (dst port 48573) || (dst port 64184)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.53.35/32) || (dst net 152.0.108.188/32) || (dst net 152.0.132.2/32) || (dst net 152.0.132.96/32) || (dst net 152.0.135.219/32))),
	((dst port 32685) || (dst port 33264) || (dst port 34972) || (dst port 39171) || (dst port 40770)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.103.204/32) || (dst net 153.0.117.146/32) || (dst net 153.0.119.110/32) || (dst net 153.0.126.99/32) || (dst net 153.0.179.93/32))),
	((dst port 4325) || (dst port 17039) || (dst port 43778) || (dst port 47951) || (dst port 55877)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.161.39/32) || (dst net 154.0.176.39/32) || (dst net 154.0.236.71/32) || (dst net 154.0.240.127/32) || (dst net 154.0.245.216/32))),
	((dst port 10586) || (dst port 35472) || (dst port 36359) || (dst port 38945) || (dst port 56130)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.158.27/32) || (dst net 155.0.174.157/32) || (dst net 155.0.177.13/32) || (dst net 155.0.190.168/32) || (dst net 155.0.211.220/32))),
	((dst port 1077) || (dst port 15300) || (dst port 39487) || (dst port 54299) || (dst port 56236)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.35.75/32) || (dst net 156.0.57.16/32) || (dst net 156.0.75.239/32) || (dst net 156.0.107.21/32) || (dst net 156.0.229.181/32))),
	((dst port 4465) || (dst port 7403) || (dst port 27512) || (dst port 47241) || (dst port 56247)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.80.120/32) || (dst net 157.0.124.87/32) || (dst net 157.0.132.97/32) || (dst net 157.0.191.78/32) || (dst net 157.0.237.44/32))),
	((dst port 8479) || (dst port 26400) || (dst port 26649) || (dst port 28157) || (dst port 53264)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.54.228/32) || (dst net 158.0.112.18/32) || (dst net 158.0.129.158/32) || (dst net 158.0.133.6/32) || (dst net 158.0.169.116/32))),
	((dst port 20005) || (dst port 30363) || (dst port 35018) || (dst port 45275) || (dst port 52352)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.130.235/32) || (dst net 159.0.195.143/32) || (dst net 159.0.201.191/32) || (dst net 159.0.230.98/32) || (dst net 159.0.231.248/32))),
	((dst port 3343) || (dst port 27902) || (dst port 29096) || (dst port 38304) || (dst port 45930)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.75.69/32) || (dst net 160.0.129.127/32) || (dst net 160.0.152.231/32) || (dst net 160.0.188.33/32) || (dst net 160.0.221.46/32))),
	((dst port 8879) || (dst port 8909) || (dst port 42368) || (dst port 49482) || (dst port 51286)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.41.132/32) || (dst net 161.0.126.67/32) || (dst net 161.0.151.207/32) || (dst net 161.0.162.255/32) || (dst net 161.0.176.8/32))),
	((dst port 1471) || (dst port 5743) || (dst port 28884) || (dst port 28899) || (dst port 37210)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.26.80/32) || (dst net 162.0.71.124/32) || (dst net 162.0.127.245/32) || (dst net 162.0.132.244/32) || (dst net 162.0.155.72/32))),
	((dst port 13314) || (dst port 14659) || (dst port 31757) || (dst port 35810) || (dst port 37339)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.61.193/32) || (dst net 163.0.67.212/32) || (dst net 163.0.86.145/32) || (dst net 163.0.115.5/32) || (dst net 163.0.240.145/32))),
	((dst port 5680) || (dst port 9109) || (dst port 49678) || (dst port 50707) || (dst port 57107)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.48.219/32) || (dst net 164.0.57.123/32) || (dst net 164.0.116.32/32) || (dst net 164.0.121.91/32) || (dst net 164.0.228.89/32))),
	((dst port 10340) || (dst port 13740) || (dst port 46083) || (dst port 52903) || (dst port 62325)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.148.240/32) || (dst net 165.0.179.239/32) || (dst net 165.0.183.145/32) || (dst net 165.0.222.246/32) || (dst net 165.0.226.18/32))),
	((dst port 18001) || (dst port 27560) || (dst port 28443) || (dst port 46601) || (dst port 52600)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.91.255/32) || (dst net 166.0.130.140/32) || (dst net 166.0.131.199/32) || (dst net 166.0.184.100/32) || (dst net 166.0.229.91/32))),
	((dst port 31440) || (dst port 46219) || (dst port 53786) || (dst port 62894) || (dst port 64159)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.43.186/32) || (dst net 167.0.45.151/32) || (dst net 167.0.100.249/32) || (dst net 167.0.173.8/32) || (dst net 167.0.178.170/32))),
	((dst port 26545) || (dst port 30012) || (dst port 36309) || (dst port 38709) || (dst port 61879)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.30.183/32) || (dst net 168.0.84.62/32) || (dst net 168.0.149.38/32) || (dst net 168.0.149.227/32) || (dst net 168.0.167.249/32))),
	((dst port 2256) || (dst port 25471) || (dst port 49347) || (dst port 60140) || (dst port 65101)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.53.114/32) || (dst net 169.0.61.87/32) || (dst net 169.0.187.49/32) || (dst net 169.0.205.171/32) || (dst net 169.0.213.168/32))),
	((dst port 6226) || (dst port 10178) || (dst port 10850) || (dst port 32541) || (dst port 47205)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.3.16/32) || (dst net 170.0.46.240/32) || (dst net 170.0.139.247/32) || (dst net 170.0.198.164/32) || (dst net 170.0.251.93/32))),
	((dst port 15705) || (dst port 19454) || (dst port 43012) || (dst port 60021) || (dst port 61228)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.9.138/32) || (dst net 171.0.63.54/32) || (dst net 171.0.108.142/32) || (dst net 171.0.165.47/32) || (dst net 171.0.190.29/32))),
	((dst port 5309) || (dst port 14132) || (dst port 19288) || (dst port 40876) || (dst port 44988)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.18.65/32) || (dst net 172.0.40.32/32) || (dst net 172.0.86.245/32) || (dst net 172.0.118.60/32) || (dst net 172.0.207.169/32))),
	((dst port 531) || (dst port 25410) || (dst port 34736) || (dst port 48207) || (dst port 59656)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.5.237/32) || (dst net 173.0.22.131/32) || (dst net 173.0.39.194/32) || (dst net 173.0.72.133/32) || (dst net 173.0.105.76/32))),
	((dst port 2426) || (dst port 13903) || (dst port 15809) || (dst port 21662) || (dst port 38390)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.57.52/32) || (dst net 174.0.76.251/32) || (dst net 174.0.133.53/32) || (dst net 174.0.141.216/32) || (dst net 174.0.149.181/32))),
	((dst port 5624) || (dst port 29733) || (dst port 32192) || (dst port 39473) || (dst port 60298)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.31.32/32) || (dst net 175.0.34.195/32) || (dst net 175.0.38.61/32) || (dst net 175.0.114.159/32) || (dst net 175.0.133.159/32))),
	((dst port 22868) || (dst port 34255) || (dst port 43519) || (dst port 48113) || (dst port 54137)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.56.28/32) || (dst net 176.0.131.80/32) || (dst net 176.0.136.70/32) || (dst net 176.0.140.222/32) || (dst net 176.0.200.17/32))),
	((dst port 18231) || (dst port 30796) || (dst port 32141) || (dst port 36979) || (dst port 37447)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.74.25/32) || (dst net 177.0.118.25/32) || (dst net 177.0.123.9/32) || (dst net 177.0.124.46/32) || (dst net 177.0.195.61/32))),
	((dst port 9933) || (dst port 27110) || (dst port 39069) || (dst port 41936) || (dst port 45146)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.26.72/32) || (dst net 178.0.54.94/32) || (dst net 178.0.57.148/32) || (dst net 178.0.126.178/32) || (dst net 178.0.136.214/32))),
	((dst port 36127) || (dst port 38431) || (dst port 41133) || (dst port 52888) || (dst port 57828)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.36.8/32) || (dst net 179.0.83.206/32) || (dst net 179.0.178.139/32) || (dst net 179.0.210.59/32) || (dst net 179.0.213.173/32))),
	((dst port 13982) || (dst port 21177) || (dst port 23257) || (dst port 27461) || (dst port 44084)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.8.80/32) || (dst net 180.0.23.249/32) || (dst net 180.0.51.75/32) || (dst net 180.0.139.93/32) || (dst net 180.0.205.178/32))),
	((dst port 8113) || (dst port 10374) || (dst port 27086) || (dst port 32815) || (dst port 54627)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.27.12/32) || (dst net 181.0.49.67/32) || (dst net 181.0.87.149/32) || (dst net 181.0.170.240/32) || (dst net 181.0.229.215/32))),
	((dst port 18816) || (dst port 21131) || (dst port 30804) || (dst port 40906) || (dst port 55951)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.62.134/32) || (dst net 182.0.88.81/32) || (dst net 182.0.125.89/32) || (dst net 182.0.138.248/32) || (dst net 182.0.201.190/32))),
	((dst port 1578) || (dst port 10072) || (dst port 43746) || (dst port 47741) || (dst port 58498)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.21.241/32) || (dst net 183.0.52.18/32) || (dst net 183.0.86.250/32) || (dst net 183.0.157.99/32) || (dst net 183.0.184.127/32))),
	((dst port 30379) || (dst port 32945) || (dst port 39126) || (dst port 46709) || (dst port 50534)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.81.155/32) || (dst net 184.0.137.96/32) || (dst net 184.0.177.226/32) || (dst net 184.0.220.192/32) || (dst net 184.0.248.180/32))),
	((dst port 7976) || (dst port 26680) || (dst port 31233) || (dst port 37477) || (dst port 47259)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.37.140/32) || (dst net 185.0.141.164/32) || (dst net 185.0.189.152/32) || (dst net 185.0.233.94/32) || (dst net 185.0.250.166/32))),
	((dst port 4986) || (dst port 18813) || (dst port 23859) || (dst port 45951) || (dst port 46030)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.19.252/32) || (dst net 186.0.24.227/32) || (dst net 186.0.31.58/32) || (dst net 186.0.107.162/32) || (dst net 186.0.215.142/32))),
	((dst port 3467) || (dst port 13665) || (dst port 28086) || (dst port 38023) || (dst port 65118)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.2.190/32) || (dst net 187.0.7.216/32) || (dst net 187.0.156.212/32) || (dst net 187.0.199.172/32) || (dst net 187.0.226.229/32))),
	((dst port 6652) || (dst port 15182) || (dst port 20948) || (dst port 31228) || (dst port 38577)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.17.164/32) || (dst net 188.0.69.10/32) || (dst net 188.0.90.69/32) || (dst net 188.0.118.233/32) || (dst net 188.0.164.153/32))),
	((dst port 24093) || (dst port 46254) || (dst port 49331) || (dst port 50128) || (dst port 64665)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.0.50/32) || (dst net 189.0.10.26/32) || (dst net 189.0.48.37/32) || (dst net 189.0.188.243/32) || (dst net 189.0.198.54/32))),
	((dst port 3664) || (dst port 8638) || (dst port 19056) || (dst port 51395) || (dst port 58601)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.32.117/32) || (dst net 190.0.74.132/32) || (dst net 190.0.89.242/32) || (dst net 190.0.139.225/32) || (dst net 190.0.251.75/32))),
	((dst port 3980) || (dst port 22796) || (dst port 40401) || (dst port 48046) || (dst port 52800)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.53.106/32) || (dst net 191.0.98.80/32) || (dst net 191.0.117.172/32) || (dst net 191.0.187.23/32) || (dst net 191.0.220.162/32))),
	((dst port 14141) || (dst port 29542) || (dst port 45187) || (dst port 48925) || (dst port 57367)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.24.119/32) || (dst net 192.0.41.215/32) || (dst net 192.0.75.70/32) || (dst net 192.0.189.184/32) || (dst net 192.0.209.141/32))),
	((dst port 10922) || (dst port 11953) || (dst port 23198) || (dst port 28887) || (dst port 35178)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.39.109/32) || (dst net 193.0.51.177/32) || (dst net 193.0.111.100/32) || (dst net 193.0.194.15/32) || (dst net 193.0.226.25/32))),
	((dst port 13514) || (dst port 16626) || (dst port 31527) || (dst port 56063) || (dst port 56832)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.81.205/32) || (dst net 194.0.92.191/32) || (dst net 194.0.140.176/32) || (dst net 194.0.149.127/32) || (dst net 194.0.252.244/32))),
	((dst port 6358) || (dst port 25068) || (dst port 28904) || (dst port 32799) || (dst port 33839)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.16.50/32) || (dst net 195.0.47.64/32) || (dst net 195.0.109.53/32) || (dst net 195.0.140.208/32) || (dst net 195.0.205.93/32))),
	((dst port 7485) || (dst port 27814) || (dst port 37663) || (dst port 38118) || (dst port 61463)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.12.66/32) || (dst net 196.0.139.57/32) || (dst net 196.0.149.240/32) || (dst net 196.0.209.103/32) || (dst net 196.0.215.232/32))),
	((dst port 30703) || (dst port 33405) || (dst port 50856) || (dst port 55885) || (dst port 57787)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.16.230/32) || (dst net 197.0.95.238/32) || (dst net 197.0.103.103/32) || (dst net 197.0.142.226/32) || (dst net 197.0.155.247/32))),
	((dst port 13242) || (dst port 40768) || (dst port 58148) || (dst port 62616) || (dst port 64608)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.12.50/32) || (dst net 198.0.90.199/32) || (dst net 198.0.168.151/32) || (dst net 198.0.184.239/32) || (dst net 198.0.241.248/32))),
	((dst port 5161) || (dst port 9121) || (dst port 37023) || (dst port 41209) || (dst port 50973)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.15.174/32) || (dst net 199.0.100.127/32) || (dst net 199.0.133.140/32) || (dst net 199.0.138.11/32) || (dst net 199.0.218.45/32))),
	((dst port 1989) || (dst port 17972) || (dst port 19932) || (dst port 36108) || (dst port 53060)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.37.203/32) || (dst net 200.0.60.171/32) || (dst net 200.0.68.121/32) || (dst net 200.0.123.136/32) || (dst net 200.0.223.234/32))),
	((dst port 8207) || (dst port 26213) || (dst port 26701) || (dst port 29815) || (dst port 46693)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.27.30/32) || (dst net 201.0.92.236/32) || (dst net 201.0.100.17/32) || (dst net 201.0.157.58/32) || (dst net 201.0.242.179/32))),
	((dst port 2361) || (dst port 11610) || (dst port 30809) || (dst port 34247) || (dst port 46144)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.40.70/32) || (dst net 202.0.48.190/32) || (dst net 202.0.102.41/32) || (dst net 202.0.105.140/32) || (dst net 202.0.238.236/32))),
	((dst port 2689) || (dst port 21423) || (dst port 48341) || (dst port 48440) || (dst port 60849)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.48.66/32) || (dst net 203.0.71.216/32) || (dst net 203.0.175.237/32) || (dst net 203.0.211.14/32) || (dst net 203.0.245.57/32))),
	((dst port 6493) || (dst port 15786) || (dst port 19661) || (dst port 42398) || (dst port 61386)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.3.253/32) || (dst net 204.0.11.50/32) || (dst net 204.0.18.81/32) || (dst net 204.0.171.202/32) || (dst net 204.0.226.234/32))),
	((dst port 6023) || (dst port 16218) || (dst port 23226) || (dst port 45291) || (dst port 59308)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.76.3/32) || (dst net 205.0.107.43/32) || (dst net 205.0.156.235/32) || (dst net 205.0.177.44/32) || (dst net 205.0.245.188/32))),
	((dst port 812) || (dst port 6686) || (dst port 33319) || (dst port 50646) || (dst port 52334)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.75.65/32) || (dst net 206.0.141.55/32) || (dst net 206.0.173.38/32) || (dst net 206.0.214.244/32) || (dst net 206.0.223.68/32))),
	((dst port 5667) || (dst port 25597) || (dst port 32862) || (dst port 54140) || (dst port 61010)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.37.89/32) || (dst net 207.0.50.87/32) || (dst net 207.0.71.103/32) || (dst net 207.0.187.25/32) || (dst net 207.0.233.244/32))),
	((dst port 8148) || (dst port 11255) || (dst port 34003) || (dst port 40504) || (dst port 42568)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.118.186/32) || (dst net 208.0.138.187/32) || (dst net 208.0.139.239/32) || (dst net 208.0.206.9/32) || (dst net 208.0.221.229/32))),
	((dst port 17411) || (dst port 28546) || (dst port 35617) || (dst port 45928) || (dst port 65290)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.53.9/32) || (dst net 209.0.70.199/32) || (dst net 209.0.139.26/32) || (dst net 209.0.149.1/32) || (dst net 209.0.253.15/32))),
	((dst port 14996) || (dst port 34848) || (dst port 43590) || (dst port 44857) || (dst port 52949)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.2.39/32) || (dst net 210.0.84.128/32) || (dst net 210.0.128.132/32) || (dst net 210.0.142.127/32) || (dst net 210.0.245.39/32))),
	((dst port 17300) || (dst port 27316) || (dst port 50280) || (dst port 50803) || (dst port 61243)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.14.42/32) || (dst net 211.0.62.2/32) || (dst net 211.0.184.107/32) || (dst net 211.0.195.164/32) || (dst net 211.0.215.93/32))),
	((dst port 21409) || (dst port 33361) || (dst port 36871) || (dst port 46613) || (dst port 61288)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.13.192/32) || (dst net 212.0.81.36/32) || (dst net 212.0.119.114/32) || (dst net 212.0.208.60/32) || (dst net 212.0.228.90/32))),
	((dst port 6087) || (dst port 16663) || (dst port 17268) || (dst port 18882) || (dst port 22819)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.109.163/32) || (dst net 213.0.133.13/32) || (dst net 213.0.174.145/32) || (dst net 213.0.199.206/32) || (dst net 213.0.215.135/32))),
	((dst port 25016) || (dst port 35740) || (dst port 36523) || (dst port 36642) || (dst port 56555)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.7.155/32) || (dst net 214.0.97.111/32) || (dst net 214.0.101.104/32) || (dst net 214.0.126.227/32) || (dst net 214.0.188.79/32))),
	((dst port 9063) || (dst port 15034) || (dst port 40366) || (dst port 54216) || (dst port 54264)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.25.113/32) || (dst net 215.0.78.144/32) || (dst net 215.0.117.144/32) || (dst net 215.0.132.145/32) || (dst net 215.0.170.222/32))),
	((dst port 21428) || (dst port 22612) || (dst port 46365) || (dst port 51565) || (dst port 58408)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.49.212/32) || (dst net 216.0.84.133/32) || (dst net 216.0.142.233/32) || (dst net 216.0.172.201/32) || (dst net 216.0.204.20/32))),
	((dst port 4733) || (dst port 27271) || (dst port 40442) || (dst port 48065) || (dst port 59406)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.71.182/32) || (dst net 217.0.90.80/32) || (dst net 217.0.217.73/32) || (dst net 217.0.226.227/32) || (dst net 217.0.242.29/32))),
	((dst port 18553) || (dst port 21226) || (dst port 35419) || (dst port 58871) || (dst port 64248)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.36.216/32) || (dst net 218.0.208.123/32) || (dst net 218.0.229.187/32) || (dst net 218.0.235.206/32) || (dst net 218.0.254.236/32))),
	((dst port 17172) || (dst port 25750) || (dst port 36069) || (dst port 38991) || (dst port 63964)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.34.40/32) || (dst net 219.0.70.121/32) || (dst net 219.0.107.240/32) || (dst net 219.0.167.173/32) || (dst net 219.0.192.96/32))),
	((dst port 46312) || (dst port 48379) || (dst port 49818) || (dst port 56494) || (dst port 57524)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.54.108/32) || (dst net 220.0.78.246/32) || (dst net 220.0.189.231/32) || (dst net 220.0.208.222/32) || (dst net 220.0.219.20/32))),
	((dst port 3745) || (dst port 9984) || (dst port 28694) || (dst port 37313) || (dst port 55661)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.2.132/32) || (dst net 221.0.19.199/32) || (dst net 221.0.51.11/32) || (dst net 221.0.79.178/32) || (dst net 221.0.157.50/32))),
	((dst port 12633) || (dst port 24051) || (dst port 37404) || (dst port 51350) || (dst port 57587)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.27.65/32) || (dst net 222.0.56.3/32) || (dst net 222.0.104.20/32) || (dst net 222.0.125.151/32) || (dst net 222.0.224.228/32))),
	((dst port 994) || (dst port 4276) || (dst port 12669) || (dst port 14400) || (dst port 39997)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.34.186/32) || (dst net 223.0.75.95/32) || (dst net 223.0.153.215/32) || (dst net 223.0.202.210/32) || (dst net 223.0.223.99/32))),
	((dst port 1830) || (dst port 12771) || (dst port 13520) || (dst port 16674) || (dst port 34101)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.18.52/32) || (dst net 224.0.39.14/32) || (dst net 224.0.49.163/32) || (dst net 224.0.195.121/32) || (dst net 224.0.253.161/32))),
	((dst port 24018) || (dst port 24081) || (dst port 38528) || (dst port 40454) || (dst port 43235)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.9.187/32) || (dst net 225.0.69.136/32) || (dst net 225.0.158.255/32) || (dst net 225.0.206.39/32) || (dst net 225.0.234.149/32))),
	((dst port 17320) || (dst port 23901) || (dst port 29168) || (dst port 41659) || (dst port 48875)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.116.68/32) || (dst net 226.0.127.144/32) || (dst net 226.0.139.235/32) || (dst net 226.0.207.42/32) || (dst net 226.0.248.180/32))),
	((dst port 968) || (dst port 13444) || (dst port 28315) || (dst port 28321) || (dst port 63058)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.42.114/32) || (dst net 227.0.62.178/32) || (dst net 227.0.113.220/32) || (dst net 227.0.142.234/32) || (dst net 227.0.236.139/32))),
	((dst port 17738) || (dst port 28402) || (dst port 50848) || (dst port 56441) || (dst port 60801)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.128.240/32) || (dst net 228.0.195.171/32) || (dst net 228.0.199.97/32) || (dst net 228.0.216.126/32) || (dst net 228.0.230.121/32))),
	((dst port 8216) || (dst port 8540) || (dst port 27061) || (dst port 52655) || (dst port 57006)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.2.21/32) || (dst net 229.0.35.214/32) || (dst net 229.0.87.95/32) || (dst net 229.0.192.134/32) || (dst net 229.0.212.198/32))),
	((dst port 16727) || (dst port 17291) || (dst port 39728) || (dst port 44919) || (dst port 64222)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.76.13/32) || (dst net 230.0.200.218/32) || (dst net 230.0.215.43/32) || (dst net 230.0.236.161/32) || (dst net 230.0.237.217/32))),
	((dst port 10349) || (dst port 39460) || (dst port 39832) || (dst port 63493) || (dst port 65123)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.45.89/32) || (dst net 231.0.60.43/32) || (dst net 231.0.109.180/32) || (dst net 231.0.117.83/32) || (dst net 231.0.160.219/32))),
	((dst port 5663) || (dst port 26830) || (dst port 28116) || (dst port 34732) || (dst port 62886)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.37.162/32) || (dst net 232.0.70.99/32) || (dst net 232.0.89.32/32) || (dst net 232.0.138.224/32) || (dst net 232.0.214.234/32))),
	((dst port 1423) || (dst port 27599) || (dst port 45854) || (dst port 57501) || (dst port 64706)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.70.94/32) || (dst net 233.0.79.97/32) || (dst net 233.0.159.11/32) || (dst net 233.0.188.201/32) || (dst net 233.0.246.142/32))),
	((dst port 13567) || (dst port 17995) || (dst port 24246) || (dst port 48003) || (dst port 65377)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.50.193/32) || (dst net 234.0.54.107/32) || (dst net 234.0.58.204/32) || (dst net 234.0.190.220/32) || (dst net 234.0.201.27/32))),
	((dst port 11214) || (dst port 13302) || (dst port 27355) || (dst port 42477) || (dst port 55667)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.7.218/32) || (dst net 235.0.38.26/32) || (dst net 235.0.100.12/32) || (dst net 235.0.153.97/32) || (dst net 235.0.160.24/32))),
	((dst port 22898) || (dst port 24011) || (dst port 30579) || (dst port 30643) || (dst port 37253)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.60.171/32) || (dst net 236.0.74.125/32) || (dst net 236.0.122.222/32) || (dst net 236.0.203.204/32) || (dst net 236.0.242.79/32))),
	((dst port 15155) || (dst port 25527) || (dst port 33586) || (dst port 41447) || (dst port 62111)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.39.16/32) || (dst net 237.0.75.169/32) || (dst net 237.0.93.14/32) || (dst net 237.0.180.255/32) || (dst net 237.0.229.1/32))),
	((dst port 13318) || (dst port 21894) || (dst port 23967) || (dst port 32427) || (dst port 54749)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.19.224/32) || (dst net 238.0.139.232/32) || (dst net 238.0.149.193/32) || (dst net 238.0.172.45/32) || (dst net 238.0.223.61/32))),
	((dst port 3430) || (dst port 12003) || (dst port 22432) || (dst port 46328) || (dst port 55400)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.81.108/32) || (dst net 239.0.122.223/32) || (dst net 239.0.178.183/32) || (dst net 239.0.196.251/32) || (dst net 239.0.208.11/32))),
	((dst port 15661) || (dst port 17416) || (dst port 18299) || (dst port 41385) || (dst port 52177)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.20.96/32) || (dst net 240.0.174.57/32) || (dst net 240.0.193.90/32) || (dst net 240.0.201.245/32) || (dst net 240.0.216.107/32))),
	((dst port 4619) || (dst port 6740) || (dst port 39817) || (dst port 41277) || (dst port 57645)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.155.112/32) || (dst net 241.0.158.187/32) || (dst net 241.0.191.87/32) || (dst net 241.0.217.108/32) || (dst net 241.0.253.117/32))),
	((dst port 37667) || (dst port 51872) || (dst port 56994) || (dst port 59871) || (dst port 65438)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.136.16/32) || (dst net 242.0.147.137/32) || (dst net 242.0.183.171/32) || (dst net 242.0.233.253/32) || (dst net 242.0.234.139/32))),
	((dst port 13870) || (dst port 14643) || (dst port 35504) || (dst port 59194) || (dst port 62560)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.94.130/32) || (dst net 243.0.111.156/32) || (dst net 243.0.185.2/32) || (dst net 243.0.205.72/32) || (dst net 243.0.244.121/32))),
	((dst port 11265) || (dst port 34499) || (dst port 60739) || (dst port 63077) || (dst port 65206)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.14.177/32) || (dst net 244.0.124.119/32) || (dst net 244.0.133.124/32) || (dst net 244.0.203.105/32) || (dst net 244.0.246.194/32))),
	((dst port 23222) || (dst port 29451) || (dst port 37960) || (dst port 43091) || (dst port 59338)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.49.205/32) || (dst net 245.0.61.24/32) || (dst net 245.0.134.93/32) || (dst net 245.0.224.209/32) || (dst net 245.0.236.60/32))),
	((dst port 3097) || (dst port 17985) || (dst port 27441) || (dst port 34861) || (dst port 47754)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.37.53/32) || (dst net 246.0.58.19/32) || (dst net 246.0.139.95/32) || (dst net 246.0.178.18/32) || (dst net 246.0.245.50/32))),
	((dst port 15888) || (dst port 35104) || (dst port 35446) || (dst port 44292) || (dst port 60042)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.68.47/32) || (dst net 247.0.102.6/32) || (dst net 247.0.104.203/32) || (dst net 247.0.114.250/32) || (dst net 247.0.234.133/32))),
	((dst port 8529) || (dst port 10603) || (dst port 28826) || (dst port 30309) || (dst port 51699)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.1.131/32) || (dst net 248.0.111.158/32) || (dst net 248.0.132.249/32) || (dst net 248.0.197.9/32) || (dst net 248.0.226.195/32))),
	((dst port 14421) || (dst port 25291) || (dst port 29682) || (dst port 55621) || (dst port 62954)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.59.145/32) || (dst net 249.0.77.156/32) || (dst net 249.0.94.49/32) || (dst net 249.0.167.138/32) || (dst net 249.0.217.168/32))),
	((dst port 17658) || (dst port 29237) || (dst port 58465) || (dst port 59657) || (dst port 59970)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.13.163/32) || (dst net 250.0.26.165/32) || (dst net 250.0.46.234/32) || (dst net 250.0.66.133/32) || (dst net 250.0.91.186/32))),
	((dst port 11111) || (dst port 28185) || (dst port 36015) || (dst port 62933) || (dst port 64789)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.39.124/32) || (dst net 251.0.48.47/32) || (dst net 251.0.85.19/32) || (dst net 251.0.91.229/32) || (dst net 251.0.238.134/32))),
	((dst port 3355) || (dst port 14553) || (dst port 24918) || (dst port 26461) || (dst port 54952)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.12.155/32) || (dst net 252.0.80.166/32) || (dst net 252.0.159.161/32) || (dst net 252.0.176.41/32) || (dst net 252.0.254.82/32))),
	((dst port 5509) || (dst port 27855) || (dst port 33215) || (dst port 56050) || (dst port 61392)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.6.33/32) || (dst net 253.0.7.154/32) || (dst net 253.0.56.158/32) || (dst net 253.0.74.104/32) || (dst net 253.0.153.81/32))),
	((dst port 6220) || (dst port 34033) || (dst port 39324) || (dst port 48678) || (dst port 57540)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.81.242/32) || (dst net 254.0.97.217/32) || (dst net 254.0.215.100/32) || (dst net 254.0.220.215/32) || (dst net 254.0.250.26/32))),
	((dst port 10839) || (dst port 27625) || (dst port 31494) || (dst port 50395) || (dst port 51930)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.77.38/32) || (dst net 255.0.222.178/32) || (dst net 255.0.238.175/32) || (dst net 255.0.239.76/32) || (dst net 255.0.249.206/32))),
	((dst port 24172) || (dst port 45601) || (dst port 51435) || (dst port 53242) || (dst port 62277)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.68.134/32) || (dst net 0.0.70.139/32) || (dst net 0.0.103.8/32) || (dst net 0.0.192.243/32) || (dst net 0.0.204.120/32))),
	((dst port 17211) || (dst port 28016) || (dst port 50302) || (dst port 56004) || (dst port 57779)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.18.123/32) || (dst net 1.0.37.147/32) || (dst net 1.0.52.145/32) || (dst net 1.0.129.48/32) || (dst net 1.0.243.4/32))),
	((dst port 10110) || (dst port 19485) || (dst port 44335) || (dst port 50054) || (dst port 56745)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.33.168/32) || (dst net 2.0.80.224/32) || (dst net 2.0.164.253/32) || (dst net 2.0.194.23/32) || (dst net 2.0.199.40/32))),
	((dst port 8807) || (dst port 15971) || (dst port 26369) || (dst port 26832) || (dst port 56332)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.138.152/32) || (dst net 3.0.174.208/32) || (dst net 3.0.192.96/32) || (dst net 3.0.200.27/32) || (dst net 3.0.220.201/32))),
	((dst port 9465) || (dst port 10607) || (dst port 17738) || (dst port 46599) || (dst port 60557)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.61.181/32) || (dst net 4.0.72.128/32) || (dst net 4.0.102.103/32) || (dst net 4.0.193.37/32) || (dst net 4.0.226.75/32))),
	((dst port 18587) || (dst port 37188) || (dst port 48293) || (dst port 51194) || (dst port 56155)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.8.123/32) || (dst net 5.0.15.169/32) || (dst net 5.0.27.173/32) || (dst net 5.0.68.178/32) || (dst net 5.0.251.253/32))),
	((dst port 30391) || (dst port 53866) || (dst port 54884) || (dst port 61033) || (dst port 63192)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.146.85/32) || (dst net 6.0.160.5/32) || (dst net 6.0.220.159/32) || (dst net 6.0.224.54/32) || (dst net 6.0.234.14/32))),
	((dst port 6901) || (dst port 10336) || (dst port 41196) || (dst port 53621) || (dst port 54871)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.5.215/32) || (dst net 7.0.147.184/32) || (dst net 7.0.181.203/32) || (dst net 7.0.205.213/32) || (dst net 7.0.247.8/32))),
	((dst port 11529) || (dst port 34292) || (dst port 47221) || (dst port 51814) || (dst port 61180)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.64.131/32) || (dst net 8.0.81.172/32) || (dst net 8.0.203.104/32) || (dst net 8.0.207.10/32) || (dst net 8.0.230.36/32))),
	((dst port 18282) || (dst port 30552) || (dst port 31302) || (dst port 35762) || (dst port 58758)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.99.189/32) || (dst net 9.0.120.165/32) || (dst net 9.0.166.81/32) || (dst net 9.0.224.112/32) || (dst net 9.0.242.99/32))),
	((dst port 10594) || (dst port 19957) || (dst port 27639) || (dst port 54601) || (dst port 62585)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.11.181/32) || (dst net 10.0.20.39/32) || (dst net 10.0.44.99/32) || (dst net 10.0.172.206/32) || (dst net 10.0.203.24/32))),
	((dst port 9139) || (dst port 27765) || (dst port 32988) || (dst port 54070) || (dst port 59398)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.165.150/32) || (dst net 11.0.177.243/32) || (dst net 11.0.196.47/32) || (dst net 11.0.202.71/32) || (dst net 11.0.221.140/32))),
	((dst port 723) || (dst port 6741) || (dst port 27754) || (dst port 31537) || (dst port 59907)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.70.75/32) || (dst net 12.0.95.95/32) || (dst net 12.0.149.148/32) || (dst net 12.0.223.249/32) || (dst net 12.0.240.208/32))),
	((dst port 13841) || (dst port 34199) || (dst port 36425) || (dst port 40919) || (dst port 64639)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.2.177/32) || (dst net 13.0.44.60/32) || (dst net 13.0.156.161/32) || (dst net 13.0.227.115/32) || (dst net 13.0.234.120/32))),
	((dst port 3293) || (dst port 24253) || (dst port 36154) || (dst port 37774) || (dst port 43242)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.50.4/32) || (dst net 14.0.77.17/32) || (dst net 14.0.81.21/32) || (dst net 14.0.125.123/32) || (dst net 14.0.220.231/32))),
	((dst port 1494) || (dst port 15541) || (dst port 32665) || (dst port 34535) || (dst port 61435)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.70.222/32) || (dst net 15.0.130.163/32) || (dst net 15.0.135.186/32) || (dst net 15.0.156.248/32) || (dst net 15.0.158.100/32))),
	((dst port 8275) || (dst port 22631) || (dst port 28150) || (dst port 43850) || (dst port 54614)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.48.71/32) || (dst net 16.0.53.42/32) || (dst net 16.0.80.205/32) || (dst net 16.0.122.65/32) || (dst net 16.0.164.224/32))),
	((dst port 12169) || (dst port 22822) || (dst port 29980) || (dst port 47536) || (dst port 48416)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.49.221/32) || (dst net 17.0.110.178/32) || (dst net 17.0.141.12/32) || (dst net 17.0.185.62/32) || (dst net 17.0.245.191/32))),
	((dst port 5414) || (dst port 5801) || (dst port 9370) || (dst port 52354) || (dst port 58371)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.87.168/32) || (dst net 18.0.153.9/32) || (dst net 18.0.222.177/32) || (dst net 18.0.230.254/32) || (dst net 18.0.255.52/32))),
	((dst port 38865) || (dst port 56079) || (dst port 56185) || (dst port 64465) || (dst port 65046)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.5.84/32) || (dst net 19.0.133.177/32) || (dst net 19.0.148.205/32) || (dst net 19.0.189.193/32) || (dst net 19.0.247.187/32))),
	((dst port 3564) || (dst port 5293) || (dst port 22214) || (dst port 37459) || (dst port 51253)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.64.183/32) || (dst net 20.0.75.57/32) || (dst net 20.0.114.253/32) || (dst net 20.0.119.100/32) || (dst net 20.0.152.52/32))),
	((dst port 6966) || (dst port 35740) || (dst port 40464) || (dst port 64052) || (dst port 64877)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.130.164/32) || (dst net 21.0.145.239/32) || (dst net 21.0.174.139/32) || (dst net 21.0.207.69/32) || (dst net 21.0.229.49/32))),
	((dst port 8804) || (dst port 15436) || (dst port 40006) || (dst port 57662) || (dst port 60980)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.76.195/32) || (dst net 22.0.125.210/32) || (dst net 22.0.129.49/32) || (dst net 22.0.162.173/32) || (dst net 22.0.199.154/32))),
	((dst port 24549) || (dst port 39824) || (dst port 43653) || (dst port 48242) || (dst port 49708)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.35.224/32) || (dst net 23.0.61.109/32) || (dst net 23.0.112.63/32) || (dst net 23.0.162.171/32) || (dst net 23.0.255.86/32))),
	((dst port 22322) || (dst port 31909) || (dst port 47890) || (dst port 59153) || (dst port 62351)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.111.254/32) || (dst net 24.0.116.199/32) || (dst net 24.0.120.104/32) || (dst net 24.0.128.125/32) || (dst net 24.0.163.118/32))),
	((dst port 3966) || (dst port 17577) || (dst port 18518) || (dst port 38570) || (dst port 53333)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.1.120/32) || (dst net 25.0.109.135/32) || (dst net 25.0.123.31/32) || (dst net 25.0.192.7/32) || (dst net 25.0.251.219/32))),
	((dst port 13464) || (dst port 22594) || (dst port 26604) || (dst port 29769) || (dst port 64100)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.46.39/32) || (dst net 26.0.74.20/32) || (dst net 26.0.75.135/32) || (dst net 26.0.128.254/32) || (dst net 26.0.249.24/32))),
	((dst port 1191) || (dst port 1688) || (dst port 2189) || (dst port 25877) || (dst port 41548)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.47.113/32) || (dst net 27.0.112.207/32) || (dst net 27.0.131.98/32) || (dst net 27.0.187.21/32) || (dst net 27.0.236.53/32))),
	((dst port 6538) || (dst port 8036) || (dst port 43717) || (dst port 47682) || (dst port 54877)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.65.224/32) || (dst net 28.0.186.62/32) || (dst net 28.0.187.90/32) || (dst net 28.0.226.104/32) || (dst net 28.0.247.168/32))),
	((dst port 1833) || (dst port 8326) || (dst port 22545) || (dst port 33656) || (dst port 55120)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.38.15/32) || (dst net 29.0.46.167/32) || (dst net 29.0.154.166/32) || (dst net 29.0.240.171/32) || (dst net 29.0.250.126/32))),
	((dst port 4393) || (dst port 14060) || (dst port 42317) || (dst port 42609) || (dst port 57669)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.0.252/32) || (dst net 30.0.25.29/32) || (dst net 30.0.92.53/32) || (dst net 30.0.156.60/32) || (dst net 30.0.198.111/32))),
	((dst port 538) || (dst port 6125) || (dst port 30392) || (dst port 58474) || (dst port 60175)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.36.187/32) || (dst net 31.0.67.24/32) || (dst net 31.0.122.108/32) || (dst net 31.0.151.217/32) || (dst net 31.0.234.172/32))),
	((dst port 6328) || (dst port 25207) || (dst port 29118) || (dst port 43217) || (dst port 58672)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.4.119/32) || (dst net 32.0.27.161/32) || (dst net 32.0.81.42/32) || (dst net 32.0.136.199/32) || (dst net 32.0.137.177/32))),
	((dst port 14274) || (dst port 17788) || (dst port 47472) || (dst port 54502) || (dst port 65035)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.32.192/32) || (dst net 33.0.56.38/32) || (dst net 33.0.68.173/32) || (dst net 33.0.77.222/32) || (dst net 33.0.185.112/32))),
	((dst port 1242) || (dst port 16852) || (dst port 22184) || (dst port 38675) || (dst port 40001)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.41.182/32) || (dst net 34.0.99.219/32) || (dst net 34.0.150.14/32) || (dst net 34.0.173.208/32) || (dst net 34.0.228.83/32))),
	((dst port 5383) || (dst port 13266) || (dst port 21170) || (dst port 32781) || (dst port 40236)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.183.132/32) || (dst net 35.0.193.121/32) || (dst net 35.0.199.207/32) || (dst net 35.0.221.50/32) || (dst net 35.0.228.241/32))),
	((dst port 660) || (dst port 9477) || (dst port 15119) || (dst port 18577) || (dst port 27362)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.48.30/32) || (dst net 36.0.54.96/32) || (dst net 36.0.60.219/32) || (dst net 36.0.180.113/32) || (dst net 36.0.202.7/32))),
	((dst port 9120) || (dst port 25884) || (dst port 49574) || (dst port 54617) || (dst port 55675)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.5.28/32) || (dst net 37.0.19.181/32) || (dst net 37.0.57.119/32) || (dst net 37.0.155.215/32) || (dst net 37.0.163.123/32))),
	((dst port 28379) || (dst port 40413) || (dst port 51741) || (dst port 57834) || (dst port 59683)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.4.150/32) || (dst net 38.0.68.45/32) || (dst net 38.0.198.98/32) || (dst net 38.0.224.27/32) || (dst net 38.0.254.213/32))),
	((dst port 16303) || (dst port 57450) || (dst port 60355) || (dst port 61974) || (dst port 62512)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.2.217/32) || (dst net 39.0.13.124/32) || (dst net 39.0.97.122/32) || (dst net 39.0.136.83/32) || (dst net 39.0.220.198/32))),
	((dst port 28433) || (dst port 44552) || (dst port 44963) || (dst port 45714) || (dst port 53998)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.18.36/32) || (dst net 40.0.120.81/32) || (dst net 40.0.131.161/32) || (dst net 40.0.144.116/32) || (dst net 40.0.249.29/32))),
	((dst port 9037) || (dst port 14383) || (dst port 29476) || (dst port 33877) || (dst port 58889)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.19.37/32) || (dst net 41.0.74.16/32) || (dst net 41.0.80.134/32) || (dst net 41.0.92.227/32) || (dst net 41.0.216.233/32))),
	((dst port 12660) || (dst port 16232) || (dst port 23077) || (dst port 28833) || (dst port 44541)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.11.136/32) || (dst net 42.0.47.218/32) || (dst net 42.0.87.107/32) || (dst net 42.0.152.191/32) || (dst net 42.0.168.12/32))),
	((dst port 1028) || (dst port 5372) || (dst port 31809) || (dst port 48088) || (dst port 57608)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.21.169/32) || (dst net 43.0.107.75/32) || (dst net 43.0.204.207/32) || (dst net 43.0.212.29/32) || (dst net 43.0.227.142/32))),
	((dst port 361) || (dst port 43071) || (dst port 50646) || (dst port 52958) || (dst port 60093)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.46.90/32) || (dst net 44.0.48.72/32) || (dst net 44.0.52.101/32) || (dst net 44.0.121.208/32) || (dst net 44.0.200.78/32))),
	((dst port 6816) || (dst port 26418) || (dst port 52137) || (dst port 64202) || (dst port 64550)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.141.196/32) || (dst net 45.0.148.38/32) || (dst net 45.0.156.137/32) || (dst net 45.0.187.70/32) || (dst net 45.0.254.17/32))),
	((dst port 13210) || (dst port 23438) || (dst port 41103) || (dst port 50104) || (dst port 57027)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.39.44/32) || (dst net 46.0.114.191/32) || (dst net 46.0.173.128/32) || (dst net 46.0.207.227/32) || (dst net 46.0.219.121/32))),
	((dst port 24344) || (dst port 39468) || (dst port 42579) || (dst port 59379) || (dst port 64589)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.109.46/32) || (dst net 47.0.144.230/32) || (dst net 47.0.153.52/32) || (dst net 47.0.186.118/32) || (dst net 47.0.209.111/32))),
	((dst port 3844) || (dst port 26862) || (dst port 33944) || (dst port 44252) || (dst port 52406)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.35.183/32) || (dst net 48.0.73.128/32) || (dst net 48.0.80.105/32) || (dst net 48.0.220.71/32) || (dst net 48.0.251.241/32))),
	((dst port 1198) || (dst port 7708) || (dst port 25607) || (dst port 43147) || (dst port 46187)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.6.18/32) || (dst net 49.0.20.82/32) || (dst net 49.0.42.25/32) || (dst net 49.0.164.56/32) || (dst net 49.0.186.66/32))),
	((dst port 2889) || (dst port 8700) || (dst port 17892) || (dst port 24414) || (dst port 58675)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.12.204/32) || (dst net 50.0.15.254/32) || (dst net 50.0.63.182/32) || (dst net 50.0.116.29/32) || (dst net 50.0.172.53/32))),
	((dst port 11712) || (dst port 24168) || (dst port 32771) || (dst port 34260) || (dst port 63659)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.5.113/32) || (dst net 51.0.43.123/32) || (dst net 51.0.64.126/32) || (dst net 51.0.88.219/32) || (dst net 51.0.147.49/32))),
	((dst port 7255) || (dst port 32238) || (dst port 35081) || (dst port 35881) || (dst port 47862)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.64.8/32) || (dst net 52.0.108.137/32) || (dst net 52.0.124.217/32) || (dst net 52.0.187.143/32) || (dst net 52.0.215.91/32))),
	((dst port 6058) || (dst port 27397) || (dst port 38815) || (dst port 50661) || (dst port 55638)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.23.46/32) || (dst net 53.0.93.153/32) || (dst net 53.0.184.65/32) || (dst net 53.0.233.2/32) || (dst net 53.0.255.57/32))),
	((dst port 3593) || (dst port 6484) || (dst port 12786) || (dst port 42361) || (dst port 64068)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.4.13/32) || (dst net 54.0.6.237/32) || (dst net 54.0.45.235/32) || (dst net 54.0.172.24/32) || (dst net 54.0.189.199/32))),
	((dst port 16521) || (dst port 25867) || (dst port 54768) || (dst port 55851) || (dst port 63656)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.34.222/32) || (dst net 55.0.59.161/32) || (dst net 55.0.99.155/32) || (dst net 55.0.193.243/32) || (dst net 55.0.203.170/32))),
	((dst port 3843) || (dst port 20341) || (dst port 20664) || (dst port 41782) || (dst port 60149)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.132.62/32) || (dst net 56.0.139.112/32) || (dst net 56.0.173.184/32) || (dst net 56.0.190.155/32) || (dst net 56.0.219.43/32))),
	((dst port 31307) || (dst port 39141) || (dst port 43829) || (dst port 45625) || (dst port 63473)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.7.220/32) || (dst net 57.0.51.182/32) || (dst net 57.0.150.114/32) || (dst net 57.0.163.127/32) || (dst net 57.0.251.48/32))),
	((dst port 3714) || (dst port 11289) || (dst port 13466) || (dst port 32713) || (dst port 37331)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.102.234/32) || (dst net 58.0.103.182/32) || (dst net 58.0.150.243/32) || (dst net 58.0.152.232/32) || (dst net 58.0.175.76/32))),
	((dst port 1533) || (dst port 15085) || (dst port 36372) || (dst port 45086) || (dst port 49026)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.78.224/32) || (dst net 59.0.101.200/32) || (dst net 59.0.117.120/32) || (dst net 59.0.192.138/32) || (dst net 59.0.249.100/32))),
	((dst port 23075) || (dst port 27962) || (dst port 47044) || (dst port 50887) || (dst port 57827)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.23.89/32) || (dst net 60.0.66.12/32) || (dst net 60.0.83.77/32) || (dst net 60.0.209.235/32) || (dst net 60.0.252.173/32))),
	((dst port 14992) || (dst port 34614) || (dst port 43756) || (dst port 45906) || (dst port 50425)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.84.25/32) || (dst net 61.0.170.91/32) || (dst net 61.0.185.50/32) || (dst net 61.0.217.185/32) || (dst net 61.0.241.164/32))),
	((dst port 18915) || (dst port 29175) || (dst port 45860) || (dst port 53271) || (dst port 56545)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.44.91/32) || (dst net 62.0.48.231/32) || (dst net 62.0.134.159/32) || (dst net 62.0.193.233/32) || (dst net 62.0.240.41/32))),
	((dst port 8316) || (dst port 47014) || (dst port 47117) || (dst port 47678) || (dst port 60391)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.1.121/32) || (dst net 63.0.24.161/32) || (dst net 63.0.30.147/32) || (dst net 63.0.106.242/32) || (dst net 63.0.190.52/32))),
	((dst port 8620) || (dst port 12280) || (dst port 17938) || (dst port 23284) || (dst port 44849)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.47.88/32) || (dst net 64.0.57.178/32) || (dst net 64.0.98.56/32) || (dst net 64.0.108.58/32) || (dst net 64.0.232.247/32))),
	((dst port 2040) || (dst port 15989) || (dst port 17774) || (dst port 18189) || (dst port 33667)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.34.196/32) || (dst net 65.0.60.47/32) || (dst net 65.0.74.206/32) || (dst net 65.0.139.69/32) || (dst net 65.0.158.25/32))),
	((dst port 14809) || (dst port 35666) || (dst port 42675) || (dst port 62557) || (dst port 62881)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.7.45/32) || (dst net 66.0.115.186/32) || (dst net 66.0.174.119/32) || (dst net 66.0.181.174/32) || (dst net 66.0.203.202/32))),
	((dst port 1275) || (dst port 26489) || (dst port 30226) || (dst port 58442) || (dst port 63614)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.9.47/32) || (dst net 67.0.10.177/32) || (dst net 67.0.12.210/32) || (dst net 67.0.125.201/32) || (dst net 67.0.233.223/32))),
	((dst port 36150) || (dst port 48173) || (dst port 55266) || (dst port 56989) || (dst port 61574)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.17.164/32) || (dst net 68.0.34.138/32) || (dst net 68.0.134.255/32) || (dst net 68.0.147.161/32) || (dst net 68.0.181.190/32))),
	((dst port 5181) || (dst port 12899) || (dst port 26778) || (dst port 50453) || (dst port 63921)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.64.129/32) || (dst net 69.0.66.215/32) || (dst net 69.0.98.29/32) || (dst net 69.0.170.252/32) || (dst net 69.0.239.52/32))),
	((dst port 6865) || (dst port 12806) || (dst port 48922) || (dst port 55089) || (dst port 61945)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.132.63/32) || (dst net 70.0.146.93/32) || (dst net 70.0.151.5/32) || (dst net 70.0.169.14/32) || (dst net 70.0.242.145/32))),
	((dst port 11124) || (dst port 13873) || (dst port 22123) || (dst port 49239) || (dst port 50416)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.15.156/32) || (dst net 71.0.29.160/32) || (dst net 71.0.113.240/32) || (dst net 71.0.161.9/32) || (dst net 71.0.234.157/32))),
	((dst port 5486) || (dst port 16848) || (dst port 42951) || (dst port 47019) || (dst port 57185)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.37.82/32) || (dst net 72.0.84.58/32) || (dst net 72.0.87.139/32) || (dst net 72.0.136.2/32) || (dst net 72.0.136.15/32))),
	((dst port 5188) || (dst port 11160) || (dst port 13291) || (dst port 36799) || (dst port 42288)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.92.113/32) || (dst net 73.0.121.56/32) || (dst net 73.0.156.15/32) || (dst net 73.0.221.253/32) || (dst net 73.0.252.107/32))),
	((dst port 3926) || (dst port 29475) || (dst port 30747) || (dst port 50988) || (dst port 56684)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.36.4/32) || (dst net 74.0.118.95/32) || (dst net 74.0.124.202/32) || (dst net 74.0.215.35/32) || (dst net 74.0.229.48/32))),
	((dst port 1670) || (dst port 5514) || (dst port 5888) || (dst port 31323) || (dst port 47230)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.130.187/32) || (dst net 75.0.138.144/32) || (dst net 75.0.218.217/32) || (dst net 75.0.223.229/32) || (dst net 75.0.249.4/32))),
	((dst port 14897) || (dst port 23200) || (dst port 31033) || (dst port 39478) || (dst port 46655)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.7.157/32) || (dst net 76.0.48.135/32) || (dst net 76.0.168.68/32) || (dst net 76.0.194.13/32) || (dst net 76.0.229.84/32))),
	((dst port 21389) || (dst port 29481) || (dst port 30668) || (dst port 49165) || (dst port 53708)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.44.239/32) || (dst net 77.0.181.163/32) || (dst net 77.0.189.116/32) || (dst net 77.0.189.184/32) || (dst net 77.0.233.180/32))),
	((dst port 5343) || (dst port 17204) || (dst port 19522) || (dst port 28642) || (dst port 29203)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.34.5/32) || (dst net 78.0.72.208/32) || (dst net 78.0.94.38/32) || (dst net 78.0.98.6/32) || (dst net 78.0.226.160/32))),
	((dst port 3872) || (dst port 13108) || (dst port 22862) || (dst port 45841) || (dst port 62669)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.41.17/32) || (dst net 79.0.46.171/32) || (dst net 79.0.49.71/32) || (dst net 79.0.61.111/32) || (dst net 79.0.237.56/32))),
	((dst port 1754) || (dst port 19295) || (dst port 42862) || (dst port 54740) || (dst port 58371)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.112.194/32) || (dst net 80.0.129.158/32) || (dst net 80.0.142.132/32) || (dst net 80.0.184.78/32) || (dst net 80.0.229.166/32))),
	((dst port 1623) || (dst port 10802) || (dst port 23476) || (dst port 24188) || (dst port 54760)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.3.131/32) || (dst net 81.0.86.189/32) || (dst net 81.0.139.83/32) || (dst net 81.0.153.250/32) || (dst net 81.0.230.161/32))),
	((dst port 936) || (dst port 11378) || (dst port 12435) || (dst port 45388) || (dst port 63497)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.19.193/32) || (dst net 82.0.57.31/32) || (dst net 82.0.143.255/32) || (dst net 82.0.165.85/32) || (dst net 82.0.254.27/32))),
	((dst port 13267) || (dst port 20267) || (dst port 37846) || (dst port 42955) || (dst port 53372)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.35.147/32) || (dst net 83.0.116.221/32) || (dst net 83.0.151.227/32) || (dst net 83.0.164.84/32) || (dst net 83.0.213.132/32))),
	((dst port 12000) || (dst port 22018) || (dst port 28703) || (dst port 31022) || (dst port 46384)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.19.209/32) || (dst net 84.0.123.253/32) || (dst net 84.0.238.10/32) || (dst net 84.0.247.189/32) || (dst net 84.0.248.88/32))),
	((dst port 18455) || (dst port 20917) || (dst port 29985) || (dst port 39580) || (dst port 50281)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.6.73/32) || (dst net 85.0.110.204/32) || (dst net 85.0.182.56/32) || (dst net 85.0.234.207/32) || (dst net 85.0.245.95/32))),
	((dst port 5200) || (dst port 24769) || (dst port 38123) || (dst port 39357) || (dst port 42630)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.90.15/32) || (dst net 86.0.106.118/32) || (dst net 86.0.111.236/32) || (dst net 86.0.216.132/32) || (dst net 86.0.231.78/32))),
	((dst port 6890) || (dst port 32461) || (dst port 34132) || (dst port 42357) || (dst port 62292)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.1.64/32) || (dst net 87.0.59.184/32) || (dst net 87.0.135.214/32) || (dst net 87.0.196.179/32) || (dst net 87.0.224.112/32))),
	((dst port 28577) || (dst port 30538) || (dst port 33189) || (dst port 37966) || (dst port 39946)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.82.94/32) || (dst net 88.0.87.44/32) || (dst net 88.0.182.144/32) || (dst net 88.0.189.53/32) || (dst net 88.0.230.197/32))),
	((dst port 9432) || (dst port 23220) || (dst port 44246) || (dst port 48521) || (dst port 58859)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.12.252/32) || (dst net 89.0.57.216/32) || (dst net 89.0.129.50/32) || (dst net 89.0.141.161/32) || (dst net 89.0.217.185/32))),
	((dst port 25492) || (dst port 36233) || (dst port 47861) || (dst port 62558) || (dst port 62813)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.103.2/32) || (dst net 90.0.120.127/32) || (dst net 90.0.147.246/32) || (dst net 90.0.184.232/32) || (dst net 90.0.238.166/32))),
	((dst port 4702) || (dst port 34687) || (dst port 40510) || (dst port 47939) || (dst port 61233)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.9.213/32) || (dst net 91.0.62.195/32) || (dst net 91.0.107.242/32) || (dst net 91.0.179.238/32) || (dst net 91.0.181.68/32))),
	((dst port 27373) || (dst port 33124) || (dst port 40748) || (dst port 47845) || (dst port 55865)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.19.168/32) || (dst net 92.0.49.168/32) || (dst net 92.0.75.170/32) || (dst net 92.0.139.159/32) || (dst net 92.0.249.243/32))),
	((dst port 10586) || (dst port 18500) || (dst port 20199) || (dst port 28135) || (dst port 59370)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.39.17/32) || (dst net 93.0.77.235/32) || (dst net 93.0.125.199/32) || (dst net 93.0.136.209/32) || (dst net 93.0.237.39/32))),
	((dst port 10336) || (dst port 27725) || (dst port 34293) || (dst port 51398) || (dst port 64635)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.5.235/32) || (dst net 94.0.17.18/32) || (dst net 94.0.23.97/32) || (dst net 94.0.204.161/32) || (dst net 94.0.212.226/32))),
	((dst port 477) || (dst port 1832) || (dst port 22316) || (dst port 24270) || (dst port 53894)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.56.206/32) || (dst net 95.0.92.33/32) || (dst net 95.0.154.232/32) || (dst net 95.0.187.98/32) || (dst net 95.0.243.187/32))),
	((dst port 21506) || (dst port 24266) || (dst port 31551) || (dst port 50604) || (dst port 62712)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.9.128/32) || (dst net 96.0.46.237/32) || (dst net 96.0.219.235/32) || (dst net 96.0.223.11/32) || (dst net 96.0.227.82/32))),
	((dst port 4693) || (dst port 7341) || (dst port 28181) || (dst port 40583) || (dst port 41903)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.23.221/32) || (dst net 97.0.25.91/32) || (dst net 97.0.54.105/32) || (dst net 97.0.166.85/32) || (dst net 97.0.215.28/32))),
	((dst port 13502) || (dst port 28267) || (dst port 33482) || (dst port 37728) || (dst port 55573)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.25.111/32) || (dst net 98.0.67.187/32) || (dst net 98.0.74.218/32) || (dst net 98.0.199.155/32) || (dst net 98.0.203.211/32))),
	((dst port 4548) || (dst port 25880) || (dst port 31939) || (dst port 49212) || (dst port 49771)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.19.130/32) || (dst net 99.0.61.45/32) || (dst net 99.0.77.95/32) || (dst net 99.0.109.156/32) || (dst net 99.0.130.38/32))),
	((dst port 24661) || (dst port 26038) || (dst port 31112) || (dst port 52764) || (dst port 62626)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.126.135/32) || (dst net 100.0.150.241/32) || (dst net 100.0.151.29/32) || (dst net 100.0.164.34/32) || (dst net 100.0.180.233/32))),
	((dst port 13056) || (dst port 17343) || (dst port 22517) || (dst port 24384) || (dst port 45566)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.33.131/32) || (dst net 101.0.79.35/32) || (dst net 101.0.81.111/32) || (dst net 101.0.124.248/32) || (dst net 101.0.153.193/32))),
	((dst port 18701) || (dst port 25440) || (dst port 26759) || (dst port 57140) || (dst port 57832)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.62.82/32) || (dst net 102.0.126.7/32) || (dst net 102.0.151.56/32) || (dst net 102.0.196.123/32) || (dst net 102.0.209.166/32))),
	((dst port 6569) || (dst port 25087) || (dst port 39573) || (dst port 47725) || (dst port 59275)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.52.46/32) || (dst net 103.0.86.229/32) || (dst net 103.0.145.183/32) || (dst net 103.0.147.132/32) || (dst net 103.0.168.98/32))),
	((dst port 6584) || (dst port 6672) || (dst port 29939) || (dst port 38595) || (dst port 52494)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.14.96/32) || (dst net 104.0.104.234/32) || (dst net 104.0.194.212/32) || (dst net 104.0.195.197/32) || (dst net 104.0.255.215/32))),
	((dst port 21539) || (dst port 25761) || (dst port 25905) || (dst port 44681) || (dst port 65005)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.58.66/32) || (dst net 105.0.129.36/32) || (dst net 105.0.138.61/32) || (dst net 105.0.199.220/32) || (dst net 105.0.226.2/32))),
	((dst port 29622) || (dst port 32601) || (dst port 40589) || (dst port 44725) || (dst port 48125)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.28.245/32) || (dst net 106.0.74.127/32) || (dst net 106.0.126.120/32) || (dst net 106.0.188.129/32) || (dst net 106.0.214.93/32))),
	((dst port 15373) || (dst port 33513) || (dst port 34419) || (dst port 40523) || (dst port 45397)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.18.182/32) || (dst net 107.0.26.249/32) || (dst net 107.0.39.244/32) || (dst net 107.0.157.124/32) || (dst net 107.0.242.82/32))),
	((dst port 2055) || (dst port 9784) || (dst port 14722) || (dst port 30945) || (dst port 31517)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.29.119/32) || (dst net 108.0.72.35/32) || (dst net 108.0.117.82/32) || (dst net 108.0.239.111/32) || (dst net 108.0.250.2/32))),
	((dst port 97) || (dst port 2308) || (dst port 9687) || (dst port 18666) || (dst port 64649)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.87.79/32) || (dst net 109.0.91.117/32) || (dst net 109.0.132.156/32) || (dst net 109.0.214.211/32) || (dst net 109.0.224.77/32))),
	((dst port 9910) || (dst port 30875) || (dst port 38148) || (dst port 48203) || (dst port 53502)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.21.120/32) || (dst net 110.0.113.0/32) || (dst net 110.0.117.95/32) || (dst net 110.0.128.39/32) || (dst net 110.0.170.219/32))),
	((dst port 4132) || (dst port 21429) || (dst port 30776) || (dst port 32845) || (dst port 49924)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.52.202/32) || (dst net 111.0.63.134/32) || (dst net 111.0.116.166/32) || (dst net 111.0.130.154/32) || (dst net 111.0.168.8/32))),
	((dst port 4198) || (dst port 11462) || (dst port 36207) || (dst port 41958) || (dst port 64768)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.60.10/32) || (dst net 112.0.76.119/32) || (dst net 112.0.183.160/32) || (dst net 112.0.213.152/32) || (dst net 112.0.224.76/32))),
	((dst port 6299) || (dst port 9446) || (dst port 28019) || (dst port 37926) || (dst port 39653)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.155.12/32) || (dst net 113.0.209.6/32) || (dst net 113.0.217.38/32) || (dst net 113.0.251.229/32) || (dst net 113.0.254.115/32))),
	((dst port 48789) || (dst port 49391) || (dst port 60843) || (dst port 61844) || (dst port 65522)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.5.146/32) || (dst net 114.0.27.41/32) || (dst net 114.0.63.73/32) || (dst net 114.0.83.23/32) || (dst net 114.0.187.91/32))),
	((dst port 11419) || (dst port 18363) || (dst port 32142) || (dst port 40034) || (dst port 49063)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.14.196/32) || (dst net 115.0.75.142/32) || (dst net 115.0.99.119/32) || (dst net 115.0.196.123/32) || (dst net 115.0.239.254/32))),
	((dst port 4544) || (dst port 4998) || (dst port 34365) || (dst port 53991) || (dst port 63487)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.39.195/32) || (dst net 116.0.77.23/32) || (dst net 116.0.123.137/32) || (dst net 116.0.145.105/32) || (dst net 116.0.165.156/32))),
	((dst port 1922) || (dst port 7998) || (dst port 11500) || (dst port 21576) || (dst port 47538)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.38.31/32) || (dst net 117.0.88.240/32) || (dst net 117.0.199.21/32) || (dst net 117.0.240.157/32) || (dst net 117.0.249.230/32))),
	((dst port 5371) || (dst port 10420) || (dst port 14931) || (dst port 17649) || (dst port 64462)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.43.133/32) || (dst net 118.0.44.251/32) || (dst net 118.0.48.39/32) || (dst net 118.0.57.225/32) || (dst net 118.0.109.102/32))),
	((dst port 3964) || (dst port 23305) || (dst port 32283) || (dst port 38465) || (dst port 39552)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.48.220/32) || (dst net 119.0.87.206/32) || (dst net 119.0.115.67/32) || (dst net 119.0.131.243/32) || (dst net 119.0.212.243/32))),
	((dst port 8691) || (dst port 47853) || (dst port 53137) || (dst port 57176) || (dst port 58732)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.29.231/32) || (dst net 120.0.81.43/32) || (dst net 120.0.111.34/32) || (dst net 120.0.240.13/32) || (dst net 120.0.245.162/32))),
	((dst port 19452) || (dst port 28150) || (dst port 31185) || (dst port 33883) || (dst port 44892)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.36.11/32) || (dst net 121.0.80.46/32) || (dst net 121.0.217.26/32) || (dst net 121.0.230.23/32) || (dst net 121.0.249.24/32))),
	((dst port 17051) || (dst port 39627) || (dst port 47645) || (dst port 50578) || (dst port 57543)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.26.181/32) || (dst net 122.0.42.88/32) || (dst net 122.0.131.255/32) || (dst net 122.0.188.95/32) || (dst net 122.0.231.26/32))),
	((dst port 15262) || (dst port 20557) || (dst port 23141) || (dst port 32354) || (dst port 64100)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.64.104/32) || (dst net 123.0.108.124/32) || (dst net 123.0.184.155/32) || (dst net 123.0.191.134/32) || (dst net 123.0.221.156/32))),
	((dst port 5546) || (dst port 15428) || (dst port 30351) || (dst port 31045) || (dst port 37572)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.2.84/32) || (dst net 124.0.81.221/32) || (dst net 124.0.96.122/32) || (dst net 124.0.213.83/32) || (dst net 124.0.231.47/32))),
	((dst port 16402) || (dst port 26791) || (dst port 28668) || (dst port 48837) || (dst port 55971)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.141.23/32) || (dst net 125.0.189.210/32) || (dst net 125.0.210.47/32) || (dst net 125.0.219.180/32) || (dst net 125.0.237.24/32))),
	((dst port 7340) || (dst port 10903) || (dst port 16676) || (dst port 21806) || (dst port 40013)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.27.155/32) || (dst net 126.0.92.132/32) || (dst net 126.0.115.161/32) || (dst net 126.0.132.219/32) || (dst net 126.0.235.205/32))),
	((dst port 4047) || (dst port 10712) || (dst port 43867) || (dst port 48225) || (dst port 58683)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.46.3/32) || (dst net 127.0.73.147/32) || (dst net 127.0.83.40/32) || (dst net 127.0.117.6/32) || (dst net 127.0.195.146/32))),
	((dst port 13707) || (dst port 16258) || (dst port 22132) || (dst port 34707) || (dst port 45636)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.56.168/32) || (dst net 128.0.61.154/32) || (dst net 128.0.72.188/32) || (dst net 128.0.88.114/32) || (dst net 128.0.141.208/32))),
	((dst port 10165) || (dst port 25969) || (dst port 26424) || (dst port 49886) || (dst port 55063)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.169.212/32) || (dst net 129.0.172.225/32) || (dst net 129.0.203.19/32) || (dst net 129.0.222.55/32) || (dst net 129.0.239.44/32))),
	((dst port 5549) || (dst port 6113) || (dst port 6797) || (dst port 16716) || (dst port 53360)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.10.200/32) || (dst net 130.0.146.100/32) || (dst net 130.0.207.62/32) || (dst net 130.0.217.46/32) || (dst net 130.0.253.76/32))),
	((dst port 14126) || (dst port 18796) || (dst port 23015) || (dst port 50014) || (dst port 50547)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.9.23/32) || (dst net 131.0.80.81/32) || (dst net 131.0.146.48/32) || (dst net 131.0.205.63/32) || (dst net 131.0.243.40/32))),
	((dst port 26972) || (dst port 35133) || (dst port 40965) || (dst port 48035) || (dst port 63341)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.46.58/32) || (dst net 132.0.118.181/32) || (dst net 132.0.227.7/32) || (dst net 132.0.245.238/32) || (dst net 132.0.249.50/32))),
	((dst port 6923) || (dst port 15755) || (dst port 26565) || (dst port 33568) || (dst port 36877)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.13.210/32) || (dst net 133.0.90.123/32) || (dst net 133.0.191.150/32) || (dst net 133.0.194.112/32) || (dst net 133.0.223.205/32))),
	((dst port 19174) || (dst port 21406) || (dst port 21512) || (dst port 33240) || (dst port 47898)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.51.96/32) || (dst net 134.0.135.27/32) || (dst net 134.0.201.238/32) || (dst net 134.0.213.22/32) || (dst net 134.0.245.109/32))),
	((dst port 14803) || (dst port 16204) || (dst port 34167) || (dst port 39266) || (dst port 53459)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.9.219/32) || (dst net 135.0.37.216/32) || (dst net 135.0.105.12/32) || (dst net 135.0.118.124/32) || (dst net 135.0.123.128/32))),
	((dst port 6588) || (dst port 11646) || (dst port 25436) || (dst port 34187) || (dst port 59174)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.39.224/32) || (dst net 136.0.117.120/32) || (dst net 136.0.154.101/32) || (dst net 136.0.209.253/32) || (dst net 136.0.223.44/32))),
	((dst port 2199) || (dst port 9944) || (dst port 13627) || (dst port 43154) || (dst port 63698)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.104.38/32) || (dst net 137.0.125.227/32) || (dst net 137.0.155.88/32) || (dst net 137.0.177.182/32) || (dst net 137.0.242.84/32))),
	((dst port 5968) || (dst port 46153) || (dst port 48110) || (dst port 51441) || (dst port 57622)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.17.29/32) || (dst net 138.0.17.52/32) || (dst net 138.0.90.68/32) || (dst net 138.0.160.55/32) || (dst net 138.0.219.49/32))),
	((dst port 19897) || (dst port 27500) || (dst port 38867) || (dst port 46708) || (dst port 47178)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.21.56/32) || (dst net 139.0.48.21/32) || (dst net 139.0.196.177/32) || (dst net 139.0.213.59/32) || (dst net 139.0.254.88/32))),
	((dst port 38981) || (dst port 41992) || (dst port 45934) || (dst port 52899) || (dst port 65477)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.43.207/32) || (dst net 140.0.74.72/32) || (dst net 140.0.77.234/32) || (dst net 140.0.85.154/32) || (dst net 140.0.163.129/32))),
	((dst port 5226) || (dst port 16301) || (dst port 23389) || (dst port 44240) || (dst port 63902)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.177.216/32) || (dst net 141.0.179.21/32) || (dst net 141.0.222.87/32) || (dst net 141.0.227.43/32) || (dst net 141.0.236.44/32))),
	((dst port 19496) || (dst port 24163) || (dst port 40060) || (dst port 53913) || (dst port 56857)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.27.22/32) || (dst net 142.0.57.197/32) || (dst net 142.0.88.54/32) || (dst net 142.0.157.81/32) || (dst net 142.0.248.152/32))),
	((dst port 4406) || (dst port 33683) || (dst port 47202) || (dst port 57408) || (dst port 63325)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.37.241/32) || (dst net 143.0.57.110/32) || (dst net 143.0.201.17/32) || (dst net 143.0.219.36/32) || (dst net 143.0.226.82/32))),
	((dst port 32874) || (dst port 34605) || (dst port 37662) || (dst port 38669) || (dst port 49767)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.7.87/32) || (dst net 144.0.46.35/32) || (dst net 144.0.199.106/32) || (dst net 144.0.240.155/32) || (dst net 144.0.244.246/32))),
	((dst port 565) || (dst port 9246) || (dst port 11158) || (dst port 22105) || (dst port 30306)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.20.121/32) || (dst net 145.0.36.169/32) || (dst net 145.0.66.138/32) || (dst net 145.0.119.232/32) || (dst net 145.0.232.28/32))),
	((dst port 12015) || (dst port 15109) || (dst port 17080) || (dst port 23262) || (dst port 57244)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.18.172/32) || (dst net 146.0.127.252/32) || (dst net 146.0.206.72/32) || (dst net 146.0.223.202/32) || (dst net 146.0.227.144/32))),
	((dst port 11430) || (dst port 23057) || (dst port 25253) || (dst port 25414) || (dst port 61776)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.31.231/32) || (dst net 147.0.74.237/32) || (dst net 147.0.125.214/32) || (dst net 147.0.154.162/32) || (dst net 147.0.233.7/32))),
	((dst port 19982) || (dst port 30220) || (dst port 39654) || (dst port 42515) || (dst port 61336)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.16.44/32) || (dst net 148.0.22.188/32) || (dst net 148.0.85.135/32) || (dst net 148.0.104.5/32) || (dst net 148.0.215.185/32))),
	((dst port 6279) || (dst port 21933) || (dst port 27145) || (dst port 44872) || (dst port 47891)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.71.195/32) || (dst net 149.0.85.116/32) || (dst net 149.0.93.10/32) || (dst net 149.0.168.35/32) || (dst net 149.0.220.166/32))),
	((dst port 13756) || (dst port 27669) || (dst port 36277) || (dst port 57001) || (dst port 58918)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.5.4/32) || (dst net 150.0.106.138/32) || (dst net 150.0.147.74/32) || (dst net 150.0.149.167/32) || (dst net 150.0.191.225/32))),
	((dst port 41301) || (dst port 44661) || (dst port 45294) || (dst port 45754) || (dst port 58806)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.8.201/32) || (dst net 151.0.173.60/32) || (dst net 151.0.189.163/32) || (dst net 151.0.230.187/32) || (dst net 151.0.234.88/32))),
	((dst port 11079) || (dst port 24799) || (dst port 41268) || (dst port 43875) || (dst port 59734)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.21.4/32) || (dst net 152.0.38.148/32) || (dst net 152.0.72.71/32) || (dst net 152.0.205.201/32) || (dst net 152.0.224.16/32))),
	((dst port 4415) || (dst port 27288) || (dst port 36580) || (dst port 44442) || (dst port 61617)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.55.142/32) || (dst net 153.0.74.21/32) || (dst net 153.0.118.51/32) || (dst net 153.0.189.162/32) || (dst net 153.0.253.6/32))),
	((dst port 1144) || (dst port 19148) || (dst port 33611) || (dst port 35916) || (dst port 48173)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.35.216/32) || (dst net 154.0.42.206/32) || (dst net 154.0.48.198/32) || (dst net 154.0.77.127/32) || (dst net 154.0.190.146/32))),
	((dst port 15439) || (dst port 19677) || (dst port 28897) || (dst port 32129) || (dst port 41912)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.21.242/32) || (dst net 155.0.65.12/32) || (dst net 155.0.157.2/32) || (dst net 155.0.199.139/32) || (dst net 155.0.238.208/32))),
	((dst port 14583) || (dst port 39385) || (dst port 58272) || (dst port 64157) || (dst port 64830)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.54.71/32) || (dst net 156.0.85.160/32) || (dst net 156.0.94.202/32) || (dst net 156.0.133.161/32) || (dst net 156.0.225.132/32))),
	((dst port 502) || (dst port 11006) || (dst port 20289) || (dst port 35679) || (dst port 36156)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.22.100/32) || (dst net 157.0.33.167/32) || (dst net 157.0.111.33/32) || (dst net 157.0.187.114/32) || (dst net 157.0.198.233/32))),
	((dst port 737) || (dst port 8213) || (dst port 15133) || (dst port 30162) || (dst port 58364)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.119.220/32) || (dst net 158.0.128.163/32) || (dst net 158.0.226.155/32) || (dst net 158.0.233.108/32) || (dst net 158.0.248.160/32))),
	((dst port 28039) || (dst port 39522) || (dst port 40771) || (dst port 50879) || (dst port 51389)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.27.139/32) || (dst net 159.0.38.180/32) || (dst net 159.0.50.131/32) || (dst net 159.0.105.137/32) || (dst net 159.0.156.98/32))),
	((dst port 6186) || (dst port 17177) || (dst port 28724) || (dst port 32656) || (dst port 49496)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.193.67/32) || (dst net 160.0.220.21/32) || (dst net 160.0.222.102/32) || (dst net 160.0.236.243/32) || (dst net 160.0.242.239/32))),
	((dst port 7485) || (dst port 14681) || (dst port 36190) || (dst port 38184) || (dst port 60722)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.22.46/32) || (dst net 161.0.53.19/32) || (dst net 161.0.55.251/32) || (dst net 161.0.109.221/32) || (dst net 161.0.158.207/32))),
	((dst port 3073) || (dst port 10335) || (dst port 12782) || (dst port 32168) || (dst port 32966)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.25.83/32) || (dst net 162.0.91.0/32) || (dst net 162.0.135.80/32) || (dst net 162.0.153.8/32) || (dst net 162.0.170.144/32))),
	((dst port 1534) || (dst port 9933) || (dst port 25110) || (dst port 33144) || (dst port 52362)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.52.185/32) || (dst net 163.0.57.25/32) || (dst net 163.0.122.216/32) || (dst net 163.0.156.52/32) || (dst net 163.0.249.192/32))),
	((dst port 10449) || (dst port 33736) || (dst port 34891) || (dst port 48111) || (dst port 63871)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.118.38/32) || (dst net 164.0.142.204/32) || (dst net 164.0.183.80/32) || (dst net 164.0.225.158/32) || (dst net 164.0.249.191/32))),
	((dst port 12984) || (dst port 35614) || (dst port 35739) || (dst port 48172) || (dst port 52504)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.1.191/32) || (dst net 165.0.25.61/32) || (dst net 165.0.62.74/32) || (dst net 165.0.192.227/32) || (dst net 165.0.227.165/32))),
	((dst port 17198) || (dst port 30878) || (dst port 34028) || (dst port 34621) || (dst port 51308)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.43.198/32) || (dst net 166.0.85.113/32) || (dst net 166.0.118.136/32) || (dst net 166.0.197.195/32) || (dst net 166.0.216.201/32))),
	((dst port 7721) || (dst port 12841) || (dst port 14781) || (dst port 37317) || (dst port 54503)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.61.22/32) || (dst net 167.0.92.154/32) || (dst net 167.0.108.238/32) || (dst net 167.0.117.129/32) || (dst net 167.0.250.88/32))),
	((dst port 16735) || (dst port 21591) || (dst port 29886) || (dst port 56200) || (dst port 60539)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.17.158/32) || (dst net 168.0.61.102/32) || (dst net 168.0.98.227/32) || (dst net 168.0.174.248/32) || (dst net 168.0.246.63/32))),
	((dst port 23749) || (dst port 30822) || (dst port 34883) || (dst port 41625) || (dst port 50378)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.27.112/32) || (dst net 169.0.28.22/32) || (dst net 169.0.47.167/32) || (dst net 169.0.116.65/32) || (dst net 169.0.235.180/32))),
	((dst port 9421) || (dst port 11368) || (dst port 20637) || (dst port 23210) || (dst port 46510)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.58.164/32) || (dst net 170.0.107.36/32) || (dst net 170.0.212.200/32) || (dst net 170.0.227.164/32) || (dst net 170.0.246.201/32))),
	((dst port 9369) || (dst port 27292) || (dst port 27846) || (dst port 31669) || (dst port 44147)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.31.125/32) || (dst net 171.0.78.206/32) || (dst net 171.0.91.95/32) || (dst net 171.0.139.210/32) || (dst net 171.0.199.178/32))),
	((dst port 2432) || (dst port 33655) || (dst port 35539) || (dst port 50252) || (dst port 54208)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.22.49/32) || (dst net 172.0.83.76/32) || (dst net 172.0.112.221/32) || (dst net 172.0.183.21/32) || (dst net 172.0.233.108/32))),
	((dst port 10047) || (dst port 10723) || (dst port 17672) || (dst port 50697) || (dst port 63245)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.0.249/32) || (dst net 173.0.81.43/32) || (dst net 173.0.99.136/32) || (dst net 173.0.201.160/32) || (dst net 173.0.219.38/32))),
	((dst port 2299) || (dst port 11714) || (dst port 12121) || (dst port 32181) || (dst port 58055)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.50.204/32) || (dst net 174.0.98.70/32) || (dst net 174.0.151.74/32) || (dst net 174.0.227.108/32) || (dst net 174.0.228.101/32))),
	((dst port 8018) || (dst port 17436) || (dst port 23479) || (dst port 23625) || (dst port 41721)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.61.40/32) || (dst net 175.0.66.79/32) || (dst net 175.0.178.179/32) || (dst net 175.0.205.236/32) || (dst net 175.0.255.5/32))),
	((dst port 15720) || (dst port 47121) || (dst port 48995) || (dst port 57118) || (dst port 61317)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.18.56/32) || (dst net 176.0.36.235/32) || (dst net 176.0.195.164/32) || (dst net 176.0.195.206/32) || (dst net 176.0.225.22/32))),
	((dst port 16308) || (dst port 20727) || (dst port 25235) || (dst port 33774) || (dst port 40457)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.1.205/32) || (dst net 177.0.63.233/32) || (dst net 177.0.93.64/32) || (dst net 177.0.141.143/32) || (dst net 177.0.205.215/32))),
	((dst port 9275) || (dst port 38108) || (dst port 41665) || (dst port 59038) || (dst port 59746)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.16.27/32) || (dst net 178.0.26.18/32) || (dst net 178.0.88.32/32) || (dst net 178.0.130.214/32) || (dst net 178.0.135.79/32))),
	((dst port 15907) || (dst port 29829) || (dst port 44160) || (dst port 53509) || (dst port 60208)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.48.153/32) || (dst net 179.0.144.168/32) || (dst net 179.0.173.154/32) || (dst net 179.0.178.61/32) || (dst net 179.0.215.132/32))),
	((dst port 16352) || (dst port 23397) || (dst port 39514) || (dst port 41321) || (dst port 57570)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.49.208/32) || (dst net 180.0.63.166/32) || (dst net 180.0.151.25/32) || (dst net 180.0.202.177/32) || (dst net 180.0.236.211/32))),
	((dst port 9594) || (dst port 21730) || (dst port 39323) || (dst port 49398) || (dst port 51577)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.33.181/32) || (dst net 181.0.51.97/32) || (dst net 181.0.98.241/32) || (dst net 181.0.172.204/32) || (dst net 181.0.248.152/32))),
	((dst port 17697) || (dst port 21245) || (dst port 23608) || (dst port 48357) || (dst port 65230)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.76.77/32) || (dst net 182.0.78.0/32) || (dst net 182.0.136.200/32) || (dst net 182.0.198.185/32) || (dst net 182.0.226.181/32))),
	((dst port 18710) || (dst port 32159) || (dst port 53765) || (dst port 59458) || (dst port 61496)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.3.130/32) || (dst net 183.0.57.36/32) || (dst net 183.0.107.95/32) || (dst net 183.0.109.225/32) || (dst net 183.0.252.129/32))),
	((dst port 18090) || (dst port 19529) || (dst port 21741) || (dst port 23253) || (dst port 34145)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.40.83/32) || (dst net 184.0.107.214/32) || (dst net 184.0.126.208/32) || (dst net 184.0.131.36/32) || (dst net 184.0.150.171/32))),
	((dst port 1429) || (dst port 24140) || (dst port 34231) || (dst port 39366) || (dst port 41872)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.2.22/32) || (dst net 185.0.41.246/32) || (dst net 185.0.49.109/32) || (dst net 185.0.129.219/32) || (dst net 185.0.220.136/32))),
	((dst port 4015) || (dst port 7818) || (dst port 9530) || (dst port 21685) || (dst port 49606)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.5.170/32) || (dst net 186.0.51.49/32) || (dst net 186.0.183.113/32) || (dst net 186.0.222.30/32) || (dst net 186.0.251.5/32))),
	((dst port 3070) || (dst port 27838) || (dst port 35259) || (dst port 53607) || (dst port 65234)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.20.45/32) || (dst net 187.0.55.90/32) || (dst net 187.0.73.39/32) || (dst net 187.0.162.9/32) || (dst net 187.0.176.229/32))),
	((dst port 12011) || (dst port 27723) || (dst port 38505) || (dst port 42907) || (dst port 47250)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.50.126/32) || (dst net 188.0.111.239/32) || (dst net 188.0.145.120/32) || (dst net 188.0.212.115/32) || (dst net 188.0.235.3/32))),
	((dst port 1154) || (dst port 6480) || (dst port 27884) || (dst port 39448) || (dst port 60609)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.1.218/32) || (dst net 189.0.62.106/32) || (dst net 189.0.93.230/32) || (dst net 189.0.146.1/32) || (dst net 189.0.183.81/32))),
	((dst port 14789) || (dst port 18741) || (dst port 19552) || (dst port 40722) || (dst port 57767)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.42.36/32) || (dst net 190.0.66.97/32) || (dst net 190.0.194.15/32) || (dst net 190.0.197.217/32) || (dst net 190.0.255.69/32))),
	((dst port 33301) || (dst port 33330) || (dst port 42401) || (dst port 48053) || (dst port 61028)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.18.162/32) || (dst net 191.0.50.186/32) || (dst net 191.0.65.60/32) || (dst net 191.0.107.101/32) || (dst net 191.0.226.35/32))),
	((dst port 30399) || (dst port 48106) || (dst port 48916) || (dst port 49026) || (dst port 58532)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.21.168/32) || (dst net 192.0.40.45/32) || (dst net 192.0.88.171/32) || (dst net 192.0.130.112/32) || (dst net 192.0.207.73/32))),
	((dst port 8907) || (dst port 23661) || (dst port 34146) || (dst port 46619) || (dst port 60101)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.0.102/32) || (dst net 193.0.45.252/32) || (dst net 193.0.141.129/32) || (dst net 193.0.215.98/32) || (dst net 193.0.230.129/32))),
	((dst port 7183) || (dst port 18364) || (dst port 21789) || (dst port 40055) || (dst port 51502)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.37.33/32) || (dst net 194.0.138.181/32) || (dst net 194.0.208.197/32) || (dst net 194.0.212.38/32) || (dst net 194.0.214.190/32))),
	((dst port 16310) || (dst port 17306) || (dst port 32463) || (dst port 48636) || (dst port 51639)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.112.140/32) || (dst net 195.0.139.218/32) || (dst net 195.0.154.92/32) || (dst net 195.0.219.54/32) || (dst net 195.0.245.250/32))),
	((dst port 23832) || (dst port 25457) || (dst port 26798) || (dst port 35343) || (dst port 45792)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.26.153/32) || (dst net 196.0.62.226/32) || (dst net 196.0.158.31/32) || (dst net 196.0.186.137/32) || (dst net 196.0.228.251/32))),
	((dst port 18100) || (dst port 30545) || (dst port 46046) || (dst port 48999) || (dst port 51572)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.143.202/32) || (dst net 197.0.168.212/32) || (dst net 197.0.173.152/32) || (dst net 197.0.206.2/32) || (dst net 197.0.242.125/32))),
	((dst port 1912) || (dst port 7560) || (dst port 32814) || (dst port 36586) || (dst port 48713)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.1.4/32) || (dst net 198.0.39.143/32) || (dst net 198.0.48.112/32) || (dst net 198.0.214.128/32) || (dst net 198.0.223.58/32))),
	((dst port 946) || (dst port 8520) || (dst port 11795) || (dst port 48170) || (dst port 54506)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.1.182/32) || (dst net 199.0.27.64/32) || (dst net 199.0.89.140/32) || (dst net 199.0.103.150/32) || (dst net 199.0.166.78/32))),
	((dst port 11011) || (dst port 39544) || (dst port 40171) || (dst port 54329) || (dst port 56458)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.3.189/32) || (dst net 200.0.134.17/32) || (dst net 200.0.139.12/32) || (dst net 200.0.182.122/32) || (dst net 200.0.197.95/32))),
	((dst port 5012) || (dst port 21855) || (dst port 23445) || (dst port 26825) || (dst port 55545)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.23.29/32) || (dst net 201.0.102.57/32) || (dst net 201.0.145.246/32) || (dst net 201.0.174.30/32) || (dst net 201.0.179.16/32))),
	((dst port 20350) || (dst port 24427) || (dst port 29151) || (dst port 50074) || (dst port 55547)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.8.79/32) || (dst net 202.0.126.35/32) || (dst net 202.0.147.79/32) || (dst net 202.0.177.176/32) || (dst net 202.0.237.25/32))),
	((dst port 11752) || (dst port 21829) || (dst port 50984) || (dst port 51333) || (dst port 64074)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.22.142/32) || (dst net 203.0.89.153/32) || (dst net 203.0.95.63/32) || (dst net 203.0.213.248/32) || (dst net 203.0.215.138/32))),
	((dst port 4809) || (dst port 16139) || (dst port 31097) || (dst port 53481) || (dst port 56737)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.29.6/32) || (dst net 204.0.73.115/32) || (dst net 204.0.74.5/32) || (dst net 204.0.106.36/32) || (dst net 204.0.160.89/32))),
	((dst port 29927) || (dst port 37895) || (dst port 43972) || (dst port 49276) || (dst port 54408)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.38.112/32) || (dst net 205.0.38.170/32) || (dst net 205.0.93.78/32) || (dst net 205.0.132.188/32) || (dst net 205.0.174.59/32))),
	((dst port 2798) || (dst port 10996) || (dst port 26459) || (dst port 36640) || (dst port 37852)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.13.1/32) || (dst net 206.0.54.227/32) || (dst net 206.0.140.164/32) || (dst net 206.0.195.169/32) || (dst net 206.0.214.76/32))),
	((dst port 4716) || (dst port 4741) || (dst port 8109) || (dst port 27635) || (dst port 41389)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.2.168/32) || (dst net 207.0.22.107/32) || (dst net 207.0.61.75/32) || (dst net 207.0.140.191/32) || (dst net 207.0.193.173/32))),
	((dst port 6952) || (dst port 47050) || (dst port 53643) || (dst port 61479) || (dst port 64090)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.9.42/32) || (dst net 208.0.40.6/32) || (dst net 208.0.163.218/32) || (dst net 208.0.178.98/32) || (dst net 208.0.239.131/32))),
	((dst port 20314) || (dst port 29239) || (dst port 35545) || (dst port 35935) || (dst port 38340)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.1.166/32) || (dst net 209.0.35.248/32) || (dst net 209.0.80.21/32) || (dst net 209.0.87.26/32) || (dst net 209.0.149.156/32))),
	((dst port 5071) || (dst port 9506) || (dst port 33561) || (dst port 34986) || (dst port 56475)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.41.225/32) || (dst net 210.0.77.210/32) || (dst net 210.0.100.37/32) || (dst net 210.0.171.209/32) || (dst net 210.0.218.104/32))),
	((dst port 7283) || (dst port 8887) || (dst port 44804) || (dst port 58650) || (dst port 61779)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.68.156/32) || (dst net 211.0.108.68/32) || (dst net 211.0.124.231/32) || (dst net 211.0.204.158/32) || (dst net 211.0.232.68/32))),
	((dst port 5022) || (dst port 8275) || (dst port 12220) || (dst port 15071) || (dst port 57627)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.104.142/32) || (dst net 212.0.127.155/32) || (dst net 212.0.178.105/32) || (dst net 212.0.216.223/32) || (dst net 212.0.222.129/32))),
	((dst port 22436) || (dst port 40096) || (dst port 56396) || (dst port 56456) || (dst port 64868)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.12.93/32) || (dst net 213.0.21.220/32) || (dst net 213.0.30.13/32) || (dst net 213.0.114.95/32) || (dst net 213.0.192.133/32))),
	((dst port 830) || (dst port 8317) || (dst port 33925) || (dst port 35459) || (dst port 63578)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.12.58/32) || (dst net 214.0.45.155/32) || (dst net 214.0.64.142/32) || (dst net 214.0.169.200/32) || (dst net 214.0.225.51/32))),
	((dst port 1879) || (dst port 5938) || (dst port 48852) || (dst port 49800) || (dst port 59036)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.5.86/32) || (dst net 215.0.36.17/32) || (dst net 215.0.120.222/32) || (dst net 215.0.136.138/32) || (dst net 215.0.209.163/32))),
	((dst port 257) || (dst port 28465) || (dst port 60768) || (dst port 61845) || (dst port 63987)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.38.201/32) || (dst net 216.0.50.12/32) || (dst net 216.0.154.189/32) || (dst net 216.0.203.168/32) || (dst net 216.0.209.111/32))),
	((dst port 12585) || (dst port 22198) || (dst port 34277) || (dst port 35781) || (dst port 52122)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.49.38/32) || (dst net 217.0.73.30/32) || (dst net 217.0.85.158/32) || (dst net 217.0.194.163/32) || (dst net 217.0.228.195/32))),
	((dst port 1854) || (dst port 19867) || (dst port 35725) || (dst port 38475) || (dst port 52739)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.40.192/32) || (dst net 218.0.110.180/32) || (dst net 218.0.115.40/32) || (dst net 218.0.223.79/32) || (dst net 218.0.240.120/32))),
	((dst port 16714) || (dst port 27445) || (dst port 44453) || (dst port 52413) || (dst port 62086)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.68.74/32) || (dst net 219.0.71.79/32) || (dst net 219.0.111.40/32) || (dst net 219.0.128.78/32) || (dst net 219.0.190.131/32))),
	((dst port 7788) || (dst port 19991) || (dst port 22720) || (dst port 44964) || (dst port 53772)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.29.185/32) || (dst net 220.0.75.167/32) || (dst net 220.0.117.145/32) || (dst net 220.0.202.44/32) || (dst net 220.0.211.112/32))),
	((dst port 18779) || (dst port 26283) || (dst port 53854) || (dst port 56886) || (dst port 57578)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.55.25/32) || (dst net 221.0.83.81/32) || (dst net 221.0.221.107/32) || (dst net 221.0.230.181/32) || (dst net 221.0.244.160/32))),
	((dst port 9743) || (dst port 19540) || (dst port 30885) || (dst port 39549) || (dst port 40580)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.22.160/32) || (dst net 222.0.69.213/32) || (dst net 222.0.139.29/32) || (dst net 222.0.143.179/32) || (dst net 222.0.221.170/32))),
	((dst port 6100) || (dst port 7910) || (dst port 24320) || (dst port 36086) || (dst port 57431)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.127.212/32) || (dst net 223.0.173.47/32) || (dst net 223.0.182.239/32) || (dst net 223.0.188.106/32) || (dst net 223.0.190.179/32))),
	((dst port 13157) || (dst port 16195) || (dst port 16678) || (dst port 19485) || (dst port 60087)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.1.150/32) || (dst net 224.0.1.231/32) || (dst net 224.0.80.122/32) || (dst net 224.0.138.222/32) || (dst net 224.0.177.136/32))),
	((dst port 1725) || (dst port 19785) || (dst port 20871) || (dst port 46177) || (dst port 60721)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.67.69/32) || (dst net 225.0.67.159/32) || (dst net 225.0.71.137/32) || (dst net 225.0.103.184/32) || (dst net 225.0.138.2/32))),
	((dst port 2783) || (dst port 10185) || (dst port 16714) || (dst port 32798) || (dst port 49634)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.23.228/32) || (dst net 226.0.66.168/32) || (dst net 226.0.143.184/32) || (dst net 226.0.152.218/32) || (dst net 226.0.207.72/32))),
	((dst port 35) || (dst port 3267) || (dst port 10130) || (dst port 28290) || (dst port 45535)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.89.242/32) || (dst net 227.0.155.151/32) || (dst net 227.0.188.125/32) || (dst net 227.0.239.121/32) || (dst net 227.0.255.70/32))),
	((dst port 7836) || (dst port 11082) || (dst port 33489) || (dst port 45392) || (dst port 54498)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.47.234/32) || (dst net 228.0.88.136/32) || (dst net 228.0.135.232/32) || (dst net 228.0.161.237/32) || (dst net 228.0.239.69/32))),
	((dst port 6665) || (dst port 31123) || (dst port 41793) || (dst port 48329) || (dst port 63362)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.1.81/32) || (dst net 229.0.21.92/32) || (dst net 229.0.79.16/32) || (dst net 229.0.142.65/32) || (dst net 229.0.164.224/32))),
	((dst port 10512) || (dst port 12563) || (dst port 30692) || (dst port 58687) || (dst port 62198)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.6.255/32) || (dst net 230.0.56.252/32) || (dst net 230.0.71.170/32) || (dst net 230.0.85.97/32) || (dst net 230.0.241.28/32))),
	((dst port 1743) || (dst port 10034) || (dst port 22885) || (dst port 39836) || (dst port 61028)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.135.71/32) || (dst net 231.0.154.235/32) || (dst net 231.0.160.248/32) || (dst net 231.0.171.60/32) || (dst net 231.0.232.38/32))),
	((dst port 19826) || (dst port 22865) || (dst port 53379) || (dst port 55060) || (dst port 58371)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.25.178/32) || (dst net 232.0.35.251/32) || (dst net 232.0.84.219/32) || (dst net 232.0.95.239/32) || (dst net 232.0.233.170/32))),
	((dst port 41766) || (dst port 41879) || (dst port 49911) || (dst port 56623) || (dst port 58942)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.1.89/32) || (dst net 233.0.37.38/32) || (dst net 233.0.122.205/32) || (dst net 233.0.229.35/32) || (dst net 233.0.248.142/32))),
	((dst port 5487) || (dst port 24449) || (dst port 39004) || (dst port 40987) || (dst port 62721)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.40.128/32) || (dst net 234.0.91.68/32) || (dst net 234.0.179.221/32) || (dst net 234.0.248.128/32) || (dst net 234.0.249.104/32))),
	((dst port 5643) || (dst port 12463) || (dst port 22706) || (dst port 44992) || (dst port 47240)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.19.86/32) || (dst net 235.0.75.76/32) || (dst net 235.0.118.35/32) || (dst net 235.0.124.123/32) || (dst net 235.0.135.32/32))),
	((dst port 9703) || (dst port 28863) || (dst port 57422) || (dst port 59997) || (dst port 61821)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.2.20/32) || (dst net 236.0.92.166/32) || (dst net 236.0.123.248/32) || (dst net 236.0.151.207/32) || (dst net 236.0.154.16/32))),
	((dst port 19396) || (dst port 37262) || (dst port 38407) || (dst port 53766) || (dst port 54868)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.62.164/32) || (dst net 237.0.103.26/32) || (dst net 237.0.177.221/32) || (dst net 237.0.222.118/32) || (dst net 237.0.224.165/32))),
	((dst port 5188) || (dst port 13142) || (dst port 17956) || (dst port 44668) || (dst port 51724)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.40.61/32) || (dst net 238.0.133.47/32) || (dst net 238.0.164.4/32) || (dst net 238.0.198.243/32) || (dst net 238.0.229.88/32))),
	((dst port 14136) || (dst port 23703) || (dst port 33361) || (dst port 44671) || (dst port 61740)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.80.40/32) || (dst net 239.0.165.255/32) || (dst net 239.0.166.11/32) || (dst net 239.0.183.244/32) || (dst net 239.0.214.250/32))),
	((dst port 37527) || (dst port 54235) || (dst port 55953) || (dst port 59781) || (dst port 62944)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.58.77/32) || (dst net 240.0.93.188/32) || (dst net 240.0.112.115/32) || (dst net 240.0.143.9/32) || (dst net 240.0.169.6/32))),
	((dst port 23078) || (dst port 30085) || (dst port 31314) || (dst port 38232) || (dst port 44681)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.69.175/32) || (dst net 241.0.204.98/32) || (dst net 241.0.208.254/32) || (dst net 241.0.233.221/32) || (dst net 241.0.238.105/32))),
	((dst port 4646) || (dst port 34529) || (dst port 44935) || (dst port 56561) || (dst port 56688)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.20.151/32) || (dst net 242.0.36.198/32) || (dst net 242.0.55.50/32) || (dst net 242.0.77.144/32) || (dst net 242.0.210.99/32))),
	((dst port 23109) || (dst port 23774) || (dst port 46593) || (dst port 48187) || (dst port 59952)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.55.128/32) || (dst net 243.0.94.61/32) || (dst net 243.0.162.210/32) || (dst net 243.0.203.63/32) || (dst net 243.0.203.180/32))),
	((dst port 18314) || (dst port 26605) || (dst port 53351) || (dst port 55740) || (dst port 56527)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.73.196/32) || (dst net 244.0.145.101/32) || (dst net 244.0.155.89/32) || (dst net 244.0.180.126/32) || (dst net 244.0.190.234/32))),
	((dst port 1834) || (dst port 20308) || (dst port 31174) || (dst port 35245) || (dst port 42212)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.27.39/32) || (dst net 245.0.83.19/32) || (dst net 245.0.89.158/32) || (dst net 245.0.177.20/32) || (dst net 245.0.222.222/32))),
	((dst port 7175) || (dst port 10390) || (dst port 20230) || (dst port 32625) || (dst port 51582)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.65.104/32) || (dst net 246.0.148.37/32) || (dst net 246.0.195.148/32) || (dst net 246.0.238.95/32) || (dst net 246.0.248.226/32))),
	((dst port 4523) || (dst port 9961) || (dst port 11462) || (dst port 41283) || (dst port 62633)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.6.78/32) || (dst net 247.0.28.206/32) || (dst net 247.0.36.9/32) || (dst net 247.0.245.154/32) || (dst net 247.0.251.112/32))),
	((dst port 39095) || (dst port 42210) || (dst port 47611) || (dst port 55249) || (dst port 56290)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.111.217/32) || (dst net 248.0.179.145/32) || (dst net 248.0.196.67/32) || (dst net 248.0.202.227/32) || (dst net 248.0.249.182/32))),
	((dst port 36477) || (dst port 37495) || (dst port 49872) || (dst port 50657) || (dst port 59184)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.46.33/32) || (dst net 249.0.71.158/32) || (dst net 249.0.109.240/32) || (dst net 249.0.158.25/32) || (dst net 249.0.207.130/32))),
	((dst port 13874) || (dst port 49214) || (dst port 60120) || (dst port 64465) || (dst port 65128)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.54.199/32) || (dst net 250.0.126.53/32) || (dst net 250.0.130.96/32) || (dst net 250.0.197.170/32) || (dst net 250.0.220.36/32))),
	((dst port 2927) || (dst port 19750) || (dst port 40398) || (dst port 45828) || (dst port 52398)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.56.90/32) || (dst net 251.0.58.237/32) || (dst net 251.0.115.13/32) || (dst net 251.0.164.159/32) || (dst net 251.0.220.24/32))),
	((dst port 1739) || (dst port 35534) || (dst port 37345) || (dst port 48647) || (dst port 52664)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.33.234/32) || (dst net 252.0.160.205/32) || (dst net 252.0.171.1/32) || (dst net 252.0.171.103/32) || (dst net 252.0.242.190/32))),
	((dst port 31295) || (dst port 42334) || (dst port 43817) || (dst port 53668) || (dst port 56443)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.44.148/32) || (dst net 253.0.48.169/32) || (dst net 253.0.72.171/32) || (dst net 253.0.208.62/32) || (dst net 253.0.229.192/32))),
	((dst port 2673) || (dst port 35676) || (dst port 40201) || (dst port 48068) || (dst port 53522)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.38.89/32) || (dst net 254.0.55.181/32) || (dst net 254.0.90.102/32) || (dst net 254.0.150.18/32) || (dst net 254.0.215.210/32))),
	((dst port 3335) || (dst port 11944) || (dst port 18263) || (dst port 32683) || (dst port 61830)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.63.116/32) || (dst net 255.0.72.220/32) || (dst net 255.0.86.202/32) || (dst net 255.0.232.28/32) || (dst net 255.0.252.153/32))),
	((dst port 16931) || (dst port 36639) || (dst port 37299) || (dst port 61087) || (dst port 63430)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.17.174/32) || (dst net 0.0.114.241/32) || (dst net 0.0.177.62/32) || (dst net 0.0.195.10/32) || (dst net 0.0.253.62/32))),
	((dst port 547) || (dst port 26405) || (dst port 31675) || (dst port 39757) || (dst port 45978)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.20.23/32) || (dst net 1.0.39.219/32) || (dst net 1.0.125.198/32) || (dst net 1.0.148.154/32) || (dst net 1.0.205.16/32))),
	((dst port 2627) || (dst port 23305) || (dst port 42157) || (dst port 54826) || (dst port 63905)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.38.170/32) || (dst net 2.0.45.113/32) || (dst net 2.0.82.20/32) || (dst net 2.0.98.47/32) || (dst net 2.0.169.164/32))),
	((dst port 14661) || (dst port 14797) || (dst port 21511) || (dst port 37252) || (dst port 48377)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.10.190/32) || (dst net 3.0.22.29/32) || (dst net 3.0.33.193/32) || (dst net 3.0.189.211/32) || (dst net 3.0.236.129/32))),
	((dst port 2263) || (dst port 3151) || (dst port 15079) || (dst port 35398) || (dst port 46079)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.79.133/32) || (dst net 4.0.160.164/32) || (dst net 4.0.170.122/32) || (dst net 4.0.211.139/32) || (dst net 4.0.252.10/32))),
	((dst port 11659) || (dst port 11739) || (dst port 36308) || (dst port 38815) || (dst port 63457)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.1.193/32) || (dst net 5.0.24.140/32) || (dst net 5.0.29.98/32) || (dst net 5.0.58.110/32) || (dst net 5.0.170.195/32))),
	((dst port 17242) || (dst port 34898) || (dst port 47935) || (dst port 53922) || (dst port 65278)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.0.2/32) || (dst net 6.0.105.186/32) || (dst net 6.0.155.43/32) || (dst net 6.0.194.173/32) || (dst net 6.0.225.68/32))),
	((dst port 8518) || (dst port 17032) || (dst port 32300) || (dst port 58171) || (dst port 64152)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.13.142/32) || (dst net 7.0.21.255/32) || (dst net 7.0.54.93/32) || (dst net 7.0.122.8/32) || (dst net 7.0.144.220/32))),
	((dst port 74) || (dst port 7443) || (dst port 38318) || (dst port 47720) || (dst port 64280)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.48.146/32) || (dst net 8.0.151.163/32) || (dst net 8.0.188.209/32) || (dst net 8.0.208.157/32) || (dst net 8.0.229.166/32))),
	((dst port 4009) || (dst port 7343) || (dst port 14556) || (dst port 52072) || (dst port 60567)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.114.185/32) || (dst net 9.0.128.187/32) || (dst net 9.0.184.98/32) || (dst net 9.0.190.219/32) || (dst net 9.0.200.32/32))),
	((dst port 20513) || (dst port 24802) || (dst port 32721) || (dst port 34349) || (dst port 52347)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.10.11/32) || (dst net 10.0.42.93/32) || (dst net 10.0.102.186/32) || (dst net 10.0.136.145/32) || (dst net 10.0.218.64/32))),
	((dst port 17248) || (dst port 22224) || (dst port 32014) || (dst port 50682) || (dst port 64081)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.10.153/32) || (dst net 11.0.81.137/32) || (dst net 11.0.217.252/32) || (dst net 11.0.224.152/32) || (dst net 11.0.238.160/32))),
	((dst port 7047) || (dst port 12954) || (dst port 16819) || (dst port 26133) || (dst port 57690)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.99.4/32) || (dst net 12.0.121.224/32) || (dst net 12.0.156.157/32) || (dst net 12.0.206.245/32) || (dst net 12.0.245.66/32))),
	((dst port 15998) || (dst port 20323) || (dst port 28525) || (dst port 55446) || (dst port 62240)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.25.85/32) || (dst net 13.0.52.21/32) || (dst net 13.0.103.78/32) || (dst net 13.0.158.42/32) || (dst net 13.0.174.113/32))),
	((dst port 13501) || (dst port 21438) || (dst port 25063) || (dst port 32510) || (dst port 51282)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.2.160/32) || (dst net 14.0.54.92/32) || (dst net 14.0.98.103/32) || (dst net 14.0.192.228/32) || (dst net 14.0.224.66/32))),
	((dst port 256) || (dst port 6968) || (dst port 13941) || (dst port 24184) || (dst port 45762)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.37.232/32) || (dst net 15.0.83.110/32) || (dst net 15.0.87.141/32) || (dst net 15.0.177.207/32) || (dst net 15.0.233.251/32))),
	((dst port 9676) || (dst port 39449) || (dst port 45639) || (dst port 56015) || (dst port 58599)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.16.241/32) || (dst net 16.0.65.90/32) || (dst net 16.0.106.104/32) || (dst net 16.0.172.148/32) || (dst net 16.0.252.176/32))),
	((dst port 6217) || (dst port 15184) || (dst port 32231) || (dst port 37712) || (dst port 47574)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.7.203/32) || (dst net 17.0.91.221/32) || (dst net 17.0.183.176/32) || (dst net 17.0.191.251/32) || (dst net 17.0.210.230/32))),
	((dst port 13179) || (dst port 24972) || (dst port 29723) || (dst port 59986) || (dst port 63987)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.93.86/32) || (dst net 18.0.115.67/32) || (dst net 18.0.180.61/32) || (dst net 18.0.206.231/32) || (dst net 18.0.228.228/32))),
	((dst port 22147) || (dst port 36500) || (dst port 42086) || (dst port 49101) || (dst port 59905)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.1.97/32) || (dst net 19.0.24.15/32) || (dst net 19.0.99.162/32) || (dst net 19.0.172.121/32) || (dst net 19.0.250.103/32))),
	((dst port 16418) || (dst port 41580) || (dst port 55722) || (dst port 57224) || (dst port 65423)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.99.71/32) || (dst net 20.0.170.246/32) || (dst net 20.0.185.15/32) || (dst net 20.0.208.91/32) || (dst net 20.0.211.201/32))),
	((dst port 574) || (dst port 16781) || (dst port 44503) || (dst port 48071) || (dst port 50286)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.91.169/32) || (dst net 21.0.135.254/32) || (dst net 21.0.138.7/32) || (dst net 21.0.153.40/32) || (dst net 21.0.227.30/32))),
	((dst port 1163) || (dst port 12422) || (dst port 19804) || (dst port 27019) || (dst port 50342)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.12.123/32) || (dst net 22.0.139.21/32) || (dst net 22.0.211.174/32) || (dst net 22.0.238.197/32) || (dst net 22.0.251.69/32))),
	((dst port 28578) || (dst port 41390) || (dst port 45739) || (dst port 49099) || (dst port 53257)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.62.215/32) || (dst net 23.0.64.176/32) || (dst net 23.0.168.116/32) || (dst net 23.0.171.218/32) || (dst net 23.0.221.206/32))),
	((dst port 11714) || (dst port 15284) || (dst port 18334) || (dst port 37824) || (dst port 58043)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.5.138/32) || (dst net 24.0.123.160/32) || (dst net 24.0.130.231/32) || (dst net 24.0.208.130/32) || (dst net 24.0.215.100/32))),
	((dst port 1645) || (dst port 7138) || (dst port 46897) || (dst port 47604) || (dst port 51794)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.14.138/32) || (dst net 25.0.48.209/32) || (dst net 25.0.66.250/32) || (dst net 25.0.185.105/32) || (dst net 25.0.244.0/32))),
	((dst port 1013) || (dst port 53425) || (dst port 54412) || (dst port 58807) || (dst port 59953)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.4.168/32) || (dst net 26.0.18.123/32) || (dst net 26.0.115.213/32) || (dst net 26.0.129.47/32) || (dst net 26.0.166.230/32))),
	((dst port 6965) || (dst port 17863) || (dst port 25502) || (dst port 31056) || (dst port 62665)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.63.224/32) || (dst net 27.0.121.237/32) || (dst net 27.0.132.214/32) || (dst net 27.0.193.70/32) || (dst net 27.0.243.102/32))),
	((dst port 12071) || (dst port 16577) || (dst port 28330) || (dst port 45943) || (dst port 61515)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.19.66/32) || (dst net 28.0.87.126/32) || (dst net 28.0.89.237/32) || (dst net 28.0.113.3/32) || (dst net 28.0.211.172/32))),
	((dst port 7075) || (dst port 28086) || (dst port 39564) || (dst port 48103) || (dst port 63847)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.86.128/32) || (dst net 29.0.166.61/32) || (dst net 29.0.193.254/32) || (dst net 29.0.226.143/32) || (dst net 29.0.230.51/32))),
	((dst port 11236) || (dst port 34466) || (dst port 44044) || (dst port 53508) || (dst port 55878)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.14.10/32) || (dst net 30.0.130.40/32) || (dst net 30.0.149.176/32) || (dst net 30.0.202.94/32) || (dst net 30.0.219.94/32))),
	((dst port 3253) || (dst port 12261) || (dst port 16515) || (dst port 18967) || (dst port 29101)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.33.187/32) || (dst net 31.0.51.178/32) || (dst net 31.0.104.2/32) || (dst net 31.0.115.89/32) || (dst net 31.0.208.238/32))),
	((dst port 234) || (dst port 5788) || (dst port 34022) || (dst port 55555) || (dst port 57107)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.16.149/32) || (dst net 32.0.165.56/32) || (dst net 32.0.192.49/32) || (dst net 32.0.218.116/32) || (dst net 32.0.220.46/32))),
	((dst port 14060) || (dst port 40229) || (dst port 45527) || (dst port 45633) || (dst port 46661)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.28.58/32) || (dst net 33.0.59.118/32) || (dst net 33.0.82.35/32) || (dst net 33.0.88.13/32) || (dst net 33.0.176.155/32))),
	((dst port 2803) || (dst port 3043) || (dst port 9163) || (dst port 24324) || (dst port 54751)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.28.192/32) || (dst net 34.0.45.245/32) || (dst net 34.0.118.42/32) || (dst net 34.0.118.153/32) || (dst net 34.0.132.192/32))),
	((dst port 3315) || (dst port 13002) || (dst port 18226) || (dst port 25726) || (dst port 39096)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.58.45/32) || (dst net 35.0.109.236/32) || (dst net 35.0.162.119/32) || (dst net 35.0.236.61/32) || (dst net 35.0.241.243/32))),
	((dst port 27210) || (dst port 34279) || (dst port 49236) || (dst port 61874) || (dst port 62262)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.10.83/32) || (dst net 36.0.40.98/32) || (dst net 36.0.56.37/32) || (dst net 36.0.162.88/32) || (dst net 36.0.243.10/32))),
	((dst port 4120) || (dst port 24595) || (dst port 36716) || (dst port 46310) || (dst port 50253)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.3.130/32) || (dst net 37.0.134.99/32) || (dst net 37.0.168.185/32) || (dst net 37.0.176.40/32) || (dst net 37.0.183.72/32))),
	((dst port 14483) || (dst port 18617) || (dst port 21000) || (dst port 21978) || (dst port 27411)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.27.248/32) || (dst net 38.0.32.165/32) || (dst net 38.0.86.34/32) || (dst net 38.0.166.105/32) || (dst net 38.0.213.205/32))),
	((dst port 18882) || (dst port 33082) || (dst port 54761) || (dst port 55360) || (dst port 62290)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.75.175/32) || (dst net 39.0.118.203/32) || (dst net 39.0.142.58/32) || (dst net 39.0.196.251/32) || (dst net 39.0.240.90/32))),
	((dst port 1215) || (dst port 4537) || (dst port 48201) || (dst port 50755) || (dst port 63159)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.53.62/32) || (dst net 40.0.62.33/32) || (dst net 40.0.144.68/32) || (dst net 40.0.153.137/32) || (dst net 40.0.217.196/32))),
	((dst port 22640) || (dst port 36638) || (dst port 47283) || (dst port 50500) || (dst port 50522)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.42.97/32) || (dst net 41.0.72.188/32) || (dst net 41.0.74.100/32) || (dst net 41.0.99.249/32) || (dst net 41.0.190.56/32))),
	((dst port 17730) || (dst port 34835) || (dst port 49644) || (dst port 54915) || (dst port 62268)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.10.78/32) || (dst net 42.0.47.101/32) || (dst net 42.0.82.12/32) || (dst net 42.0.144.220/32) || (dst net 42.0.164.98/32))),
	((dst port 6663) || (dst port 24779) || (dst port 34529) || (dst port 47093) || (dst port 55475)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.4.70/32) || (dst net 43.0.45.195/32) || (dst net 43.0.49.70/32) || (dst net 43.0.85.38/32) || (dst net 43.0.107.228/32))),
	((dst port 16924) || (dst port 21231) || (dst port 37096) || (dst port 54529) || (dst port 63196)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.51.17/32) || (dst net 44.0.70.2/32) || (dst net 44.0.82.245/32) || (dst net 44.0.104.100/32) || (dst net 44.0.200.114/32))),
	((dst port 11642) || (dst port 21224) || (dst port 44484) || (dst port 57596) || (dst port 60228)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.109.145/32) || (dst net 45.0.113.210/32) || (dst net 45.0.115.242/32) || (dst net 45.0.150.3/32) || (dst net 45.0.218.61/32))),
	((dst port 27330) || (dst port 42223) || (dst port 46705) || (dst port 56419) || (dst port 62054)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.74.138/32) || (dst net 46.0.121.29/32) || (dst net 46.0.131.243/32) || (dst net 46.0.153.70/32) || (dst net 46.0.187.58/32))),
	((dst port 3482) || (dst port 6288) || (dst port 28247) || (dst port 45537) || (dst port 56387)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.11.14/32) || (dst net 47.0.59.182/32) || (dst net 47.0.65.108/32) || (dst net 47.0.177.112/32) || (dst net 47.0.241.208/32))),
	((dst port 1314) || (dst port 3752) || (dst port 17480) || (dst port 42029) || (dst port 47156)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.14.44/32) || (dst net 48.0.56.168/32) || (dst net 48.0.143.45/32) || (dst net 48.0.179.44/32) || (dst net 48.0.230.162/32))),
	((dst port 2590) || (dst port 15957) || (dst port 17465) || (dst port 33545) || (dst port 35754)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.55.119/32) || (dst net 49.0.114.248/32) || (dst net 49.0.120.68/32) || (dst net 49.0.243.196/32) || (dst net 49.0.251.166/32))),
	((dst port 8996) || (dst port 10109) || (dst port 18880) || (dst port 28919) || (dst port 52947)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.7.70/32) || (dst net 50.0.114.100/32) || (dst net 50.0.177.133/32) || (dst net 50.0.238.20/32) || (dst net 50.0.244.88/32))),
	((dst port 17742) || (dst port 18333) || (dst port 30775) || (dst port 39057) || (dst port 59090)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.2.165/32) || (dst net 51.0.46.223/32) || (dst net 51.0.71.35/32) || (dst net 51.0.90.95/32) || (dst net 51.0.190.143/32))),
	((dst port 8790) || (dst port 14486) || (dst port 20461) || (dst port 21911) || (dst port 56239)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.10.129/32) || (dst net 52.0.45.13/32) || (dst net 52.0.47.17/32) || (dst net 52.0.187.36/32) || (dst net 52.0.191.34/32))),
	((dst port 12246) || (dst port 16643) || (dst port 33061) || (dst port 35950) || (dst port 38203)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.17.174/32) || (dst net 53.0.100.123/32) || (dst net 53.0.176.154/32) || (dst net 53.0.179.205/32) || (dst net 53.0.183.80/32))),
	((dst port 13292) || (dst port 19048) || (dst port 22707) || (dst port 54835) || (dst port 55318)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.60.181/32) || (dst net 54.0.64.100/32) || (dst net 54.0.86.128/32) || (dst net 54.0.116.50/32) || (dst net 54.0.250.107/32))),
	((dst port 3672) || (dst port 3979) || (dst port 38468) || (dst port 45366) || (dst port 56464)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.40.57/32) || (dst net 55.0.40.235/32) || (dst net 55.0.109.219/32) || (dst net 55.0.110.253/32) || (dst net 55.0.136.228/32))),
	((dst port 1128) || (dst port 10947) || (dst port 26155) || (dst port 35210) || (dst port 37087)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.26.81/32) || (dst net 56.0.91.202/32) || (dst net 56.0.180.33/32) || (dst net 56.0.184.19/32) || (dst net 56.0.185.241/32))),
	((dst port 14008) || (dst port 26853) || (dst port 35612) || (dst port 43074) || (dst port 44353)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.5.201/32) || (dst net 57.0.70.138/32) || (dst net 57.0.109.38/32) || (dst net 57.0.181.165/32) || (dst net 57.0.244.186/32))),
	((dst port 5123) || (dst port 10084) || (dst port 13830) || (dst port 49839) || (dst port 54883)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.27.174/32) || (dst net 58.0.89.69/32) || (dst net 58.0.101.161/32) || (dst net 58.0.104.220/32) || (dst net 58.0.150.93/32))),
	((dst port 28407) || (dst port 33974) || (dst port 35347) || (dst port 55182) || (dst port 64218)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.35.92/32) || (dst net 59.0.147.222/32) || (dst net 59.0.186.41/32) || (dst net 59.0.187.5/32) || (dst net 59.0.226.57/32))),
	((dst port 17886) || (dst port 21163) || (dst port 26942) || (dst port 30822) || (dst port 39534)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.13.152/32) || (dst net 60.0.19.14/32) || (dst net 60.0.41.9/32) || (dst net 60.0.144.72/32) || (dst net 60.0.252.125/32))),
	((dst port 8609) || (dst port 10532) || (dst port 13030) || (dst port 57657) || (dst port 58508)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.66.70/32) || (dst net 61.0.90.246/32) || (dst net 61.0.110.244/32) || (dst net 61.0.205.140/32) || (dst net 61.0.227.46/32))),
	((dst port 7657) || (dst port 35260) || (dst port 36996) || (dst port 37945) || (dst port 47676)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.157.252/32) || (dst net 62.0.216.176/32) || (dst net 62.0.218.81/32) || (dst net 62.0.219.110/32) || (dst net 62.0.235.4/32))),
	((dst port 3571) || (dst port 5618) || (dst port 48450) || (dst port 55432) || (dst port 60948)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.30.237/32) || (dst net 63.0.71.241/32) || (dst net 63.0.131.17/32) || (dst net 63.0.151.128/32) || (dst net 63.0.188.132/32))),
	((dst port 11638) || (dst port 29663) || (dst port 34665) || (dst port 42280) || (dst port 47403)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.41.51/32) || (dst net 64.0.94.64/32) || (dst net 64.0.183.210/32) || (dst net 64.0.215.201/32) || (dst net 64.0.239.143/32))),
	((dst port 25716) || (dst port 49381) || (dst port 53987) || (dst port 54231) || (dst port 60452)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.17.116/32) || (dst net 65.0.85.61/32) || (dst net 65.0.89.247/32) || (dst net 65.0.231.113/32) || (dst net 65.0.244.184/32))),
	((dst port 397) || (dst port 3825) || (dst port 22164) || (dst port 62309) || (dst port 64293)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.3.212/32) || (dst net 66.0.112.166/32) || (dst net 66.0.136.187/32) || (dst net 66.0.142.93/32) || (dst net 66.0.236.25/32))),
	((dst port 12206) || (dst port 12755) || (dst port 14708) || (dst port 26181) || (dst port 55915)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.19.91/32) || (dst net 67.0.203.78/32) || (dst net 67.0.210.212/32) || (dst net 67.0.229.147/32) || (dst net 67.0.242.110/32))),
	((dst port 7859) || (dst port 10634) || (dst port 15309) || (dst port 31743) || (dst port 40844)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.104.70/32) || (dst net 68.0.107.63/32) || (dst net 68.0.142.11/32) || (dst net 68.0.209.192/32) || (dst net 68.0.225.215/32))),
	((dst port 6754) || (dst port 9773) || (dst port 18664) || (dst port 28426) || (dst port 55220)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.45.38/32) || (dst net 69.0.103.100/32) || (dst net 69.0.143.182/32) || (dst net 69.0.178.60/32) || (dst net 69.0.223.48/32))),
	((dst port 8577) || (dst port 24099) || (dst port 35388) || (dst port 39329) || (dst port 41312)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.0.146/32) || (dst net 70.0.14.169/32) || (dst net 70.0.126.175/32) || (dst net 70.0.139.106/32) || (dst net 70.0.172.4/32))),
	((dst port 33195) || (dst port 37196) || (dst port 53593) || (dst port 61655) || (dst port 62151)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.62.238/32) || (dst net 71.0.90.45/32) || (dst net 71.0.122.146/32) || (dst net 71.0.234.90/32) || (dst net 71.0.242.152/32))),
	((dst port 17850) || (dst port 32723) || (dst port 32850) || (dst port 47037) || (dst port 61318)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.31.211/32) || (dst net 72.0.87.157/32) || (dst net 72.0.113.82/32) || (dst net 72.0.167.123/32) || (dst net 72.0.216.185/32))),
	((dst port 3394) || (dst port 15928) || (dst port 40254) || (dst port 40568) || (dst port 60283)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.19.18/32) || (dst net 73.0.137.232/32) || (dst net 73.0.206.125/32) || (dst net 73.0.218.84/32) || (dst net 73.0.246.93/32))),
	((dst port 21278) || (dst port 27851) || (dst port 34429) || (dst port 48504) || (dst port 60172)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.16.12/32) || (dst net 74.0.57.126/32) || (dst net 74.0.164.253/32) || (dst net 74.0.167.10/32) || (dst net 74.0.199.100/32))),
	((dst port 446) || (dst port 4609) || (dst port 33441) || (dst port 37227) || (dst port 58835)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.31.39/32) || (dst net 75.0.64.180/32) || (dst net 75.0.78.48/32) || (dst net 75.0.81.38/32) || (dst net 75.0.254.164/32))),
	((dst port 8439) || (dst port 20708) || (dst port 34044) || (dst port 44625) || (dst port 45005)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.26.154/32) || (dst net 76.0.134.162/32) || (dst net 76.0.214.143/32) || (dst net 76.0.221.7/32) || (dst net 76.0.221.24/32))),
	((dst port 24236) || (dst port 26382) || (dst port 31912) || (dst port 50100) || (dst port 64272)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.60.8/32) || (dst net 77.0.64.155/32) || (dst net 77.0.128.162/32) || (dst net 77.0.145.63/32) || (dst net 77.0.216.100/32))),
	((dst port 12967) || (dst port 23725) || (dst port 26268) || (dst port 38650) || (dst port 49765)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.11.250/32) || (dst net 78.0.85.243/32) || (dst net 78.0.175.9/32) || (dst net 78.0.199.138/32) || (dst net 78.0.215.136/32))),
	((dst port 28467) || (dst port 31897) || (dst port 37740) || (dst port 47095) || (dst port 62810)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.36.62/32) || (dst net 79.0.87.211/32) || (dst net 79.0.117.156/32) || (dst net 79.0.217.92/32) || (dst net 79.0.231.220/32))),
	((dst port 1913) || (dst port 3478) || (dst port 11163) || (dst port 45856) || (dst port 51325)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.86.240/32) || (dst net 80.0.123.2/32) || (dst net 80.0.149.62/32) || (dst net 80.0.184.165/32) || (dst net 80.0.219.31/32))),
	((dst port 3112) || (dst port 9640) || (dst port 10926) || (dst port 17939) || (dst port 35153)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.27.94/32) || (dst net 81.0.32.243/32) || (dst net 81.0.88.3/32) || (dst net 81.0.230.38/32) || (dst net 81.0.237.89/32))),
	((dst port 5602) || (dst port 15861) || (dst port 42378) || (dst port 42777) || (dst port 48686)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.0.113/32) || (dst net 82.0.57.217/32) || (dst net 82.0.58.11/32) || (dst net 82.0.203.152/32) || (dst net 82.0.215.149/32))),
	((dst port 3453) || (dst port 36822) || (dst port 45489) || (dst port 47336) || (dst port 49525)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.43.249/32) || (dst net 83.0.121.66/32) || (dst net 83.0.155.150/32) || (dst net 83.0.216.250/32) || (dst net 83.0.221.44/32))),
	((dst port 2902) || (dst port 5651) || (dst port 9078) || (dst port 25912) || (dst port 46712)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.47.20/32) || (dst net 84.0.53.170/32) || (dst net 84.0.64.147/32) || (dst net 84.0.136.106/32) || (dst net 84.0.179.92/32))),
	((dst port 1563) || (dst port 2439) || (dst port 2585) || (dst port 4933) || (dst port 39088)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.6.37/32) || (dst net 85.0.37.210/32) || (dst net 85.0.63.96/32) || (dst net 85.0.159.84/32) || (dst net 85.0.188.182/32))),
	((dst port 7078) || (dst port 12512) || (dst port 17684) || (dst port 26538) || (dst port 42762)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.44.178/32) || (dst net 86.0.72.253/32) || (dst net 86.0.193.182/32) || (dst net 86.0.233.56/32) || (dst net 86.0.241.42/32))),
	((dst port 7176) || (dst port 21213) || (dst port 23129) || (dst port 24270) || (dst port 40886)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.40.187/32) || (dst net 87.0.46.26/32) || (dst net 87.0.46.67/32) || (dst net 87.0.178.202/32) || (dst net 87.0.187.169/32))),
	((dst port 4886) || (dst port 11842) || (dst port 12108) || (dst port 18842) || (dst port 25994)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.0.55/32) || (dst net 88.0.24.81/32) || (dst net 88.0.44.234/32) || (dst net 88.0.97.219/32) || (dst net 88.0.196.57/32))),
	((dst port 15570) || (dst port 18231) || (dst port 34741) || (dst port 62439) || (dst port 62836)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.7.189/32) || (dst net 89.0.17.224/32) || (dst net 89.0.85.222/32) || (dst net 89.0.117.104/32) || (dst net 89.0.191.164/32))),
	((dst port 727) || (dst port 32055) || (dst port 33234) || (dst port 34929) || (dst port 44085)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.33.160/32) || (dst net 90.0.59.137/32) || (dst net 90.0.119.205/32) || (dst net 90.0.148.194/32) || (dst net 90.0.168.88/32))),
	((dst port 27840) || (dst port 28928) || (dst port 35144) || (dst port 35716) || (dst port 40384)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.26.15/32) || (dst net 91.0.82.88/32) || (dst net 91.0.184.131/32) || (dst net 91.0.218.204/32) || (dst net 91.0.226.154/32))),
	((dst port 21632) || (dst port 46464) || (dst port 47449) || (dst port 48866) || (dst port 52848)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.52.138/32) || (dst net 92.0.88.115/32) || (dst net 92.0.186.178/32) || (dst net 92.0.190.162/32) || (dst net 92.0.222.161/32))),
	((dst port 47045) || (dst port 50318) || (dst port 53718) || (dst port 54704) || (dst port 59012)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.10.114/32) || (dst net 93.0.136.212/32) || (dst net 93.0.170.206/32) || (dst net 93.0.208.181/32) || (dst net 93.0.214.104/32))),
	((dst port 7179) || (dst port 15072) || (dst port 20897) || (dst port 27239) || (dst port 41436)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.14.146/32) || (dst net 94.0.167.93/32) || (dst net 94.0.173.33/32) || (dst net 94.0.176.87/32) || (dst net 94.0.220.201/32))),
	((dst port 14079) || (dst port 27101) || (dst port 40323) || (dst port 47767) || (dst port 51439)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.49.178/32) || (dst net 95.0.100.121/32) || (dst net 95.0.108.40/32) || (dst net 95.0.136.1/32) || (dst net 95.0.184.69/32))),
	((dst port 5745) || (dst port 31413) || (dst port 44003) || (dst port 44493) || (dst port 49923)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.8.156/32) || (dst net 96.0.40.25/32) || (dst net 96.0.63.59/32) || (dst net 96.0.118.106/32) || (dst net 96.0.210.221/32))),
	((dst port 21817) || (dst port 27107) || (dst port 48986) || (dst port 49469) || (dst port 65473)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.80.59/32) || (dst net 97.0.91.166/32) || (dst net 97.0.143.85/32) || (dst net 97.0.227.19/32) || (dst net 97.0.247.77/32))),
	((dst port 5159) || (dst port 13296) || (dst port 22819) || (dst port 62509) || (dst port 65483)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.28.52/32) || (dst net 98.0.44.159/32) || (dst net 98.0.134.255/32) || (dst net 98.0.151.34/32) || (dst net 98.0.160.140/32))),
	((dst port 18360) || (dst port 31408) || (dst port 33545) || (dst port 42408) || (dst port 46619)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.19.223/32) || (dst net 99.0.32.182/32) || (dst net 99.0.35.33/32) || (dst net 99.0.136.154/32) || (dst net 99.0.142.248/32))),
	((dst port 3868) || (dst port 17543) || (dst port 30587) || (dst port 34464) || (dst port 64249)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.0.211/32) || (dst net 100.0.85.172/32) || (dst net 100.0.91.219/32) || (dst net 100.0.132.244/32) || (dst net 100.0.150.1/32))),
	((dst port 4831) || (dst port 27202) || (dst port 52141) || (dst port 62075) || (dst port 63701)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.20.24/32) || (dst net 101.0.44.137/32) || (dst net 101.0.189.172/32) || (dst net 101.0.225.1/32) || (dst net 101.0.241.253/32))),
	((dst port 14170) || (dst port 26457) || (dst port 32156) || (dst port 60719) || (dst port 61397)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.38.10/32) || (dst net 102.0.62.144/32) || (dst net 102.0.84.237/32) || (dst net 102.0.127.194/32) || (dst net 102.0.151.249/32))),
	((dst port 8476) || (dst port 25167) || (dst port 27384) || (dst port 43012) || (dst port 47543)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.17.193/32) || (dst net 103.0.74.9/32) || (dst net 103.0.149.50/32) || (dst net 103.0.161.26/32) || (dst net 103.0.226.141/32))),
	((dst port 1795) || (dst port 20990) || (dst port 30032) || (dst port 55743) || (dst port 59747)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.44.229/32) || (dst net 104.0.74.183/32) || (dst net 104.0.102.233/32) || (dst net 104.0.138.10/32) || (dst net 104.0.138.240/32))),
	((dst port 8211) || (dst port 20567) || (dst port 25771) || (dst port 49971) || (dst port 59749)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.45.153/32) || (dst net 105.0.52.1/32) || (dst net 105.0.134.236/32) || (dst net 105.0.191.248/32) || (dst net 105.0.212.107/32))),
	((dst port 15666) || (dst port 32330) || (dst port 46149) || (dst port 59888) || (dst port 64311)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.16.42/32) || (dst net 106.0.105.103/32) || (dst net 106.0.173.8/32) || (dst net 106.0.205.223/32) || (dst net 106.0.207.153/32))),
	((dst port 34134) || (dst port 34633) || (dst port 36103) || (dst port 44800) || (dst port 59534)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.31.91/32) || (dst net 107.0.91.5/32) || (dst net 107.0.125.174/32) || (dst net 107.0.135.255/32) || (dst net 107.0.178.10/32))),
	((dst port 4888) || (dst port 24686) || (dst port 43147) || (dst port 44145) || (dst port 57324)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.42.194/32) || (dst net 108.0.44.197/32) || (dst net 108.0.91.113/32) || (dst net 108.0.99.171/32) || (dst net 108.0.139.92/32))),
	((dst port 18774) || (dst port 29734) || (dst port 47545) || (dst port 64617) || (dst port 64954)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.102.114/32) || (dst net 109.0.128.95/32) || (dst net 109.0.165.94/32) || (dst net 109.0.165.232/32) || (dst net 109.0.199.38/32))),
	((dst port 764) || (dst port 23950) || (dst port 25285) || (dst port 30861) || (dst port 61552)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.60.247/32) || (dst net 110.0.152.132/32) || (dst net 110.0.197.218/32) || (dst net 110.0.225.125/32) || (dst net 110.0.246.182/32))),
	((dst port 12536) || (dst port 23817) || (dst port 37904) || (dst port 52860) || (dst port 59811)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.4.246/32) || (dst net 111.0.14.168/32) || (dst net 111.0.54.155/32) || (dst net 111.0.207.110/32) || (dst net 111.0.212.12/32))),
	((dst port 1271) || (dst port 3060) || (dst port 40332) || (dst port 54707) || (dst port 57988)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.50.228/32) || (dst net 112.0.53.148/32) || (dst net 112.0.72.130/32) || (dst net 112.0.104.87/32) || (dst net 112.0.211.74/32))),
	((dst port 14304) || (dst port 29405) || (dst port 48416) || (dst port 55909) || (dst port 61497)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.20.228/32) || (dst net 113.0.167.4/32) || (dst net 113.0.171.64/32) || (dst net 113.0.174.154/32) || (dst net 113.0.196.21/32))),
	((dst port 2990) || (dst port 44484) || (dst port 47249) || (dst port 61107) || (dst port 62383)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.151.111/32) || (dst net 114.0.165.251/32) || (dst net 114.0.195.127/32) || (dst net 114.0.201.3/32) || (dst net 114.0.208.232/32))),
	((dst port 302) || (dst port 12345) || (dst port 34499) || (dst port 37832) || (dst port 63251)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.12.57/32) || (dst net 115.0.48.50/32) || (dst net 115.0.105.175/32) || (dst net 115.0.148.250/32) || (dst net 115.0.250.167/32))),
	((dst port 19798) || (dst port 21575) || (dst port 37663) || (dst port 49121) || (dst port 59960)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.8.145/32) || (dst net 116.0.100.23/32) || (dst net 116.0.108.222/32) || (dst net 116.0.151.34/32) || (dst net 116.0.249.20/32))),
	((dst port 43422) || (dst port 43883) || (dst port 50871) || (dst port 57983) || (dst port 58174)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.39.13/32) || (dst net 117.0.86.93/32) || (dst net 117.0.171.173/32) || (dst net 117.0.218.201/32) || (dst net 117.0.253.35/32))),
	((dst port 6351) || (dst port 34813) || (dst port 45787) || (dst port 58033) || (dst port 60281)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.57.35/32) || (dst net 118.0.76.169/32) || (dst net 118.0.119.22/32) || (dst net 118.0.217.216/32) || (dst net 118.0.232.27/32))),
	((dst port 22390) || (dst port 37319) || (dst port 38216) || (dst port 39887) || (dst port 62151)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.30.152/32) || (dst net 119.0.55.34/32) || (dst net 119.0.126.106/32) || (dst net 119.0.147.112/32) || (dst net 119.0.181.161/32))),
	((dst port 3590) || (dst port 18674) || (dst port 25751) || (dst port 49310) || (dst port 53864)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.4.41/32) || (dst net 120.0.91.60/32) || (dst net 120.0.178.50/32) || (dst net 120.0.195.95/32) || (dst net 120.0.232.203/32))),
	((dst port 12600) || (dst port 14939) || (dst port 16606) || (dst port 19624) || (dst port 39974)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.93.14/32) || (dst net 121.0.97.89/32) || (dst net 121.0.157.229/32) || (dst net 121.0.223.184/32) || (dst net 121.0.253.155/32))),
	((dst port 9221) || (dst port 24133) || (dst port 60952) || (dst port 62133) || (dst port 65063)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.17.221/32) || (dst net 122.0.36.139/32) || (dst net 122.0.171.161/32) || (dst net 122.0.179.110/32) || (dst net 122.0.182.190/32))),
	((dst port 4658) || (dst port 13738) || (dst port 24062) || (dst port 47773) || (dst port 52612)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.17.136/32) || (dst net 123.0.81.211/32) || (dst net 123.0.162.150/32) || (dst net 123.0.182.93/32) || (dst net 123.0.218.65/32))),
	((dst port 16045) || (dst port 22169) || (dst port 28562) || (dst port 35973) || (dst port 47707)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.25.30/32) || (dst net 124.0.47.81/32) || (dst net 124.0.73.212/32) || (dst net 124.0.93.8/32) || (dst net 124.0.249.113/32))),
	((dst port 11754) || (dst port 29042) || (dst port 38565) || (dst port 47502) || (dst port 58891)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.64.28/32) || (dst net 125.0.111.105/32) || (dst net 125.0.162.142/32) || (dst net 125.0.208.4/32) || (dst net 125.0.236.224/32))),
	((dst port 16861) || (dst port 30481) || (dst port 32516) || (dst port 53614) || (dst port 57986)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.69.231/32) || (dst net 126.0.76.144/32) || (dst net 126.0.104.129/32) || (dst net 126.0.222.90/32) || (dst net 126.0.228.109/32))),
	((dst port 6846) || (dst port 9081) || (dst port 51519) || (dst port 58671) || (dst port 59013)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.2.184/32) || (dst net 127.0.10.212/32) || (dst net 127.0.85.237/32) || (dst net 127.0.131.203/32) || (dst net 127.0.161.190/32))),
	((dst port 4576) || (dst port 6321) || (dst port 29129) || (dst port 39830) || (dst port 62321)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.18.98/32) || (dst net 128.0.164.114/32) || (dst net 128.0.204.171/32) || (dst net 128.0.229.198/32) || (dst net 128.0.235.171/32))),
	((dst port 13660) || (dst port 17508) || (dst port 17523) || (dst port 55359) || (dst port 55993)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.0.73/32) || (dst net 129.0.2.32/32) || (dst net 129.0.9.211/32) || (dst net 129.0.159.185/32) || (dst net 129.0.193.228/32))),
	((dst port 6354) || (dst port 36860) || (dst port 44136) || (dst port 44239) || (dst port 56308)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.63.85/32) || (dst net 130.0.139.89/32) || (dst net 130.0.211.190/32) || (dst net 130.0.235.170/32) || (dst net 130.0.252.104/32))),
	((dst port 2128) || (dst port 9837) || (dst port 16529) || (dst port 57548) || (dst port 64337)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.38.136/32) || (dst net 131.0.160.11/32) || (dst net 131.0.176.111/32) || (dst net 131.0.235.32/32) || (dst net 131.0.253.19/32))),
	((dst port 2028) || (dst port 17301) || (dst port 40620) || (dst port 41317) || (dst port 61637)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.2.181/32) || (dst net 132.0.21.91/32) || (dst net 132.0.170.165/32) || (dst net 132.0.186.221/32) || (dst net 132.0.229.54/32))),
	((dst port 22889) || (dst port 25129) || (dst port 33464) || (dst port 49146) || (dst port 58291)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.33.245/32) || (dst net 133.0.104.211/32) || (dst net 133.0.122.250/32) || (dst net 133.0.206.222/32) || (dst net 133.0.239.77/32))),
	((dst port 4241) || (dst port 8644) || (dst port 24488) || (dst port 53030) || (dst port 60640)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.180.112/32) || (dst net 134.0.214.18/32) || (dst net 134.0.245.102/32) || (dst net 134.0.250.160/32) || (dst net 134.0.253.10/32))),
	((dst port 20327) || (dst port 22723) || (dst port 27636) || (dst port 49399) || (dst port 65090)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.12.211/32) || (dst net 135.0.37.143/32) || (dst net 135.0.53.232/32) || (dst net 135.0.204.13/32) || (dst net 135.0.247.179/32))),
	((dst port 14516) || (dst port 19490) || (dst port 23828) || (dst port 41011) || (dst port 48190)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.52.104/32) || (dst net 136.0.112.188/32) || (dst net 136.0.134.9/32) || (dst net 136.0.175.132/32) || (dst net 136.0.224.97/32))),
	((dst port 10167) || (dst port 30065) || (dst port 31570) || (dst port 36629) || (dst port 60899)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.24.17/32) || (dst net 137.0.174.202/32) || (dst net 137.0.176.251/32) || (dst net 137.0.202.44/32) || (dst net 137.0.254.170/32))),
	((dst port 2148) || (dst port 2477) || (dst port 54388) || (dst port 55926) || (dst port 60483)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.59.83/32) || (dst net 138.0.92.146/32) || (dst net 138.0.93.231/32) || (dst net 138.0.180.129/32) || (dst net 138.0.219.84/32))),
	((dst port 11602) || (dst port 14763) || (dst port 29112) || (dst port 54031) || (dst port 56892)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.74.89/32) || (dst net 139.0.115.146/32) || (dst net 139.0.121.127/32) || (dst net 139.0.241.45/32) || (dst net 139.0.253.153/32))),
	((dst port 15390) || (dst port 29759) || (dst port 52323) || (dst port 54575) || (dst port 59252)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.4.85/32) || (dst net 140.0.81.206/32) || (dst net 140.0.133.89/32) || (dst net 140.0.137.87/32) || (dst net 140.0.171.73/32))),
	((dst port 5483) || (dst port 6579) || (dst port 7052) || (dst port 13282) || (dst port 45393)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.0.170/32) || (dst net 141.0.30.99/32) || (dst net 141.0.114.175/32) || (dst net 141.0.116.19/32) || (dst net 141.0.205.152/32))),
	((dst port 15286) || (dst port 19292) || (dst port 21999) || (dst port 30843) || (dst port 43437)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.13.205/32) || (dst net 142.0.50.94/32) || (dst net 142.0.58.91/32) || (dst net 142.0.88.205/32) || (dst net 142.0.224.72/32))),
	((dst port 4665) || (dst port 15035) || (dst port 34507) || (dst port 48785) || (dst port 50899)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.9.63/32) || (dst net 143.0.34.46/32) || (dst net 143.0.57.112/32) || (dst net 143.0.148.34/32) || (dst net 143.0.222.149/32))),
	((dst port 33461) || (dst port 34111) || (dst port 44737) || (dst port 54789) || (dst port 56521)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.48.211/32) || (dst net 144.0.85.65/32) || (dst net 144.0.102.81/32) || (dst net 144.0.227.166/32) || (dst net 144.0.245.78/32))),
	((dst port 3600) || (dst port 15196) || (dst port 29932) || (dst port 39242) || (dst port 41823)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.6.253/32) || (dst net 145.0.94.55/32) || (dst net 145.0.98.159/32) || (dst net 145.0.105.144/32) || (dst net 145.0.207.108/32))),
	((dst port 12699) || (dst port 21182) || (dst port 28365) || (dst port 35820) || (dst port 43668)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.26.122/32) || (dst net 146.0.50.46/32) || (dst net 146.0.84.28/32) || (dst net 146.0.210.198/32) || (dst net 146.0.250.168/32))),
	((dst port 14372) || (dst port 18386) || (dst port 51409) || (dst port 56043) || (dst port 57166)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.0.112/32) || (dst net 147.0.82.199/32) || (dst net 147.0.99.87/32) || (dst net 147.0.129.17/32) || (dst net 147.0.205.63/32))),
	((dst port 8087) || (dst port 30680) || (dst port 52128) || (dst port 62388) || (dst port 65210)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.2.133/32) || (dst net 148.0.44.227/32) || (dst net 148.0.95.224/32) || (dst net 148.0.112.62/32) || (dst net 148.0.196.136/32))),
	((dst port 44055) || (dst port 48781) || (dst port 50699) || (dst port 52360) || (dst port 54079)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.63.163/32) || (dst net 149.0.63.213/32) || (dst net 149.0.73.100/32) || (dst net 149.0.84.170/32) || (dst net 149.0.181.18/32))),
	((dst port 24537) || (dst port 25953) || (dst port 33328) || (dst port 52366) || (dst port 63531)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.24.231/32) || (dst net 150.0.100.34/32) || (dst net 150.0.138.53/32) || (dst net 150.0.217.161/32) || (dst net 150.0.218.168/32))),
	((dst port 2438) || (dst port 13283) || (dst port 24440) || (dst port 26441) || (dst port 46848)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.3.195/32) || (dst net 151.0.23.189/32) || (dst net 151.0.37.116/32) || (dst net 151.0.137.0/32) || (dst net 151.0.151.102/32))),
	((dst port 15113) || (dst port 19431) || (dst port 24897) || (dst port 59977) || (dst port 64466)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.22.214/32) || (dst net 152.0.117.56/32) || (dst net 152.0.119.183/32) || (dst net 152.0.154.50/32) || (dst net 152.0.240.204/32))),
	((dst port 11581) || (dst port 53091) || (dst port 58678) || (dst port 61681) || (dst port 62059)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.21.169/32) || (dst net 153.0.37.106/32) || (dst net 153.0.87.247/32) || (dst net 153.0.250.184/32) || (dst net 153.0.254.151/32))),
	((dst port 2792) || (dst port 6248) || (dst port 27353) || (dst port 32560) || (dst port 48274)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.3.80/32) || (dst net 154.0.33.149/32) || (dst net 154.0.134.109/32) || (dst net 154.0.171.157/32) || (dst net 154.0.176.74/32))),
	((dst port 17314) || (dst port 17375) || (dst port 35922) || (dst port 62098) || (dst port 64382)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.103.109/32) || (dst net 155.0.125.47/32) || (dst net 155.0.133.108/32) || (dst net 155.0.175.96/32) || (dst net 155.0.189.104/32))),
	((dst port 5679) || (dst port 23895) || (dst port 26909) || (dst port 48603) || (dst port 65044)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.13.81/32) || (dst net 156.0.112.203/32) || (dst net 156.0.166.175/32) || (dst net 156.0.225.12/32) || (dst net 156.0.253.12/32))),
	((dst port 28695) || (dst port 45338) || (dst port 57979) || (dst port 58282) || (dst port 59806)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.83.28/32) || (dst net 157.0.96.35/32) || (dst net 157.0.119.9/32) || (dst net 157.0.131.188/32) || (dst net 157.0.159.249/32))),
	((dst port 2064) || (dst port 5505) || (dst port 25085) || (dst port 49417) || (dst port 56423)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.14.139/32) || (dst net 158.0.52.178/32) || (dst net 158.0.108.243/32) || (dst net 158.0.182.139/32) || (dst net 158.0.207.116/32))),
	((dst port 5794) || (dst port 41539) || (dst port 43177) || (dst port 44723) || (dst port 56103)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.64.161/32) || (dst net 159.0.69.225/32) || (dst net 159.0.90.229/32) || (dst net 159.0.171.191/32) || (dst net 159.0.202.225/32))),
	((dst port 18845) || (dst port 31262) || (dst port 44274) || (dst port 56265) || (dst port 63750)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.25.47/32) || (dst net 160.0.30.211/32) || (dst net 160.0.88.1/32) || (dst net 160.0.177.136/32) || (dst net 160.0.206.14/32))),
	((dst port 6372) || (dst port 7276) || (dst port 19080) || (dst port 19976) || (dst port 65226)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.6.61/32) || (dst net 161.0.44.191/32) || (dst net 161.0.154.23/32) || (dst net 161.0.163.79/32) || (dst net 161.0.253.239/32))),
	((dst port 15865) || (dst port 19491) || (dst port 28045) || (dst port 37661) || (dst port 50366)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.10.211/32) || (dst net 162.0.84.184/32) || (dst net 162.0.183.84/32) || (dst net 162.0.187.186/32) || (dst net 162.0.223.95/32))),
	((dst port 8921) || (dst port 38357) || (dst port 49416) || (dst port 51256) || (dst port 60416)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.3.206/32) || (dst net 163.0.59.152/32) || (dst net 163.0.124.32/32) || (dst net 163.0.126.1/32) || (dst net 163.0.234.27/32))),
	((dst port 6696) || (dst port 7464) || (dst port 15066) || (dst port 26906) || (dst port 52125)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.14.163/32) || (dst net 164.0.53.142/32) || (dst net 164.0.171.7/32) || (dst net 164.0.200.93/32) || (dst net 164.0.250.51/32))),
	((dst port 2439) || (dst port 11537) || (dst port 40238) || (dst port 51137) || (dst port 62075)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.66.218/32) || (dst net 165.0.106.211/32) || (dst net 165.0.117.96/32) || (dst net 165.0.217.78/32) || (dst net 165.0.249.21/32))),
	((dst port 30418) || (dst port 48446) || (dst port 52518) || (dst port 62702) || (dst port 64646)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.23.75/32) || (dst net 166.0.49.13/32) || (dst net 166.0.94.111/32) || (dst net 166.0.98.145/32) || (dst net 166.0.163.133/32))),
	((dst port 21446) || (dst port 28839) || (dst port 31731) || (dst port 52297) || (dst port 55964)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.33.223/32) || (dst net 167.0.82.37/32) || (dst net 167.0.143.51/32) || (dst net 167.0.179.156/32) || (dst net 167.0.224.69/32))),
	((dst port 908) || (dst port 2147) || (dst port 3460) || (dst port 11881) || (dst port 30536)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.27.101/32) || (dst net 168.0.104.177/32) || (dst net 168.0.140.190/32) || (dst net 168.0.214.172/32) || (dst net 168.0.243.168/32))),
	((dst port 3151) || (dst port 6472) || (dst port 13614) || (dst port 23884) || (dst port 54426)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.31.206/32) || (dst net 169.0.83.105/32) || (dst net 169.0.152.157/32) || (dst net 169.0.181.7/32) || (dst net 169.0.248.147/32))),
	((dst port 934) || (dst port 4805) || (dst port 29195) || (dst port 48887) || (dst port 48975)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.23.213/32) || (dst net 170.0.44.48/32) || (dst net 170.0.123.154/32) || (dst net 170.0.141.204/32) || (dst net 170.0.180.197/32))),
	((dst port 10833) || (dst port 13764) || (dst port 28217) || (dst port 44913) || (dst port 55604)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.83.166/32) || (dst net 171.0.148.84/32) || (dst net 171.0.161.125/32) || (dst net 171.0.217.39/32) || (dst net 171.0.223.177/32))),
	((dst port 9948) || (dst port 19187) || (dst port 20271) || (dst port 37800) || (dst port 40418)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.10.159/32) || (dst net 172.0.179.115/32) || (dst net 172.0.203.217/32) || (dst net 172.0.206.225/32) || (dst net 172.0.247.207/32))),
	((dst port 8534) || (dst port 21568) || (dst port 40518) || (dst port 51579) || (dst port 52501)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.92.97/32) || (dst net 173.0.131.187/32) || (dst net 173.0.134.59/32) || (dst net 173.0.210.112/32) || (dst net 173.0.237.40/32))),
	((dst port 4096) || (dst port 9291) || (dst port 42401) || (dst port 53161) || (dst port 57876)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.28.212/32) || (dst net 174.0.67.138/32) || (dst net 174.0.87.217/32) || (dst net 174.0.106.207/32) || (dst net 174.0.172.28/32))),
	((dst port 2856) || (dst port 22320) || (dst port 27551) || (dst port 31738) || (dst port 56426)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.44.222/32) || (dst net 175.0.52.200/32) || (dst net 175.0.71.14/32) || (dst net 175.0.105.19/32) || (dst net 175.0.178.252/32))),
	((dst port 17291) || (dst port 23168) || (dst port 25768) || (dst port 26092) || (dst port 28434)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.6.251/32) || (dst net 176.0.28.213/32) || (dst net 176.0.37.28/32) || (dst net 176.0.109.13/32) || (dst net 176.0.118.192/32))),
	((dst port 10837) || (dst port 17481) || (dst port 21839) || (dst port 35965) || (dst port 41003)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.14.78/32) || (dst net 177.0.31.0/32) || (dst net 177.0.42.47/32) || (dst net 177.0.53.248/32) || (dst net 177.0.57.187/32))),
	((dst port 155) || (dst port 12829) || (dst port 54786) || (dst port 56976) || (dst port 64895)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.35.131/32) || (dst net 178.0.91.42/32) || (dst net 178.0.110.83/32) || (dst net 178.0.153.175/32) || (dst net 178.0.241.96/32))),
	((dst port 3983) || (dst port 21461) || (dst port 35085) || (dst port 39953) || (dst port 44150)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.31.213/32) || (dst net 179.0.102.63/32) || (dst net 179.0.127.61/32) || (dst net 179.0.147.208/32) || (dst net 179.0.208.86/32))),
	((dst port 27228) || (dst port 33167) || (dst port 41040) || (dst port 46947) || (dst port 49523)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.91.224/32) || (dst net 180.0.139.191/32) || (dst net 180.0.221.254/32) || (dst net 180.0.231.154/32) || (dst net 180.0.249.107/32))),
	((dst port 4999) || (dst port 7029) || (dst port 18668) || (dst port 18694) || (dst port 38168)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.22.65/32) || (dst net 181.0.31.146/32) || (dst net 181.0.42.202/32) || (dst net 181.0.143.246/32) || (dst net 181.0.179.250/32))),
	((dst port 27033) || (dst port 34629) || (dst port 36053) || (dst port 39132) || (dst port 42962)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.13.16/32) || (dst net 182.0.194.209/32) || (dst net 182.0.196.10/32) || (dst net 182.0.205.5/32) || (dst net 182.0.208.122/32))),
	((dst port 13396) || (dst port 14207) || (dst port 23499) || (dst port 28901) || (dst port 30061)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.61.83/32) || (dst net 183.0.100.213/32) || (dst net 183.0.150.3/32) || (dst net 183.0.172.67/32) || (dst net 183.0.222.152/32))),
	((dst port 21253) || (dst port 24119) || (dst port 24935) || (dst port 31575) || (dst port 64112)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.120.103/32) || (dst net 184.0.135.152/32) || (dst net 184.0.200.122/32) || (dst net 184.0.240.30/32) || (dst net 184.0.253.40/32))),
	((dst port 5796) || (dst port 18702) || (dst port 22939) || (dst port 30973) || (dst port 52975)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.126.44/32) || (dst net 185.0.136.7/32) || (dst net 185.0.138.128/32) || (dst net 185.0.205.234/32) || (dst net 185.0.210.203/32))),
	((dst port 32728) || (dst port 46075) || (dst port 50742) || (dst port 59803) || (dst port 62655)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.56.245/32) || (dst net 186.0.117.54/32) || (dst net 186.0.181.189/32) || (dst net 186.0.241.85/32) || (dst net 186.0.248.192/32))),
	((dst port 170) || (dst port 23334) || (dst port 26744) || (dst port 40797) || (dst port 46226)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.15.90/32) || (dst net 187.0.19.89/32) || (dst net 187.0.97.87/32) || (dst net 187.0.151.181/32) || (dst net 187.0.191.8/32))),
	((dst port 30793) || (dst port 32537) || (dst port 35616) || (dst port 49739) || (dst port 63395)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.9.134/32) || (dst net 188.0.28.129/32) || (dst net 188.0.96.170/32) || (dst net 188.0.173.144/32) || (dst net 188.0.177.112/32))),
	((dst port 9908) || (dst port 31848) || (dst port 34088) || (dst port 51508) || (dst port 56205)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.52.168/32) || (dst net 189.0.116.246/32) || (dst net 189.0.141.8/32) || (dst net 189.0.222.97/32) || (dst net 189.0.243.44/32))),
	((dst port 21523) || (dst port 22031) || (dst port 28541) || (dst port 47180) || (dst port 64030)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.65.248/32) || (dst net 190.0.126.189/32) || (dst net 190.0.165.232/32) || (dst net 190.0.238.135/32) || (dst net 190.0.255.149/32))),
	((dst port 1666) || (dst port 20489) || (dst port 29141) || (dst port 35494) || (dst port 55009)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.93.137/32) || (dst net 191.0.104.11/32) || (dst net 191.0.152.5/32) || (dst net 191.0.159.206/32) || (dst net 191.0.221.237/32))),
	((dst port 23403) || (dst port 29015) || (dst port 49899) || (dst port 62103) || (dst port 63619)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.15.241/32) || (dst net 192.0.87.130/32) || (dst net 192.0.185.103/32) || (dst net 192.0.200.135/32) || (dst net 192.0.221.59/32))),
	((dst port 5123) || (dst port 29267) || (dst port 38618) || (dst port 40228) || (dst port 54851)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.106.10/32) || (dst net 193.0.131.5/32) || (dst net 193.0.146.143/32) || (dst net 193.0.208.151/32) || (dst net 193.0.239.194/32))),
	((dst port 3682) || (dst port 8070) || (dst port 16027) || (dst port 26333) || (dst port 44496)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.90.95/32) || (dst net 194.0.132.138/32) || (dst net 194.0.148.144/32) || (dst net 194.0.156.113/32) || (dst net 194.0.252.84/32))),
	((dst port 6358) || (dst port 10797) || (dst port 14730) || (dst port 26236) || (dst port 32515)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.75.7/32) || (dst net 195.0.84.220/32) || (dst net 195.0.115.243/32) || (dst net 195.0.181.96/32) || (dst net 195.0.227.29/32))),
	((dst port 115) || (dst port 836) || (dst port 5962) || (dst port 31673) || (dst port 39041)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.29.110/32) || (dst net 196.0.33.92/32) || (dst net 196.0.60.52/32) || (dst net 196.0.96.103/32) || (dst net 196.0.164.126/32))),
	((dst port 13241) || (dst port 15033) || (dst port 19373) || (dst port 32286) || (dst port 50440)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.5.74/32) || (dst net 197.0.11.122/32) || (dst net 197.0.67.188/32) || (dst net 197.0.113.165/32) || (dst net 197.0.244.247/32))),
	((dst port 25844) || (dst port 27682) || (dst port 30783) || (dst port 43215) || (dst port 63381)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.38.168/32) || (dst net 198.0.58.121/32) || (dst net 198.0.183.20/32) || (dst net 198.0.225.73/32) || (dst net 198.0.249.220/32))),
	((dst port 5793) || (dst port 11596) || (dst port 46289) || (dst port 59139) || (dst port 62910)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.7.237/32) || (dst net 199.0.103.150/32) || (dst net 199.0.163.26/32) || (dst net 199.0.171.56/32) || (dst net 199.0.192.62/32))),
	((dst port 2881) || (dst port 17149) || (dst port 35507) || (dst port 44981) || (dst port 45934)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.38.239/32) || (dst net 200.0.61.100/32) || (dst net 200.0.208.150/32) || (dst net 200.0.222.236/32) || (dst net 200.0.225.177/32))),
	((dst port 22639) || (dst port 23780) || (dst port 53650) || (dst port 54369) || (dst port 57522)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.14.150/32) || (dst net 201.0.91.19/32) || (dst net 201.0.152.189/32) || (dst net 201.0.189.171/32) || (dst net 201.0.246.212/32))),
	((dst port 5050) || (dst port 9229) || (dst port 10703) || (dst port 16089) || (dst port 65133)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.35.158/32) || (dst net 202.0.99.95/32) || (dst net 202.0.117.253/32) || (dst net 202.0.124.42/32) || (dst net 202.0.207.228/32))),
	((dst port 5230) || (dst port 26550) || (dst port 37913) || (dst port 48891) || (dst port 56141)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.28.132/32) || (dst net 203.0.77.41/32) || (dst net 203.0.167.1/32) || (dst net 203.0.204.147/32) || (dst net 203.0.223.10/32))),
	((dst port 19626) || (dst port 23494) || (dst port 49163) || (dst port 52846) || (dst port 64956)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.18.81/32) || (dst net 204.0.94.179/32) || (dst net 204.0.112.2/32) || (dst net 204.0.119.214/32) || (dst net 204.0.130.253/32))),
	((dst port 3998) || (dst port 9699) || (dst port 22165) || (dst port 46079) || (dst port 62218)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.49.190/32) || (dst net 205.0.61.189/32) || (dst net 205.0.79.247/32) || (dst net 205.0.167.101/32) || (dst net 205.0.186.86/32))),
	((dst port 7104) || (dst port 13740) || (dst port 15056) || (dst port 55177) || (dst port 56615)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.127.5/32) || (dst net 206.0.146.37/32) || (dst net 206.0.158.118/32) || (dst net 206.0.174.75/32) || (dst net 206.0.226.49/32))),
	((dst port 912) || (dst port 4072) || (dst port 22397) || (dst port 22692) || (dst port 55637)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.199.239/32) || (dst net 207.0.207.129/32) || (dst net 207.0.209.132/32) || (dst net 207.0.242.25/32) || (dst net 207.0.254.197/32))),
	((dst port 6684) || (dst port 12265) || (dst port 15765) || (dst port 21280) || (dst port 33856)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.182.244/32) || (dst net 208.0.185.167/32) || (dst net 208.0.190.59/32) || (dst net 208.0.204.70/32) || (dst net 208.0.243.65/32))),
	((dst port 495) || (dst port 3090) || (dst port 33188) || (dst port 37510) || (dst port 38678)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.13.194/32) || (dst net 209.0.77.212/32) || (dst net 209.0.87.0/32) || (dst net 209.0.149.193/32) || (dst net 209.0.176.41/32))),
	((dst port 13143) || (dst port 35577) || (dst port 42112) || (dst port 54222) || (dst port 61699)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.52.107/32) || (dst net 210.0.130.192/32) || (dst net 210.0.147.199/32) || (dst net 210.0.181.76/32) || (dst net 210.0.234.204/32))),
	((dst port 10236) || (dst port 21953) || (dst port 40190) || (dst port 54744) || (dst port 55269)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.67.38/32) || (dst net 211.0.96.86/32) || (dst net 211.0.155.95/32) || (dst net 211.0.157.40/32) || (dst net 211.0.182.139/32))),
	((dst port 4543) || (dst port 16228) || (dst port 32197) || (dst port 51065) || (dst port 61434)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.30.185/32) || (dst net 212.0.61.139/32) || (dst net 212.0.116.63/32) || (dst net 212.0.153.24/32) || (dst net 212.0.183.144/32))),
	((dst port 5533) || (dst port 18725) || (dst port 20705) || (dst port 60657) || (dst port 65018)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.169.50/32) || (dst net 213.0.178.198/32) || (dst net 213.0.191.115/32) || (dst net 213.0.201.170/32) || (dst net 213.0.204.93/32))),
	((dst port 22365) || (dst port 31826) || (dst port 44848) || (dst port 54077) || (dst port 58122)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.14.22/32) || (dst net 214.0.19.71/32) || (dst net 214.0.128.57/32) || (dst net 214.0.200.144/32) || (dst net 214.0.211.102/32))),
	((dst port 8937) || (dst port 12366) || (dst port 21060) || (dst port 56511) || (dst port 61088)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.55.124/32) || (dst net 215.0.171.25/32) || (dst net 215.0.174.212/32) || (dst net 215.0.186.150/32) || (dst net 215.0.189.63/32))),
	((dst port 15193) || (dst port 27780) || (dst port 44710) || (dst port 53427) || (dst port 56517)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.54.217/32) || (dst net 216.0.72.119/32) || (dst net 216.0.126.12/32) || (dst net 216.0.206.38/32) || (dst net 216.0.255.91/32))),
	((dst port 1845) || (dst port 14806) || (dst port 20451) || (dst port 30918) || (dst port 45824)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.68.150/32) || (dst net 217.0.83.92/32) || (dst net 217.0.185.97/32) || (dst net 217.0.191.119/32) || (dst net 217.0.237.67/32))),
	((dst port 4086) || (dst port 7247) || (dst port 19536) || (dst port 29687) || (dst port 41386)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.9.168/32) || (dst net 218.0.139.10/32) || (dst net 218.0.218.156/32) || (dst net 218.0.247.186/32) || (dst net 218.0.252.206/32))),
	((dst port 22981) || (dst port 37203) || (dst port 42523) || (dst port 43225) || (dst port 64981)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.10.235/32) || (dst net 219.0.22.217/32) || (dst net 219.0.165.225/32) || (dst net 219.0.230.245/32) || (dst net 219.0.251.99/32))),
	((dst port 28908) || (dst port 31791) || (dst port 47844) || (dst port 51209) || (dst port 52466)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.9.236/32) || (dst net 220.0.23.69/32) || (dst net 220.0.42.65/32) || (dst net 220.0.126.77/32) || (dst net 220.0.230.33/32))),
	((dst port 11479) || (dst port 17236) || (dst port 46700) || (dst port 47205) || (dst port 63624)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.5.220/32) || (dst net 221.0.130.4/32) || (dst net 221.0.152.55/32) || (dst net 221.0.183.61/32) || (dst net 221.0.195.120/32))),
	((dst port 25856) || (dst port 34099) || (dst port 47395) || (dst port 51288) || (dst port 52306)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.45.29/32) || (dst net 222.0.49.17/32) || (dst net 222.0.82.148/32) || (dst net 222.0.176.14/32) || (dst net 222.0.219.238/32))),
	((dst port 1020) || (dst port 26537) || (dst port 30189) || (dst port 46554) || (dst port 49735)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.31.184/32) || (dst net 223.0.49.105/32) || (dst net 223.0.159.26/32) || (dst net 223.0.203.138/32) || (dst net 223.0.235.242/32))),
	((dst port 11494) || (dst port 28286) || (dst port 47865) || (dst port 60344) || (dst port 61523)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.0.96/32) || (dst net 224.0.68.63/32) || (dst net 224.0.130.4/32) || (dst net 224.0.155.0/32) || (dst net 224.0.217.74/32))),
	((dst port 788) || (dst port 19139) || (dst port 21060) || (dst port 43147) || (dst port 62896)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.25.10/32) || (dst net 225.0.42.16/32) || (dst net 225.0.101.165/32) || (dst net 225.0.140.156/32) || (dst net 225.0.141.131/32))),
	((dst port 1992) || (dst port 5239) || (dst port 24572) || (dst port 29713) || (dst port 62547)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.121.77/32) || (dst net 226.0.123.126/32) || (dst net 226.0.129.84/32) || (dst net 226.0.201.149/32) || (dst net 226.0.253.222/32))),
	((dst port 7589) || (dst port 16310) || (dst port 26218) || (dst port 41771) || (dst port 54370)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.25.70/32) || (dst net 227.0.88.50/32) || (dst net 227.0.89.101/32) || (dst net 227.0.116.58/32) || (dst net 227.0.160.251/32))),
	((dst port 1296) || (dst port 7105) || (dst port 7502) || (dst port 19412) || (dst port 25163)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.13.213/32) || (dst net 228.0.120.186/32) || (dst net 228.0.165.51/32) || (dst net 228.0.212.213/32) || (dst net 228.0.241.172/32))),
	((dst port 16618) || (dst port 23617) || (dst port 30467) || (dst port 39989) || (dst port 56847)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.56.100/32) || (dst net 229.0.113.5/32) || (dst net 229.0.132.204/32) || (dst net 229.0.199.223/32) || (dst net 229.0.212.216/32))),
	((dst port 5394) || (dst port 26693) || (dst port 32925) || (dst port 40994) || (dst port 61519)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.24.130/32) || (dst net 230.0.26.117/32) || (dst net 230.0.45.143/32) || (dst net 230.0.55.203/32) || (dst net 230.0.255.1/32))),
	((dst port 10057) || (dst port 18409) || (dst port 24799) || (dst port 56441) || (dst port 65491)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.7.187/32) || (dst net 231.0.46.34/32) || (dst net 231.0.124.83/32) || (dst net 231.0.159.245/32) || (dst net 231.0.193.157/32))),
	((dst port 3063) || (dst port 8458) || (dst port 16402) || (dst port 46664) || (dst port 55891)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.14.162/32) || (dst net 232.0.89.254/32) || (dst net 232.0.209.218/32) || (dst net 232.0.229.46/32) || (dst net 232.0.242.229/32))),
	((dst port 5522) || (dst port 11220) || (dst port 33987) || (dst port 34685) || (dst port 60228)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.28.27/32) || (dst net 233.0.35.97/32) || (dst net 233.0.114.146/32) || (dst net 233.0.166.212/32) || (dst net 233.0.195.55/32))),
	((dst port 181) || (dst port 29776) || (dst port 34731) || (dst port 55678) || (dst port 65385)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.84.79/32) || (dst net 234.0.88.164/32) || (dst net 234.0.101.150/32) || (dst net 234.0.115.215/32) || (dst net 234.0.244.143/32))),
	((dst port 2994) || (dst port 16326) || (dst port 53870) || (dst port 55229) || (dst port 55560)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.37.33/32) || (dst net 235.0.94.109/32) || (dst net 235.0.115.205/32) || (dst net 235.0.168.10/32) || (dst net 235.0.222.86/32))),
	((dst port 25203) || (dst port 30558) || (dst port 36238) || (dst port 39109) || (dst port 49221)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.4.70/32) || (dst net 236.0.86.13/32) || (dst net 236.0.86.202/32) || (dst net 236.0.111.140/32) || (dst net 236.0.221.102/32))),
	((dst port 17807) || (dst port 20760) || (dst port 46934) || (dst port 50896) || (dst port 65484)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.61.132/32) || (dst net 237.0.62.160/32) || (dst net 237.0.152.140/32) || (dst net 237.0.172.157/32) || (dst net 237.0.239.12/32))),
	((dst port 6471) || (dst port 21427) || (dst port 38213) || (dst port 40978) || (dst port 46195)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.13.59/32) || (dst net 238.0.43.179/32) || (dst net 238.0.96.165/32) || (dst net 238.0.193.166/32) || (dst net 238.0.202.210/32))),
	((dst port 20088) || (dst port 22760) || (dst port 37053) || (dst port 41296) || (dst port 56664)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.160.14/32) || (dst net 239.0.179.91/32) || (dst net 239.0.182.114/32) || (dst net 239.0.214.169/32) || (dst net 239.0.218.128/32))),
	((dst port 2107) || (dst port 24323) || (dst port 50419) || (dst port 54050) || (dst port 55405)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.17.213/32) || (dst net 240.0.137.115/32) || (dst net 240.0.148.147/32) || (dst net 240.0.195.18/32) || (dst net 240.0.213.86/32))),
	((dst port 16099) || (dst port 24629) || (dst port 39882) || (dst port 42445) || (dst port 54273)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.54.51/32) || (dst net 241.0.89.138/32) || (dst net 241.0.95.226/32) || (dst net 241.0.161.13/32) || (dst net 241.0.228.107/32))),
	((dst port 8839) || (dst port 53153) || (dst port 55354) || (dst port 59715) || (dst port 60132)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.2.125/32) || (dst net 242.0.14.23/32) || (dst net 242.0.65.177/32) || (dst net 242.0.91.226/32) || (dst net 242.0.192.78/32))),
	((dst port 23802) || (dst port 38196) || (dst port 40217) || (dst port 47306) || (dst port 49131)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.36.235/32) || (dst net 243.0.67.17/32) || (dst net 243.0.112.114/32) || (dst net 243.0.184.129/32) || (dst net 243.0.240.123/32))),
	((dst port 2789) || (dst port 19967) || (dst port 44617) || (dst port 57981) || (dst port 62477)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.38.198/32) || (dst net 244.0.43.56/32) || (dst net 244.0.82.177/32) || (dst net 244.0.103.90/32) || (dst net 244.0.136.116/32))),
	((dst port 17276) || (dst port 25144) || (dst port 38229) || (dst port 46317) || (dst port 55213)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.38.209/32) || (dst net 245.0.87.149/32) || (dst net 245.0.106.200/32) || (dst net 245.0.202.179/32) || (dst net 245.0.235.19/32))),
	((dst port 2499) || (dst port 9738) || (dst port 30216) || (dst port 30447) || (dst port 61455)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.29.8/32) || (dst net 246.0.41.127/32) || (dst net 246.0.94.184/32) || (dst net 246.0.108.234/32) || (dst net 246.0.127.41/32))),
	((dst port 9062) || (dst port 22047) || (dst port 53246) || (dst port 57190) || (dst port 62710)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.12.30/32) || (dst net 247.0.30.66/32) || (dst net 247.0.132.238/32) || (dst net 247.0.165.221/32) || (dst net 247.0.171.103/32))),
	((dst port 2117) || (dst port 13836) || (dst port 21427) || (dst port 24333) || (dst port 62837)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.14.78/32) || (dst net 248.0.76.194/32) || (dst net 248.0.77.248/32) || (dst net 248.0.221.172/32) || (dst net 248.0.221.205/32))),
	((dst port 18512) || (dst port 19091) || (dst port 19958) || (dst port 49637) || (dst port 62745)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.10.29/32) || (dst net 249.0.27.228/32) || (dst net 249.0.36.240/32) || (dst net 249.0.67.114/32) || (dst net 249.0.212.130/32))),
	((dst port 1171) || (dst port 23435) || (dst port 26278) || (dst port 62037) || (dst port 65126)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.35.21/32) || (dst net 250.0.49.120/32) || (dst net 250.0.97.201/32) || (dst net 250.0.179.123/32) || (dst net 250.0.184.67/32))),
	((dst port 27602) || (dst port 31045) || (dst port 42276) || (dst port 43404) || (dst port 62031)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.29.3/32) || (dst net 251.0.65.168/32) || (dst net 251.0.94.184/32) || (dst net 251.0.132.180/32) || (dst net 251.0.168.233/32))),
	((dst port 16188) || (dst port 17400) || (dst port 36540) || (dst port 45741) || (dst port 54711)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.22.134/32) || (dst net 252.0.116.184/32) || (dst net 252.0.161.31/32) || (dst net 252.0.184.174/32) || (dst net 252.0.227.224/32))),
	((dst port 1664) || (dst port 7579) || (dst port 18659) || (dst port 55018) || (dst port 59275)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.50.116/32) || (dst net 253.0.59.69/32) || (dst net 253.0.113.32/32) || (dst net 253.0.155.97/32) || (dst net 253.0.178.181/32))),
	((dst port 3633) || (dst port 26858) || (dst port 28997) || (dst port 49423) || (dst port 57562)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.26.251/32) || (dst net 254.0.84.44/32) || (dst net 254.0.94.81/32) || (dst net 254.0.173.213/32) || (dst net 254.0.236.146/32))),
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
getIPClas512 :: CycleCountAccum;
getIPClas513 :: CycleCountAccum;
getIPClas514 :: CycleCountAccum;
getIPClas515 :: CycleCountAccum;
getIPClas516 :: CycleCountAccum;
getIPClas517 :: CycleCountAccum;
getIPClas518 :: CycleCountAccum;
getIPClas519 :: CycleCountAccum;
getIPClas520 :: CycleCountAccum;
getIPClas521 :: CycleCountAccum;
getIPClas522 :: CycleCountAccum;
getIPClas523 :: CycleCountAccum;
getIPClas524 :: CycleCountAccum;
getIPClas525 :: CycleCountAccum;
getIPClas526 :: CycleCountAccum;
getIPClas527 :: CycleCountAccum;
getIPClas528 :: CycleCountAccum;
getIPClas529 :: CycleCountAccum;
getIPClas530 :: CycleCountAccum;
getIPClas531 :: CycleCountAccum;
getIPClas532 :: CycleCountAccum;
getIPClas533 :: CycleCountAccum;
getIPClas534 :: CycleCountAccum;
getIPClas535 :: CycleCountAccum;
getIPClas536 :: CycleCountAccum;
getIPClas537 :: CycleCountAccum;
getIPClas538 :: CycleCountAccum;
getIPClas539 :: CycleCountAccum;
getIPClas540 :: CycleCountAccum;
getIPClas541 :: CycleCountAccum;
getIPClas542 :: CycleCountAccum;
getIPClas543 :: CycleCountAccum;
getIPClas544 :: CycleCountAccum;
getIPClas545 :: CycleCountAccum;
getIPClas546 :: CycleCountAccum;
getIPClas547 :: CycleCountAccum;
getIPClas548 :: CycleCountAccum;
getIPClas549 :: CycleCountAccum;
getIPClas550 :: CycleCountAccum;
getIPClas551 :: CycleCountAccum;
getIPClas552 :: CycleCountAccum;
getIPClas553 :: CycleCountAccum;
getIPClas554 :: CycleCountAccum;
getIPClas555 :: CycleCountAccum;
getIPClas556 :: CycleCountAccum;
getIPClas557 :: CycleCountAccum;
getIPClas558 :: CycleCountAccum;
getIPClas559 :: CycleCountAccum;
getIPClas560 :: CycleCountAccum;
getIPClas561 :: CycleCountAccum;
getIPClas562 :: CycleCountAccum;
getIPClas563 :: CycleCountAccum;
getIPClas564 :: CycleCountAccum;
getIPClas565 :: CycleCountAccum;
getIPClas566 :: CycleCountAccum;
getIPClas567 :: CycleCountAccum;
getIPClas568 :: CycleCountAccum;
getIPClas569 :: CycleCountAccum;
getIPClas570 :: CycleCountAccum;
getIPClas571 :: CycleCountAccum;
getIPClas572 :: CycleCountAccum;
getIPClas573 :: CycleCountAccum;
getIPClas574 :: CycleCountAccum;
getIPClas575 :: CycleCountAccum;
getIPClas576 :: CycleCountAccum;
getIPClas577 :: CycleCountAccum;
getIPClas578 :: CycleCountAccum;
getIPClas579 :: CycleCountAccum;
getIPClas580 :: CycleCountAccum;
getIPClas581 :: CycleCountAccum;
getIPClas582 :: CycleCountAccum;
getIPClas583 :: CycleCountAccum;
getIPClas584 :: CycleCountAccum;
getIPClas585 :: CycleCountAccum;
getIPClas586 :: CycleCountAccum;
getIPClas587 :: CycleCountAccum;
getIPClas588 :: CycleCountAccum;
getIPClas589 :: CycleCountAccum;
getIPClas590 :: CycleCountAccum;
getIPClas591 :: CycleCountAccum;
getIPClas592 :: CycleCountAccum;
getIPClas593 :: CycleCountAccum;
getIPClas594 :: CycleCountAccum;
getIPClas595 :: CycleCountAccum;
getIPClas596 :: CycleCountAccum;
getIPClas597 :: CycleCountAccum;
getIPClas598 :: CycleCountAccum;
getIPClas599 :: CycleCountAccum;
getIPClas600 :: CycleCountAccum;
getIPClas601 :: CycleCountAccum;
getIPClas602 :: CycleCountAccum;
getIPClas603 :: CycleCountAccum;
getIPClas604 :: CycleCountAccum;
getIPClas605 :: CycleCountAccum;
getIPClas606 :: CycleCountAccum;
getIPClas607 :: CycleCountAccum;
getIPClas608 :: CycleCountAccum;
getIPClas609 :: CycleCountAccum;
getIPClas610 :: CycleCountAccum;
getIPClas611 :: CycleCountAccum;
getIPClas612 :: CycleCountAccum;
getIPClas613 :: CycleCountAccum;
getIPClas614 :: CycleCountAccum;
getIPClas615 :: CycleCountAccum;
getIPClas616 :: CycleCountAccum;
getIPClas617 :: CycleCountAccum;
getIPClas618 :: CycleCountAccum;
getIPClas619 :: CycleCountAccum;
getIPClas620 :: CycleCountAccum;
getIPClas621 :: CycleCountAccum;
getIPClas622 :: CycleCountAccum;
getIPClas623 :: CycleCountAccum;
getIPClas624 :: CycleCountAccum;
getIPClas625 :: CycleCountAccum;
getIPClas626 :: CycleCountAccum;
getIPClas627 :: CycleCountAccum;
getIPClas628 :: CycleCountAccum;
getIPClas629 :: CycleCountAccum;
getIPClas630 :: CycleCountAccum;
getIPClas631 :: CycleCountAccum;
getIPClas632 :: CycleCountAccum;
getIPClas633 :: CycleCountAccum;
getIPClas634 :: CycleCountAccum;
getIPClas635 :: CycleCountAccum;
getIPClas636 :: CycleCountAccum;
getIPClas637 :: CycleCountAccum;
getIPClas638 :: CycleCountAccum;
getIPClas639 :: CycleCountAccum;
getIPClas640 :: CycleCountAccum;
getIPClas641 :: CycleCountAccum;
getIPClas642 :: CycleCountAccum;
getIPClas643 :: CycleCountAccum;
getIPClas644 :: CycleCountAccum;
getIPClas645 :: CycleCountAccum;
getIPClas646 :: CycleCountAccum;
getIPClas647 :: CycleCountAccum;
getIPClas648 :: CycleCountAccum;
getIPClas649 :: CycleCountAccum;
getIPClas650 :: CycleCountAccum;
getIPClas651 :: CycleCountAccum;
getIPClas652 :: CycleCountAccum;
getIPClas653 :: CycleCountAccum;
getIPClas654 :: CycleCountAccum;
getIPClas655 :: CycleCountAccum;
getIPClas656 :: CycleCountAccum;
getIPClas657 :: CycleCountAccum;
getIPClas658 :: CycleCountAccum;
getIPClas659 :: CycleCountAccum;
getIPClas660 :: CycleCountAccum;
getIPClas661 :: CycleCountAccum;
getIPClas662 :: CycleCountAccum;
getIPClas663 :: CycleCountAccum;
getIPClas664 :: CycleCountAccum;
getIPClas665 :: CycleCountAccum;
getIPClas666 :: CycleCountAccum;
getIPClas667 :: CycleCountAccum;
getIPClas668 :: CycleCountAccum;
getIPClas669 :: CycleCountAccum;
getIPClas670 :: CycleCountAccum;
getIPClas671 :: CycleCountAccum;
getIPClas672 :: CycleCountAccum;
getIPClas673 :: CycleCountAccum;
getIPClas674 :: CycleCountAccum;
getIPClas675 :: CycleCountAccum;
getIPClas676 :: CycleCountAccum;
getIPClas677 :: CycleCountAccum;
getIPClas678 :: CycleCountAccum;
getIPClas679 :: CycleCountAccum;
getIPClas680 :: CycleCountAccum;
getIPClas681 :: CycleCountAccum;
getIPClas682 :: CycleCountAccum;
getIPClas683 :: CycleCountAccum;
getIPClas684 :: CycleCountAccum;
getIPClas685 :: CycleCountAccum;
getIPClas686 :: CycleCountAccum;
getIPClas687 :: CycleCountAccum;
getIPClas688 :: CycleCountAccum;
getIPClas689 :: CycleCountAccum;
getIPClas690 :: CycleCountAccum;
getIPClas691 :: CycleCountAccum;
getIPClas692 :: CycleCountAccum;
getIPClas693 :: CycleCountAccum;
getIPClas694 :: CycleCountAccum;
getIPClas695 :: CycleCountAccum;
getIPClas696 :: CycleCountAccum;
getIPClas697 :: CycleCountAccum;
getIPClas698 :: CycleCountAccum;
getIPClas699 :: CycleCountAccum;
getIPClas700 :: CycleCountAccum;
getIPClas701 :: CycleCountAccum;
getIPClas702 :: CycleCountAccum;
getIPClas703 :: CycleCountAccum;
getIPClas704 :: CycleCountAccum;
getIPClas705 :: CycleCountAccum;
getIPClas706 :: CycleCountAccum;
getIPClas707 :: CycleCountAccum;
getIPClas708 :: CycleCountAccum;
getIPClas709 :: CycleCountAccum;
getIPClas710 :: CycleCountAccum;
getIPClas711 :: CycleCountAccum;
getIPClas712 :: CycleCountAccum;
getIPClas713 :: CycleCountAccum;
getIPClas714 :: CycleCountAccum;
getIPClas715 :: CycleCountAccum;
getIPClas716 :: CycleCountAccum;
getIPClas717 :: CycleCountAccum;
getIPClas718 :: CycleCountAccum;
getIPClas719 :: CycleCountAccum;
getIPClas720 :: CycleCountAccum;
getIPClas721 :: CycleCountAccum;
getIPClas722 :: CycleCountAccum;
getIPClas723 :: CycleCountAccum;
getIPClas724 :: CycleCountAccum;
getIPClas725 :: CycleCountAccum;
getIPClas726 :: CycleCountAccum;
getIPClas727 :: CycleCountAccum;
getIPClas728 :: CycleCountAccum;
getIPClas729 :: CycleCountAccum;
getIPClas730 :: CycleCountAccum;
getIPClas731 :: CycleCountAccum;
getIPClas732 :: CycleCountAccum;
getIPClas733 :: CycleCountAccum;
getIPClas734 :: CycleCountAccum;
getIPClas735 :: CycleCountAccum;
getIPClas736 :: CycleCountAccum;
getIPClas737 :: CycleCountAccum;
getIPClas738 :: CycleCountAccum;
getIPClas739 :: CycleCountAccum;
getIPClas740 :: CycleCountAccum;
getIPClas741 :: CycleCountAccum;
getIPClas742 :: CycleCountAccum;
getIPClas743 :: CycleCountAccum;
getIPClas744 :: CycleCountAccum;
getIPClas745 :: CycleCountAccum;
getIPClas746 :: CycleCountAccum;
getIPClas747 :: CycleCountAccum;
getIPClas748 :: CycleCountAccum;
getIPClas749 :: CycleCountAccum;
getIPClas750 :: CycleCountAccum;
getIPClas751 :: CycleCountAccum;
getIPClas752 :: CycleCountAccum;
getIPClas753 :: CycleCountAccum;
getIPClas754 :: CycleCountAccum;
getIPClas755 :: CycleCountAccum;
getIPClas756 :: CycleCountAccum;
getIPClas757 :: CycleCountAccum;
getIPClas758 :: CycleCountAccum;
getIPClas759 :: CycleCountAccum;
getIPClas760 :: CycleCountAccum;
getIPClas761 :: CycleCountAccum;
getIPClas762 :: CycleCountAccum;
getIPClas763 :: CycleCountAccum;
getIPClas764 :: CycleCountAccum;
getIPClas765 :: CycleCountAccum;
getIPClas766 :: CycleCountAccum;
getIPClas767 :: CycleCountAccum;
getIPClas768 :: CycleCountAccum;
getIPClas769 :: CycleCountAccum;
getIPClas770 :: CycleCountAccum;
getIPClas771 :: CycleCountAccum;
getIPClas772 :: CycleCountAccum;
getIPClas773 :: CycleCountAccum;
getIPClas774 :: CycleCountAccum;
getIPClas775 :: CycleCountAccum;
getIPClas776 :: CycleCountAccum;
getIPClas777 :: CycleCountAccum;
getIPClas778 :: CycleCountAccum;
getIPClas779 :: CycleCountAccum;
getIPClas780 :: CycleCountAccum;
getIPClas781 :: CycleCountAccum;
getIPClas782 :: CycleCountAccum;
getIPClas783 :: CycleCountAccum;
getIPClas784 :: CycleCountAccum;
getIPClas785 :: CycleCountAccum;
getIPClas786 :: CycleCountAccum;
getIPClas787 :: CycleCountAccum;
getIPClas788 :: CycleCountAccum;
getIPClas789 :: CycleCountAccum;
getIPClas790 :: CycleCountAccum;
getIPClas791 :: CycleCountAccum;
getIPClas792 :: CycleCountAccum;
getIPClas793 :: CycleCountAccum;
getIPClas794 :: CycleCountAccum;
getIPClas795 :: CycleCountAccum;
getIPClas796 :: CycleCountAccum;
getIPClas797 :: CycleCountAccum;
getIPClas798 :: CycleCountAccum;
getIPClas799 :: CycleCountAccum;
getIPClas800 :: CycleCountAccum;
getIPClas801 :: CycleCountAccum;
getIPClas802 :: CycleCountAccum;
getIPClas803 :: CycleCountAccum;
getIPClas804 :: CycleCountAccum;
getIPClas805 :: CycleCountAccum;
getIPClas806 :: CycleCountAccum;
getIPClas807 :: CycleCountAccum;
getIPClas808 :: CycleCountAccum;
getIPClas809 :: CycleCountAccum;
getIPClas810 :: CycleCountAccum;
getIPClas811 :: CycleCountAccum;
getIPClas812 :: CycleCountAccum;
getIPClas813 :: CycleCountAccum;
getIPClas814 :: CycleCountAccum;
getIPClas815 :: CycleCountAccum;
getIPClas816 :: CycleCountAccum;
getIPClas817 :: CycleCountAccum;
getIPClas818 :: CycleCountAccum;
getIPClas819 :: CycleCountAccum;
getIPClas820 :: CycleCountAccum;
getIPClas821 :: CycleCountAccum;
getIPClas822 :: CycleCountAccum;
getIPClas823 :: CycleCountAccum;
getIPClas824 :: CycleCountAccum;
getIPClas825 :: CycleCountAccum;
getIPClas826 :: CycleCountAccum;
getIPClas827 :: CycleCountAccum;
getIPClas828 :: CycleCountAccum;
getIPClas829 :: CycleCountAccum;
getIPClas830 :: CycleCountAccum;
getIPClas831 :: CycleCountAccum;
getIPClas832 :: CycleCountAccum;
getIPClas833 :: CycleCountAccum;
getIPClas834 :: CycleCountAccum;
getIPClas835 :: CycleCountAccum;
getIPClas836 :: CycleCountAccum;
getIPClas837 :: CycleCountAccum;
getIPClas838 :: CycleCountAccum;
getIPClas839 :: CycleCountAccum;
getIPClas840 :: CycleCountAccum;
getIPClas841 :: CycleCountAccum;
getIPClas842 :: CycleCountAccum;
getIPClas843 :: CycleCountAccum;
getIPClas844 :: CycleCountAccum;
getIPClas845 :: CycleCountAccum;
getIPClas846 :: CycleCountAccum;
getIPClas847 :: CycleCountAccum;
getIPClas848 :: CycleCountAccum;
getIPClas849 :: CycleCountAccum;
getIPClas850 :: CycleCountAccum;
getIPClas851 :: CycleCountAccum;
getIPClas852 :: CycleCountAccum;
getIPClas853 :: CycleCountAccum;
getIPClas854 :: CycleCountAccum;
getIPClas855 :: CycleCountAccum;
getIPClas856 :: CycleCountAccum;
getIPClas857 :: CycleCountAccum;
getIPClas858 :: CycleCountAccum;
getIPClas859 :: CycleCountAccum;
getIPClas860 :: CycleCountAccum;
getIPClas861 :: CycleCountAccum;
getIPClas862 :: CycleCountAccum;
getIPClas863 :: CycleCountAccum;
getIPClas864 :: CycleCountAccum;
getIPClas865 :: CycleCountAccum;
getIPClas866 :: CycleCountAccum;
getIPClas867 :: CycleCountAccum;
getIPClas868 :: CycleCountAccum;
getIPClas869 :: CycleCountAccum;
getIPClas870 :: CycleCountAccum;
getIPClas871 :: CycleCountAccum;
getIPClas872 :: CycleCountAccum;
getIPClas873 :: CycleCountAccum;
getIPClas874 :: CycleCountAccum;
getIPClas875 :: CycleCountAccum;
getIPClas876 :: CycleCountAccum;
getIPClas877 :: CycleCountAccum;
getIPClas878 :: CycleCountAccum;
getIPClas879 :: CycleCountAccum;
getIPClas880 :: CycleCountAccum;
getIPClas881 :: CycleCountAccum;
getIPClas882 :: CycleCountAccum;
getIPClas883 :: CycleCountAccum;
getIPClas884 :: CycleCountAccum;
getIPClas885 :: CycleCountAccum;
getIPClas886 :: CycleCountAccum;
getIPClas887 :: CycleCountAccum;
getIPClas888 :: CycleCountAccum;
getIPClas889 :: CycleCountAccum;
getIPClas890 :: CycleCountAccum;
getIPClas891 :: CycleCountAccum;
getIPClas892 :: CycleCountAccum;
getIPClas893 :: CycleCountAccum;
getIPClas894 :: CycleCountAccum;
getIPClas895 :: CycleCountAccum;
getIPClas896 :: CycleCountAccum;
getIPClas897 :: CycleCountAccum;
getIPClas898 :: CycleCountAccum;
getIPClas899 :: CycleCountAccum;
getIPClas900 :: CycleCountAccum;
getIPClas901 :: CycleCountAccum;
getIPClas902 :: CycleCountAccum;
getIPClas903 :: CycleCountAccum;
getIPClas904 :: CycleCountAccum;
getIPClas905 :: CycleCountAccum;
getIPClas906 :: CycleCountAccum;
getIPClas907 :: CycleCountAccum;
getIPClas908 :: CycleCountAccum;
getIPClas909 :: CycleCountAccum;
getIPClas910 :: CycleCountAccum;
getIPClas911 :: CycleCountAccum;
getIPClas912 :: CycleCountAccum;
getIPClas913 :: CycleCountAccum;
getIPClas914 :: CycleCountAccum;
getIPClas915 :: CycleCountAccum;
getIPClas916 :: CycleCountAccum;
getIPClas917 :: CycleCountAccum;
getIPClas918 :: CycleCountAccum;
getIPClas919 :: CycleCountAccum;
getIPClas920 :: CycleCountAccum;
getIPClas921 :: CycleCountAccum;
getIPClas922 :: CycleCountAccum;
getIPClas923 :: CycleCountAccum;
getIPClas924 :: CycleCountAccum;
getIPClas925 :: CycleCountAccum;
getIPClas926 :: CycleCountAccum;
getIPClas927 :: CycleCountAccum;
getIPClas928 :: CycleCountAccum;
getIPClas929 :: CycleCountAccum;
getIPClas930 :: CycleCountAccum;
getIPClas931 :: CycleCountAccum;
getIPClas932 :: CycleCountAccum;
getIPClas933 :: CycleCountAccum;
getIPClas934 :: CycleCountAccum;
getIPClas935 :: CycleCountAccum;
getIPClas936 :: CycleCountAccum;
getIPClas937 :: CycleCountAccum;
getIPClas938 :: CycleCountAccum;
getIPClas939 :: CycleCountAccum;
getIPClas940 :: CycleCountAccum;
getIPClas941 :: CycleCountAccum;
getIPClas942 :: CycleCountAccum;
getIPClas943 :: CycleCountAccum;
getIPClas944 :: CycleCountAccum;
getIPClas945 :: CycleCountAccum;
getIPClas946 :: CycleCountAccum;
getIPClas947 :: CycleCountAccum;
getIPClas948 :: CycleCountAccum;
getIPClas949 :: CycleCountAccum;
getIPClas950 :: CycleCountAccum;
getIPClas951 :: CycleCountAccum;
getIPClas952 :: CycleCountAccum;
getIPClas953 :: CycleCountAccum;
getIPClas954 :: CycleCountAccum;
getIPClas955 :: CycleCountAccum;
getIPClas956 :: CycleCountAccum;
getIPClas957 :: CycleCountAccum;
getIPClas958 :: CycleCountAccum;
getIPClas959 :: CycleCountAccum;
getIPClas960 :: CycleCountAccum;
getIPClas961 :: CycleCountAccum;
getIPClas962 :: CycleCountAccum;
getIPClas963 :: CycleCountAccum;
getIPClas964 :: CycleCountAccum;
getIPClas965 :: CycleCountAccum;
getIPClas966 :: CycleCountAccum;
getIPClas967 :: CycleCountAccum;
getIPClas968 :: CycleCountAccum;
getIPClas969 :: CycleCountAccum;
getIPClas970 :: CycleCountAccum;
getIPClas971 :: CycleCountAccum;
getIPClas972 :: CycleCountAccum;
getIPClas973 :: CycleCountAccum;
getIPClas974 :: CycleCountAccum;
getIPClas975 :: CycleCountAccum;
getIPClas976 :: CycleCountAccum;
getIPClas977 :: CycleCountAccum;
getIPClas978 :: CycleCountAccum;
getIPClas979 :: CycleCountAccum;
getIPClas980 :: CycleCountAccum;
getIPClas981 :: CycleCountAccum;
getIPClas982 :: CycleCountAccum;
getIPClas983 :: CycleCountAccum;
getIPClas984 :: CycleCountAccum;
getIPClas985 :: CycleCountAccum;
getIPClas986 :: CycleCountAccum;
getIPClas987 :: CycleCountAccum;
getIPClas988 :: CycleCountAccum;
getIPClas989 :: CycleCountAccum;
getIPClas990 :: CycleCountAccum;
getIPClas991 :: CycleCountAccum;
getIPClas992 :: CycleCountAccum;
getIPClas993 :: CycleCountAccum;
getIPClas994 :: CycleCountAccum;
getIPClas995 :: CycleCountAccum;
getIPClas996 :: CycleCountAccum;
getIPClas997 :: CycleCountAccum;
getIPClas998 :: CycleCountAccum;
getIPClas999 :: CycleCountAccum;
getIPClas1000 :: CycleCountAccum;
getIPClas1001 :: CycleCountAccum;
getIPClas1002 :: CycleCountAccum;
getIPClas1003 :: CycleCountAccum;
getIPClas1004 :: CycleCountAccum;
getIPClas1005 :: CycleCountAccum;
getIPClas1006 :: CycleCountAccum;
getIPClas1007 :: CycleCountAccum;
getIPClas1008 :: CycleCountAccum;
getIPClas1009 :: CycleCountAccum;
getIPClas1010 :: CycleCountAccum;
getIPClas1011 :: CycleCountAccum;
getIPClas1012 :: CycleCountAccum;
getIPClas1013 :: CycleCountAccum;
getIPClas1014 :: CycleCountAccum;
getIPClas1015 :: CycleCountAccum;
getIPClas1016 :: CycleCountAccum;
getIPClas1017 :: CycleCountAccum;
getIPClas1018 :: CycleCountAccum;
getIPClas1019 :: CycleCountAccum;
getIPClas1020 :: CycleCountAccum;
getIPClas1021 :: CycleCountAccum;
getIPClas1022 :: CycleCountAccum;
getIPClas1023 :: CycleCountAccum;

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
ipclassifier[512] -> getIPClas512 -> Discard ();
ipclassifier[513] -> getIPClas513 -> Discard ();
ipclassifier[514] -> getIPClas514 -> Discard ();
ipclassifier[515] -> getIPClas515 -> Discard ();
ipclassifier[516] -> getIPClas516 -> Discard ();
ipclassifier[517] -> getIPClas517 -> Discard ();
ipclassifier[518] -> getIPClas518 -> Discard ();
ipclassifier[519] -> getIPClas519 -> Discard ();
ipclassifier[520] -> getIPClas520 -> Discard ();
ipclassifier[521] -> getIPClas521 -> Discard ();
ipclassifier[522] -> getIPClas522 -> Discard ();
ipclassifier[523] -> getIPClas523 -> Discard ();
ipclassifier[524] -> getIPClas524 -> Discard ();
ipclassifier[525] -> getIPClas525 -> Discard ();
ipclassifier[526] -> getIPClas526 -> Discard ();
ipclassifier[527] -> getIPClas527 -> Discard ();
ipclassifier[528] -> getIPClas528 -> Discard ();
ipclassifier[529] -> getIPClas529 -> Discard ();
ipclassifier[530] -> getIPClas530 -> Discard ();
ipclassifier[531] -> getIPClas531 -> Discard ();
ipclassifier[532] -> getIPClas532 -> Discard ();
ipclassifier[533] -> getIPClas533 -> Discard ();
ipclassifier[534] -> getIPClas534 -> Discard ();
ipclassifier[535] -> getIPClas535 -> Discard ();
ipclassifier[536] -> getIPClas536 -> Discard ();
ipclassifier[537] -> getIPClas537 -> Discard ();
ipclassifier[538] -> getIPClas538 -> Discard ();
ipclassifier[539] -> getIPClas539 -> Discard ();
ipclassifier[540] -> getIPClas540 -> Discard ();
ipclassifier[541] -> getIPClas541 -> Discard ();
ipclassifier[542] -> getIPClas542 -> Discard ();
ipclassifier[543] -> getIPClas543 -> Discard ();
ipclassifier[544] -> getIPClas544 -> Discard ();
ipclassifier[545] -> getIPClas545 -> Discard ();
ipclassifier[546] -> getIPClas546 -> Discard ();
ipclassifier[547] -> getIPClas547 -> Discard ();
ipclassifier[548] -> getIPClas548 -> Discard ();
ipclassifier[549] -> getIPClas549 -> Discard ();
ipclassifier[550] -> getIPClas550 -> Discard ();
ipclassifier[551] -> getIPClas551 -> Discard ();
ipclassifier[552] -> getIPClas552 -> Discard ();
ipclassifier[553] -> getIPClas553 -> Discard ();
ipclassifier[554] -> getIPClas554 -> Discard ();
ipclassifier[555] -> getIPClas555 -> Discard ();
ipclassifier[556] -> getIPClas556 -> Discard ();
ipclassifier[557] -> getIPClas557 -> Discard ();
ipclassifier[558] -> getIPClas558 -> Discard ();
ipclassifier[559] -> getIPClas559 -> Discard ();
ipclassifier[560] -> getIPClas560 -> Discard ();
ipclassifier[561] -> getIPClas561 -> Discard ();
ipclassifier[562] -> getIPClas562 -> Discard ();
ipclassifier[563] -> getIPClas563 -> Discard ();
ipclassifier[564] -> getIPClas564 -> Discard ();
ipclassifier[565] -> getIPClas565 -> Discard ();
ipclassifier[566] -> getIPClas566 -> Discard ();
ipclassifier[567] -> getIPClas567 -> Discard ();
ipclassifier[568] -> getIPClas568 -> Discard ();
ipclassifier[569] -> getIPClas569 -> Discard ();
ipclassifier[570] -> getIPClas570 -> Discard ();
ipclassifier[571] -> getIPClas571 -> Discard ();
ipclassifier[572] -> getIPClas572 -> Discard ();
ipclassifier[573] -> getIPClas573 -> Discard ();
ipclassifier[574] -> getIPClas574 -> Discard ();
ipclassifier[575] -> getIPClas575 -> Discard ();
ipclassifier[576] -> getIPClas576 -> Discard ();
ipclassifier[577] -> getIPClas577 -> Discard ();
ipclassifier[578] -> getIPClas578 -> Discard ();
ipclassifier[579] -> getIPClas579 -> Discard ();
ipclassifier[580] -> getIPClas580 -> Discard ();
ipclassifier[581] -> getIPClas581 -> Discard ();
ipclassifier[582] -> getIPClas582 -> Discard ();
ipclassifier[583] -> getIPClas583 -> Discard ();
ipclassifier[584] -> getIPClas584 -> Discard ();
ipclassifier[585] -> getIPClas585 -> Discard ();
ipclassifier[586] -> getIPClas586 -> Discard ();
ipclassifier[587] -> getIPClas587 -> Discard ();
ipclassifier[588] -> getIPClas588 -> Discard ();
ipclassifier[589] -> getIPClas589 -> Discard ();
ipclassifier[590] -> getIPClas590 -> Discard ();
ipclassifier[591] -> getIPClas591 -> Discard ();
ipclassifier[592] -> getIPClas592 -> Discard ();
ipclassifier[593] -> getIPClas593 -> Discard ();
ipclassifier[594] -> getIPClas594 -> Discard ();
ipclassifier[595] -> getIPClas595 -> Discard ();
ipclassifier[596] -> getIPClas596 -> Discard ();
ipclassifier[597] -> getIPClas597 -> Discard ();
ipclassifier[598] -> getIPClas598 -> Discard ();
ipclassifier[599] -> getIPClas599 -> Discard ();
ipclassifier[600] -> getIPClas600 -> Discard ();
ipclassifier[601] -> getIPClas601 -> Discard ();
ipclassifier[602] -> getIPClas602 -> Discard ();
ipclassifier[603] -> getIPClas603 -> Discard ();
ipclassifier[604] -> getIPClas604 -> Discard ();
ipclassifier[605] -> getIPClas605 -> Discard ();
ipclassifier[606] -> getIPClas606 -> Discard ();
ipclassifier[607] -> getIPClas607 -> Discard ();
ipclassifier[608] -> getIPClas608 -> Discard ();
ipclassifier[609] -> getIPClas609 -> Discard ();
ipclassifier[610] -> getIPClas610 -> Discard ();
ipclassifier[611] -> getIPClas611 -> Discard ();
ipclassifier[612] -> getIPClas612 -> Discard ();
ipclassifier[613] -> getIPClas613 -> Discard ();
ipclassifier[614] -> getIPClas614 -> Discard ();
ipclassifier[615] -> getIPClas615 -> Discard ();
ipclassifier[616] -> getIPClas616 -> Discard ();
ipclassifier[617] -> getIPClas617 -> Discard ();
ipclassifier[618] -> getIPClas618 -> Discard ();
ipclassifier[619] -> getIPClas619 -> Discard ();
ipclassifier[620] -> getIPClas620 -> Discard ();
ipclassifier[621] -> getIPClas621 -> Discard ();
ipclassifier[622] -> getIPClas622 -> Discard ();
ipclassifier[623] -> getIPClas623 -> Discard ();
ipclassifier[624] -> getIPClas624 -> Discard ();
ipclassifier[625] -> getIPClas625 -> Discard ();
ipclassifier[626] -> getIPClas626 -> Discard ();
ipclassifier[627] -> getIPClas627 -> Discard ();
ipclassifier[628] -> getIPClas628 -> Discard ();
ipclassifier[629] -> getIPClas629 -> Discard ();
ipclassifier[630] -> getIPClas630 -> Discard ();
ipclassifier[631] -> getIPClas631 -> Discard ();
ipclassifier[632] -> getIPClas632 -> Discard ();
ipclassifier[633] -> getIPClas633 -> Discard ();
ipclassifier[634] -> getIPClas634 -> Discard ();
ipclassifier[635] -> getIPClas635 -> Discard ();
ipclassifier[636] -> getIPClas636 -> Discard ();
ipclassifier[637] -> getIPClas637 -> Discard ();
ipclassifier[638] -> getIPClas638 -> Discard ();
ipclassifier[639] -> getIPClas639 -> Discard ();
ipclassifier[640] -> getIPClas640 -> Discard ();
ipclassifier[641] -> getIPClas641 -> Discard ();
ipclassifier[642] -> getIPClas642 -> Discard ();
ipclassifier[643] -> getIPClas643 -> Discard ();
ipclassifier[644] -> getIPClas644 -> Discard ();
ipclassifier[645] -> getIPClas645 -> Discard ();
ipclassifier[646] -> getIPClas646 -> Discard ();
ipclassifier[647] -> getIPClas647 -> Discard ();
ipclassifier[648] -> getIPClas648 -> Discard ();
ipclassifier[649] -> getIPClas649 -> Discard ();
ipclassifier[650] -> getIPClas650 -> Discard ();
ipclassifier[651] -> getIPClas651 -> Discard ();
ipclassifier[652] -> getIPClas652 -> Discard ();
ipclassifier[653] -> getIPClas653 -> Discard ();
ipclassifier[654] -> getIPClas654 -> Discard ();
ipclassifier[655] -> getIPClas655 -> Discard ();
ipclassifier[656] -> getIPClas656 -> Discard ();
ipclassifier[657] -> getIPClas657 -> Discard ();
ipclassifier[658] -> getIPClas658 -> Discard ();
ipclassifier[659] -> getIPClas659 -> Discard ();
ipclassifier[660] -> getIPClas660 -> Discard ();
ipclassifier[661] -> getIPClas661 -> Discard ();
ipclassifier[662] -> getIPClas662 -> Discard ();
ipclassifier[663] -> getIPClas663 -> Discard ();
ipclassifier[664] -> getIPClas664 -> Discard ();
ipclassifier[665] -> getIPClas665 -> Discard ();
ipclassifier[666] -> getIPClas666 -> Discard ();
ipclassifier[667] -> getIPClas667 -> Discard ();
ipclassifier[668] -> getIPClas668 -> Discard ();
ipclassifier[669] -> getIPClas669 -> Discard ();
ipclassifier[670] -> getIPClas670 -> Discard ();
ipclassifier[671] -> getIPClas671 -> Discard ();
ipclassifier[672] -> getIPClas672 -> Discard ();
ipclassifier[673] -> getIPClas673 -> Discard ();
ipclassifier[674] -> getIPClas674 -> Discard ();
ipclassifier[675] -> getIPClas675 -> Discard ();
ipclassifier[676] -> getIPClas676 -> Discard ();
ipclassifier[677] -> getIPClas677 -> Discard ();
ipclassifier[678] -> getIPClas678 -> Discard ();
ipclassifier[679] -> getIPClas679 -> Discard ();
ipclassifier[680] -> getIPClas680 -> Discard ();
ipclassifier[681] -> getIPClas681 -> Discard ();
ipclassifier[682] -> getIPClas682 -> Discard ();
ipclassifier[683] -> getIPClas683 -> Discard ();
ipclassifier[684] -> getIPClas684 -> Discard ();
ipclassifier[685] -> getIPClas685 -> Discard ();
ipclassifier[686] -> getIPClas686 -> Discard ();
ipclassifier[687] -> getIPClas687 -> Discard ();
ipclassifier[688] -> getIPClas688 -> Discard ();
ipclassifier[689] -> getIPClas689 -> Discard ();
ipclassifier[690] -> getIPClas690 -> Discard ();
ipclassifier[691] -> getIPClas691 -> Discard ();
ipclassifier[692] -> getIPClas692 -> Discard ();
ipclassifier[693] -> getIPClas693 -> Discard ();
ipclassifier[694] -> getIPClas694 -> Discard ();
ipclassifier[695] -> getIPClas695 -> Discard ();
ipclassifier[696] -> getIPClas696 -> Discard ();
ipclassifier[697] -> getIPClas697 -> Discard ();
ipclassifier[698] -> getIPClas698 -> Discard ();
ipclassifier[699] -> getIPClas699 -> Discard ();
ipclassifier[700] -> getIPClas700 -> Discard ();
ipclassifier[701] -> getIPClas701 -> Discard ();
ipclassifier[702] -> getIPClas702 -> Discard ();
ipclassifier[703] -> getIPClas703 -> Discard ();
ipclassifier[704] -> getIPClas704 -> Discard ();
ipclassifier[705] -> getIPClas705 -> Discard ();
ipclassifier[706] -> getIPClas706 -> Discard ();
ipclassifier[707] -> getIPClas707 -> Discard ();
ipclassifier[708] -> getIPClas708 -> Discard ();
ipclassifier[709] -> getIPClas709 -> Discard ();
ipclassifier[710] -> getIPClas710 -> Discard ();
ipclassifier[711] -> getIPClas711 -> Discard ();
ipclassifier[712] -> getIPClas712 -> Discard ();
ipclassifier[713] -> getIPClas713 -> Discard ();
ipclassifier[714] -> getIPClas714 -> Discard ();
ipclassifier[715] -> getIPClas715 -> Discard ();
ipclassifier[716] -> getIPClas716 -> Discard ();
ipclassifier[717] -> getIPClas717 -> Discard ();
ipclassifier[718] -> getIPClas718 -> Discard ();
ipclassifier[719] -> getIPClas719 -> Discard ();
ipclassifier[720] -> getIPClas720 -> Discard ();
ipclassifier[721] -> getIPClas721 -> Discard ();
ipclassifier[722] -> getIPClas722 -> Discard ();
ipclassifier[723] -> getIPClas723 -> Discard ();
ipclassifier[724] -> getIPClas724 -> Discard ();
ipclassifier[725] -> getIPClas725 -> Discard ();
ipclassifier[726] -> getIPClas726 -> Discard ();
ipclassifier[727] -> getIPClas727 -> Discard ();
ipclassifier[728] -> getIPClas728 -> Discard ();
ipclassifier[729] -> getIPClas729 -> Discard ();
ipclassifier[730] -> getIPClas730 -> Discard ();
ipclassifier[731] -> getIPClas731 -> Discard ();
ipclassifier[732] -> getIPClas732 -> Discard ();
ipclassifier[733] -> getIPClas733 -> Discard ();
ipclassifier[734] -> getIPClas734 -> Discard ();
ipclassifier[735] -> getIPClas735 -> Discard ();
ipclassifier[736] -> getIPClas736 -> Discard ();
ipclassifier[737] -> getIPClas737 -> Discard ();
ipclassifier[738] -> getIPClas738 -> Discard ();
ipclassifier[739] -> getIPClas739 -> Discard ();
ipclassifier[740] -> getIPClas740 -> Discard ();
ipclassifier[741] -> getIPClas741 -> Discard ();
ipclassifier[742] -> getIPClas742 -> Discard ();
ipclassifier[743] -> getIPClas743 -> Discard ();
ipclassifier[744] -> getIPClas744 -> Discard ();
ipclassifier[745] -> getIPClas745 -> Discard ();
ipclassifier[746] -> getIPClas746 -> Discard ();
ipclassifier[747] -> getIPClas747 -> Discard ();
ipclassifier[748] -> getIPClas748 -> Discard ();
ipclassifier[749] -> getIPClas749 -> Discard ();
ipclassifier[750] -> getIPClas750 -> Discard ();
ipclassifier[751] -> getIPClas751 -> Discard ();
ipclassifier[752] -> getIPClas752 -> Discard ();
ipclassifier[753] -> getIPClas753 -> Discard ();
ipclassifier[754] -> getIPClas754 -> Discard ();
ipclassifier[755] -> getIPClas755 -> Discard ();
ipclassifier[756] -> getIPClas756 -> Discard ();
ipclassifier[757] -> getIPClas757 -> Discard ();
ipclassifier[758] -> getIPClas758 -> Discard ();
ipclassifier[759] -> getIPClas759 -> Discard ();
ipclassifier[760] -> getIPClas760 -> Discard ();
ipclassifier[761] -> getIPClas761 -> Discard ();
ipclassifier[762] -> getIPClas762 -> Discard ();
ipclassifier[763] -> getIPClas763 -> Discard ();
ipclassifier[764] -> getIPClas764 -> Discard ();
ipclassifier[765] -> getIPClas765 -> Discard ();
ipclassifier[766] -> getIPClas766 -> Discard ();
ipclassifier[767] -> getIPClas767 -> Discard ();
ipclassifier[768] -> getIPClas768 -> Discard ();
ipclassifier[769] -> getIPClas769 -> Discard ();
ipclassifier[770] -> getIPClas770 -> Discard ();
ipclassifier[771] -> getIPClas771 -> Discard ();
ipclassifier[772] -> getIPClas772 -> Discard ();
ipclassifier[773] -> getIPClas773 -> Discard ();
ipclassifier[774] -> getIPClas774 -> Discard ();
ipclassifier[775] -> getIPClas775 -> Discard ();
ipclassifier[776] -> getIPClas776 -> Discard ();
ipclassifier[777] -> getIPClas777 -> Discard ();
ipclassifier[778] -> getIPClas778 -> Discard ();
ipclassifier[779] -> getIPClas779 -> Discard ();
ipclassifier[780] -> getIPClas780 -> Discard ();
ipclassifier[781] -> getIPClas781 -> Discard ();
ipclassifier[782] -> getIPClas782 -> Discard ();
ipclassifier[783] -> getIPClas783 -> Discard ();
ipclassifier[784] -> getIPClas784 -> Discard ();
ipclassifier[785] -> getIPClas785 -> Discard ();
ipclassifier[786] -> getIPClas786 -> Discard ();
ipclassifier[787] -> getIPClas787 -> Discard ();
ipclassifier[788] -> getIPClas788 -> Discard ();
ipclassifier[789] -> getIPClas789 -> Discard ();
ipclassifier[790] -> getIPClas790 -> Discard ();
ipclassifier[791] -> getIPClas791 -> Discard ();
ipclassifier[792] -> getIPClas792 -> Discard ();
ipclassifier[793] -> getIPClas793 -> Discard ();
ipclassifier[794] -> getIPClas794 -> Discard ();
ipclassifier[795] -> getIPClas795 -> Discard ();
ipclassifier[796] -> getIPClas796 -> Discard ();
ipclassifier[797] -> getIPClas797 -> Discard ();
ipclassifier[798] -> getIPClas798 -> Discard ();
ipclassifier[799] -> getIPClas799 -> Discard ();
ipclassifier[800] -> getIPClas800 -> Discard ();
ipclassifier[801] -> getIPClas801 -> Discard ();
ipclassifier[802] -> getIPClas802 -> Discard ();
ipclassifier[803] -> getIPClas803 -> Discard ();
ipclassifier[804] -> getIPClas804 -> Discard ();
ipclassifier[805] -> getIPClas805 -> Discard ();
ipclassifier[806] -> getIPClas806 -> Discard ();
ipclassifier[807] -> getIPClas807 -> Discard ();
ipclassifier[808] -> getIPClas808 -> Discard ();
ipclassifier[809] -> getIPClas809 -> Discard ();
ipclassifier[810] -> getIPClas810 -> Discard ();
ipclassifier[811] -> getIPClas811 -> Discard ();
ipclassifier[812] -> getIPClas812 -> Discard ();
ipclassifier[813] -> getIPClas813 -> Discard ();
ipclassifier[814] -> getIPClas814 -> Discard ();
ipclassifier[815] -> getIPClas815 -> Discard ();
ipclassifier[816] -> getIPClas816 -> Discard ();
ipclassifier[817] -> getIPClas817 -> Discard ();
ipclassifier[818] -> getIPClas818 -> Discard ();
ipclassifier[819] -> getIPClas819 -> Discard ();
ipclassifier[820] -> getIPClas820 -> Discard ();
ipclassifier[821] -> getIPClas821 -> Discard ();
ipclassifier[822] -> getIPClas822 -> Discard ();
ipclassifier[823] -> getIPClas823 -> Discard ();
ipclassifier[824] -> getIPClas824 -> Discard ();
ipclassifier[825] -> getIPClas825 -> Discard ();
ipclassifier[826] -> getIPClas826 -> Discard ();
ipclassifier[827] -> getIPClas827 -> Discard ();
ipclassifier[828] -> getIPClas828 -> Discard ();
ipclassifier[829] -> getIPClas829 -> Discard ();
ipclassifier[830] -> getIPClas830 -> Discard ();
ipclassifier[831] -> getIPClas831 -> Discard ();
ipclassifier[832] -> getIPClas832 -> Discard ();
ipclassifier[833] -> getIPClas833 -> Discard ();
ipclassifier[834] -> getIPClas834 -> Discard ();
ipclassifier[835] -> getIPClas835 -> Discard ();
ipclassifier[836] -> getIPClas836 -> Discard ();
ipclassifier[837] -> getIPClas837 -> Discard ();
ipclassifier[838] -> getIPClas838 -> Discard ();
ipclassifier[839] -> getIPClas839 -> Discard ();
ipclassifier[840] -> getIPClas840 -> Discard ();
ipclassifier[841] -> getIPClas841 -> Discard ();
ipclassifier[842] -> getIPClas842 -> Discard ();
ipclassifier[843] -> getIPClas843 -> Discard ();
ipclassifier[844] -> getIPClas844 -> Discard ();
ipclassifier[845] -> getIPClas845 -> Discard ();
ipclassifier[846] -> getIPClas846 -> Discard ();
ipclassifier[847] -> getIPClas847 -> Discard ();
ipclassifier[848] -> getIPClas848 -> Discard ();
ipclassifier[849] -> getIPClas849 -> Discard ();
ipclassifier[850] -> getIPClas850 -> Discard ();
ipclassifier[851] -> getIPClas851 -> Discard ();
ipclassifier[852] -> getIPClas852 -> Discard ();
ipclassifier[853] -> getIPClas853 -> Discard ();
ipclassifier[854] -> getIPClas854 -> Discard ();
ipclassifier[855] -> getIPClas855 -> Discard ();
ipclassifier[856] -> getIPClas856 -> Discard ();
ipclassifier[857] -> getIPClas857 -> Discard ();
ipclassifier[858] -> getIPClas858 -> Discard ();
ipclassifier[859] -> getIPClas859 -> Discard ();
ipclassifier[860] -> getIPClas860 -> Discard ();
ipclassifier[861] -> getIPClas861 -> Discard ();
ipclassifier[862] -> getIPClas862 -> Discard ();
ipclassifier[863] -> getIPClas863 -> Discard ();
ipclassifier[864] -> getIPClas864 -> Discard ();
ipclassifier[865] -> getIPClas865 -> Discard ();
ipclassifier[866] -> getIPClas866 -> Discard ();
ipclassifier[867] -> getIPClas867 -> Discard ();
ipclassifier[868] -> getIPClas868 -> Discard ();
ipclassifier[869] -> getIPClas869 -> Discard ();
ipclassifier[870] -> getIPClas870 -> Discard ();
ipclassifier[871] -> getIPClas871 -> Discard ();
ipclassifier[872] -> getIPClas872 -> Discard ();
ipclassifier[873] -> getIPClas873 -> Discard ();
ipclassifier[874] -> getIPClas874 -> Discard ();
ipclassifier[875] -> getIPClas875 -> Discard ();
ipclassifier[876] -> getIPClas876 -> Discard ();
ipclassifier[877] -> getIPClas877 -> Discard ();
ipclassifier[878] -> getIPClas878 -> Discard ();
ipclassifier[879] -> getIPClas879 -> Discard ();
ipclassifier[880] -> getIPClas880 -> Discard ();
ipclassifier[881] -> getIPClas881 -> Discard ();
ipclassifier[882] -> getIPClas882 -> Discard ();
ipclassifier[883] -> getIPClas883 -> Discard ();
ipclassifier[884] -> getIPClas884 -> Discard ();
ipclassifier[885] -> getIPClas885 -> Discard ();
ipclassifier[886] -> getIPClas886 -> Discard ();
ipclassifier[887] -> getIPClas887 -> Discard ();
ipclassifier[888] -> getIPClas888 -> Discard ();
ipclassifier[889] -> getIPClas889 -> Discard ();
ipclassifier[890] -> getIPClas890 -> Discard ();
ipclassifier[891] -> getIPClas891 -> Discard ();
ipclassifier[892] -> getIPClas892 -> Discard ();
ipclassifier[893] -> getIPClas893 -> Discard ();
ipclassifier[894] -> getIPClas894 -> Discard ();
ipclassifier[895] -> getIPClas895 -> Discard ();
ipclassifier[896] -> getIPClas896 -> Discard ();
ipclassifier[897] -> getIPClas897 -> Discard ();
ipclassifier[898] -> getIPClas898 -> Discard ();
ipclassifier[899] -> getIPClas899 -> Discard ();
ipclassifier[900] -> getIPClas900 -> Discard ();
ipclassifier[901] -> getIPClas901 -> Discard ();
ipclassifier[902] -> getIPClas902 -> Discard ();
ipclassifier[903] -> getIPClas903 -> Discard ();
ipclassifier[904] -> getIPClas904 -> Discard ();
ipclassifier[905] -> getIPClas905 -> Discard ();
ipclassifier[906] -> getIPClas906 -> Discard ();
ipclassifier[907] -> getIPClas907 -> Discard ();
ipclassifier[908] -> getIPClas908 -> Discard ();
ipclassifier[909] -> getIPClas909 -> Discard ();
ipclassifier[910] -> getIPClas910 -> Discard ();
ipclassifier[911] -> getIPClas911 -> Discard ();
ipclassifier[912] -> getIPClas912 -> Discard ();
ipclassifier[913] -> getIPClas913 -> Discard ();
ipclassifier[914] -> getIPClas914 -> Discard ();
ipclassifier[915] -> getIPClas915 -> Discard ();
ipclassifier[916] -> getIPClas916 -> Discard ();
ipclassifier[917] -> getIPClas917 -> Discard ();
ipclassifier[918] -> getIPClas918 -> Discard ();
ipclassifier[919] -> getIPClas919 -> Discard ();
ipclassifier[920] -> getIPClas920 -> Discard ();
ipclassifier[921] -> getIPClas921 -> Discard ();
ipclassifier[922] -> getIPClas922 -> Discard ();
ipclassifier[923] -> getIPClas923 -> Discard ();
ipclassifier[924] -> getIPClas924 -> Discard ();
ipclassifier[925] -> getIPClas925 -> Discard ();
ipclassifier[926] -> getIPClas926 -> Discard ();
ipclassifier[927] -> getIPClas927 -> Discard ();
ipclassifier[928] -> getIPClas928 -> Discard ();
ipclassifier[929] -> getIPClas929 -> Discard ();
ipclassifier[930] -> getIPClas930 -> Discard ();
ipclassifier[931] -> getIPClas931 -> Discard ();
ipclassifier[932] -> getIPClas932 -> Discard ();
ipclassifier[933] -> getIPClas933 -> Discard ();
ipclassifier[934] -> getIPClas934 -> Discard ();
ipclassifier[935] -> getIPClas935 -> Discard ();
ipclassifier[936] -> getIPClas936 -> Discard ();
ipclassifier[937] -> getIPClas937 -> Discard ();
ipclassifier[938] -> getIPClas938 -> Discard ();
ipclassifier[939] -> getIPClas939 -> Discard ();
ipclassifier[940] -> getIPClas940 -> Discard ();
ipclassifier[941] -> getIPClas941 -> Discard ();
ipclassifier[942] -> getIPClas942 -> Discard ();
ipclassifier[943] -> getIPClas943 -> Discard ();
ipclassifier[944] -> getIPClas944 -> Discard ();
ipclassifier[945] -> getIPClas945 -> Discard ();
ipclassifier[946] -> getIPClas946 -> Discard ();
ipclassifier[947] -> getIPClas947 -> Discard ();
ipclassifier[948] -> getIPClas948 -> Discard ();
ipclassifier[949] -> getIPClas949 -> Discard ();
ipclassifier[950] -> getIPClas950 -> Discard ();
ipclassifier[951] -> getIPClas951 -> Discard ();
ipclassifier[952] -> getIPClas952 -> Discard ();
ipclassifier[953] -> getIPClas953 -> Discard ();
ipclassifier[954] -> getIPClas954 -> Discard ();
ipclassifier[955] -> getIPClas955 -> Discard ();
ipclassifier[956] -> getIPClas956 -> Discard ();
ipclassifier[957] -> getIPClas957 -> Discard ();
ipclassifier[958] -> getIPClas958 -> Discard ();
ipclassifier[959] -> getIPClas959 -> Discard ();
ipclassifier[960] -> getIPClas960 -> Discard ();
ipclassifier[961] -> getIPClas961 -> Discard ();
ipclassifier[962] -> getIPClas962 -> Discard ();
ipclassifier[963] -> getIPClas963 -> Discard ();
ipclassifier[964] -> getIPClas964 -> Discard ();
ipclassifier[965] -> getIPClas965 -> Discard ();
ipclassifier[966] -> getIPClas966 -> Discard ();
ipclassifier[967] -> getIPClas967 -> Discard ();
ipclassifier[968] -> getIPClas968 -> Discard ();
ipclassifier[969] -> getIPClas969 -> Discard ();
ipclassifier[970] -> getIPClas970 -> Discard ();
ipclassifier[971] -> getIPClas971 -> Discard ();
ipclassifier[972] -> getIPClas972 -> Discard ();
ipclassifier[973] -> getIPClas973 -> Discard ();
ipclassifier[974] -> getIPClas974 -> Discard ();
ipclassifier[975] -> getIPClas975 -> Discard ();
ipclassifier[976] -> getIPClas976 -> Discard ();
ipclassifier[977] -> getIPClas977 -> Discard ();
ipclassifier[978] -> getIPClas978 -> Discard ();
ipclassifier[979] -> getIPClas979 -> Discard ();
ipclassifier[980] -> getIPClas980 -> Discard ();
ipclassifier[981] -> getIPClas981 -> Discard ();
ipclassifier[982] -> getIPClas982 -> Discard ();
ipclassifier[983] -> getIPClas983 -> Discard ();
ipclassifier[984] -> getIPClas984 -> Discard ();
ipclassifier[985] -> getIPClas985 -> Discard ();
ipclassifier[986] -> getIPClas986 -> Discard ();
ipclassifier[987] -> getIPClas987 -> Discard ();
ipclassifier[988] -> getIPClas988 -> Discard ();
ipclassifier[989] -> getIPClas989 -> Discard ();
ipclassifier[990] -> getIPClas990 -> Discard ();
ipclassifier[991] -> getIPClas991 -> Discard ();
ipclassifier[992] -> getIPClas992 -> Discard ();
ipclassifier[993] -> getIPClas993 -> Discard ();
ipclassifier[994] -> getIPClas994 -> Discard ();
ipclassifier[995] -> getIPClas995 -> Discard ();
ipclassifier[996] -> getIPClas996 -> Discard ();
ipclassifier[997] -> getIPClas997 -> Discard ();
ipclassifier[998] -> getIPClas998 -> Discard ();
ipclassifier[999] -> getIPClas999 -> Discard ();
ipclassifier[1000] -> getIPClas1000 -> Discard ();
ipclassifier[1001] -> getIPClas1001 -> Discard ();
ipclassifier[1002] -> getIPClas1002 -> Discard ();
ipclassifier[1003] -> getIPClas1003 -> Discard ();
ipclassifier[1004] -> getIPClas1004 -> Discard ();
ipclassifier[1005] -> getIPClas1005 -> Discard ();
ipclassifier[1006] -> getIPClas1006 -> Discard ();
ipclassifier[1007] -> getIPClas1007 -> Discard ();
ipclassifier[1008] -> getIPClas1008 -> Discard ();
ipclassifier[1009] -> getIPClas1009 -> Discard ();
ipclassifier[1010] -> getIPClas1010 -> Discard ();
ipclassifier[1011] -> getIPClas1011 -> Discard ();
ipclassifier[1012] -> getIPClas1012 -> Discard ();
ipclassifier[1013] -> getIPClas1013 -> Discard ();
ipclassifier[1014] -> getIPClas1014 -> Discard ();
ipclassifier[1015] -> getIPClas1015 -> Discard ();
ipclassifier[1016] -> getIPClas1016 -> Discard ();
ipclassifier[1017] -> getIPClas1017 -> Discard ();
ipclassifier[1018] -> getIPClas1018 -> Discard ();
ipclassifier[1019] -> getIPClas1019 -> Discard ();
ipclassifier[1020] -> getIPClas1020 -> Discard ();
ipclassifier[1021] -> getIPClas1021 -> Discard ();
ipclassifier[1022] -> getIPClas1022 -> Discard ();
ipclassifier[1023] -> getIPClas1023 -> Discard ();
