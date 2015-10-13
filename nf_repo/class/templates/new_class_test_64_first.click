ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 1337) || (dst port 23060) || (dst port 27015) || (dst port 31883) || (dst port 56262)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.64.49/32) || (dst net 1.0.72.186/32) || (dst net 1.0.131.235/32) || (dst net 1.0.140.193/32) || (dst net 1.0.184.11/32))),
	((dst port 2844) || (dst port 26754) || (dst port 35746) || (dst port 38514) || (dst port 52846)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.102.137/32) || (dst net 2.0.145.147/32) || (dst net 2.0.234.108/32) || (dst net 2.0.245.164/32) || (dst net 2.0.255.119/32))),
	((dst port 19194) || (dst port 20058) || (dst port 36954) || (dst port 54441) || (dst port 64095)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.33.78/32) || (dst net 3.0.53.12/32) || (dst net 3.0.147.32/32) || (dst net 3.0.174.109/32) || (dst net 3.0.248.32/32))),
	((dst port 13133) || (dst port 13379) || (dst port 38979) || (dst port 44674) || (dst port 52937)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.21.23/32) || (dst net 4.0.85.55/32) || (dst net 4.0.133.134/32) || (dst net 4.0.149.110/32) || (dst net 4.0.252.37/32))),
	((dst port 5947) || (dst port 10486) || (dst port 16189) || (dst port 49903) || (dst port 51722)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.41.248/32) || (dst net 5.0.50.141/32) || (dst net 5.0.71.226/32) || (dst net 5.0.203.7/32) || (dst net 5.0.223.49/32))),
	((dst port 50925) || (dst port 51133) || (dst port 53924) || (dst port 62546) || (dst port 64668)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.85.44/32) || (dst net 6.0.100.77/32) || (dst net 6.0.132.95/32) || (dst net 6.0.152.194/32) || (dst net 6.0.222.54/32))),
	((dst port 27529) || (dst port 31311) || (dst port 38356) || (dst port 45271) || (dst port 52535)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.101.139/32) || (dst net 7.0.160.197/32) || (dst net 7.0.175.187/32) || (dst net 7.0.196.183/32) || (dst net 7.0.215.139/32))),
	((dst port 2) || (dst port 17034) || (dst port 28131) || (dst port 30411) || (dst port 58895)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.75.120/32) || (dst net 8.0.121.109/32) || (dst net 8.0.141.10/32) || (dst net 8.0.150.69/32) || (dst net 8.0.208.75/32))),
	((dst port 18330) || (dst port 42761) || (dst port 48843) || (dst port 51301) || (dst port 64357)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.23.131/32) || (dst net 9.0.143.244/32) || (dst net 9.0.168.120/32) || (dst net 9.0.170.234/32) || (dst net 9.0.173.215/32))),
	((dst port 16624) || (dst port 18782) || (dst port 19389) || (dst port 48377) || (dst port 51208)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.1.83/32) || (dst net 10.0.15.39/32) || (dst net 10.0.22.57/32) || (dst net 10.0.54.244/32) || (dst net 10.0.237.66/32))),
	((dst port 13681) || (dst port 30678) || (dst port 31059) || (dst port 44822) || (dst port 49311)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.64.43/32) || (dst net 11.0.121.35/32) || (dst net 11.0.228.77/32) || (dst net 11.0.232.245/32) || (dst net 11.0.236.79/32))),
	((dst port 9745) || (dst port 17229) || (dst port 25985) || (dst port 50559) || (dst port 60192)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.129.163/32) || (dst net 12.0.213.200/32) || (dst net 12.0.229.214/32) || (dst net 12.0.245.111/32) || (dst net 12.0.249.31/32))),
	((dst port 17835) || (dst port 42409) || (dst port 48629) || (dst port 51134) || (dst port 54363)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.107.46/32) || (dst net 13.0.116.89/32) || (dst net 13.0.162.231/32) || (dst net 13.0.197.72/32) || (dst net 13.0.198.150/32))),
	((dst port 27849) || (dst port 28204) || (dst port 41521) || (dst port 55125) || (dst port 61920)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.19.199/32) || (dst net 14.0.30.184/32) || (dst net 14.0.46.47/32) || (dst net 14.0.201.168/32) || (dst net 14.0.253.236/32))),
	((dst port 2726) || (dst port 2850) || (dst port 6160) || (dst port 14982) || (dst port 56456)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.63.46/32) || (dst net 15.0.96.143/32) || (dst net 15.0.204.111/32) || (dst net 15.0.212.39/32) || (dst net 15.0.242.44/32))),
	((dst port 7137) || (dst port 13868) || (dst port 26458) || (dst port 27359) || (dst port 65426)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.131.17/32) || (dst net 16.0.192.8/32) || (dst net 16.0.211.2/32) || (dst net 16.0.222.121/32) || (dst net 16.0.244.101/32))),
	((dst port 27318) || (dst port 53548) || (dst port 53573) || (dst port 58932) || (dst port 63299)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.24.205/32) || (dst net 17.0.52.52/32) || (dst net 17.0.92.176/32) || (dst net 17.0.99.25/32) || (dst net 17.0.210.215/32))),
	((dst port 275) || (dst port 40991) || (dst port 43747) || (dst port 48438) || (dst port 64714)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.106.68/32) || (dst net 18.0.117.98/32) || (dst net 18.0.151.188/32) || (dst net 18.0.154.118/32) || (dst net 18.0.185.152/32))),
	((dst port 9568) || (dst port 16963) || (dst port 29587) || (dst port 44614) || (dst port 46128)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.33.83/32) || (dst net 19.0.60.161/32) || (dst net 19.0.84.14/32) || (dst net 19.0.173.135/32) || (dst net 19.0.229.104/32))),
	((dst port 14204) || (dst port 46889) || (dst port 48013) || (dst port 51488) || (dst port 62799)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.18.222/32) || (dst net 20.0.51.245/32) || (dst net 20.0.153.74/32) || (dst net 20.0.176.228/32) || (dst net 20.0.225.50/32))),
	((dst port 14328) || (dst port 17741) || (dst port 27538) || (dst port 44359) || (dst port 49863)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.5.60/32) || (dst net 21.0.49.250/32) || (dst net 21.0.55.39/32) || (dst net 21.0.189.145/32) || (dst net 21.0.214.212/32))),
	((dst port 1148) || (dst port 7177) || (dst port 27056) || (dst port 35270) || (dst port 47530)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.12.237/32) || (dst net 22.0.117.46/32) || (dst net 22.0.159.113/32) || (dst net 22.0.162.58/32) || (dst net 22.0.213.251/32))),
	((dst port 21620) || (dst port 24627) || (dst port 35694) || (dst port 41409) || (dst port 50388)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.7.29/32) || (dst net 23.0.26.45/32) || (dst net 23.0.62.19/32) || (dst net 23.0.111.143/32) || (dst net 23.0.163.239/32))),
	((dst port 22181) || (dst port 24140) || (dst port 51559) || (dst port 54952) || (dst port 55956)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.12.91/32) || (dst net 24.0.20.53/32) || (dst net 24.0.47.65/32) || (dst net 24.0.120.104/32) || (dst net 24.0.195.67/32))),
	((dst port 11926) || (dst port 23001) || (dst port 27055) || (dst port 34796) || (dst port 36337)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.71.80/32) || (dst net 25.0.180.14/32) || (dst net 25.0.208.184/32) || (dst net 25.0.222.210/32) || (dst net 25.0.229.222/32))),
	((dst port 26281) || (dst port 39478) || (dst port 52532) || (dst port 53891) || (dst port 56879)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.36.14/32) || (dst net 26.0.60.62/32) || (dst net 26.0.60.221/32) || (dst net 26.0.185.174/32) || (dst net 26.0.248.214/32))),
	((dst port 10816) || (dst port 20338) || (dst port 44407) || (dst port 47835) || (dst port 57599)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.9.229/32) || (dst net 27.0.90.242/32) || (dst net 27.0.124.219/32) || (dst net 27.0.193.81/32) || (dst net 27.0.250.135/32))),
	((dst port 1990) || (dst port 13850) || (dst port 37232) || (dst port 54352) || (dst port 61906)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.5.172/32) || (dst net 28.0.38.127/32) || (dst net 28.0.73.177/32) || (dst net 28.0.151.123/32) || (dst net 28.0.232.31/32))),
	((dst port 2291) || (dst port 13765) || (dst port 24157) || (dst port 37638) || (dst port 49609)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.17.121/32) || (dst net 29.0.39.178/32) || (dst net 29.0.78.186/32) || (dst net 29.0.149.6/32) || (dst net 29.0.164.68/32))),
	((dst port 22714) || (dst port 23228) || (dst port 40783) || (dst port 45734) || (dst port 63391)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.16.178/32) || (dst net 30.0.70.125/32) || (dst net 30.0.77.137/32) || (dst net 30.0.95.204/32) || (dst net 30.0.197.71/32))),
	((dst port 10603) || (dst port 21485) || (dst port 30071) || (dst port 48244) || (dst port 52932)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.39.137/32) || (dst net 31.0.132.26/32) || (dst net 31.0.144.195/32) || (dst net 31.0.176.98/32) || (dst net 31.0.178.73/32))),
	((dst port 7286) || (dst port 37163) || (dst port 37727) || (dst port 47741) || (dst port 64737)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.3.48/32) || (dst net 32.0.112.206/32) || (dst net 32.0.144.65/32) || (dst net 32.0.206.54/32) || (dst net 32.0.238.225/32))),
	((dst port 9731) || (dst port 22622) || (dst port 34437) || (dst port 38522) || (dst port 47555)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.113.202/32) || (dst net 33.0.121.139/32) || (dst net 33.0.130.198/32) || (dst net 33.0.139.133/32) || (dst net 33.0.149.207/32))),
	((dst port 2272) || (dst port 10652) || (dst port 30357) || (dst port 45401) || (dst port 45436)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.8.111/32) || (dst net 34.0.104.190/32) || (dst net 34.0.130.11/32) || (dst net 34.0.193.241/32) || (dst net 34.0.232.178/32))),
	((dst port 18921) || (dst port 21800) || (dst port 27808) || (dst port 42963) || (dst port 54726)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.43.246/32) || (dst net 35.0.64.48/32) || (dst net 35.0.190.82/32) || (dst net 35.0.209.243/32) || (dst net 35.0.242.114/32))),
	((dst port 13689) || (dst port 33641) || (dst port 33949) || (dst port 45145) || (dst port 48355)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.15.29/32) || (dst net 36.0.98.23/32) || (dst net 36.0.110.115/32) || (dst net 36.0.112.255/32) || (dst net 36.0.164.241/32))),
	((dst port 1908) || (dst port 7598) || (dst port 35426) || (dst port 41422) || (dst port 48031)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.31.172/32) || (dst net 37.0.93.245/32) || (dst net 37.0.106.100/32) || (dst net 37.0.128.151/32) || (dst net 37.0.208.49/32))),
	((dst port 25048) || (dst port 41299) || (dst port 46223) || (dst port 62029) || (dst port 63941)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.130.195/32) || (dst net 38.0.131.25/32) || (dst net 38.0.140.185/32) || (dst net 38.0.180.243/32) || (dst net 38.0.184.145/32))),
	((dst port 11746) || (dst port 29480) || (dst port 32130) || (dst port 52463) || (dst port 55670)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.47.50/32) || (dst net 39.0.77.220/32) || (dst net 39.0.125.31/32) || (dst net 39.0.175.214/32) || (dst net 39.0.179.68/32))),
	((dst port 12297) || (dst port 23407) || (dst port 30063) || (dst port 39108) || (dst port 44212)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.6.2/32) || (dst net 40.0.59.232/32) || (dst net 40.0.86.197/32) || (dst net 40.0.135.23/32) || (dst net 40.0.223.48/32))),
	((dst port 1458) || (dst port 53750) || (dst port 56104) || (dst port 60557) || (dst port 63893)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.13.71/32) || (dst net 41.0.35.129/32) || (dst net 41.0.108.81/32) || (dst net 41.0.210.42/32) || (dst net 41.0.216.84/32))),
	((dst port 810) || (dst port 1129) || (dst port 35861) || (dst port 39673) || (dst port 52258)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.25.99/32) || (dst net 42.0.70.141/32) || (dst net 42.0.188.104/32) || (dst net 42.0.200.62/32) || (dst net 42.0.212.62/32))),
	((dst port 42706) || (dst port 44996) || (dst port 48211) || (dst port 48305) || (dst port 53366)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.7.112/32) || (dst net 43.0.79.223/32) || (dst net 43.0.82.20/32) || (dst net 43.0.147.186/32) || (dst net 43.0.160.120/32))),
	((dst port 13880) || (dst port 15792) || (dst port 37317) || (dst port 40379) || (dst port 57923)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.0.210/32) || (dst net 44.0.26.166/32) || (dst net 44.0.33.55/32) || (dst net 44.0.80.241/32) || (dst net 44.0.193.22/32))),
	((dst port 4133) || (dst port 25543) || (dst port 42460) || (dst port 52287) || (dst port 64288)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.22.179/32) || (dst net 45.0.96.129/32) || (dst net 45.0.151.251/32) || (dst net 45.0.205.199/32) || (dst net 45.0.224.212/32))),
	((dst port 2605) || (dst port 10411) || (dst port 30981) || (dst port 46844) || (dst port 57067)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.64.46/32) || (dst net 46.0.84.207/32) || (dst net 46.0.151.135/32) || (dst net 46.0.221.33/32) || (dst net 46.0.246.44/32))),
	((dst port 12632) || (dst port 17919) || (dst port 22571) || (dst port 42692) || (dst port 44739)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.10.147/32) || (dst net 47.0.18.109/32) || (dst net 47.0.47.150/32) || (dst net 47.0.60.228/32) || (dst net 47.0.202.73/32))),
	((dst port 4046) || (dst port 14497) || (dst port 18907) || (dst port 51528) || (dst port 60878)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.5.209/32) || (dst net 48.0.58.116/32) || (dst net 48.0.81.40/32) || (dst net 48.0.169.133/32) || (dst net 48.0.250.236/32))),
	((dst port 1592) || (dst port 18493) || (dst port 31702) || (dst port 34966) || (dst port 61267)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.46.96/32) || (dst net 49.0.65.215/32) || (dst net 49.0.98.118/32) || (dst net 49.0.166.184/32) || (dst net 49.0.189.157/32))),
	((dst port 429) || (dst port 12573) || (dst port 14796) || (dst port 20445) || (dst port 33429)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.88.127/32) || (dst net 50.0.150.75/32) || (dst net 50.0.222.138/32) || (dst net 50.0.226.176/32) || (dst net 50.0.247.186/32))),
	((dst port 9114) || (dst port 18316) || (dst port 32436) || (dst port 42250) || (dst port 58567)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.46.221/32) || (dst net 51.0.49.32/32) || (dst net 51.0.56.109/32) || (dst net 51.0.139.49/32) || (dst net 51.0.209.102/32))),
	((dst port 15992) || (dst port 19452) || (dst port 23627) || (dst port 25176) || (dst port 37401)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.11.12/32) || (dst net 52.0.21.21/32) || (dst net 52.0.47.12/32) || (dst net 52.0.90.14/32) || (dst net 52.0.177.120/32))),
	((dst port 33823) || (dst port 43415) || (dst port 48964) || (dst port 52026) || (dst port 61207)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.74.14/32) || (dst net 53.0.82.28/32) || (dst net 53.0.89.226/32) || (dst net 53.0.221.224/32) || (dst net 53.0.235.52/32))),
	((dst port 3878) || (dst port 6562) || (dst port 12780) || (dst port 28401) || (dst port 45242)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.78.186/32) || (dst net 54.0.82.170/32) || (dst net 54.0.147.248/32) || (dst net 54.0.203.135/32) || (dst net 54.0.207.33/32))),
	((dst port 456) || (dst port 34539) || (dst port 41116) || (dst port 42155) || (dst port 64311)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.82.164/32) || (dst net 55.0.132.17/32) || (dst net 55.0.139.17/32) || (dst net 55.0.156.197/32) || (dst net 55.0.251.227/32))),
	((dst port 9446) || (dst port 12839) || (dst port 26043) || (dst port 49553) || (dst port 57178)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.43.243/32) || (dst net 56.0.48.249/32) || (dst net 56.0.73.2/32) || (dst net 56.0.113.142/32) || (dst net 56.0.237.198/32))),
	((dst port 5520) || (dst port 7153) || (dst port 27345) || (dst port 39529) || (dst port 52806)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.84.3/32) || (dst net 57.0.146.41/32) || (dst net 57.0.205.37/32) || (dst net 57.0.211.4/32) || (dst net 57.0.222.107/32))),
	((dst port 11520) || (dst port 17564) || (dst port 26798) || (dst port 29691) || (dst port 58886)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.82.215/32) || (dst net 58.0.128.250/32) || (dst net 58.0.129.191/32) || (dst net 58.0.168.227/32) || (dst net 58.0.190.127/32))),
	((dst port 26242) || (dst port 33803) || (dst port 39101) || (dst port 44896) || (dst port 59414)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.44.152/32) || (dst net 59.0.116.99/32) || (dst net 59.0.123.117/32) || (dst net 59.0.244.82/32) || (dst net 59.0.245.125/32))),
	((dst port 6524) || (dst port 6842) || (dst port 8700) || (dst port 51479) || (dst port 54335)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.88.140/32) || (dst net 60.0.97.93/32) || (dst net 60.0.190.64/32) || (dst net 60.0.246.131/32) || (dst net 60.0.251.0/32))),
	((dst port 1595) || (dst port 6348) || (dst port 7930) || (dst port 15949) || (dst port 46129)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.35.204/32) || (dst net 61.0.89.223/32) || (dst net 61.0.97.79/32) || (dst net 61.0.199.183/32) || (dst net 61.0.203.84/32))),
	((dst port 4235) || (dst port 17860) || (dst port 37778) || (dst port 38643) || (dst port 65232)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.22.188/32) || (dst net 62.0.148.96/32) || (dst net 62.0.150.113/32) || (dst net 62.0.182.154/32) || (dst net 62.0.238.92/32))),
	((dst port 2927) || (dst port 8789) || (dst port 18000) || (dst port 37932) || (dst port 42053)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.61.12/32) || (dst net 63.0.65.187/32) || (dst net 63.0.96.57/32) || (dst net 63.0.207.122/32) || (dst net 63.0.251.160/32))),
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
