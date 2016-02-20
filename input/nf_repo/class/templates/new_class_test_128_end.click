ipclassifier :: IPClassifier(
	((dst port 9517) || (dst port 33416) || (dst port 35040) || (dst port 50921) || (dst port 56115)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.24.189/32) || (dst net 0.0.36.26/32) || (dst net 0.0.44.213/32) || (dst net 0.0.74.183/32) || (dst net 0.0.110.196/32))),
	((dst port 14709) || (dst port 16239) || (dst port 17436) || (dst port 29415) || (dst port 31309)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.85.225/32) || (dst net 1.0.144.49/32) || (dst net 1.0.148.242/32) || (dst net 1.0.248.180/32) || (dst net 1.0.251.76/32))),
	((dst port 4120) || (dst port 27018) || (dst port 47352) || (dst port 49346) || (dst port 62520)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.2.153/32) || (dst net 2.0.21.216/32) || (dst net 2.0.47.21/32) || (dst net 2.0.144.60/32) || (dst net 2.0.202.208/32))),
	((dst port 19560) || (dst port 22275) || (dst port 35643) || (dst port 36164) || (dst port 63161)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.2.228/32) || (dst net 3.0.56.146/32) || (dst net 3.0.158.33/32) || (dst net 3.0.218.73/32) || (dst net 3.0.250.251/32))),
	((dst port 9582) || (dst port 24964) || (dst port 43595) || (dst port 48464) || (dst port 65392)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.37.51/32) || (dst net 4.0.128.166/32) || (dst net 4.0.176.189/32) || (dst net 4.0.235.54/32) || (dst net 4.0.238.94/32))),
	((dst port 8819) || (dst port 15082) || (dst port 32541) || (dst port 42192) || (dst port 47286)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.48.83/32) || (dst net 5.0.157.177/32) || (dst net 5.0.190.23/32) || (dst net 5.0.204.41/32) || (dst net 5.0.233.43/32))),
	((dst port 7355) || (dst port 16993) || (dst port 39396) || (dst port 49753) || (dst port 62038)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.14.181/32) || (dst net 6.0.152.108/32) || (dst net 6.0.224.63/32) || (dst net 6.0.225.138/32) || (dst net 6.0.230.133/32))),
	((dst port 37616) || (dst port 39797) || (dst port 45106) || (dst port 51763) || (dst port 60974)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.57.79/32) || (dst net 7.0.103.194/32) || (dst net 7.0.120.167/32) || (dst net 7.0.249.99/32) || (dst net 7.0.254.209/32))),
	((dst port 3176) || (dst port 14432) || (dst port 19583) || (dst port 40129) || (dst port 44560)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.97.48/32) || (dst net 8.0.120.123/32) || (dst net 8.0.135.105/32) || (dst net 8.0.232.132/32) || (dst net 8.0.248.113/32))),
	((dst port 1606) || (dst port 1848) || (dst port 12066) || (dst port 24738) || (dst port 65126)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.40.21/32) || (dst net 9.0.73.230/32) || (dst net 9.0.122.142/32) || (dst net 9.0.177.42/32) || (dst net 9.0.199.50/32))),
	((dst port 27871) || (dst port 30733) || (dst port 31594) || (dst port 33643) || (dst port 46986)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.8.251/32) || (dst net 10.0.92.246/32) || (dst net 10.0.203.255/32) || (dst net 10.0.223.249/32) || (dst net 10.0.242.200/32))),
	((dst port 6380) || (dst port 22052) || (dst port 25946) || (dst port 35656) || (dst port 53525)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.52.79/32) || (dst net 11.0.77.188/32) || (dst net 11.0.121.180/32) || (dst net 11.0.122.132/32) || (dst net 11.0.219.187/32))),
	((dst port 5227) || (dst port 26866) || (dst port 33590) || (dst port 37015) || (dst port 56419)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.31.132/32) || (dst net 12.0.31.235/32) || (dst net 12.0.50.83/32) || (dst net 12.0.87.115/32) || (dst net 12.0.239.237/32))),
	((dst port 6192) || (dst port 8888) || (dst port 35297) || (dst port 50334) || (dst port 64234)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.38.8/32) || (dst net 13.0.78.227/32) || (dst net 13.0.146.117/32) || (dst net 13.0.221.9/32) || (dst net 13.0.249.204/32))),
	((dst port 17292) || (dst port 18599) || (dst port 31178) || (dst port 44727) || (dst port 58145)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.79.246/32) || (dst net 14.0.123.149/32) || (dst net 14.0.139.72/32) || (dst net 14.0.210.237/32) || (dst net 14.0.246.120/32))),
	((dst port 32153) || (dst port 32273) || (dst port 40119) || (dst port 42300) || (dst port 49568)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.48.239/32) || (dst net 15.0.156.217/32) || (dst net 15.0.161.141/32) || (dst net 15.0.163.29/32) || (dst net 15.0.225.246/32))),
	((dst port 13723) || (dst port 20822) || (dst port 48704) || (dst port 49935) || (dst port 52577)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.40.254/32) || (dst net 16.0.97.255/32) || (dst net 16.0.128.201/32) || (dst net 16.0.163.148/32) || (dst net 16.0.235.151/32))),
	((dst port 15942) || (dst port 21555) || (dst port 23955) || (dst port 24012) || (dst port 61210)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.26.81/32) || (dst net 17.0.56.135/32) || (dst net 17.0.80.8/32) || (dst net 17.0.218.242/32) || (dst net 17.0.222.124/32))),
	((dst port 3227) || (dst port 10307) || (dst port 20712) || (dst port 49932) || (dst port 52824)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.40.21/32) || (dst net 18.0.106.168/32) || (dst net 18.0.122.81/32) || (dst net 18.0.148.145/32) || (dst net 18.0.222.4/32))),
	((dst port 10226) || (dst port 19945) || (dst port 32881) || (dst port 54093) || (dst port 57149)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.62.44/32) || (dst net 19.0.67.203/32) || (dst net 19.0.130.123/32) || (dst net 19.0.165.125/32) || (dst net 19.0.189.227/32))),
	((dst port 10734) || (dst port 25915) || (dst port 40678) || (dst port 59494) || (dst port 60138)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.89.13/32) || (dst net 20.0.118.90/32) || (dst net 20.0.209.87/32) || (dst net 20.0.224.200/32) || (dst net 20.0.248.79/32))),
	((dst port 4085) || (dst port 28761) || (dst port 35471) || (dst port 53810) || (dst port 56979)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.115.164/32) || (dst net 21.0.204.47/32) || (dst net 21.0.229.7/32) || (dst net 21.0.231.130/32) || (dst net 21.0.243.79/32))),
	((dst port 19026) || (dst port 36762) || (dst port 48380) || (dst port 49427) || (dst port 62006)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.12.148/32) || (dst net 22.0.53.220/32) || (dst net 22.0.248.33/32) || (dst net 22.0.248.100/32) || (dst net 22.0.249.160/32))),
	((dst port 10414) || (dst port 14134) || (dst port 28389) || (dst port 31383) || (dst port 53084)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.96.208/32) || (dst net 23.0.116.80/32) || (dst net 23.0.121.131/32) || (dst net 23.0.219.148/32) || (dst net 23.0.222.138/32))),
	((dst port 18443) || (dst port 23084) || (dst port 38905) || (dst port 49317) || (dst port 64475)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.29.25/32) || (dst net 24.0.66.69/32) || (dst net 24.0.93.114/32) || (dst net 24.0.167.80/32) || (dst net 24.0.209.148/32))),
	((dst port 8916) || (dst port 26512) || (dst port 39256) || (dst port 45396) || (dst port 51540)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.49.220/32) || (dst net 25.0.131.137/32) || (dst net 25.0.140.208/32) || (dst net 25.0.197.74/32) || (dst net 25.0.230.109/32))),
	((dst port 7095) || (dst port 8945) || (dst port 13523) || (dst port 43003) || (dst port 63881)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.6.231/32) || (dst net 26.0.51.74/32) || (dst net 26.0.90.241/32) || (dst net 26.0.96.120/32) || (dst net 26.0.106.254/32))),
	((dst port 6754) || (dst port 7889) || (dst port 13211) || (dst port 17178) || (dst port 19553)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.9.183/32) || (dst net 27.0.105.131/32) || (dst net 27.0.170.231/32) || (dst net 27.0.239.113/32) || (dst net 27.0.242.94/32))),
	((dst port 12453) || (dst port 13833) || (dst port 25616) || (dst port 42387) || (dst port 50249)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.0.55/32) || (dst net 28.0.10.243/32) || (dst net 28.0.75.138/32) || (dst net 28.0.80.36/32) || (dst net 28.0.128.252/32))),
	((dst port 4352) || (dst port 11490) || (dst port 33320) || (dst port 53070) || (dst port 56280)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.14.75/32) || (dst net 29.0.54.245/32) || (dst net 29.0.131.254/32) || (dst net 29.0.140.7/32) || (dst net 29.0.224.96/32))),
	((dst port 7367) || (dst port 9933) || (dst port 14104) || (dst port 29424) || (dst port 54124)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.21.176/32) || (dst net 30.0.167.169/32) || (dst net 30.0.204.199/32) || (dst net 30.0.239.242/32) || (dst net 30.0.252.172/32))),
	((dst port 11034) || (dst port 14202) || (dst port 22814) || (dst port 35169) || (dst port 45897)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.67.153/32) || (dst net 31.0.164.43/32) || (dst net 31.0.170.77/32) || (dst net 31.0.218.11/32) || (dst net 31.0.252.143/32))),
	((dst port 733) || (dst port 1300) || (dst port 40389) || (dst port 42211) || (dst port 42929)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.107.85/32) || (dst net 32.0.141.58/32) || (dst net 32.0.148.182/32) || (dst net 32.0.202.249/32) || (dst net 32.0.242.149/32))),
	((dst port 12140) || (dst port 32100) || (dst port 32204) || (dst port 47891) || (dst port 54107)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.60.48/32) || (dst net 33.0.146.159/32) || (dst net 33.0.164.3/32) || (dst net 33.0.199.117/32) || (dst net 33.0.216.67/32))),
	((dst port 12114) || (dst port 16942) || (dst port 30822) || (dst port 45560) || (dst port 63040)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.60.176/32) || (dst net 34.0.81.166/32) || (dst net 34.0.100.230/32) || (dst net 34.0.139.229/32) || (dst net 34.0.166.72/32))),
	((dst port 7363) || (dst port 20777) || (dst port 24567) || (dst port 25429) || (dst port 40702)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.11.95/32) || (dst net 35.0.134.235/32) || (dst net 35.0.154.118/32) || (dst net 35.0.220.186/32) || (dst net 35.0.253.216/32))),
	((dst port 7735) || (dst port 27585) || (dst port 33258) || (dst port 50394) || (dst port 62954)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.89.229/32) || (dst net 36.0.153.105/32) || (dst net 36.0.161.70/32) || (dst net 36.0.178.206/32) || (dst net 36.0.210.123/32))),
	((dst port 20648) || (dst port 21459) || (dst port 31257) || (dst port 49957) || (dst port 51700)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.55.156/32) || (dst net 37.0.64.73/32) || (dst net 37.0.130.47/32) || (dst net 37.0.205.73/32) || (dst net 37.0.224.58/32))),
	((dst port 12304) || (dst port 15690) || (dst port 24577) || (dst port 35053) || (dst port 56628)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.0.0/32) || (dst net 38.0.15.238/32) || (dst net 38.0.16.203/32) || (dst net 38.0.61.212/32) || (dst net 38.0.174.105/32))),
	((dst port 11068) || (dst port 16075) || (dst port 31243) || (dst port 53610) || (dst port 64390)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.68.119/32) || (dst net 39.0.135.210/32) || (dst net 39.0.138.178/32) || (dst net 39.0.229.223/32) || (dst net 39.0.236.70/32))),
	((dst port 15987) || (dst port 25638) || (dst port 27332) || (dst port 55650) || (dst port 61715)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.44.100/32) || (dst net 40.0.55.53/32) || (dst net 40.0.86.167/32) || (dst net 40.0.136.174/32) || (dst net 40.0.200.242/32))),
	((dst port 9401) || (dst port 26812) || (dst port 37647) || (dst port 38504) || (dst port 58657)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.20.172/32) || (dst net 41.0.56.51/32) || (dst net 41.0.82.151/32) || (dst net 41.0.129.149/32) || (dst net 41.0.205.124/32))),
	((dst port 4072) || (dst port 21349) || (dst port 25033) || (dst port 44579) || (dst port 65134)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.162.84/32) || (dst net 42.0.184.21/32) || (dst net 42.0.221.206/32) || (dst net 42.0.237.80/32) || (dst net 42.0.253.55/32))),
	((dst port 17241) || (dst port 31145) || (dst port 35655) || (dst port 47077) || (dst port 54387)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.32.174/32) || (dst net 43.0.111.211/32) || (dst net 43.0.127.247/32) || (dst net 43.0.134.150/32) || (dst net 43.0.211.78/32))),
	((dst port 429) || (dst port 1364) || (dst port 4950) || (dst port 5859) || (dst port 29698)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.13.122/32) || (dst net 44.0.106.90/32) || (dst net 44.0.180.247/32) || (dst net 44.0.181.245/32) || (dst net 44.0.228.60/32))),
	((dst port 15398) || (dst port 29449) || (dst port 34841) || (dst port 50905) || (dst port 57175)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.27.146/32) || (dst net 45.0.61.14/32) || (dst net 45.0.67.125/32) || (dst net 45.0.109.118/32) || (dst net 45.0.157.39/32))),
	((dst port 1241) || (dst port 21023) || (dst port 30309) || (dst port 33798) || (dst port 50471)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.151.170/32) || (dst net 46.0.159.238/32) || (dst net 46.0.198.42/32) || (dst net 46.0.218.163/32) || (dst net 46.0.240.30/32))),
	((dst port 19999) || (dst port 31005) || (dst port 36755) || (dst port 50690) || (dst port 56586)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.32.248/32) || (dst net 47.0.116.149/32) || (dst net 47.0.223.104/32) || (dst net 47.0.229.92/32) || (dst net 47.0.230.161/32))),
	((dst port 11946) || (dst port 37173) || (dst port 41588) || (dst port 45962) || (dst port 60369)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.56.31/32) || (dst net 48.0.64.201/32) || (dst net 48.0.98.58/32) || (dst net 48.0.141.35/32) || (dst net 48.0.175.204/32))),
	((dst port 3428) || (dst port 5007) || (dst port 7314) || (dst port 21702) || (dst port 53614)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.22.241/32) || (dst net 49.0.75.3/32) || (dst net 49.0.194.68/32) || (dst net 49.0.202.13/32) || (dst net 49.0.239.244/32))),
	((dst port 1338) || (dst port 9545) || (dst port 19920) || (dst port 25760) || (dst port 27371)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.95.42/32) || (dst net 50.0.105.230/32) || (dst net 50.0.126.247/32) || (dst net 50.0.197.162/32) || (dst net 50.0.223.90/32))),
	((dst port 16961) || (dst port 18656) || (dst port 19759) || (dst port 21566) || (dst port 47535)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.44.26/32) || (dst net 51.0.53.61/32) || (dst net 51.0.115.78/32) || (dst net 51.0.164.138/32) || (dst net 51.0.239.24/32))),
	((dst port 3055) || (dst port 11343) || (dst port 45299) || (dst port 57355) || (dst port 62559)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.49.51/32) || (dst net 52.0.98.174/32) || (dst net 52.0.117.244/32) || (dst net 52.0.196.233/32) || (dst net 52.0.225.104/32))),
	((dst port 10704) || (dst port 14944) || (dst port 17696) || (dst port 33833) || (dst port 37002)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.55.172/32) || (dst net 53.0.139.176/32) || (dst net 53.0.147.95/32) || (dst net 53.0.220.79/32) || (dst net 53.0.247.203/32))),
	((dst port 21484) || (dst port 40678) || (dst port 47773) || (dst port 55547) || (dst port 56962)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.40.117/32) || (dst net 54.0.41.50/32) || (dst net 54.0.117.203/32) || (dst net 54.0.168.80/32) || (dst net 54.0.237.134/32))),
	((dst port 24896) || (dst port 41752) || (dst port 45322) || (dst port 46562) || (dst port 47571)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.99.235/32) || (dst net 55.0.143.244/32) || (dst net 55.0.167.121/32) || (dst net 55.0.192.228/32) || (dst net 55.0.200.29/32))),
	((dst port 1495) || (dst port 14844) || (dst port 25066) || (dst port 27998) || (dst port 49080)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.15.151/32) || (dst net 56.0.44.74/32) || (dst net 56.0.159.49/32) || (dst net 56.0.161.224/32) || (dst net 56.0.215.75/32))),
	((dst port 6600) || (dst port 15488) || (dst port 20535) || (dst port 40496) || (dst port 65515)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.109.152/32) || (dst net 57.0.125.255/32) || (dst net 57.0.150.136/32) || (dst net 57.0.151.149/32) || (dst net 57.0.205.137/32))),
	((dst port 12690) || (dst port 15728) || (dst port 15776) || (dst port 22134) || (dst port 56371)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.63.159/32) || (dst net 58.0.112.46/32) || (dst net 58.0.153.45/32) || (dst net 58.0.186.29/32) || (dst net 58.0.231.246/32))),
	((dst port 2484) || (dst port 15053) || (dst port 28738) || (dst port 31117) || (dst port 55319)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.22.44/32) || (dst net 59.0.64.28/32) || (dst net 59.0.129.125/32) || (dst net 59.0.157.152/32) || (dst net 59.0.205.1/32))),
	((dst port 2259) || (dst port 10066) || (dst port 34095) || (dst port 40588) || (dst port 53118)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.13.55/32) || (dst net 60.0.153.79/32) || (dst net 60.0.205.236/32) || (dst net 60.0.227.12/32) || (dst net 60.0.248.45/32))),
	((dst port 17207) || (dst port 52732) || (dst port 54123) || (dst port 57127) || (dst port 60206)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.6.206/32) || (dst net 61.0.36.86/32) || (dst net 61.0.158.39/32) || (dst net 61.0.177.198/32) || (dst net 61.0.222.18/32))),
	((dst port 7865) || (dst port 9585) || (dst port 10710) || (dst port 20901) || (dst port 38989)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.3.174/32) || (dst net 62.0.56.42/32) || (dst net 62.0.99.231/32) || (dst net 62.0.166.40/32) || (dst net 62.0.200.235/32))),
	((dst port 652) || (dst port 16333) || (dst port 22882) || (dst port 43630) || (dst port 50982)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.94.97/32) || (dst net 63.0.98.23/32) || (dst net 63.0.170.151/32) || (dst net 63.0.221.121/32) || (dst net 63.0.252.255/32))),
	((dst port 13525) || (dst port 39494) || (dst port 42775) || (dst port 45922) || (dst port 47371)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.15.11/32) || (dst net 64.0.38.175/32) || (dst net 64.0.181.55/32) || (dst net 64.0.181.218/32) || (dst net 64.0.225.170/32))),
	((dst port 4306) || (dst port 9346) || (dst port 29659) || (dst port 30552) || (dst port 54211)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.41.174/32) || (dst net 65.0.69.47/32) || (dst net 65.0.129.86/32) || (dst net 65.0.136.93/32) || (dst net 65.0.244.91/32))),
	((dst port 3881) || (dst port 30520) || (dst port 50060) || (dst port 59098) || (dst port 59426)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.7.129/32) || (dst net 66.0.36.89/32) || (dst net 66.0.80.19/32) || (dst net 66.0.123.12/32) || (dst net 66.0.221.44/32))),
	((dst port 1713) || (dst port 17173) || (dst port 20935) || (dst port 55369) || (dst port 57403)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.24.252/32) || (dst net 67.0.66.175/32) || (dst net 67.0.68.138/32) || (dst net 67.0.163.121/32) || (dst net 67.0.201.196/32))),
	((dst port 375) || (dst port 2812) || (dst port 9311) || (dst port 38768) || (dst port 55711)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.142.43/32) || (dst net 68.0.154.127/32) || (dst net 68.0.161.22/32) || (dst net 68.0.214.25/32) || (dst net 68.0.230.70/32))),
	((dst port 7278) || (dst port 9726) || (dst port 10501) || (dst port 28758) || (dst port 38885)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.80.162/32) || (dst net 69.0.121.77/32) || (dst net 69.0.125.207/32) || (dst net 69.0.161.96/32) || (dst net 69.0.182.78/32))),
	((dst port 561) || (dst port 5866) || (dst port 32111) || (dst port 53749) || (dst port 60551)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.69.162/32) || (dst net 70.0.109.150/32) || (dst net 70.0.123.32/32) || (dst net 70.0.155.66/32) || (dst net 70.0.244.83/32))),
	((dst port 5059) || (dst port 12393) || (dst port 20554) || (dst port 28708) || (dst port 43685)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.24.63/32) || (dst net 71.0.51.221/32) || (dst net 71.0.155.93/32) || (dst net 71.0.204.12/32) || (dst net 71.0.224.253/32))),
	((dst port 1689) || (dst port 12887) || (dst port 21536) || (dst port 56553) || (dst port 60551)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.20.154/32) || (dst net 72.0.140.25/32) || (dst net 72.0.145.10/32) || (dst net 72.0.161.104/32) || (dst net 72.0.228.230/32))),
	((dst port 5088) || (dst port 28501) || (dst port 37045) || (dst port 49282) || (dst port 55831)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.36.164/32) || (dst net 73.0.58.173/32) || (dst net 73.0.99.47/32) || (dst net 73.0.163.100/32) || (dst net 73.0.209.215/32))),
	((dst port 1276) || (dst port 6029) || (dst port 17244) || (dst port 20803) || (dst port 45889)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.40.6/32) || (dst net 74.0.56.252/32) || (dst net 74.0.84.164/32) || (dst net 74.0.130.18/32) || (dst net 74.0.178.115/32))),
	((dst port 8366) || (dst port 23687) || (dst port 36578) || (dst port 46393) || (dst port 49839)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.0.25/32) || (dst net 75.0.11.167/32) || (dst net 75.0.60.145/32) || (dst net 75.0.93.45/32) || (dst net 75.0.144.207/32))),
	((dst port 9630) || (dst port 24792) || (dst port 41380) || (dst port 43297) || (dst port 65076)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.5.123/32) || (dst net 76.0.87.18/32) || (dst net 76.0.111.173/32) || (dst net 76.0.149.242/32) || (dst net 76.0.224.220/32))),
	((dst port 10642) || (dst port 17767) || (dst port 26319) || (dst port 26517) || (dst port 36468)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.27.198/32) || (dst net 77.0.95.179/32) || (dst net 77.0.105.75/32) || (dst net 77.0.210.112/32) || (dst net 77.0.241.122/32))),
	((dst port 14960) || (dst port 39164) || (dst port 43388) || (dst port 55318) || (dst port 62873)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.30.80/32) || (dst net 78.0.68.185/32) || (dst net 78.0.138.219/32) || (dst net 78.0.231.186/32) || (dst net 78.0.250.153/32))),
	((dst port 235) || (dst port 8659) || (dst port 13421) || (dst port 13648) || (dst port 26352)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.33.244/32) || (dst net 79.0.37.110/32) || (dst net 79.0.92.59/32) || (dst net 79.0.151.11/32) || (dst net 79.0.184.11/32))),
	((dst port 3606) || (dst port 4036) || (dst port 4160) || (dst port 25440) || (dst port 60433)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.51.153/32) || (dst net 80.0.79.181/32) || (dst net 80.0.111.0/32) || (dst net 80.0.147.135/32) || (dst net 80.0.239.182/32))),
	((dst port 2627) || (dst port 30326) || (dst port 53426) || (dst port 57789) || (dst port 58598)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.51.164/32) || (dst net 81.0.61.90/32) || (dst net 81.0.127.6/32) || (dst net 81.0.135.65/32) || (dst net 81.0.193.226/32))),
	((dst port 21739) || (dst port 34363) || (dst port 41967) || (dst port 55171) || (dst port 63918)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.1.74/32) || (dst net 82.0.14.212/32) || (dst net 82.0.22.69/32) || (dst net 82.0.176.231/32) || (dst net 82.0.192.16/32))),
	((dst port 6690) || (dst port 10311) || (dst port 40691) || (dst port 42163) || (dst port 52826)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.26.227/32) || (dst net 83.0.54.216/32) || (dst net 83.0.80.230/32) || (dst net 83.0.155.97/32) || (dst net 83.0.177.224/32))),
	((dst port 16697) || (dst port 24005) || (dst port 56943) || (dst port 60854) || (dst port 64316)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.53.40/32) || (dst net 84.0.55.14/32) || (dst net 84.0.80.228/32) || (dst net 84.0.142.77/32) || (dst net 84.0.200.16/32))),
	((dst port 12596) || (dst port 28121) || (dst port 42751) || (dst port 45033) || (dst port 63136)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.55.15/32) || (dst net 85.0.74.65/32) || (dst net 85.0.194.198/32) || (dst net 85.0.234.93/32) || (dst net 85.0.241.115/32))),
	((dst port 12684) || (dst port 16561) || (dst port 28355) || (dst port 39315) || (dst port 64060)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.57.104/32) || (dst net 86.0.115.190/32) || (dst net 86.0.143.173/32) || (dst net 86.0.152.126/32) || (dst net 86.0.235.107/32))),
	((dst port 288) || (dst port 26492) || (dst port 37147) || (dst port 57001) || (dst port 57942)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.2.246/32) || (dst net 87.0.13.56/32) || (dst net 87.0.32.35/32) || (dst net 87.0.123.175/32) || (dst net 87.0.249.240/32))),
	((dst port 2348) || (dst port 12860) || (dst port 33320) || (dst port 54117) || (dst port 63607)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.11.147/32) || (dst net 88.0.60.180/32) || (dst net 88.0.75.0/32) || (dst net 88.0.237.249/32) || (dst net 88.0.255.84/32))),
	((dst port 14783) || (dst port 17790) || (dst port 28109) || (dst port 45434) || (dst port 57989)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.63.176/32) || (dst net 89.0.90.187/32) || (dst net 89.0.105.200/32) || (dst net 89.0.125.218/32) || (dst net 89.0.200.205/32))),
	((dst port 4969) || (dst port 13620) || (dst port 45986) || (dst port 57777) || (dst port 59730)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.30.189/32) || (dst net 90.0.52.196/32) || (dst net 90.0.62.46/32) || (dst net 90.0.115.47/32) || (dst net 90.0.216.209/32))),
	((dst port 20221) || (dst port 22809) || (dst port 40637) || (dst port 47059) || (dst port 54606)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.58.230/32) || (dst net 91.0.96.78/32) || (dst net 91.0.122.50/32) || (dst net 91.0.172.73/32) || (dst net 91.0.221.150/32))),
	((dst port 9739) || (dst port 31055) || (dst port 43020) || (dst port 43299) || (dst port 61079)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.57.106/32) || (dst net 92.0.74.69/32) || (dst net 92.0.195.183/32) || (dst net 92.0.240.139/32) || (dst net 92.0.250.40/32))),
	((dst port 8542) || (dst port 22744) || (dst port 32237) || (dst port 43759) || (dst port 50214)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.1.104/32) || (dst net 93.0.28.174/32) || (dst net 93.0.51.28/32) || (dst net 93.0.89.76/32) || (dst net 93.0.95.208/32))),
	((dst port 7358) || (dst port 21125) || (dst port 62675) || (dst port 62988) || (dst port 63250)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.24.5/32) || (dst net 94.0.98.178/32) || (dst net 94.0.129.238/32) || (dst net 94.0.156.206/32) || (dst net 94.0.223.52/32))),
	((dst port 4539) || (dst port 8120) || (dst port 12537) || (dst port 12626) || (dst port 18764)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.11.117/32) || (dst net 95.0.91.225/32) || (dst net 95.0.133.156/32) || (dst net 95.0.184.149/32) || (dst net 95.0.234.207/32))),
	((dst port 9950) || (dst port 24707) || (dst port 42607) || (dst port 43122) || (dst port 53463)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.17.30/32) || (dst net 96.0.22.35/32) || (dst net 96.0.112.226/32) || (dst net 96.0.224.126/32) || (dst net 96.0.237.218/32))),
	((dst port 16992) || (dst port 30470) || (dst port 49758) || (dst port 50636) || (dst port 64720)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.5.204/32) || (dst net 97.0.27.223/32) || (dst net 97.0.177.18/32) || (dst net 97.0.203.90/32) || (dst net 97.0.221.164/32))),
	((dst port 4108) || (dst port 15766) || (dst port 20056) || (dst port 20897) || (dst port 32386)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.18.79/32) || (dst net 98.0.23.90/32) || (dst net 98.0.58.64/32) || (dst net 98.0.165.204/32) || (dst net 98.0.223.136/32))),
	((dst port 202) || (dst port 6683) || (dst port 32069) || (dst port 32176) || (dst port 55301)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.6.134/32) || (dst net 99.0.67.206/32) || (dst net 99.0.130.115/32) || (dst net 99.0.148.236/32) || (dst net 99.0.217.217/32))),
	((dst port 3925) || (dst port 14942) || (dst port 26508) || (dst port 51021) || (dst port 56082)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.48.90/32) || (dst net 100.0.85.147/32) || (dst net 100.0.203.120/32) || (dst net 100.0.206.79/32) || (dst net 100.0.243.26/32))),
	((dst port 14434) || (dst port 39559) || (dst port 48714) || (dst port 57287) || (dst port 65399)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.72.173/32) || (dst net 101.0.75.168/32) || (dst net 101.0.130.187/32) || (dst net 101.0.183.108/32) || (dst net 101.0.220.21/32))),
	((dst port 15803) || (dst port 36368) || (dst port 44889) || (dst port 48948) || (dst port 57045)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.31.178/32) || (dst net 102.0.47.176/32) || (dst net 102.0.95.44/32) || (dst net 102.0.222.119/32) || (dst net 102.0.244.242/32))),
	((dst port 18373) || (dst port 19194) || (dst port 21612) || (dst port 33485) || (dst port 57434)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.8.117/32) || (dst net 103.0.61.137/32) || (dst net 103.0.181.110/32) || (dst net 103.0.213.166/32) || (dst net 103.0.214.76/32))),
	((dst port 8428) || (dst port 12646) || (dst port 26203) || (dst port 48310) || (dst port 60138)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.49.71/32) || (dst net 104.0.61.155/32) || (dst net 104.0.138.116/32) || (dst net 104.0.210.75/32) || (dst net 104.0.235.5/32))),
	((dst port 32812) || (dst port 37378) || (dst port 38225) || (dst port 46733) || (dst port 52797)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.37.103/32) || (dst net 105.0.113.90/32) || (dst net 105.0.147.117/32) || (dst net 105.0.182.32/32) || (dst net 105.0.186.90/32))),
	((dst port 27451) || (dst port 28105) || (dst port 35603) || (dst port 43020) || (dst port 62685)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.53.178/32) || (dst net 106.0.95.37/32) || (dst net 106.0.125.247/32) || (dst net 106.0.186.147/32) || (dst net 106.0.232.110/32))),
	((dst port 857) || (dst port 43521) || (dst port 50910) || (dst port 56509) || (dst port 62590)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.45.208/32) || (dst net 107.0.132.219/32) || (dst net 107.0.135.66/32) || (dst net 107.0.153.89/32) || (dst net 107.0.235.201/32))),
	((dst port 34649) || (dst port 37815) || (dst port 41663) || (dst port 42498) || (dst port 42677)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.14.104/32) || (dst net 108.0.141.229/32) || (dst net 108.0.198.235/32) || (dst net 108.0.208.90/32) || (dst net 108.0.223.205/32))),
	((dst port 1846) || (dst port 27857) || (dst port 32394) || (dst port 59236) || (dst port 61891)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.5.218/32) || (dst net 109.0.96.121/32) || (dst net 109.0.117.65/32) || (dst net 109.0.145.174/32) || (dst net 109.0.179.241/32))),
	((dst port 1368) || (dst port 25487) || (dst port 47436) || (dst port 55582) || (dst port 59990)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.16.72/32) || (dst net 110.0.54.159/32) || (dst net 110.0.238.19/32) || (dst net 110.0.240.156/32) || (dst net 110.0.252.113/32))),
	((dst port 6166) || (dst port 7180) || (dst port 14845) || (dst port 22687) || (dst port 25133)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.5.9/32) || (dst net 111.0.33.170/32) || (dst net 111.0.47.240/32) || (dst net 111.0.66.109/32) || (dst net 111.0.179.240/32))),
	((dst port 19869) || (dst port 23024) || (dst port 33046) || (dst port 60922) || (dst port 61607)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.82.118/32) || (dst net 112.0.97.137/32) || (dst net 112.0.121.192/32) || (dst net 112.0.164.172/32) || (dst net 112.0.232.154/32))),
	((dst port 2278) || (dst port 14980) || (dst port 16920) || (dst port 18655) || (dst port 44019)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.94.135/32) || (dst net 113.0.165.121/32) || (dst net 113.0.171.239/32) || (dst net 113.0.175.128/32) || (dst net 113.0.243.117/32))),
	((dst port 8280) || (dst port 11363) || (dst port 18940) || (dst port 38320) || (dst port 55271)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.27.21/32) || (dst net 114.0.44.168/32) || (dst net 114.0.80.65/32) || (dst net 114.0.176.18/32) || (dst net 114.0.209.78/32))),
	((dst port 1404) || (dst port 10019) || (dst port 26631) || (dst port 41973) || (dst port 62796)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.35.85/32) || (dst net 115.0.37.140/32) || (dst net 115.0.185.216/32) || (dst net 115.0.191.77/32) || (dst net 115.0.254.15/32))),
	((dst port 6175) || (dst port 6299) || (dst port 11429) || (dst port 41903) || (dst port 58414)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.25.216/32) || (dst net 116.0.148.150/32) || (dst net 116.0.193.47/32) || (dst net 116.0.193.235/32) || (dst net 116.0.222.242/32))),
	((dst port 3786) || (dst port 6620) || (dst port 16600) || (dst port 19625) || (dst port 59643)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.44.158/32) || (dst net 117.0.130.235/32) || (dst net 117.0.181.153/32) || (dst net 117.0.205.122/32) || (dst net 117.0.223.229/32))),
	((dst port 28045) || (dst port 43511) || (dst port 49296) || (dst port 63493) || (dst port 63922)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.66.3/32) || (dst net 118.0.185.181/32) || (dst net 118.0.199.217/32) || (dst net 118.0.200.240/32) || (dst net 118.0.203.76/32))),
	((dst port 5434) || (dst port 10750) || (dst port 40172) || (dst port 40985) || (dst port 64608)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.30.117/32) || (dst net 119.0.45.221/32) || (dst net 119.0.177.151/32) || (dst net 119.0.241.83/32) || (dst net 119.0.252.199/32))),
	((dst port 254) || (dst port 15632) || (dst port 23630) || (dst port 44411) || (dst port 59462)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.3.124/32) || (dst net 120.0.40.178/32) || (dst net 120.0.179.166/32) || (dst net 120.0.220.124/32) || (dst net 120.0.225.217/32))),
	((dst port 5497) || (dst port 36731) || (dst port 48220) || (dst port 57070) || (dst port 60724)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.95.124/32) || (dst net 121.0.139.181/32) || (dst net 121.0.197.139/32) || (dst net 121.0.225.188/32) || (dst net 121.0.243.59/32))),
	((dst port 4106) || (dst port 6092) || (dst port 19735) || (dst port 20715) || (dst port 31007)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.115.240/32) || (dst net 122.0.128.6/32) || (dst net 122.0.138.242/32) || (dst net 122.0.247.46/32) || (dst net 122.0.255.48/32))),
	((dst port 1311) || (dst port 15882) || (dst port 16047) || (dst port 28295) || (dst port 51333)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.0.26/32) || (dst net 123.0.125.98/32) || (dst net 123.0.141.149/32) || (dst net 123.0.207.16/32) || (dst net 123.0.243.110/32))),
	((dst port 17585) || (dst port 18664) || (dst port 22259) || (dst port 36570) || (dst port 60334)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.6.218/32) || (dst net 124.0.78.84/32) || (dst net 124.0.130.129/32) || (dst net 124.0.160.158/32) || (dst net 124.0.199.232/32))),
	((dst port 29084) || (dst port 42288) || (dst port 50290) || (dst port 54783) || (dst port 60210)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.3.72/32) || (dst net 125.0.44.5/32) || (dst net 125.0.129.13/32) || (dst net 125.0.152.28/32) || (dst net 125.0.192.104/32))),
	((dst port 16952) || (dst port 17708) || (dst port 18675) || (dst port 29054) || (dst port 58394)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.164.157/32) || (dst net 126.0.181.203/32) || (dst net 126.0.207.101/32) || (dst net 126.0.233.123/32) || (dst net 126.0.246.108/32))),
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
