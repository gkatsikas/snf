ipclassifier :: IPClassifier(
	((dst port 22138) || (dst port 24310) || (dst port 25718) || (dst port 27735) || (dst port 43550)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.95.59/32) || (dst net 0.0.170.203/32) || (dst net 0.0.177.244/32) || (dst net 0.0.235.85/32) || (dst net 0.0.239.151/32))),
	((dst port 1488) || (dst port 5619) || (dst port 6024) || (dst port 9296) || (dst port 64181)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.19.254/32) || (dst net 1.0.62.10/32) || (dst net 1.0.148.87/32) || (dst net 1.0.156.203/32) || (dst net 1.0.186.140/32))),
	((dst port 35839) || (dst port 46827) || (dst port 51197) || (dst port 52763) || (dst port 61536)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.4.219/32) || (dst net 2.0.158.234/32) || (dst net 2.0.161.93/32) || (dst net 2.0.196.36/32) || (dst net 2.0.220.34/32))),
	((dst port 13974) || (dst port 44008) || (dst port 50949) || (dst port 52816) || (dst port 54633)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.5.148/32) || (dst net 3.0.49.220/32) || (dst net 3.0.87.185/32) || (dst net 3.0.89.39/32) || (dst net 3.0.239.236/32))),
	((dst port 4108) || (dst port 8030) || (dst port 31924) || (dst port 46010) || (dst port 64645)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.51.203/32) || (dst net 4.0.74.206/32) || (dst net 4.0.96.197/32) || (dst net 4.0.108.250/32) || (dst net 4.0.174.16/32))),
	((dst port 22725) || (dst port 49366) || (dst port 59674) || (dst port 63449) || (dst port 63681)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.7.67/32) || (dst net 5.0.28.231/32) || (dst net 5.0.179.165/32) || (dst net 5.0.196.254/32) || (dst net 5.0.203.245/32))),
	((dst port 8547) || (dst port 20351) || (dst port 32001) || (dst port 46745) || (dst port 56376)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.3.231/32) || (dst net 6.0.17.45/32) || (dst net 6.0.27.169/32) || (dst net 6.0.77.85/32) || (dst net 6.0.216.142/32))),
	((dst port 5798) || (dst port 6122) || (dst port 6690) || (dst port 11648) || (dst port 42220)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.10.148/32) || (dst net 7.0.175.175/32) || (dst net 7.0.189.61/32) || (dst net 7.0.201.94/32) || (dst net 7.0.224.141/32))),
	((dst port 26324) || (dst port 27950) || (dst port 50050) || (dst port 52540) || (dst port 53275)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.36.183/32) || (dst net 8.0.56.13/32) || (dst net 8.0.150.164/32) || (dst net 8.0.165.143/32) || (dst net 8.0.232.189/32))),
	((dst port 17242) || (dst port 17387) || (dst port 51137) || (dst port 59780) || (dst port 60516)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.54.203/32) || (dst net 9.0.71.248/32) || (dst net 9.0.85.62/32) || (dst net 9.0.111.210/32) || (dst net 9.0.205.116/32))),
	((dst port 2201) || (dst port 37040) || (dst port 37973) || (dst port 45637) || (dst port 59718)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.144.242/32) || (dst net 10.0.158.109/32) || (dst net 10.0.168.142/32) || (dst net 10.0.188.149/32) || (dst net 10.0.225.114/32))),
	((dst port 18087) || (dst port 33475) || (dst port 34824) || (dst port 39301) || (dst port 48051)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.12.115/32) || (dst net 11.0.63.19/32) || (dst net 11.0.138.85/32) || (dst net 11.0.200.46/32) || (dst net 11.0.229.243/32))),
	((dst port 3581) || (dst port 5320) || (dst port 25659) || (dst port 35024) || (dst port 61549)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.11.233/32) || (dst net 12.0.16.187/32) || (dst net 12.0.102.169/32) || (dst net 12.0.181.149/32) || (dst net 12.0.212.24/32))),
	((dst port 803) || (dst port 9708) || (dst port 37875) || (dst port 40663) || (dst port 60445)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.73.206/32) || (dst net 13.0.96.152/32) || (dst net 13.0.140.143/32) || (dst net 13.0.156.65/32) || (dst net 13.0.212.174/32))),
	((dst port 814) || (dst port 2164) || (dst port 5267) || (dst port 59427) || (dst port 60819)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.43.56/32) || (dst net 14.0.85.161/32) || (dst net 14.0.144.145/32) || (dst net 14.0.193.153/32) || (dst net 14.0.226.63/32))),
	((dst port 3828) || (dst port 5865) || (dst port 8267) || (dst port 12884) || (dst port 46034)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.80.34/32) || (dst net 15.0.144.192/32) || (dst net 15.0.191.188/32) || (dst net 15.0.200.214/32) || (dst net 15.0.250.217/32))),
	((dst port 7470) || (dst port 9497) || (dst port 37856) || (dst port 56537) || (dst port 56782)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.28.168/32) || (dst net 16.0.61.165/32) || (dst net 16.0.80.152/32) || (dst net 16.0.92.235/32) || (dst net 16.0.105.82/32))),
	((dst port 12307) || (dst port 15488) || (dst port 22455) || (dst port 48162) || (dst port 63927)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.83.222/32) || (dst net 17.0.136.42/32) || (dst net 17.0.137.178/32) || (dst net 17.0.209.154/32) || (dst net 17.0.254.51/32))),
	((dst port 1002) || (dst port 25194) || (dst port 31167) || (dst port 49707) || (dst port 62143)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.18.133/32) || (dst net 18.0.212.82/32) || (dst net 18.0.228.252/32) || (dst net 18.0.236.224/32) || (dst net 18.0.253.168/32))),
	((dst port 687) || (dst port 6183) || (dst port 24375) || (dst port 27522) || (dst port 45425)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.13.38/32) || (dst net 19.0.32.124/32) || (dst net 19.0.72.151/32) || (dst net 19.0.169.239/32) || (dst net 19.0.214.77/32))),
	((dst port 16130) || (dst port 29964) || (dst port 32859) || (dst port 38420) || (dst port 48054)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.44.72/32) || (dst net 20.0.48.176/32) || (dst net 20.0.58.52/32) || (dst net 20.0.81.165/32) || (dst net 20.0.106.75/32))),
	((dst port 4705) || (dst port 11405) || (dst port 24746) || (dst port 40629) || (dst port 65108)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.16.52/32) || (dst net 21.0.59.129/32) || (dst net 21.0.99.115/32) || (dst net 21.0.123.52/32) || (dst net 21.0.234.214/32))),
	((dst port 6264) || (dst port 17410) || (dst port 44454) || (dst port 54802) || (dst port 64902)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.73.234/32) || (dst net 22.0.101.41/32) || (dst net 22.0.157.17/32) || (dst net 22.0.168.101/32) || (dst net 22.0.212.53/32))),
	((dst port 7264) || (dst port 10391) || (dst port 22344) || (dst port 56761) || (dst port 63698)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.69.135/32) || (dst net 23.0.123.97/32) || (dst net 23.0.132.71/32) || (dst net 23.0.137.145/32) || (dst net 23.0.148.172/32))),
	((dst port 4939) || (dst port 21335) || (dst port 33525) || (dst port 45455) || (dst port 60836)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.16.90/32) || (dst net 24.0.88.165/32) || (dst net 24.0.135.153/32) || (dst net 24.0.182.18/32) || (dst net 24.0.252.0/32))),
	((dst port 5413) || (dst port 9395) || (dst port 11733) || (dst port 58936) || (dst port 65296)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.7.188/32) || (dst net 25.0.81.76/32) || (dst net 25.0.90.151/32) || (dst net 25.0.104.67/32) || (dst net 25.0.107.49/32))),
	((dst port 9444) || (dst port 12038) || (dst port 33610) || (dst port 51938) || (dst port 58143)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.3.253/32) || (dst net 26.0.5.229/32) || (dst net 26.0.56.60/32) || (dst net 26.0.85.193/32) || (dst net 26.0.246.130/32))),
	((dst port 2527) || (dst port 13127) || (dst port 30043) || (dst port 34933) || (dst port 36631)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.44.31/32) || (dst net 27.0.135.132/32) || (dst net 27.0.179.83/32) || (dst net 27.0.229.55/32) || (dst net 27.0.240.79/32))),
	((dst port 3483) || (dst port 16851) || (dst port 25310) || (dst port 42688) || (dst port 55551)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.134.212/32) || (dst net 28.0.160.118/32) || (dst net 28.0.163.104/32) || (dst net 28.0.165.180/32) || (dst net 28.0.194.157/32))),
	((dst port 24183) || (dst port 29764) || (dst port 49816) || (dst port 51809) || (dst port 55784)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.74.172/32) || (dst net 29.0.82.201/32) || (dst net 29.0.172.253/32) || (dst net 29.0.240.193/32) || (dst net 29.0.253.40/32))),
	((dst port 2345) || (dst port 14701) || (dst port 16038) || (dst port 25399) || (dst port 45682)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.1.72/32) || (dst net 30.0.6.4/32) || (dst net 30.0.16.33/32) || (dst net 30.0.36.44/32) || (dst net 30.0.212.59/32))),
	((dst port 9661) || (dst port 13949) || (dst port 26781) || (dst port 35115) || (dst port 59272)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.38.117/32) || (dst net 31.0.80.146/32) || (dst net 31.0.123.48/32) || (dst net 31.0.165.152/32) || (dst net 31.0.195.233/32))),
	((dst port 14706) || (dst port 22319) || (dst port 26365) || (dst port 49519) || (dst port 53747)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.6.93/32) || (dst net 32.0.64.133/32) || (dst net 32.0.81.98/32) || (dst net 32.0.94.47/32) || (dst net 32.0.222.186/32))),
	((dst port 18590) || (dst port 28436) || (dst port 32683) || (dst port 35252) || (dst port 55201)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.3.11/32) || (dst net 33.0.48.160/32) || (dst net 33.0.50.49/32) || (dst net 33.0.108.53/32) || (dst net 33.0.121.169/32))),
	((dst port 201) || (dst port 10337) || (dst port 44102) || (dst port 58632) || (dst port 61210)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.102.236/32) || (dst net 34.0.216.247/32) || (dst net 34.0.228.177/32) || (dst net 34.0.231.236/32) || (dst net 34.0.237.77/32))),
	((dst port 6556) || (dst port 15380) || (dst port 30269) || (dst port 31815) || (dst port 60738)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.8.96/32) || (dst net 35.0.13.87/32) || (dst net 35.0.50.126/32) || (dst net 35.0.221.247/32) || (dst net 35.0.233.41/32))),
	((dst port 8178) || (dst port 15897) || (dst port 41450) || (dst port 50523) || (dst port 56386)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.22.235/32) || (dst net 36.0.98.246/32) || (dst net 36.0.156.200/32) || (dst net 36.0.217.3/32) || (dst net 36.0.248.233/32))),
	((dst port 523) || (dst port 20953) || (dst port 39154) || (dst port 64074) || (dst port 65257)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.31.205/32) || (dst net 37.0.72.65/32) || (dst net 37.0.182.41/32) || (dst net 37.0.240.43/32) || (dst net 37.0.240.93/32))),
	((dst port 7128) || (dst port 9655) || (dst port 10115) || (dst port 50163) || (dst port 65330)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.46.164/32) || (dst net 38.0.63.248/32) || (dst net 38.0.87.6/32) || (dst net 38.0.94.172/32) || (dst net 38.0.188.210/32))),
	((dst port 6717) || (dst port 16368) || (dst port 50754) || (dst port 55863) || (dst port 58558)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.28.164/32) || (dst net 39.0.74.139/32) || (dst net 39.0.91.246/32) || (dst net 39.0.187.75/32) || (dst net 39.0.231.220/32))),
	((dst port 1545) || (dst port 15859) || (dst port 18930) || (dst port 19609) || (dst port 50077)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.33.11/32) || (dst net 40.0.46.76/32) || (dst net 40.0.110.252/32) || (dst net 40.0.120.156/32) || (dst net 40.0.197.105/32))),
	((dst port 32512) || (dst port 34901) || (dst port 49636) || (dst port 60732) || (dst port 62433)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.34.170/32) || (dst net 41.0.56.115/32) || (dst net 41.0.142.165/32) || (dst net 41.0.148.163/32) || (dst net 41.0.177.130/32))),
	((dst port 7272) || (dst port 8718) || (dst port 18504) || (dst port 27909) || (dst port 34908)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.18.136/32) || (dst net 42.0.49.251/32) || (dst net 42.0.56.139/32) || (dst net 42.0.155.205/32) || (dst net 42.0.157.238/32))),
	((dst port 8526) || (dst port 35792) || (dst port 40858) || (dst port 45395) || (dst port 64740)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.4.166/32) || (dst net 43.0.10.89/32) || (dst net 43.0.70.161/32) || (dst net 43.0.85.149/32) || (dst net 43.0.235.67/32))),
	((dst port 8435) || (dst port 12099) || (dst port 14772) || (dst port 19041) || (dst port 64392)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.122.63/32) || (dst net 44.0.127.8/32) || (dst net 44.0.151.200/32) || (dst net 44.0.160.136/32) || (dst net 44.0.217.64/32))),
	((dst port 7436) || (dst port 7647) || (dst port 10737) || (dst port 16817) || (dst port 57310)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.84.59/32) || (dst net 45.0.146.24/32) || (dst net 45.0.185.235/32) || (dst net 45.0.206.64/32) || (dst net 45.0.237.197/32))),
	((dst port 6339) || (dst port 39804) || (dst port 41359) || (dst port 51105) || (dst port 57187)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.32.80/32) || (dst net 46.0.83.224/32) || (dst net 46.0.148.131/32) || (dst net 46.0.158.7/32) || (dst net 46.0.181.134/32))),
	((dst port 19792) || (dst port 26022) || (dst port 31564) || (dst port 37069) || (dst port 44627)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.66.146/32) || (dst net 47.0.102.17/32) || (dst net 47.0.116.203/32) || (dst net 47.0.164.73/32) || (dst net 47.0.209.67/32))),
	((dst port 3380) || (dst port 11891) || (dst port 22833) || (dst port 37494) || (dst port 40074)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.48.116/32) || (dst net 48.0.49.168/32) || (dst net 48.0.102.182/32) || (dst net 48.0.199.214/32) || (dst net 48.0.247.111/32))),
	((dst port 832) || (dst port 19640) || (dst port 36587) || (dst port 43178) || (dst port 60048)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.86.218/32) || (dst net 49.0.216.48/32) || (dst net 49.0.240.213/32) || (dst net 49.0.242.183/32) || (dst net 49.0.245.64/32))),
	((dst port 434) || (dst port 12803) || (dst port 21267) || (dst port 25626) || (dst port 58643)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.33.172/32) || (dst net 50.0.124.251/32) || (dst net 50.0.132.53/32) || (dst net 50.0.186.204/32) || (dst net 50.0.210.25/32))),
	((dst port 13412) || (dst port 30462) || (dst port 34755) || (dst port 64339) || (dst port 65328)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.125.169/32) || (dst net 51.0.166.152/32) || (dst net 51.0.177.224/32) || (dst net 51.0.187.174/32) || (dst net 51.0.218.245/32))),
	((dst port 4371) || (dst port 6972) || (dst port 12252) || (dst port 29199) || (dst port 63549)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.19.199/32) || (dst net 52.0.122.224/32) || (dst net 52.0.132.197/32) || (dst net 52.0.252.33/32) || (dst net 52.0.253.150/32))),
	((dst port 1572) || (dst port 2144) || (dst port 10060) || (dst port 47460) || (dst port 65253)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.9.144/32) || (dst net 53.0.26.164/32) || (dst net 53.0.41.120/32) || (dst net 53.0.148.134/32) || (dst net 53.0.241.235/32))),
	((dst port 562) || (dst port 14841) || (dst port 17552) || (dst port 37536) || (dst port 43188)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.97.120/32) || (dst net 54.0.185.17/32) || (dst net 54.0.198.12/32) || (dst net 54.0.217.220/32) || (dst net 54.0.235.38/32))),
	((dst port 1106) || (dst port 26544) || (dst port 29733) || (dst port 40275) || (dst port 50780)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.61.19/32) || (dst net 55.0.80.190/32) || (dst net 55.0.89.145/32) || (dst net 55.0.164.81/32) || (dst net 55.0.198.181/32))),
	((dst port 12799) || (dst port 16573) || (dst port 27978) || (dst port 33219) || (dst port 62544)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.18.149/32) || (dst net 56.0.24.207/32) || (dst net 56.0.77.31/32) || (dst net 56.0.180.239/32) || (dst net 56.0.248.85/32))),
	((dst port 3655) || (dst port 30469) || (dst port 51811) || (dst port 56131) || (dst port 60106)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.41.19/32) || (dst net 57.0.132.141/32) || (dst net 57.0.155.147/32) || (dst net 57.0.168.22/32) || (dst net 57.0.240.122/32))),
	((dst port 6655) || (dst port 8872) || (dst port 13836) || (dst port 24834) || (dst port 52966)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.2.132/32) || (dst net 58.0.55.241/32) || (dst net 58.0.81.21/32) || (dst net 58.0.96.77/32) || (dst net 58.0.209.165/32))),
	((dst port 11677) || (dst port 18540) || (dst port 34179) || (dst port 37966) || (dst port 46978)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.93.207/32) || (dst net 59.0.176.121/32) || (dst net 59.0.180.209/32) || (dst net 59.0.185.185/32) || (dst net 59.0.200.200/32))),
	((dst port 21272) || (dst port 22466) || (dst port 24020) || (dst port 59721) || (dst port 64490)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.121.98/32) || (dst net 60.0.147.141/32) || (dst net 60.0.184.143/32) || (dst net 60.0.233.19/32) || (dst net 60.0.248.68/32))),
	((dst port 21247) || (dst port 50603) || (dst port 51226) || (dst port 61876) || (dst port 64852)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.87.40/32) || (dst net 61.0.97.26/32) || (dst net 61.0.137.192/32) || (dst net 61.0.156.73/32) || (dst net 61.0.231.227/32))),
	((dst port 25548) || (dst port 27149) || (dst port 36590) || (dst port 40288) || (dst port 63477)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.40.198/32) || (dst net 62.0.46.129/32) || (dst net 62.0.150.113/32) || (dst net 62.0.198.252/32) || (dst net 62.0.231.134/32))),
	((dst port 5486) || (dst port 27646) || (dst port 35980) || (dst port 36001) || (dst port 51217)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.9.86/32) || (dst net 63.0.45.6/32) || (dst net 63.0.122.74/32) || (dst net 63.0.204.5/32) || (dst net 63.0.254.75/32))),
	((dst port 18940) || (dst port 21214) || (dst port 22181) || (dst port 24415) || (dst port 30144)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.12.0/32) || (dst net 64.0.79.42/32) || (dst net 64.0.149.31/32) || (dst net 64.0.234.195/32) || (dst net 64.0.239.20/32))),
	((dst port 1591) || (dst port 17393) || (dst port 40003) || (dst port 45073) || (dst port 46260)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.123.201/32) || (dst net 65.0.138.54/32) || (dst net 65.0.158.254/32) || (dst net 65.0.229.39/32) || (dst net 65.0.245.168/32))),
	((dst port 11514) || (dst port 23995) || (dst port 36515) || (dst port 48084) || (dst port 60832)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.7.68/32) || (dst net 66.0.34.128/32) || (dst net 66.0.49.139/32) || (dst net 66.0.59.181/32) || (dst net 66.0.250.91/32))),
	((dst port 3034) || (dst port 9607) || (dst port 21522) || (dst port 32427) || (dst port 60893)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.70.3/32) || (dst net 67.0.80.177/32) || (dst net 67.0.123.216/32) || (dst net 67.0.163.120/32) || (dst net 67.0.236.194/32))),
	((dst port 1696) || (dst port 5759) || (dst port 7637) || (dst port 45826) || (dst port 52927)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.26.42/32) || (dst net 68.0.68.164/32) || (dst net 68.0.85.22/32) || (dst net 68.0.227.197/32) || (dst net 68.0.244.133/32))),
	((dst port 1951) || (dst port 13090) || (dst port 31849) || (dst port 51797) || (dst port 55095)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.15.135/32) || (dst net 69.0.37.139/32) || (dst net 69.0.67.253/32) || (dst net 69.0.139.221/32) || (dst net 69.0.142.53/32))),
	((dst port 11709) || (dst port 16334) || (dst port 52607) || (dst port 55361) || (dst port 63316)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.12.7/32) || (dst net 70.0.15.71/32) || (dst net 70.0.15.156/32) || (dst net 70.0.184.122/32) || (dst net 70.0.221.12/32))),
	((dst port 17862) || (dst port 24491) || (dst port 37199) || (dst port 47757) || (dst port 51821)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.133.254/32) || (dst net 71.0.161.61/32) || (dst net 71.0.204.106/32) || (dst net 71.0.214.195/32) || (dst net 71.0.240.52/32))),
	((dst port 15857) || (dst port 16018) || (dst port 21986) || (dst port 37749) || (dst port 50744)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.64.244/32) || (dst net 72.0.71.64/32) || (dst net 72.0.187.51/32) || (dst net 72.0.207.228/32) || (dst net 72.0.220.144/32))),
	((dst port 24938) || (dst port 25938) || (dst port 42240) || (dst port 55999) || (dst port 65223)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.39.178/32) || (dst net 73.0.41.226/32) || (dst net 73.0.91.188/32) || (dst net 73.0.179.108/32) || (dst net 73.0.243.117/32))),
	((dst port 8172) || (dst port 18900) || (dst port 33134) || (dst port 58454) || (dst port 61195)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.44.157/32) || (dst net 74.0.50.79/32) || (dst net 74.0.51.15/32) || (dst net 74.0.118.212/32) || (dst net 74.0.213.72/32))),
	((dst port 2373) || (dst port 3490) || (dst port 13642) || (dst port 42215) || (dst port 48576)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.73.20/32) || (dst net 75.0.130.180/32) || (dst net 75.0.184.157/32) || (dst net 75.0.214.110/32) || (dst net 75.0.244.70/32))),
	((dst port 6774) || (dst port 18206) || (dst port 51667) || (dst port 59915) || (dst port 61429)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.37.18/32) || (dst net 76.0.118.34/32) || (dst net 76.0.168.247/32) || (dst net 76.0.181.151/32) || (dst net 76.0.196.250/32))),
	((dst port 6973) || (dst port 10612) || (dst port 21282) || (dst port 35075) || (dst port 52732)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.3.68/32) || (dst net 77.0.7.204/32) || (dst net 77.0.67.13/32) || (dst net 77.0.152.246/32) || (dst net 77.0.249.4/32))),
	((dst port 5089) || (dst port 16991) || (dst port 27566) || (dst port 27878) || (dst port 29329)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.8.7/32) || (dst net 78.0.15.208/32) || (dst net 78.0.31.14/32) || (dst net 78.0.35.51/32) || (dst net 78.0.242.135/32))),
	((dst port 30082) || (dst port 39106) || (dst port 49121) || (dst port 51901) || (dst port 60934)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.57.76/32) || (dst net 79.0.58.55/32) || (dst net 79.0.189.223/32) || (dst net 79.0.193.231/32) || (dst net 79.0.235.3/32))),
	((dst port 7902) || (dst port 21821) || (dst port 32120) || (dst port 34808) || (dst port 37218)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.24.116/32) || (dst net 80.0.67.145/32) || (dst net 80.0.120.101/32) || (dst net 80.0.237.180/32) || (dst net 80.0.255.60/32))),
	((dst port 6718) || (dst port 19860) || (dst port 20910) || (dst port 33991) || (dst port 54449)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.3.165/32) || (dst net 81.0.68.224/32) || (dst net 81.0.84.88/32) || (dst net 81.0.193.106/32) || (dst net 81.0.226.206/32))),
	((dst port 8491) || (dst port 26578) || (dst port 30604) || (dst port 39199) || (dst port 58468)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.11.28/32) || (dst net 82.0.74.199/32) || (dst net 82.0.75.37/32) || (dst net 82.0.85.96/32) || (dst net 82.0.232.28/32))),
	((dst port 5121) || (dst port 23357) || (dst port 27347) || (dst port 57565) || (dst port 58646)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.31.182/32) || (dst net 83.0.79.207/32) || (dst net 83.0.164.48/32) || (dst net 83.0.171.170/32) || (dst net 83.0.222.161/32))),
	((dst port 6665) || (dst port 21188) || (dst port 36693) || (dst port 41853) || (dst port 42279)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.3.51/32) || (dst net 84.0.10.61/32) || (dst net 84.0.19.154/32) || (dst net 84.0.102.47/32) || (dst net 84.0.177.3/32))),
	((dst port 2918) || (dst port 14884) || (dst port 28824) || (dst port 50896) || (dst port 56953)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.5.25/32) || (dst net 85.0.43.232/32) || (dst net 85.0.74.15/32) || (dst net 85.0.119.21/32) || (dst net 85.0.234.179/32))),
	((dst port 18828) || (dst port 25720) || (dst port 39327) || (dst port 57271) || (dst port 62717)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.38.56/32) || (dst net 86.0.41.61/32) || (dst net 86.0.93.166/32) || (dst net 86.0.100.225/32) || (dst net 86.0.104.240/32))),
	((dst port 21818) || (dst port 21956) || (dst port 23483) || (dst port 39101) || (dst port 47546)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.28.103/32) || (dst net 87.0.29.91/32) || (dst net 87.0.34.241/32) || (dst net 87.0.71.183/32) || (dst net 87.0.159.184/32))),
	((dst port 20403) || (dst port 21366) || (dst port 24445) || (dst port 29576) || (dst port 55607)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.40.122/32) || (dst net 88.0.42.68/32) || (dst net 88.0.102.130/32) || (dst net 88.0.210.185/32) || (dst net 88.0.224.111/32))),
	((dst port 16360) || (dst port 30428) || (dst port 37515) || (dst port 42170) || (dst port 45359)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.3.213/32) || (dst net 89.0.105.134/32) || (dst net 89.0.178.47/32) || (dst net 89.0.205.79/32) || (dst net 89.0.213.155/32))),
	((dst port 4038) || (dst port 18010) || (dst port 37166) || (dst port 51418) || (dst port 63854)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.0.160/32) || (dst net 90.0.56.26/32) || (dst net 90.0.62.220/32) || (dst net 90.0.84.247/32) || (dst net 90.0.195.195/32))),
	((dst port 239) || (dst port 4432) || (dst port 32782) || (dst port 52654) || (dst port 55727)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.40.149/32) || (dst net 91.0.41.125/32) || (dst net 91.0.62.224/32) || (dst net 91.0.189.62/32) || (dst net 91.0.241.200/32))),
	((dst port 30336) || (dst port 44178) || (dst port 48999) || (dst port 55495) || (dst port 56007)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.13.126/32) || (dst net 92.0.37.98/32) || (dst net 92.0.55.118/32) || (dst net 92.0.55.189/32) || (dst net 92.0.249.133/32))),
	((dst port 29444) || (dst port 46311) || (dst port 53136) || (dst port 56049) || (dst port 61193)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.78.124/32) || (dst net 93.0.137.225/32) || (dst net 93.0.165.14/32) || (dst net 93.0.231.250/32) || (dst net 93.0.240.166/32))),
	((dst port 11842) || (dst port 44750) || (dst port 54599) || (dst port 58007) || (dst port 64101)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.49.96/32) || (dst net 94.0.142.185/32) || (dst net 94.0.148.154/32) || (dst net 94.0.158.131/32) || (dst net 94.0.232.102/32))),
	((dst port 4859) || (dst port 5597) || (dst port 26584) || (dst port 38342) || (dst port 52787)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.32.156/32) || (dst net 95.0.148.99/32) || (dst net 95.0.205.178/32) || (dst net 95.0.210.175/32) || (dst net 95.0.215.157/32))),
	((dst port 28134) || (dst port 52986) || (dst port 60131) || (dst port 64531) || (dst port 65194)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.32.153/32) || (dst net 96.0.40.226/32) || (dst net 96.0.64.47/32) || (dst net 96.0.67.217/32) || (dst net 96.0.189.35/32))),
	((dst port 313) || (dst port 9786) || (dst port 17809) || (dst port 43115) || (dst port 49491)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.14.187/32) || (dst net 97.0.30.114/32) || (dst net 97.0.56.34/32) || (dst net 97.0.102.228/32) || (dst net 97.0.222.237/32))),
	((dst port 7993) || (dst port 29756) || (dst port 37887) || (dst port 59332) || (dst port 59750)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.7.232/32) || (dst net 98.0.19.12/32) || (dst net 98.0.106.205/32) || (dst net 98.0.176.13/32) || (dst net 98.0.211.170/32))),
	((dst port 5723) || (dst port 40529) || (dst port 41560) || (dst port 46456) || (dst port 50765)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.14.7/32) || (dst net 99.0.204.238/32) || (dst net 99.0.207.106/32) || (dst net 99.0.210.180/32) || (dst net 99.0.238.195/32))),
	((dst port 20364) || (dst port 35098) || (dst port 55525) || (dst port 57342) || (dst port 63661)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.87.44/32) || (dst net 100.0.167.20/32) || (dst net 100.0.196.145/32) || (dst net 100.0.208.254/32) || (dst net 100.0.236.57/32))),
	((dst port 813) || (dst port 46617) || (dst port 56541) || (dst port 57318) || (dst port 60986)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.12.25/32) || (dst net 101.0.61.108/32) || (dst net 101.0.70.56/32) || (dst net 101.0.102.177/32) || (dst net 101.0.108.219/32))),
	((dst port 285) || (dst port 10381) || (dst port 17655) || (dst port 27168) || (dst port 38174)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.106.150/32) || (dst net 102.0.133.95/32) || (dst net 102.0.212.41/32) || (dst net 102.0.242.115/32) || (dst net 102.0.252.242/32))),
	((dst port 4698) || (dst port 6244) || (dst port 30587) || (dst port 52986) || (dst port 62845)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.28.184/32) || (dst net 103.0.126.139/32) || (dst net 103.0.183.34/32) || (dst net 103.0.201.24/32) || (dst net 103.0.216.68/32))),
	((dst port 8434) || (dst port 23780) || (dst port 31059) || (dst port 60388) || (dst port 64259)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.4.80/32) || (dst net 104.0.50.89/32) || (dst net 104.0.93.21/32) || (dst net 104.0.147.188/32) || (dst net 104.0.246.113/32))),
	((dst port 8173) || (dst port 11824) || (dst port 42035) || (dst port 45762) || (dst port 58722)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.2.235/32) || (dst net 105.0.131.107/32) || (dst net 105.0.141.209/32) || (dst net 105.0.166.72/32) || (dst net 105.0.179.55/32))),
	((dst port 40662) || (dst port 40931) || (dst port 46941) || (dst port 51006) || (dst port 61882)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.39.79/32) || (dst net 106.0.42.217/32) || (dst net 106.0.84.129/32) || (dst net 106.0.98.17/32) || (dst net 106.0.175.37/32))),
	((dst port 2700) || (dst port 28721) || (dst port 40670) || (dst port 47369) || (dst port 52021)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.12.43/32) || (dst net 107.0.116.51/32) || (dst net 107.0.124.40/32) || (dst net 107.0.133.11/32) || (dst net 107.0.230.173/32))),
	((dst port 4879) || (dst port 6244) || (dst port 28015) || (dst port 31557) || (dst port 38129)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.52.188/32) || (dst net 108.0.92.54/32) || (dst net 108.0.131.19/32) || (dst net 108.0.199.194/32) || (dst net 108.0.200.173/32))),
	((dst port 36509) || (dst port 42108) || (dst port 45696) || (dst port 55949) || (dst port 59172)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.56.53/32) || (dst net 109.0.63.143/32) || (dst net 109.0.182.2/32) || (dst net 109.0.209.210/32) || (dst net 109.0.247.119/32))),
	((dst port 11666) || (dst port 14783) || (dst port 14861) || (dst port 43577) || (dst port 57468)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.39.46/32) || (dst net 110.0.41.79/32) || (dst net 110.0.45.53/32) || (dst net 110.0.96.115/32) || (dst net 110.0.224.189/32))),
	((dst port 4374) || (dst port 22775) || (dst port 31934) || (dst port 37200) || (dst port 60017)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.21.198/32) || (dst net 111.0.108.219/32) || (dst net 111.0.163.240/32) || (dst net 111.0.172.248/32) || (dst net 111.0.174.51/32))),
	((dst port 43788) || (dst port 45938) || (dst port 50006) || (dst port 50523) || (dst port 59979)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.0.93/32) || (dst net 112.0.55.210/32) || (dst net 112.0.154.15/32) || (dst net 112.0.203.158/32) || (dst net 112.0.219.116/32))),
	((dst port 29868) || (dst port 37971) || (dst port 41691) || (dst port 47270) || (dst port 48737)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.40.244/32) || (dst net 113.0.98.174/32) || (dst net 113.0.118.123/32) || (dst net 113.0.146.46/32) || (dst net 113.0.252.32/32))),
	((dst port 20700) || (dst port 37234) || (dst port 44570) || (dst port 44981) || (dst port 47981)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.121.50/32) || (dst net 114.0.128.24/32) || (dst net 114.0.129.123/32) || (dst net 114.0.135.121/32) || (dst net 114.0.254.168/32))),
	((dst port 15844) || (dst port 21648) || (dst port 39979) || (dst port 42384) || (dst port 48377)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.5.17/32) || (dst net 115.0.110.70/32) || (dst net 115.0.180.15/32) || (dst net 115.0.212.221/32) || (dst net 115.0.233.85/32))),
	((dst port 16333) || (dst port 24354) || (dst port 41423) || (dst port 45273) || (dst port 58305)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.39.159/32) || (dst net 116.0.41.72/32) || (dst net 116.0.65.9/32) || (dst net 116.0.153.118/32) || (dst net 116.0.211.254/32))),
	((dst port 43220) || (dst port 48996) || (dst port 50912) || (dst port 53752) || (dst port 58794)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.16.111/32) || (dst net 117.0.31.242/32) || (dst net 117.0.58.182/32) || (dst net 117.0.91.69/32) || (dst net 117.0.120.216/32))),
	((dst port 3706) || (dst port 32447) || (dst port 61798) || (dst port 64769) || (dst port 64867)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.49.191/32) || (dst net 118.0.110.32/32) || (dst net 118.0.224.146/32) || (dst net 118.0.247.106/32) || (dst net 118.0.247.126/32))),
	((dst port 22097) || (dst port 31786) || (dst port 44185) || (dst port 50909) || (dst port 51221)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.30.153/32) || (dst net 119.0.34.230/32) || (dst net 119.0.44.25/32) || (dst net 119.0.48.227/32) || (dst net 119.0.114.15/32))),
	((dst port 1419) || (dst port 9876) || (dst port 36444) || (dst port 46152) || (dst port 49499)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.16.71/32) || (dst net 120.0.105.1/32) || (dst net 120.0.155.203/32) || (dst net 120.0.195.41/32) || (dst net 120.0.199.98/32))),
	((dst port 25286) || (dst port 41091) || (dst port 48593) || (dst port 49667) || (dst port 65063)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.25.141/32) || (dst net 121.0.87.125/32) || (dst net 121.0.114.47/32) || (dst net 121.0.131.123/32) || (dst net 121.0.191.12/32))),
	((dst port 425) || (dst port 14400) || (dst port 29543) || (dst port 31446) || (dst port 60201)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.18.162/32) || (dst net 122.0.33.32/32) || (dst net 122.0.40.8/32) || (dst net 122.0.100.51/32) || (dst net 122.0.250.251/32))),
	((dst port 16791) || (dst port 29839) || (dst port 38863) || (dst port 39297) || (dst port 49369)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.39.247/32) || (dst net 123.0.119.160/32) || (dst net 123.0.171.63/32) || (dst net 123.0.221.59/32) || (dst net 123.0.237.189/32))),
	((dst port 8260) || (dst port 20957) || (dst port 38193) || (dst port 38830) || (dst port 47160)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.88.142/32) || (dst net 124.0.239.101/32) || (dst net 124.0.248.154/32) || (dst net 124.0.252.206/32) || (dst net 124.0.254.233/32))),
	((dst port 10886) || (dst port 38419) || (dst port 38740) || (dst port 52289) || (dst port 55023)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.43.107/32) || (dst net 125.0.71.129/32) || (dst net 125.0.81.48/32) || (dst net 125.0.148.105/32) || (dst net 125.0.252.51/32))),
	((dst port 12106) || (dst port 27354) || (dst port 47652) || (dst port 59713) || (dst port 62134)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.7.151/32) || (dst net 126.0.40.66/32) || (dst net 126.0.48.201/32) || (dst net 126.0.109.254/32) || (dst net 126.0.159.216/32))),
	((dst port 12737) || (dst port 14315) || (dst port 17557) || (dst port 40104) || (dst port 47238)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.109.89/32) || (dst net 127.0.195.78/32) || (dst net 127.0.212.50/32) || (dst net 127.0.217.203/32) || (dst net 127.0.243.88/32))),
	((dst port 3624) || (dst port 9636) || (dst port 11937) || (dst port 26602) || (dst port 28459)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.1.133/32) || (dst net 128.0.12.219/32) || (dst net 128.0.117.241/32) || (dst net 128.0.152.107/32) || (dst net 128.0.200.81/32))),
	((dst port 22651) || (dst port 51936) || (dst port 52301) || (dst port 60185) || (dst port 64375)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.38.104/32) || (dst net 129.0.82.85/32) || (dst net 129.0.106.157/32) || (dst net 129.0.142.185/32) || (dst net 129.0.147.34/32))),
	((dst port 15229) || (dst port 16683) || (dst port 32085) || (dst port 32245) || (dst port 37304)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.8.149/32) || (dst net 130.0.51.192/32) || (dst net 130.0.130.61/32) || (dst net 130.0.165.6/32) || (dst net 130.0.168.106/32))),
	((dst port 28674) || (dst port 31401) || (dst port 53441) || (dst port 59587) || (dst port 60124)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.93.159/32) || (dst net 131.0.94.64/32) || (dst net 131.0.125.107/32) || (dst net 131.0.156.124/32) || (dst net 131.0.217.153/32))),
	((dst port 3522) || (dst port 22048) || (dst port 26272) || (dst port 30982) || (dst port 35738)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.201.4/32) || (dst net 132.0.227.90/32) || (dst net 132.0.240.213/32) || (dst net 132.0.244.49/32) || (dst net 132.0.248.212/32))),
	((dst port 5459) || (dst port 7652) || (dst port 8241) || (dst port 24993) || (dst port 40043)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.64.250/32) || (dst net 133.0.93.180/32) || (dst net 133.0.204.200/32) || (dst net 133.0.226.81/32) || (dst net 133.0.254.93/32))),
	((dst port 6989) || (dst port 16421) || (dst port 17379) || (dst port 19657) || (dst port 53813)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.73.124/32) || (dst net 134.0.104.99/32) || (dst net 134.0.120.181/32) || (dst net 134.0.144.139/32) || (dst net 134.0.154.140/32))),
	((dst port 9927) || (dst port 32398) || (dst port 38018) || (dst port 47676) || (dst port 51490)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.26.123/32) || (dst net 135.0.33.80/32) || (dst net 135.0.132.36/32) || (dst net 135.0.135.217/32) || (dst net 135.0.159.14/32))),
	((dst port 18738) || (dst port 40787) || (dst port 45681) || (dst port 48472) || (dst port 50857)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.144.90/32) || (dst net 136.0.149.100/32) || (dst net 136.0.153.191/32) || (dst net 136.0.181.156/32) || (dst net 136.0.230.253/32))),
	((dst port 14160) || (dst port 15137) || (dst port 23475) || (dst port 57151) || (dst port 64106)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.55.58/32) || (dst net 137.0.96.220/32) || (dst net 137.0.119.81/32) || (dst net 137.0.224.10/32) || (dst net 137.0.245.108/32))),
	((dst port 10408) || (dst port 10670) || (dst port 16501) || (dst port 25124) || (dst port 48252)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.52.146/32) || (dst net 138.0.64.160/32) || (dst net 138.0.67.18/32) || (dst net 138.0.100.254/32) || (dst net 138.0.193.189/32))),
	((dst port 368) || (dst port 23823) || (dst port 26651) || (dst port 26970) || (dst port 34646)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.69.147/32) || (dst net 139.0.138.194/32) || (dst net 139.0.154.9/32) || (dst net 139.0.190.40/32) || (dst net 139.0.251.129/32))),
	((dst port 14752) || (dst port 31548) || (dst port 32060) || (dst port 58184) || (dst port 59347)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.43.239/32) || (dst net 140.0.84.239/32) || (dst net 140.0.96.7/32) || (dst net 140.0.99.212/32) || (dst net 140.0.180.20/32))),
	((dst port 6772) || (dst port 14031) || (dst port 14636) || (dst port 19642) || (dst port 28754)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.48.175/32) || (dst net 141.0.82.207/32) || (dst net 141.0.140.212/32) || (dst net 141.0.159.227/32) || (dst net 141.0.217.12/32))),
	((dst port 23725) || (dst port 49097) || (dst port 52903) || (dst port 62345) || (dst port 64589)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.75.206/32) || (dst net 142.0.81.142/32) || (dst net 142.0.91.129/32) || (dst net 142.0.107.65/32) || (dst net 142.0.201.170/32))),
	((dst port 503) || (dst port 3936) || (dst port 38216) || (dst port 39476) || (dst port 43279)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.107.65/32) || (dst net 143.0.112.26/32) || (dst net 143.0.123.132/32) || (dst net 143.0.184.225/32) || (dst net 143.0.229.217/32))),
	((dst port 903) || (dst port 1813) || (dst port 15149) || (dst port 53539) || (dst port 62979)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.50.166/32) || (dst net 144.0.79.129/32) || (dst net 144.0.142.124/32) || (dst net 144.0.149.103/32) || (dst net 144.0.161.181/32))),
	((dst port 11100) || (dst port 18197) || (dst port 22985) || (dst port 36570) || (dst port 53415)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.51.4/32) || (dst net 145.0.106.91/32) || (dst net 145.0.123.230/32) || (dst net 145.0.126.185/32) || (dst net 145.0.147.186/32))),
	((dst port 12799) || (dst port 14706) || (dst port 24091) || (dst port 26920) || (dst port 40516)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.31.63/32) || (dst net 146.0.86.108/32) || (dst net 146.0.173.83/32) || (dst net 146.0.176.224/32) || (dst net 146.0.255.177/32))),
	((dst port 4409) || (dst port 32614) || (dst port 50918) || (dst port 60981) || (dst port 65242)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.3.196/32) || (dst net 147.0.71.34/32) || (dst net 147.0.123.58/32) || (dst net 147.0.133.101/32) || (dst net 147.0.229.152/32))),
	((dst port 14157) || (dst port 16637) || (dst port 38397) || (dst port 49383) || (dst port 53672)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.6.192/32) || (dst net 148.0.48.177/32) || (dst net 148.0.77.65/32) || (dst net 148.0.155.180/32) || (dst net 148.0.255.144/32))),
	((dst port 541) || (dst port 1245) || (dst port 26661) || (dst port 52100) || (dst port 54717)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.16.102/32) || (dst net 149.0.62.149/32) || (dst net 149.0.155.169/32) || (dst net 149.0.171.57/32) || (dst net 149.0.217.153/32))),
	((dst port 3652) || (dst port 18733) || (dst port 39232) || (dst port 51274) || (dst port 56116)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.10.173/32) || (dst net 150.0.27.161/32) || (dst net 150.0.57.176/32) || (dst net 150.0.71.135/32) || (dst net 150.0.229.164/32))),
	((dst port 29514) || (dst port 55095) || (dst port 61926) || (dst port 63127) || (dst port 65377)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.1.27/32) || (dst net 151.0.160.79/32) || (dst net 151.0.214.100/32) || (dst net 151.0.239.29/32) || (dst net 151.0.240.80/32))),
	((dst port 5770) || (dst port 13116) || (dst port 44044) || (dst port 49834) || (dst port 53218)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.9.180/32) || (dst net 152.0.44.201/32) || (dst net 152.0.151.143/32) || (dst net 152.0.168.48/32) || (dst net 152.0.239.234/32))),
	((dst port 62) || (dst port 8149) || (dst port 12072) || (dst port 20753) || (dst port 59761)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.41.159/32) || (dst net 153.0.130.1/32) || (dst net 153.0.178.106/32) || (dst net 153.0.212.122/32) || (dst net 153.0.216.102/32))),
	((dst port 9352) || (dst port 16731) || (dst port 29564) || (dst port 34983) || (dst port 39759)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.15.232/32) || (dst net 154.0.24.13/32) || (dst net 154.0.126.236/32) || (dst net 154.0.162.96/32) || (dst net 154.0.170.95/32))),
	((dst port 15483) || (dst port 16871) || (dst port 21065) || (dst port 35731) || (dst port 43359)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.128.123/32) || (dst net 155.0.143.20/32) || (dst net 155.0.151.52/32) || (dst net 155.0.208.149/32) || (dst net 155.0.213.66/32))),
	((dst port 15265) || (dst port 24317) || (dst port 27456) || (dst port 28007) || (dst port 44821)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.41.133/32) || (dst net 156.0.109.227/32) || (dst net 156.0.126.111/32) || (dst net 156.0.193.163/32) || (dst net 156.0.243.162/32))),
	((dst port 4595) || (dst port 5728) || (dst port 18639) || (dst port 33514) || (dst port 45410)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.36.108/32) || (dst net 157.0.49.9/32) || (dst net 157.0.77.161/32) || (dst net 157.0.83.212/32) || (dst net 157.0.132.188/32))),
	((dst port 10709) || (dst port 11039) || (dst port 34485) || (dst port 50108) || (dst port 54004)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.1.222/32) || (dst net 158.0.28.216/32) || (dst net 158.0.35.164/32) || (dst net 158.0.152.59/32) || (dst net 158.0.190.154/32))),
	((dst port 11422) || (dst port 13167) || (dst port 29051) || (dst port 44261) || (dst port 54698)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.74.186/32) || (dst net 159.0.209.41/32) || (dst net 159.0.232.51/32) || (dst net 159.0.234.191/32) || (dst net 159.0.245.79/32))),
	((dst port 12842) || (dst port 17254) || (dst port 19556) || (dst port 20824) || (dst port 54125)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.42.43/32) || (dst net 160.0.74.131/32) || (dst net 160.0.125.3/32) || (dst net 160.0.157.199/32) || (dst net 160.0.233.58/32))),
	((dst port 2831) || (dst port 9396) || (dst port 40128) || (dst port 55660) || (dst port 64109)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.69.213/32) || (dst net 161.0.107.48/32) || (dst net 161.0.155.245/32) || (dst net 161.0.176.222/32) || (dst net 161.0.213.234/32))),
	((dst port 5918) || (dst port 20278) || (dst port 39224) || (dst port 55513) || (dst port 59005)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.46.127/32) || (dst net 162.0.58.250/32) || (dst net 162.0.126.28/32) || (dst net 162.0.147.10/32) || (dst net 162.0.247.171/32))),
	((dst port 21889) || (dst port 23030) || (dst port 32460) || (dst port 56921) || (dst port 63552)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.20.19/32) || (dst net 163.0.29.195/32) || (dst net 163.0.31.128/32) || (dst net 163.0.82.235/32) || (dst net 163.0.195.184/32))),
	((dst port 6243) || (dst port 9934) || (dst port 19329) || (dst port 39581) || (dst port 43823)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.65.201/32) || (dst net 164.0.158.232/32) || (dst net 164.0.223.145/32) || (dst net 164.0.247.94/32) || (dst net 164.0.248.13/32))),
	((dst port 14629) || (dst port 42164) || (dst port 43255) || (dst port 46056) || (dst port 61613)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.93.87/32) || (dst net 165.0.96.75/32) || (dst net 165.0.121.236/32) || (dst net 165.0.176.167/32) || (dst net 165.0.233.163/32))),
	((dst port 25870) || (dst port 27801) || (dst port 32415) || (dst port 45091) || (dst port 50876)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.30.185/32) || (dst net 166.0.52.95/32) || (dst net 166.0.90.38/32) || (dst net 166.0.108.163/32) || (dst net 166.0.244.115/32))),
	((dst port 12967) || (dst port 34412) || (dst port 37671) || (dst port 41509) || (dst port 56532)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.40.213/32) || (dst net 167.0.55.53/32) || (dst net 167.0.157.135/32) || (dst net 167.0.171.70/32) || (dst net 167.0.245.186/32))),
	((dst port 4780) || (dst port 32564) || (dst port 38732) || (dst port 45758) || (dst port 59876)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.22.94/32) || (dst net 168.0.45.15/32) || (dst net 168.0.66.107/32) || (dst net 168.0.117.228/32) || (dst net 168.0.150.220/32))),
	((dst port 6326) || (dst port 13967) || (dst port 24079) || (dst port 25054) || (dst port 59649)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.3.142/32) || (dst net 169.0.26.57/32) || (dst net 169.0.113.102/32) || (dst net 169.0.145.92/32) || (dst net 169.0.221.158/32))),
	((dst port 1799) || (dst port 7183) || (dst port 8147) || (dst port 10883) || (dst port 23112)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.5.160/32) || (dst net 170.0.34.58/32) || (dst net 170.0.57.11/32) || (dst net 170.0.84.208/32) || (dst net 170.0.240.253/32))),
	((dst port 17358) || (dst port 19139) || (dst port 23876) || (dst port 32401) || (dst port 60941)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.5.173/32) || (dst net 171.0.6.204/32) || (dst net 171.0.89.129/32) || (dst net 171.0.140.249/32) || (dst net 171.0.181.247/32))),
	((dst port 9528) || (dst port 14726) || (dst port 29737) || (dst port 32402) || (dst port 33185)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.74.169/32) || (dst net 172.0.93.175/32) || (dst net 172.0.107.178/32) || (dst net 172.0.145.126/32) || (dst net 172.0.166.95/32))),
	((dst port 8327) || (dst port 13995) || (dst port 16179) || (dst port 37221) || (dst port 39404)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.90.27/32) || (dst net 173.0.96.253/32) || (dst net 173.0.103.60/32) || (dst net 173.0.112.146/32) || (dst net 173.0.154.102/32))),
	((dst port 26974) || (dst port 42447) || (dst port 42654) || (dst port 44640) || (dst port 59554)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.56.110/32) || (dst net 174.0.79.178/32) || (dst net 174.0.102.119/32) || (dst net 174.0.228.158/32) || (dst net 174.0.254.230/32))),
	((dst port 1761) || (dst port 4565) || (dst port 19452) || (dst port 38245) || (dst port 55946)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.57.231/32) || (dst net 175.0.66.152/32) || (dst net 175.0.112.119/32) || (dst net 175.0.143.156/32) || (dst net 175.0.155.184/32))),
	((dst port 15272) || (dst port 30385) || (dst port 36822) || (dst port 54874) || (dst port 65200)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.67.113/32) || (dst net 176.0.139.102/32) || (dst net 176.0.193.198/32) || (dst net 176.0.205.161/32) || (dst net 176.0.213.69/32))),
	((dst port 35702) || (dst port 35916) || (dst port 51057) || (dst port 51085) || (dst port 52063)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.91.221/32) || (dst net 177.0.101.27/32) || (dst net 177.0.180.186/32) || (dst net 177.0.191.215/32) || (dst net 177.0.254.134/32))),
	((dst port 753) || (dst port 8666) || (dst port 25424) || (dst port 61712) || (dst port 63410)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.20.27/32) || (dst net 178.0.46.26/32) || (dst net 178.0.143.119/32) || (dst net 178.0.192.114/32) || (dst net 178.0.213.236/32))),
	((dst port 1076) || (dst port 4519) || (dst port 38355) || (dst port 41679) || (dst port 62405)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.11.154/32) || (dst net 179.0.115.142/32) || (dst net 179.0.117.145/32) || (dst net 179.0.127.161/32) || (dst net 179.0.226.112/32))),
	((dst port 15568) || (dst port 15825) || (dst port 34475) || (dst port 37705) || (dst port 46911)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.5.227/32) || (dst net 180.0.10.180/32) || (dst net 180.0.165.88/32) || (dst net 180.0.223.146/32) || (dst net 180.0.224.24/32))),
	((dst port 13270) || (dst port 15181) || (dst port 22178) || (dst port 23469) || (dst port 42044)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.24.92/32) || (dst net 181.0.91.206/32) || (dst net 181.0.94.127/32) || (dst net 181.0.189.190/32) || (dst net 181.0.205.11/32))),
	((dst port 5408) || (dst port 8003) || (dst port 17118) || (dst port 24333) || (dst port 31688)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.15.213/32) || (dst net 182.0.102.209/32) || (dst net 182.0.131.163/32) || (dst net 182.0.201.154/32) || (dst net 182.0.245.96/32))),
	((dst port 17188) || (dst port 20548) || (dst port 20800) || (dst port 34047) || (dst port 43231)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.9.171/32) || (dst net 183.0.24.204/32) || (dst net 183.0.82.149/32) || (dst net 183.0.193.198/32) || (dst net 183.0.215.1/32))),
	((dst port 12646) || (dst port 13369) || (dst port 14150) || (dst port 32951) || (dst port 65336)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.53.133/32) || (dst net 184.0.98.21/32) || (dst net 184.0.170.128/32) || (dst net 184.0.179.158/32) || (dst net 184.0.237.169/32))),
	((dst port 280) || (dst port 36547) || (dst port 36759) || (dst port 47932) || (dst port 61109)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.36.198/32) || (dst net 185.0.67.65/32) || (dst net 185.0.72.225/32) || (dst net 185.0.115.91/32) || (dst net 185.0.213.221/32))),
	((dst port 1099) || (dst port 2714) || (dst port 7919) || (dst port 24445) || (dst port 46806)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.83.111/32) || (dst net 186.0.106.39/32) || (dst net 186.0.106.79/32) || (dst net 186.0.139.141/32) || (dst net 186.0.246.103/32))),
	((dst port 13320) || (dst port 19589) || (dst port 22578) || (dst port 31411) || (dst port 43624)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.4.54/32) || (dst net 187.0.14.36/32) || (dst net 187.0.122.87/32) || (dst net 187.0.148.117/32) || (dst net 187.0.194.69/32))),
	((dst port 4564) || (dst port 19347) || (dst port 34717) || (dst port 40257) || (dst port 42520)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.9.78/32) || (dst net 188.0.99.105/32) || (dst net 188.0.129.171/32) || (dst net 188.0.214.91/32) || (dst net 188.0.240.79/32))),
	((dst port 2878) || (dst port 14405) || (dst port 16433) || (dst port 19448) || (dst port 33391)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.1.186/32) || (dst net 189.0.66.180/32) || (dst net 189.0.93.53/32) || (dst net 189.0.166.144/32) || (dst net 189.0.220.21/32))),
	((dst port 12025) || (dst port 21678) || (dst port 33014) || (dst port 52514) || (dst port 55666)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.6.17/32) || (dst net 190.0.9.97/32) || (dst net 190.0.17.226/32) || (dst net 190.0.126.132/32) || (dst net 190.0.216.201/32))),
	((dst port 15369) || (dst port 19358) || (dst port 22786) || (dst port 31752) || (dst port 55985)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.36.93/32) || (dst net 191.0.95.110/32) || (dst net 191.0.100.23/32) || (dst net 191.0.129.188/32) || (dst net 191.0.255.197/32))),
	((dst port 13926) || (dst port 21725) || (dst port 25764) || (dst port 28375) || (dst port 31520)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.0.56/32) || (dst net 192.0.47.28/32) || (dst net 192.0.130.17/32) || (dst net 192.0.149.123/32) || (dst net 192.0.237.171/32))),
	((dst port 15515) || (dst port 42419) || (dst port 45216) || (dst port 51135) || (dst port 62023)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.23.198/32) || (dst net 193.0.134.58/32) || (dst net 193.0.213.47/32) || (dst net 193.0.214.45/32) || (dst net 193.0.237.110/32))),
	((dst port 4399) || (dst port 18276) || (dst port 18973) || (dst port 20691) || (dst port 22731)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.142.16/32) || (dst net 194.0.150.127/32) || (dst net 194.0.153.8/32) || (dst net 194.0.196.235/32) || (dst net 194.0.198.209/32))),
	((dst port 29529) || (dst port 31150) || (dst port 42277) || (dst port 48503) || (dst port 51444)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.32.218/32) || (dst net 195.0.110.35/32) || (dst net 195.0.143.216/32) || (dst net 195.0.160.66/32) || (dst net 195.0.171.191/32))),
	((dst port 7936) || (dst port 11955) || (dst port 12826) || (dst port 13984) || (dst port 14479)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.43.22/32) || (dst net 196.0.95.211/32) || (dst net 196.0.176.136/32) || (dst net 196.0.233.56/32) || (dst net 196.0.245.120/32))),
	((dst port 21499) || (dst port 24173) || (dst port 34659) || (dst port 40582) || (dst port 58435)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.93.246/32) || (dst net 197.0.140.206/32) || (dst net 197.0.143.71/32) || (dst net 197.0.180.220/32) || (dst net 197.0.241.221/32))),
	((dst port 14448) || (dst port 39558) || (dst port 41244) || (dst port 59316) || (dst port 65160)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.70.218/32) || (dst net 198.0.111.248/32) || (dst net 198.0.184.195/32) || (dst net 198.0.226.31/32) || (dst net 198.0.237.244/32))),
	((dst port 21006) || (dst port 31542) || (dst port 52765) || (dst port 58238) || (dst port 65346)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.36.214/32) || (dst net 199.0.52.109/32) || (dst net 199.0.114.3/32) || (dst net 199.0.203.85/32) || (dst net 199.0.229.216/32))),
	((dst port 21029) || (dst port 31657) || (dst port 35764) || (dst port 41081) || (dst port 54393)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.49.108/32) || (dst net 200.0.144.32/32) || (dst net 200.0.160.4/32) || (dst net 200.0.246.150/32) || (dst net 200.0.252.236/32))),
	((dst port 831) || (dst port 5837) || (dst port 18024) || (dst port 58124) || (dst port 61104)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.19.187/32) || (dst net 201.0.105.45/32) || (dst net 201.0.140.169/32) || (dst net 201.0.215.89/32) || (dst net 201.0.237.49/32))),
	((dst port 10347) || (dst port 18148) || (dst port 25187) || (dst port 30850) || (dst port 42645)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.40.233/32) || (dst net 202.0.73.4/32) || (dst net 202.0.96.139/32) || (dst net 202.0.176.16/32) || (dst net 202.0.240.160/32))),
	((dst port 5603) || (dst port 12063) || (dst port 12085) || (dst port 42428) || (dst port 61144)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.15.22/32) || (dst net 203.0.45.65/32) || (dst net 203.0.145.134/32) || (dst net 203.0.182.220/32) || (dst net 203.0.204.255/32))),
	((dst port 5876) || (dst port 15476) || (dst port 36429) || (dst port 56343) || (dst port 57807)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.3.54/32) || (dst net 204.0.5.153/32) || (dst net 204.0.110.178/32) || (dst net 204.0.175.164/32) || (dst net 204.0.179.66/32))),
	((dst port 23114) || (dst port 35023) || (dst port 35209) || (dst port 35850) || (dst port 45006)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.40.50/32) || (dst net 205.0.52.72/32) || (dst net 205.0.91.205/32) || (dst net 205.0.200.149/32) || (dst net 205.0.221.17/32))),
	((dst port 1426) || (dst port 18338) || (dst port 52334) || (dst port 53859) || (dst port 55887)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.80.254/32) || (dst net 206.0.89.81/32) || (dst net 206.0.198.119/32) || (dst net 206.0.214.177/32) || (dst net 206.0.226.202/32))),
	((dst port 630) || (dst port 17870) || (dst port 36074) || (dst port 50836) || (dst port 62379)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.51.236/32) || (dst net 207.0.112.97/32) || (dst net 207.0.120.169/32) || (dst net 207.0.184.46/32) || (dst net 207.0.191.13/32))),
	((dst port 14174) || (dst port 21683) || (dst port 43070) || (dst port 43561) || (dst port 60105)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.42.250/32) || (dst net 208.0.119.104/32) || (dst net 208.0.132.213/32) || (dst net 208.0.158.33/32) || (dst net 208.0.176.199/32))),
	((dst port 5768) || (dst port 13698) || (dst port 42948) || (dst port 60658) || (dst port 64964)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.12.173/32) || (dst net 209.0.27.114/32) || (dst net 209.0.92.183/32) || (dst net 209.0.213.196/32) || (dst net 209.0.237.109/32))),
	((dst port 3688) || (dst port 8938) || (dst port 9696) || (dst port 49463) || (dst port 51297)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.9.113/32) || (dst net 210.0.35.243/32) || (dst net 210.0.131.50/32) || (dst net 210.0.159.31/32) || (dst net 210.0.247.105/32))),
	((dst port 842) || (dst port 8174) || (dst port 9654) || (dst port 24656) || (dst port 25584)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.75.53/32) || (dst net 211.0.89.165/32) || (dst net 211.0.98.60/32) || (dst net 211.0.114.145/32) || (dst net 211.0.235.84/32))),
	((dst port 7157) || (dst port 41076) || (dst port 54848) || (dst port 55575) || (dst port 64784)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.59.23/32) || (dst net 212.0.89.34/32) || (dst net 212.0.92.83/32) || (dst net 212.0.200.61/32) || (dst net 212.0.202.152/32))),
	((dst port 33570) || (dst port 40569) || (dst port 54517) || (dst port 62751) || (dst port 63602)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.29.200/32) || (dst net 213.0.80.140/32) || (dst net 213.0.211.186/32) || (dst net 213.0.243.117/32) || (dst net 213.0.247.59/32))),
	((dst port 7305) || (dst port 12960) || (dst port 39095) || (dst port 43152) || (dst port 61301)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.31.210/32) || (dst net 214.0.55.114/32) || (dst net 214.0.154.142/32) || (dst net 214.0.161.149/32) || (dst net 214.0.214.44/32))),
	((dst port 3480) || (dst port 10871) || (dst port 13267) || (dst port 32611) || (dst port 60383)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.29.243/32) || (dst net 215.0.91.243/32) || (dst net 215.0.140.210/32) || (dst net 215.0.178.160/32) || (dst net 215.0.203.9/32))),
	((dst port 12788) || (dst port 42940) || (dst port 54681) || (dst port 59968) || (dst port 64368)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.10.231/32) || (dst net 216.0.27.5/32) || (dst net 216.0.113.29/32) || (dst net 216.0.167.92/32) || (dst net 216.0.176.63/32))),
	((dst port 25723) || (dst port 31198) || (dst port 41358) || (dst port 44237) || (dst port 65067)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.74.3/32) || (dst net 217.0.80.90/32) || (dst net 217.0.115.77/32) || (dst net 217.0.144.241/32) || (dst net 217.0.174.156/32))),
	((dst port 9003) || (dst port 25011) || (dst port 28479) || (dst port 51926) || (dst port 55327)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.33.109/32) || (dst net 218.0.42.145/32) || (dst net 218.0.129.82/32) || (dst net 218.0.161.47/32) || (dst net 218.0.178.186/32))),
	((dst port 11955) || (dst port 37749) || (dst port 42621) || (dst port 48047) || (dst port 58116)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.78.44/32) || (dst net 219.0.132.167/32) || (dst net 219.0.141.49/32) || (dst net 219.0.168.176/32) || (dst net 219.0.217.31/32))),
	((dst port 2794) || (dst port 9362) || (dst port 23580) || (dst port 39262) || (dst port 46896)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.47.99/32) || (dst net 220.0.54.70/32) || (dst net 220.0.66.250/32) || (dst net 220.0.67.96/32) || (dst net 220.0.248.187/32))),
	((dst port 7974) || (dst port 14171) || (dst port 55879) || (dst port 64259) || (dst port 65007)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.76.5/32) || (dst net 221.0.128.56/32) || (dst net 221.0.132.126/32) || (dst net 221.0.147.253/32) || (dst net 221.0.183.45/32))),
	((dst port 10087) || (dst port 23929) || (dst port 37719) || (dst port 52657) || (dst port 63924)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.51.121/32) || (dst net 222.0.64.88/32) || (dst net 222.0.113.253/32) || (dst net 222.0.130.147/32) || (dst net 222.0.156.152/32))),
	((dst port 17819) || (dst port 19993) || (dst port 50766) || (dst port 52850) || (dst port 56970)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.15.175/32) || (dst net 223.0.190.41/32) || (dst net 223.0.222.102/32) || (dst net 223.0.226.151/32) || (dst net 223.0.240.113/32))),
	((dst port 1972) || (dst port 45201) || (dst port 52010) || (dst port 57956) || (dst port 62302)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.54.57/32) || (dst net 224.0.111.226/32) || (dst net 224.0.134.73/32) || (dst net 224.0.227.50/32) || (dst net 224.0.245.139/32))),
	((dst port 2606) || (dst port 21541) || (dst port 23668) || (dst port 35527) || (dst port 51952)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.44.202/32) || (dst net 225.0.84.89/32) || (dst net 225.0.160.141/32) || (dst net 225.0.170.117/32) || (dst net 225.0.178.85/32))),
	((dst port 6094) || (dst port 8853) || (dst port 26159) || (dst port 37268) || (dst port 61986)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.57.107/32) || (dst net 226.0.77.159/32) || (dst net 226.0.137.57/32) || (dst net 226.0.195.79/32) || (dst net 226.0.203.203/32))),
	((dst port 13304) || (dst port 14179) || (dst port 37353) || (dst port 39892) || (dst port 51167)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.58.103/32) || (dst net 227.0.65.220/32) || (dst net 227.0.76.195/32) || (dst net 227.0.121.119/32) || (dst net 227.0.234.211/32))),
	((dst port 26295) || (dst port 29162) || (dst port 31330) || (dst port 44475) || (dst port 45059)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.52.59/32) || (dst net 228.0.83.10/32) || (dst net 228.0.96.155/32) || (dst net 228.0.144.143/32) || (dst net 228.0.252.247/32))),
	((dst port 15929) || (dst port 21779) || (dst port 55861) || (dst port 61634) || (dst port 64477)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.23.87/32) || (dst net 229.0.58.173/32) || (dst net 229.0.94.152/32) || (dst net 229.0.106.220/32) || (dst net 229.0.155.44/32))),
	((dst port 9632) || (dst port 17262) || (dst port 28777) || (dst port 50690) || (dst port 56990)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.4.66/32) || (dst net 230.0.36.223/32) || (dst net 230.0.135.12/32) || (dst net 230.0.164.211/32) || (dst net 230.0.208.120/32))),
	((dst port 21016) || (dst port 33137) || (dst port 47328) || (dst port 57488) || (dst port 62566)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.75.51/32) || (dst net 231.0.77.55/32) || (dst net 231.0.128.47/32) || (dst net 231.0.238.181/32) || (dst net 231.0.246.150/32))),
	((dst port 3649) || (dst port 32010) || (dst port 35986) || (dst port 36668) || (dst port 60525)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.43.45/32) || (dst net 232.0.46.150/32) || (dst net 232.0.119.236/32) || (dst net 232.0.132.172/32) || (dst net 232.0.173.38/32))),
	((dst port 28345) || (dst port 32445) || (dst port 40916) || (dst port 49228) || (dst port 59816)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.36.132/32) || (dst net 233.0.99.61/32) || (dst net 233.0.145.51/32) || (dst net 233.0.180.52/32) || (dst net 233.0.222.32/32))),
	((dst port 14189) || (dst port 44863) || (dst port 50200) || (dst port 56435) || (dst port 62101)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.1.153/32) || (dst net 234.0.5.10/32) || (dst net 234.0.169.31/32) || (dst net 234.0.225.177/32) || (dst net 234.0.252.143/32))),
	((dst port 1730) || (dst port 4703) || (dst port 7529) || (dst port 17231) || (dst port 59575)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.11.160/32) || (dst net 235.0.15.9/32) || (dst net 235.0.47.111/32) || (dst net 235.0.85.147/32) || (dst net 235.0.210.166/32))),
	((dst port 127) || (dst port 4170) || (dst port 4642) || (dst port 34892) || (dst port 39216)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.115.222/32) || (dst net 236.0.167.187/32) || (dst net 236.0.173.98/32) || (dst net 236.0.189.107/32) || (dst net 236.0.203.101/32))),
	((dst port 1878) || (dst port 30780) || (dst port 36276) || (dst port 47200) || (dst port 59998)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.48.60/32) || (dst net 237.0.144.132/32) || (dst net 237.0.149.125/32) || (dst net 237.0.163.205/32) || (dst net 237.0.181.215/32))),
	((dst port 966) || (dst port 10315) || (dst port 10704) || (dst port 14475) || (dst port 60547)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.89.77/32) || (dst net 238.0.122.62/32) || (dst net 238.0.124.49/32) || (dst net 238.0.183.49/32) || (dst net 238.0.190.81/32))),
	((dst port 9505) || (dst port 23776) || (dst port 27056) || (dst port 33601) || (dst port 62048)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.18.46/32) || (dst net 239.0.26.235/32) || (dst net 239.0.55.172/32) || (dst net 239.0.124.119/32) || (dst net 239.0.155.157/32))),
	((dst port 7816) || (dst port 17430) || (dst port 24815) || (dst port 30775) || (dst port 63605)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.51.30/32) || (dst net 240.0.135.148/32) || (dst net 240.0.135.196/32) || (dst net 240.0.222.215/32) || (dst net 240.0.237.94/32))),
	((dst port 18502) || (dst port 22964) || (dst port 45635) || (dst port 54618) || (dst port 57009)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.42.191/32) || (dst net 241.0.63.75/32) || (dst net 241.0.71.230/32) || (dst net 241.0.75.212/32) || (dst net 241.0.132.28/32))),
	((dst port 10194) || (dst port 16821) || (dst port 31231) || (dst port 45057) || (dst port 50508)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.17.45/32) || (dst net 242.0.33.238/32) || (dst net 242.0.159.235/32) || (dst net 242.0.172.255/32) || (dst net 242.0.183.156/32))),
	((dst port 32165) || (dst port 32475) || (dst port 37640) || (dst port 45254) || (dst port 54886)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.49.190/32) || (dst net 243.0.144.35/32) || (dst net 243.0.180.200/32) || (dst net 243.0.189.4/32) || (dst net 243.0.213.218/32))),
	((dst port 8747) || (dst port 13627) || (dst port 21763) || (dst port 48306) || (dst port 51853)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.73.32/32) || (dst net 244.0.80.129/32) || (dst net 244.0.113.127/32) || (dst net 244.0.194.71/32) || (dst net 244.0.195.66/32))),
	((dst port 4879) || (dst port 6274) || (dst port 7294) || (dst port 23599) || (dst port 25203)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.21.190/32) || (dst net 245.0.84.157/32) || (dst net 245.0.156.93/32) || (dst net 245.0.157.91/32) || (dst net 245.0.245.73/32))),
	((dst port 15558) || (dst port 24516) || (dst port 44732) || (dst port 62612) || (dst port 64340)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.8.117/32) || (dst net 246.0.70.33/32) || (dst net 246.0.105.214/32) || (dst net 246.0.140.87/32) || (dst net 246.0.179.238/32))),
	((dst port 5907) || (dst port 44698) || (dst port 52514) || (dst port 56797) || (dst port 58548)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.11.227/32) || (dst net 247.0.75.121/32) || (dst net 247.0.118.246/32) || (dst net 247.0.136.31/32) || (dst net 247.0.241.164/32))),
	((dst port 18253) || (dst port 32817) || (dst port 56312) || (dst port 58067) || (dst port 61271)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.62.39/32) || (dst net 248.0.101.154/32) || (dst net 248.0.134.114/32) || (dst net 248.0.141.81/32) || (dst net 248.0.164.186/32))),
	((dst port 12238) || (dst port 23597) || (dst port 28823) || (dst port 37239) || (dst port 40566)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.25.127/32) || (dst net 249.0.62.129/32) || (dst net 249.0.117.98/32) || (dst net 249.0.219.192/32) || (dst net 249.0.228.190/32))),
	((dst port 22307) || (dst port 48401) || (dst port 51932) || (dst port 58231) || (dst port 58409)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.4.162/32) || (dst net 250.0.34.186/32) || (dst net 250.0.47.188/32) || (dst net 250.0.81.95/32) || (dst net 250.0.217.74/32))),
	((dst port 20470) || (dst port 25383) || (dst port 31918) || (dst port 32371) || (dst port 34028)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.104.54/32) || (dst net 251.0.107.128/32) || (dst net 251.0.145.250/32) || (dst net 251.0.159.160/32) || (dst net 251.0.168.8/32))),
	((dst port 5951) || (dst port 15980) || (dst port 17676) || (dst port 55010) || (dst port 64906)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.66.216/32) || (dst net 252.0.91.121/32) || (dst net 252.0.108.39/32) || (dst net 252.0.108.72/32) || (dst net 252.0.110.217/32))),
	((dst port 16162) || (dst port 22288) || (dst port 29188) || (dst port 33508) || (dst port 46518)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.70.241/32) || (dst net 253.0.142.106/32) || (dst net 253.0.153.44/32) || (dst net 253.0.220.104/32) || (dst net 253.0.253.46/32))),
	((dst port 12124) || (dst port 13937) || (dst port 18383) || (dst port 29131) || (dst port 40504)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.71.20/32) || (dst net 254.0.103.225/32) || (dst net 254.0.193.236/32) || (dst net 254.0.203.157/32) || (dst net 254.0.227.242/32))),
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
