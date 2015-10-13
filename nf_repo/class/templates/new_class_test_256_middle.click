ipclassifier :: IPClassifier(
	((dst port 28729) || (dst port 39749) || (dst port 41881) || (dst port 59119) || (dst port 65231)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.16.183/32) || (dst net 0.0.39.30/32) || (dst net 0.0.59.9/32) || (dst net 0.0.130.72/32) || (dst net 0.0.220.217/32))),
	((dst port 14204) || (dst port 34021) || (dst port 40466) || (dst port 44861) || (dst port 52873)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.33.98/32) || (dst net 1.0.84.51/32) || (dst net 1.0.148.88/32) || (dst net 1.0.181.190/32) || (dst net 1.0.229.121/32))),
	((dst port 502) || (dst port 8258) || (dst port 15862) || (dst port 53715) || (dst port 64349)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.19.93/32) || (dst net 2.0.44.95/32) || (dst net 2.0.107.40/32) || (dst net 2.0.196.225/32) || (dst net 2.0.232.246/32))),
	((dst port 28234) || (dst port 31849) || (dst port 45313) || (dst port 48520) || (dst port 49282)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.20.188/32) || (dst net 3.0.68.12/32) || (dst net 3.0.86.7/32) || (dst net 3.0.94.25/32) || (dst net 3.0.146.144/32))),
	((dst port 2192) || (dst port 14083) || (dst port 22442) || (dst port 28247) || (dst port 40676)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.48.160/32) || (dst net 4.0.64.189/32) || (dst net 4.0.89.134/32) || (dst net 4.0.103.75/32) || (dst net 4.0.239.182/32))),
	((dst port 12956) || (dst port 34836) || (dst port 35169) || (dst port 37972) || (dst port 54284)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.23.117/32) || (dst net 5.0.29.237/32) || (dst net 5.0.37.154/32) || (dst net 5.0.151.132/32) || (dst net 5.0.204.112/32))),
	((dst port 6628) || (dst port 22305) || (dst port 24280) || (dst port 42259) || (dst port 54925)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.43.32/32) || (dst net 6.0.59.181/32) || (dst net 6.0.65.222/32) || (dst net 6.0.89.52/32) || (dst net 6.0.240.141/32))),
	((dst port 4140) || (dst port 40132) || (dst port 41531) || (dst port 45505) || (dst port 50468)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.18.145/32) || (dst net 7.0.82.199/32) || (dst net 7.0.102.185/32) || (dst net 7.0.240.206/32) || (dst net 7.0.243.167/32))),
	((dst port 19117) || (dst port 40342) || (dst port 46500) || (dst port 53783) || (dst port 60278)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.28.9/32) || (dst net 8.0.75.190/32) || (dst net 8.0.118.200/32) || (dst net 8.0.132.5/32) || (dst net 8.0.195.44/32))),
	((dst port 21184) || (dst port 47176) || (dst port 47199) || (dst port 52945) || (dst port 55581)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.46.231/32) || (dst net 9.0.78.97/32) || (dst net 9.0.97.228/32) || (dst net 9.0.134.160/32) || (dst net 9.0.187.147/32))),
	((dst port 11056) || (dst port 12231) || (dst port 26037) || (dst port 40586) || (dst port 41833)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.18.93/32) || (dst net 10.0.35.15/32) || (dst net 10.0.41.56/32) || (dst net 10.0.186.22/32) || (dst net 10.0.202.170/32))),
	((dst port 4260) || (dst port 11135) || (dst port 40473) || (dst port 48365) || (dst port 50570)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.34.1/32) || (dst net 11.0.52.13/32) || (dst net 11.0.67.109/32) || (dst net 11.0.144.141/32) || (dst net 11.0.242.69/32))),
	((dst port 1911) || (dst port 9556) || (dst port 14817) || (dst port 47340) || (dst port 52340)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.68.211/32) || (dst net 12.0.149.174/32) || (dst net 12.0.157.58/32) || (dst net 12.0.178.235/32) || (dst net 12.0.179.129/32))),
	((dst port 14547) || (dst port 19589) || (dst port 25261) || (dst port 34802) || (dst port 60177)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.49.159/32) || (dst net 13.0.163.3/32) || (dst net 13.0.201.174/32) || (dst net 13.0.240.61/32) || (dst net 13.0.243.4/32))),
	((dst port 3604) || (dst port 10533) || (dst port 12162) || (dst port 18146) || (dst port 44997)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.8.165/32) || (dst net 14.0.80.27/32) || (dst net 14.0.98.6/32) || (dst net 14.0.136.115/32) || (dst net 14.0.177.129/32))),
	((dst port 4770) || (dst port 16145) || (dst port 35078) || (dst port 43350) || (dst port 48139)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.16.176/32) || (dst net 15.0.89.67/32) || (dst net 15.0.101.140/32) || (dst net 15.0.150.98/32) || (dst net 15.0.185.121/32))),
	((dst port 21566) || (dst port 32884) || (dst port 45024) || (dst port 49510) || (dst port 56055)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.1.132/32) || (dst net 16.0.115.23/32) || (dst net 16.0.155.59/32) || (dst net 16.0.190.199/32) || (dst net 16.0.201.198/32))),
	((dst port 21288) || (dst port 28674) || (dst port 30745) || (dst port 35444) || (dst port 48667)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.20.133/32) || (dst net 17.0.29.183/32) || (dst net 17.0.51.165/32) || (dst net 17.0.138.32/32) || (dst net 17.0.248.175/32))),
	((dst port 4314) || (dst port 27401) || (dst port 29784) || (dst port 33962) || (dst port 45375)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.7.167/32) || (dst net 18.0.158.206/32) || (dst net 18.0.185.64/32) || (dst net 18.0.190.72/32) || (dst net 18.0.214.160/32))),
	((dst port 932) || (dst port 1827) || (dst port 14854) || (dst port 15005) || (dst port 37205)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.21.137/32) || (dst net 19.0.102.111/32) || (dst net 19.0.222.41/32) || (dst net 19.0.236.34/32) || (dst net 19.0.239.103/32))),
	((dst port 3572) || (dst port 13606) || (dst port 23600) || (dst port 47620) || (dst port 60857)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.0.175/32) || (dst net 20.0.69.82/32) || (dst net 20.0.108.51/32) || (dst net 20.0.120.148/32) || (dst net 20.0.227.127/32))),
	((dst port 6124) || (dst port 33946) || (dst port 37670) || (dst port 37742) || (dst port 54395)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.83.66/32) || (dst net 21.0.83.122/32) || (dst net 21.0.84.211/32) || (dst net 21.0.90.34/32) || (dst net 21.0.253.135/32))),
	((dst port 8717) || (dst port 13131) || (dst port 27835) || (dst port 33360) || (dst port 41985)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.27.173/32) || (dst net 22.0.40.142/32) || (dst net 22.0.110.152/32) || (dst net 22.0.158.191/32) || (dst net 22.0.221.71/32))),
	((dst port 1454) || (dst port 5421) || (dst port 23747) || (dst port 44546) || (dst port 46442)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.103.185/32) || (dst net 23.0.121.55/32) || (dst net 23.0.132.233/32) || (dst net 23.0.212.88/32) || (dst net 23.0.224.7/32))),
	((dst port 16794) || (dst port 30204) || (dst port 47099) || (dst port 54473) || (dst port 55901)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.17.55/32) || (dst net 24.0.23.129/32) || (dst net 24.0.92.47/32) || (dst net 24.0.246.90/32) || (dst net 24.0.254.254/32))),
	((dst port 6610) || (dst port 16001) || (dst port 32879) || (dst port 35255) || (dst port 60459)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.22.114/32) || (dst net 25.0.28.108/32) || (dst net 25.0.49.242/32) || (dst net 25.0.120.246/32) || (dst net 25.0.162.163/32))),
	((dst port 5496) || (dst port 26034) || (dst port 34939) || (dst port 38554) || (dst port 65009)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.47.18/32) || (dst net 26.0.88.219/32) || (dst net 26.0.132.38/32) || (dst net 26.0.205.228/32) || (dst net 26.0.217.7/32))),
	((dst port 7976) || (dst port 18946) || (dst port 33358) || (dst port 36086) || (dst port 52883)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.22.51/32) || (dst net 27.0.60.25/32) || (dst net 27.0.119.146/32) || (dst net 27.0.125.174/32) || (dst net 27.0.144.151/32))),
	((dst port 5502) || (dst port 8110) || (dst port 13128) || (dst port 49328) || (dst port 61248)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.2.128/32) || (dst net 28.0.6.178/32) || (dst net 28.0.71.50/32) || (dst net 28.0.179.104/32) || (dst net 28.0.216.9/32))),
	((dst port 4525) || (dst port 12632) || (dst port 14456) || (dst port 35052) || (dst port 42957)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.41.24/32) || (dst net 29.0.55.210/32) || (dst net 29.0.161.125/32) || (dst net 29.0.233.87/32) || (dst net 29.0.234.163/32))),
	((dst port 11915) || (dst port 39243) || (dst port 40168) || (dst port 42670) || (dst port 51155)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.46.148/32) || (dst net 30.0.73.170/32) || (dst net 30.0.139.188/32) || (dst net 30.0.205.82/32) || (dst net 30.0.252.206/32))),
	((dst port 16126) || (dst port 31196) || (dst port 39349) || (dst port 45283) || (dst port 61659)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.32.132/32) || (dst net 31.0.164.73/32) || (dst net 31.0.187.247/32) || (dst net 31.0.211.149/32) || (dst net 31.0.228.1/32))),
	((dst port 3156) || (dst port 7349) || (dst port 26232) || (dst port 43198) || (dst port 65113)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.11.232/32) || (dst net 32.0.158.224/32) || (dst net 32.0.183.124/32) || (dst net 32.0.199.5/32) || (dst net 32.0.206.236/32))),
	((dst port 6407) || (dst port 8771) || (dst port 11502) || (dst port 13453) || (dst port 35356)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.4.78/32) || (dst net 33.0.137.3/32) || (dst net 33.0.172.79/32) || (dst net 33.0.210.187/32) || (dst net 33.0.225.170/32))),
	((dst port 8100) || (dst port 14102) || (dst port 15320) || (dst port 21794) || (dst port 40520)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.28.20/32) || (dst net 34.0.119.84/32) || (dst net 34.0.131.206/32) || (dst net 34.0.213.200/32) || (dst net 34.0.222.183/32))),
	((dst port 107) || (dst port 37352) || (dst port 40460) || (dst port 41158) || (dst port 58373)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.84.191/32) || (dst net 35.0.186.150/32) || (dst net 35.0.227.126/32) || (dst net 35.0.248.197/32) || (dst net 35.0.249.95/32))),
	((dst port 6514) || (dst port 10410) || (dst port 41974) || (dst port 51240) || (dst port 62075)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.4.206/32) || (dst net 36.0.30.78/32) || (dst net 36.0.159.41/32) || (dst net 36.0.194.241/32) || (dst net 36.0.221.21/32))),
	((dst port 887) || (dst port 1058) || (dst port 29578) || (dst port 36358) || (dst port 43354)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.7.74/32) || (dst net 37.0.22.76/32) || (dst net 37.0.30.112/32) || (dst net 37.0.67.224/32) || (dst net 37.0.147.185/32))),
	((dst port 185) || (dst port 14318) || (dst port 42107) || (dst port 43774) || (dst port 54957)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.29.155/32) || (dst net 38.0.75.56/32) || (dst net 38.0.86.139/32) || (dst net 38.0.156.200/32) || (dst net 38.0.192.133/32))),
	((dst port 7305) || (dst port 12900) || (dst port 13129) || (dst port 25670) || (dst port 62120)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.26.81/32) || (dst net 39.0.188.42/32) || (dst net 39.0.198.97/32) || (dst net 39.0.204.21/32) || (dst net 39.0.210.184/32))),
	((dst port 12928) || (dst port 13382) || (dst port 20309) || (dst port 52598) || (dst port 53275)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.110.214/32) || (dst net 40.0.121.17/32) || (dst net 40.0.173.28/32) || (dst net 40.0.187.55/32) || (dst net 40.0.209.122/32))),
	((dst port 29697) || (dst port 45646) || (dst port 52088) || (dst port 57722) || (dst port 61091)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.111.228/32) || (dst net 41.0.114.243/32) || (dst net 41.0.158.246/32) || (dst net 41.0.207.131/32) || (dst net 41.0.231.160/32))),
	((dst port 19256) || (dst port 22436) || (dst port 37055) || (dst port 43628) || (dst port 47934)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.66.96/32) || (dst net 42.0.74.250/32) || (dst net 42.0.86.131/32) || (dst net 42.0.175.91/32) || (dst net 42.0.185.112/32))),
	((dst port 6094) || (dst port 17167) || (dst port 44945) || (dst port 51334) || (dst port 62045)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.53.71/32) || (dst net 43.0.116.183/32) || (dst net 43.0.153.84/32) || (dst net 43.0.177.244/32) || (dst net 43.0.210.225/32))),
	((dst port 3908) || (dst port 20037) || (dst port 27456) || (dst port 33660) || (dst port 64666)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.36.215/32) || (dst net 44.0.104.144/32) || (dst net 44.0.118.153/32) || (dst net 44.0.170.220/32) || (dst net 44.0.190.34/32))),
	((dst port 10808) || (dst port 13740) || (dst port 43089) || (dst port 43674) || (dst port 45189)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.43.113/32) || (dst net 45.0.49.48/32) || (dst net 45.0.90.36/32) || (dst net 45.0.143.63/32) || (dst net 45.0.231.87/32))),
	((dst port 13725) || (dst port 40508) || (dst port 41720) || (dst port 60946) || (dst port 63521)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.34.48/32) || (dst net 46.0.113.247/32) || (dst net 46.0.170.203/32) || (dst net 46.0.211.118/32) || (dst net 46.0.234.84/32))),
	((dst port 7427) || (dst port 51604) || (dst port 52529) || (dst port 55613) || (dst port 56550)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.31.94/32) || (dst net 47.0.45.76/32) || (dst net 47.0.79.143/32) || (dst net 47.0.101.179/32) || (dst net 47.0.195.123/32))),
	((dst port 33292) || (dst port 42764) || (dst port 46172) || (dst port 56516) || (dst port 58578)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.64.192/32) || (dst net 48.0.169.23/32) || (dst net 48.0.219.106/32) || (dst net 48.0.230.59/32) || (dst net 48.0.238.136/32))),
	((dst port 1793) || (dst port 37987) || (dst port 38287) || (dst port 58224) || (dst port 59431)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.30.63/32) || (dst net 49.0.56.163/32) || (dst net 49.0.86.33/32) || (dst net 49.0.127.89/32) || (dst net 49.0.170.165/32))),
	((dst port 5835) || (dst port 8882) || (dst port 13476) || (dst port 53867) || (dst port 63979)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.44.125/32) || (dst net 50.0.84.221/32) || (dst net 50.0.130.224/32) || (dst net 50.0.190.151/32) || (dst net 50.0.220.174/32))),
	((dst port 3938) || (dst port 6656) || (dst port 22250) || (dst port 27543) || (dst port 29867)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.51.0/32) || (dst net 51.0.106.227/32) || (dst net 51.0.133.130/32) || (dst net 51.0.157.149/32) || (dst net 51.0.240.207/32))),
	((dst port 22407) || (dst port 29409) || (dst port 39825) || (dst port 58274) || (dst port 65301)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.10.146/32) || (dst net 52.0.30.180/32) || (dst net 52.0.171.216/32) || (dst net 52.0.182.20/32) || (dst net 52.0.187.86/32))),
	((dst port 14832) || (dst port 25451) || (dst port 50200) || (dst port 50616) || (dst port 57288)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.13.137/32) || (dst net 53.0.33.18/32) || (dst net 53.0.70.154/32) || (dst net 53.0.167.196/32) || (dst net 53.0.241.110/32))),
	((dst port 11274) || (dst port 15774) || (dst port 22030) || (dst port 28903) || (dst port 39793)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.62.7/32) || (dst net 54.0.83.1/32) || (dst net 54.0.119.15/32) || (dst net 54.0.143.212/32) || (dst net 54.0.148.27/32))),
	((dst port 14418) || (dst port 38823) || (dst port 41106) || (dst port 44353) || (dst port 61863)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.29.222/32) || (dst net 55.0.39.174/32) || (dst net 55.0.52.221/32) || (dst net 55.0.140.214/32) || (dst net 55.0.206.74/32))),
	((dst port 12949) || (dst port 27313) || (dst port 32732) || (dst port 57662) || (dst port 59520)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.68.208/32) || (dst net 56.0.147.180/32) || (dst net 56.0.205.24/32) || (dst net 56.0.216.196/32) || (dst net 56.0.237.226/32))),
	((dst port 10877) || (dst port 22388) || (dst port 29731) || (dst port 33238) || (dst port 64342)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.0.35/32) || (dst net 57.0.60.60/32) || (dst net 57.0.117.120/32) || (dst net 57.0.127.246/32) || (dst net 57.0.229.247/32))),
	((dst port 13801) || (dst port 18048) || (dst port 25940) || (dst port 34707) || (dst port 42326)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.2.8/32) || (dst net 58.0.44.214/32) || (dst net 58.0.85.225/32) || (dst net 58.0.152.157/32) || (dst net 58.0.155.1/32))),
	((dst port 3035) || (dst port 10726) || (dst port 43081) || (dst port 54392) || (dst port 63000)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.74.3/32) || (dst net 59.0.83.178/32) || (dst net 59.0.171.29/32) || (dst net 59.0.216.165/32) || (dst net 59.0.253.155/32))),
	((dst port 22306) || (dst port 43723) || (dst port 49830) || (dst port 50935) || (dst port 58685)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.0.97/32) || (dst net 60.0.15.176/32) || (dst net 60.0.138.180/32) || (dst net 60.0.225.240/32) || (dst net 60.0.227.4/32))),
	((dst port 19429) || (dst port 33159) || (dst port 37243) || (dst port 49258) || (dst port 64651)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.37.251/32) || (dst net 61.0.76.181/32) || (dst net 61.0.111.253/32) || (dst net 61.0.124.158/32) || (dst net 61.0.221.68/32))),
	((dst port 6201) || (dst port 17670) || (dst port 37323) || (dst port 47355) || (dst port 56135)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.6.52/32) || (dst net 62.0.41.127/32) || (dst net 62.0.94.68/32) || (dst net 62.0.121.129/32) || (dst net 62.0.195.144/32))),
	((dst port 2548) || (dst port 5085) || (dst port 14060) || (dst port 36440) || (dst port 46474)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.33.129/32) || (dst net 63.0.103.199/32) || (dst net 63.0.159.246/32) || (dst net 63.0.180.213/32) || (dst net 63.0.210.25/32))),
	((dst port 290) || (dst port 33203) || (dst port 39738) || (dst port 40939) || (dst port 54972)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.33.190/32) || (dst net 64.0.48.218/32) || (dst net 64.0.52.75/32) || (dst net 64.0.81.92/32) || (dst net 64.0.85.239/32))),
	((dst port 35397) || (dst port 42498) || (dst port 42734) || (dst port 45638) || (dst port 49338)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.155.167/32) || (dst net 65.0.155.218/32) || (dst net 65.0.177.209/32) || (dst net 65.0.201.163/32) || (dst net 65.0.217.212/32))),
	((dst port 12811) || (dst port 26694) || (dst port 35317) || (dst port 44552) || (dst port 50658)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.22.59/32) || (dst net 66.0.36.166/32) || (dst net 66.0.55.142/32) || (dst net 66.0.98.32/32) || (dst net 66.0.173.55/32))),
	((dst port 5050) || (dst port 10838) || (dst port 29156) || (dst port 29948) || (dst port 40013)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.147.94/32) || (dst net 67.0.162.141/32) || (dst net 67.0.206.222/32) || (dst net 67.0.246.146/32) || (dst net 67.0.254.110/32))),
	((dst port 5533) || (dst port 10650) || (dst port 12624) || (dst port 36856) || (dst port 40652)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.27.69/32) || (dst net 68.0.102.119/32) || (dst net 68.0.119.248/32) || (dst net 68.0.128.215/32) || (dst net 68.0.242.191/32))),
	((dst port 1812) || (dst port 1840) || (dst port 37430) || (dst port 45721) || (dst port 50445)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.32.189/32) || (dst net 69.0.33.107/32) || (dst net 69.0.76.161/32) || (dst net 69.0.82.163/32) || (dst net 69.0.216.28/32))),
	((dst port 10488) || (dst port 20379) || (dst port 27449) || (dst port 44400) || (dst port 54949)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.35.63/32) || (dst net 70.0.48.250/32) || (dst net 70.0.125.155/32) || (dst net 70.0.221.14/32) || (dst net 70.0.245.3/32))),
	((dst port 24788) || (dst port 33688) || (dst port 36063) || (dst port 58487) || (dst port 60576)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.52.209/32) || (dst net 71.0.88.46/32) || (dst net 71.0.107.234/32) || (dst net 71.0.125.101/32) || (dst net 71.0.158.3/32))),
	((dst port 2905) || (dst port 20585) || (dst port 41969) || (dst port 56950) || (dst port 64917)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.36.101/32) || (dst net 72.0.62.167/32) || (dst net 72.0.90.70/32) || (dst net 72.0.144.58/32) || (dst net 72.0.159.119/32))),
	((dst port 1265) || (dst port 8491) || (dst port 16557) || (dst port 38855) || (dst port 44449)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.2.247/32) || (dst net 73.0.3.144/32) || (dst net 73.0.150.149/32) || (dst net 73.0.216.117/32) || (dst net 73.0.252.57/32))),
	((dst port 10502) || (dst port 17509) || (dst port 24549) || (dst port 27293) || (dst port 34690)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.15.228/32) || (dst net 74.0.68.43/32) || (dst net 74.0.90.213/32) || (dst net 74.0.113.133/32) || (dst net 74.0.215.192/32))),
	((dst port 3417) || (dst port 8370) || (dst port 29160) || (dst port 29429) || (dst port 38489)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.72.160/32) || (dst net 75.0.93.4/32) || (dst net 75.0.148.182/32) || (dst net 75.0.237.94/32) || (dst net 75.0.244.151/32))),
	((dst port 8693) || (dst port 25831) || (dst port 32135) || (dst port 53251) || (dst port 61934)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.87.102/32) || (dst net 76.0.95.179/32) || (dst net 76.0.127.240/32) || (dst net 76.0.203.146/32) || (dst net 76.0.232.230/32))),
	((dst port 15804) || (dst port 16991) || (dst port 21596) || (dst port 21699) || (dst port 55692)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.36.38/32) || (dst net 77.0.66.146/32) || (dst net 77.0.75.124/32) || (dst net 77.0.107.104/32) || (dst net 77.0.183.16/32))),
	((dst port 5914) || (dst port 17404) || (dst port 22511) || (dst port 57442) || (dst port 61740)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.2.210/32) || (dst net 78.0.50.66/32) || (dst net 78.0.55.230/32) || (dst net 78.0.171.35/32) || (dst net 78.0.224.52/32))),
	((dst port 16526) || (dst port 24249) || (dst port 41513) || (dst port 51263) || (dst port 57323)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.65.71/32) || (dst net 79.0.90.234/32) || (dst net 79.0.158.101/32) || (dst net 79.0.159.43/32) || (dst net 79.0.179.7/32))),
	((dst port 10176) || (dst port 14347) || (dst port 20379) || (dst port 31202) || (dst port 47640)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.14.169/32) || (dst net 80.0.29.126/32) || (dst net 80.0.90.56/32) || (dst net 80.0.137.13/32) || (dst net 80.0.137.75/32))),
	((dst port 9847) || (dst port 12360) || (dst port 22260) || (dst port 50553) || (dst port 56281)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.6.202/32) || (dst net 81.0.36.200/32) || (dst net 81.0.131.139/32) || (dst net 81.0.187.97/32) || (dst net 81.0.192.71/32))),
	((dst port 18587) || (dst port 29752) || (dst port 40633) || (dst port 53345) || (dst port 58520)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.48.185/32) || (dst net 82.0.116.197/32) || (dst net 82.0.153.136/32) || (dst net 82.0.203.101/32) || (dst net 82.0.249.218/32))),
	((dst port 478) || (dst port 14914) || (dst port 16335) || (dst port 48772) || (dst port 49059)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.91.137/32) || (dst net 83.0.96.51/32) || (dst net 83.0.101.84/32) || (dst net 83.0.135.167/32) || (dst net 83.0.176.72/32))),
	((dst port 5106) || (dst port 5415) || (dst port 40128) || (dst port 57325) || (dst port 57891)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.42.221/32) || (dst net 84.0.47.120/32) || (dst net 84.0.127.232/32) || (dst net 84.0.137.157/32) || (dst net 84.0.145.163/32))),
	((dst port 11060) || (dst port 23146) || (dst port 23893) || (dst port 51903) || (dst port 59989)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.15.96/32) || (dst net 85.0.24.254/32) || (dst net 85.0.39.2/32) || (dst net 85.0.125.112/32) || (dst net 85.0.228.225/32))),
	((dst port 3428) || (dst port 13036) || (dst port 15536) || (dst port 15550) || (dst port 60875)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.0.183/32) || (dst net 86.0.24.204/32) || (dst net 86.0.63.93/32) || (dst net 86.0.130.170/32) || (dst net 86.0.244.161/32))),
	((dst port 9350) || (dst port 13950) || (dst port 21538) || (dst port 30065) || (dst port 61382)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.17.139/32) || (dst net 87.0.35.196/32) || (dst net 87.0.101.30/32) || (dst net 87.0.150.119/32) || (dst net 87.0.217.164/32))),
	((dst port 2338) || (dst port 9144) || (dst port 10967) || (dst port 38097) || (dst port 48218)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.7.60/32) || (dst net 88.0.99.16/32) || (dst net 88.0.127.7/32) || (dst net 88.0.127.147/32) || (dst net 88.0.154.42/32))),
	((dst port 22190) || (dst port 23222) || (dst port 37960) || (dst port 48116) || (dst port 63150)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.58.14/32) || (dst net 89.0.152.53/32) || (dst net 89.0.154.38/32) || (dst net 89.0.219.248/32) || (dst net 89.0.252.89/32))),
	((dst port 52) || (dst port 3690) || (dst port 30270) || (dst port 37891) || (dst port 49257)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.59.113/32) || (dst net 90.0.93.63/32) || (dst net 90.0.123.224/32) || (dst net 90.0.136.19/32) || (dst net 90.0.218.194/32))),
	((dst port 913) || (dst port 2887) || (dst port 5634) || (dst port 19097) || (dst port 40254)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.33.95/32) || (dst net 91.0.62.49/32) || (dst net 91.0.89.106/32) || (dst net 91.0.227.134/32) || (dst net 91.0.229.253/32))),
	((dst port 1557) || (dst port 26270) || (dst port 26889) || (dst port 32511) || (dst port 41587)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.35.254/32) || (dst net 92.0.99.97/32) || (dst net 92.0.112.166/32) || (dst net 92.0.153.29/32) || (dst net 92.0.236.69/32))),
	((dst port 4714) || (dst port 22966) || (dst port 24052) || (dst port 38202) || (dst port 55163)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.15.54/32) || (dst net 93.0.23.89/32) || (dst net 93.0.24.123/32) || (dst net 93.0.203.19/32) || (dst net 93.0.253.107/32))),
	((dst port 14850) || (dst port 20961) || (dst port 31541) || (dst port 32673) || (dst port 43040)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.31.179/32) || (dst net 94.0.48.172/32) || (dst net 94.0.57.106/32) || (dst net 94.0.105.175/32) || (dst net 94.0.143.78/32))),
	((dst port 4871) || (dst port 24272) || (dst port 43477) || (dst port 50462) || (dst port 51391)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.10.19/32) || (dst net 95.0.58.46/32) || (dst net 95.0.99.192/32) || (dst net 95.0.141.19/32) || (dst net 95.0.171.117/32))),
	((dst port 10853) || (dst port 19769) || (dst port 31274) || (dst port 31677) || (dst port 54730)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.10.9/32) || (dst net 96.0.11.214/32) || (dst net 96.0.187.12/32) || (dst net 96.0.211.17/32) || (dst net 96.0.219.184/32))),
	((dst port 6352) || (dst port 12675) || (dst port 16309) || (dst port 37887) || (dst port 43128)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.27.73/32) || (dst net 97.0.92.58/32) || (dst net 97.0.187.35/32) || (dst net 97.0.200.43/32) || (dst net 97.0.201.191/32))),
	((dst port 13058) || (dst port 32130) || (dst port 47259) || (dst port 48934) || (dst port 58014)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.1.53/32) || (dst net 98.0.49.229/32) || (dst net 98.0.56.123/32) || (dst net 98.0.147.166/32) || (dst net 98.0.155.169/32))),
	((dst port 792) || (dst port 20682) || (dst port 45440) || (dst port 63231) || (dst port 64717)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.22.167/32) || (dst net 99.0.52.112/32) || (dst net 99.0.149.187/32) || (dst net 99.0.191.236/32) || (dst net 99.0.230.67/32))),
	((dst port 1703) || (dst port 33858) || (dst port 53453) || (dst port 57181) || (dst port 64323)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.6.58/32) || (dst net 100.0.44.216/32) || (dst net 100.0.86.86/32) || (dst net 100.0.155.104/32) || (dst net 100.0.182.237/32))),
	((dst port 4651) || (dst port 6207) || (dst port 39193) || (dst port 39722) || (dst port 57056)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.27.149/32) || (dst net 101.0.28.80/32) || (dst net 101.0.209.218/32) || (dst net 101.0.212.71/32) || (dst net 101.0.239.211/32))),
	((dst port 2726) || (dst port 7084) || (dst port 18628) || (dst port 51316) || (dst port 51846)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.6.16/32) || (dst net 102.0.15.125/32) || (dst net 102.0.55.107/32) || (dst net 102.0.80.125/32) || (dst net 102.0.201.36/32))),
	((dst port 23125) || (dst port 24467) || (dst port 34024) || (dst port 47693) || (dst port 53844)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.60.192/32) || (dst net 103.0.78.115/32) || (dst net 103.0.81.174/32) || (dst net 103.0.83.40/32) || (dst net 103.0.91.59/32))),
	((dst port 42288) || (dst port 51417) || (dst port 58474) || (dst port 61969) || (dst port 63263)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.9.187/32) || (dst net 104.0.88.123/32) || (dst net 104.0.90.165/32) || (dst net 104.0.206.180/32) || (dst net 104.0.237.182/32))),
	((dst port 389) || (dst port 523) || (dst port 46988) || (dst port 50150) || (dst port 53530)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.2.37/32) || (dst net 105.0.197.143/32) || (dst net 105.0.202.33/32) || (dst net 105.0.218.206/32) || (dst net 105.0.221.39/32))),
	((dst port 6791) || (dst port 12155) || (dst port 17589) || (dst port 48795) || (dst port 54436)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.25.102/32) || (dst net 106.0.32.202/32) || (dst net 106.0.118.235/32) || (dst net 106.0.168.250/32) || (dst net 106.0.204.114/32))),
	((dst port 19139) || (dst port 19896) || (dst port 21507) || (dst port 36181) || (dst port 44630)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.0.241/32) || (dst net 107.0.123.131/32) || (dst net 107.0.184.176/32) || (dst net 107.0.211.225/32) || (dst net 107.0.243.119/32))),
	((dst port 4788) || (dst port 7165) || (dst port 13908) || (dst port 41342) || (dst port 59884)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.133.239/32) || (dst net 108.0.159.254/32) || (dst net 108.0.161.118/32) || (dst net 108.0.169.252/32) || (dst net 108.0.211.251/32))),
	((dst port 28177) || (dst port 35657) || (dst port 42509) || (dst port 63724) || (dst port 63781)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.117.159/32) || (dst net 109.0.203.87/32) || (dst net 109.0.230.129/32) || (dst net 109.0.253.222/32) || (dst net 109.0.254.96/32))),
	((dst port 925) || (dst port 7407) || (dst port 31550) || (dst port 32887) || (dst port 36313)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.65.222/32) || (dst net 110.0.79.170/32) || (dst net 110.0.112.170/32) || (dst net 110.0.115.224/32) || (dst net 110.0.253.202/32))),
	((dst port 5173) || (dst port 26668) || (dst port 37488) || (dst port 45165) || (dst port 52499)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.34.106/32) || (dst net 111.0.70.95/32) || (dst net 111.0.89.84/32) || (dst net 111.0.116.243/32) || (dst net 111.0.203.243/32))),
	((dst port 6679) || (dst port 15116) || (dst port 33572) || (dst port 47266) || (dst port 55484)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.75.47/32) || (dst net 112.0.118.38/32) || (dst net 112.0.179.81/32) || (dst net 112.0.189.45/32) || (dst net 112.0.231.54/32))),
	((dst port 5182) || (dst port 10504) || (dst port 12212) || (dst port 22375) || (dst port 56391)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.120.113/32) || (dst net 113.0.171.135/32) || (dst net 113.0.209.236/32) || (dst net 113.0.219.165/32) || (dst net 113.0.254.33/32))),
	((dst port 9560) || (dst port 24624) || (dst port 51933) || (dst port 54331) || (dst port 54991)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.42.52/32) || (dst net 114.0.43.227/32) || (dst net 114.0.52.74/32) || (dst net 114.0.226.148/32) || (dst net 114.0.252.149/32))),
	((dst port 19356) || (dst port 29079) || (dst port 39422) || (dst port 57364) || (dst port 61286)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.16.94/32) || (dst net 115.0.36.48/32) || (dst net 115.0.111.98/32) || (dst net 115.0.168.116/32) || (dst net 115.0.210.249/32))),
	((dst port 5218) || (dst port 18611) || (dst port 37364) || (dst port 54019) || (dst port 57574)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.4.186/32) || (dst net 116.0.74.176/32) || (dst net 116.0.75.36/32) || (dst net 116.0.130.101/32) || (dst net 116.0.243.149/32))),
	((dst port 11024) || (dst port 19110) || (dst port 30155) || (dst port 41395) || (dst port 45875)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.8.207/32) || (dst net 117.0.31.206/32) || (dst net 117.0.192.54/32) || (dst net 117.0.232.137/32) || (dst net 117.0.255.175/32))),
	((dst port 24158) || (dst port 27190) || (dst port 39176) || (dst port 47048) || (dst port 55010)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.18.254/32) || (dst net 118.0.23.170/32) || (dst net 118.0.182.166/32) || (dst net 118.0.192.57/32) || (dst net 118.0.238.149/32))),
	((dst port 8532) || (dst port 20940) || (dst port 21120) || (dst port 21775) || (dst port 38247)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.52.34/32) || (dst net 119.0.62.193/32) || (dst net 119.0.167.6/32) || (dst net 119.0.217.182/32) || (dst net 119.0.228.40/32))),
	((dst port 2847) || (dst port 8536) || (dst port 11759) || (dst port 13609) || (dst port 48572)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.44.255/32) || (dst net 120.0.60.236/32) || (dst net 120.0.62.223/32) || (dst net 120.0.101.44/32) || (dst net 120.0.194.199/32))),
	((dst port 19901) || (dst port 36316) || (dst port 46812) || (dst port 48243) || (dst port 59520)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.22.247/32) || (dst net 121.0.76.146/32) || (dst net 121.0.166.145/32) || (dst net 121.0.167.42/32) || (dst net 121.0.190.70/32))),
	((dst port 18156) || (dst port 19420) || (dst port 21614) || (dst port 59260) || (dst port 62924)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.9.32/32) || (dst net 122.0.87.122/32) || (dst net 122.0.108.170/32) || (dst net 122.0.221.205/32) || (dst net 122.0.243.79/32))),
	((dst port 2049) || (dst port 19314) || (dst port 28568) || (dst port 44636) || (dst port 49680)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.20.157/32) || (dst net 123.0.25.197/32) || (dst net 123.0.63.113/32) || (dst net 123.0.81.120/32) || (dst net 123.0.255.63/32))),
	((dst port 11655) || (dst port 18833) || (dst port 37049) || (dst port 59186) || (dst port 59697)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.47.20/32) || (dst net 124.0.49.228/32) || (dst net 124.0.167.232/32) || (dst net 124.0.218.161/32) || (dst net 124.0.223.147/32))),
	((dst port 3309) || (dst port 19196) || (dst port 32152) || (dst port 50800) || (dst port 58967)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.29.158/32) || (dst net 125.0.30.185/32) || (dst net 125.0.122.61/32) || (dst net 125.0.136.224/32) || (dst net 125.0.252.49/32))),
	((dst port 9027) || (dst port 25547) || (dst port 43194) || (dst port 45798) || (dst port 50444)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.46.167/32) || (dst net 126.0.227.191/32) || (dst net 126.0.232.145/32) || (dst net 126.0.236.169/32) || (dst net 126.0.242.185/32))),
	((dst port 4135) || (dst port 30694) || (dst port 35703) || (dst port 37979) || (dst port 48682)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.12.121/32) || (dst net 127.0.149.81/32) || (dst net 127.0.187.31/32) || (dst net 127.0.200.103/32) || (dst net 127.0.223.10/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 2224) || (dst port 7845) || (dst port 29951) || (dst port 30677) || (dst port 44923)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.10.195/32) || (dst net 129.0.149.34/32) || (dst net 129.0.151.162/32) || (dst net 129.0.180.35/32) || (dst net 129.0.237.231/32))),
	((dst port 36174) || (dst port 54256) || (dst port 56302) || (dst port 56327) || (dst port 61068)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.18.80/32) || (dst net 130.0.77.201/32) || (dst net 130.0.79.99/32) || (dst net 130.0.82.27/32) || (dst net 130.0.218.255/32))),
	((dst port 7633) || (dst port 15898) || (dst port 44795) || (dst port 45345) || (dst port 49644)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.6.121/32) || (dst net 131.0.28.115/32) || (dst net 131.0.63.81/32) || (dst net 131.0.227.72/32) || (dst net 131.0.240.230/32))),
	((dst port 9805) || (dst port 23628) || (dst port 35536) || (dst port 42250) || (dst port 60965)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.63.206/32) || (dst net 132.0.70.136/32) || (dst net 132.0.108.213/32) || (dst net 132.0.210.33/32) || (dst net 132.0.247.115/32))),
	((dst port 24612) || (dst port 27252) || (dst port 39089) || (dst port 56271) || (dst port 57175)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.5.173/32) || (dst net 133.0.166.77/32) || (dst net 133.0.200.132/32) || (dst net 133.0.217.48/32) || (dst net 133.0.223.26/32))),
	((dst port 6829) || (dst port 7194) || (dst port 14813) || (dst port 25104) || (dst port 60496)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.112.253/32) || (dst net 134.0.114.36/32) || (dst net 134.0.200.92/32) || (dst net 134.0.202.78/32) || (dst net 134.0.228.241/32))),
	((dst port 1301) || (dst port 1675) || (dst port 41104) || (dst port 50529) || (dst port 52216)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.42.175/32) || (dst net 135.0.92.244/32) || (dst net 135.0.150.234/32) || (dst net 135.0.154.174/32) || (dst net 135.0.236.185/32))),
	((dst port 164) || (dst port 226) || (dst port 4784) || (dst port 18230) || (dst port 28525)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.30.202/32) || (dst net 136.0.50.38/32) || (dst net 136.0.98.30/32) || (dst net 136.0.170.106/32) || (dst net 136.0.247.103/32))),
	((dst port 4473) || (dst port 22378) || (dst port 23992) || (dst port 49187) || (dst port 51815)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.30.192/32) || (dst net 137.0.88.168/32) || (dst net 137.0.94.203/32) || (dst net 137.0.112.111/32) || (dst net 137.0.246.75/32))),
	((dst port 1599) || (dst port 10085) || (dst port 17558) || (dst port 34113) || (dst port 51406)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.0.238/32) || (dst net 138.0.117.87/32) || (dst net 138.0.148.185/32) || (dst net 138.0.234.238/32) || (dst net 138.0.241.238/32))),
	((dst port 29984) || (dst port 32158) || (dst port 44061) || (dst port 58174) || (dst port 63399)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.51.184/32) || (dst net 139.0.116.59/32) || (dst net 139.0.126.13/32) || (dst net 139.0.150.71/32) || (dst net 139.0.152.209/32))),
	((dst port 10663) || (dst port 11753) || (dst port 38950) || (dst port 45585) || (dst port 52711)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.45.167/32) || (dst net 140.0.75.151/32) || (dst net 140.0.144.105/32) || (dst net 140.0.172.48/32) || (dst net 140.0.174.39/32))),
	((dst port 18883) || (dst port 31716) || (dst port 32687) || (dst port 33030) || (dst port 40754)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.1.172/32) || (dst net 141.0.79.52/32) || (dst net 141.0.164.184/32) || (dst net 141.0.191.25/32) || (dst net 141.0.255.193/32))),
	((dst port 7494) || (dst port 10748) || (dst port 23030) || (dst port 28208) || (dst port 62606)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.43.98/32) || (dst net 142.0.82.176/32) || (dst net 142.0.117.94/32) || (dst net 142.0.173.160/32) || (dst net 142.0.174.93/32))),
	((dst port 18992) || (dst port 23865) || (dst port 25917) || (dst port 32195) || (dst port 38715)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.57.126/32) || (dst net 143.0.106.25/32) || (dst net 143.0.114.200/32) || (dst net 143.0.128.97/32) || (dst net 143.0.234.43/32))),
	((dst port 5596) || (dst port 13732) || (dst port 40441) || (dst port 49712) || (dst port 50740)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.45.134/32) || (dst net 144.0.117.84/32) || (dst net 144.0.169.210/32) || (dst net 144.0.208.50/32) || (dst net 144.0.237.185/32))),
	((dst port 16535) || (dst port 18878) || (dst port 26295) || (dst port 31984) || (dst port 40395)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.34.237/32) || (dst net 145.0.36.208/32) || (dst net 145.0.91.198/32) || (dst net 145.0.131.223/32) || (dst net 145.0.226.208/32))),
	((dst port 11259) || (dst port 23379) || (dst port 30975) || (dst port 40682) || (dst port 57724)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.21.60/32) || (dst net 146.0.83.185/32) || (dst net 146.0.145.215/32) || (dst net 146.0.149.143/32) || (dst net 146.0.179.232/32))),
	((dst port 17775) || (dst port 27689) || (dst port 28664) || (dst port 52070) || (dst port 59834)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.91.61/32) || (dst net 147.0.141.244/32) || (dst net 147.0.220.15/32) || (dst net 147.0.245.211/32) || (dst net 147.0.252.237/32))),
	((dst port 20143) || (dst port 20415) || (dst port 24101) || (dst port 51323) || (dst port 54254)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.142.43/32) || (dst net 148.0.142.79/32) || (dst net 148.0.146.205/32) || (dst net 148.0.169.177/32) || (dst net 148.0.217.227/32))),
	((dst port 16200) || (dst port 17277) || (dst port 20944) || (dst port 38129) || (dst port 45936)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.81.132/32) || (dst net 149.0.105.196/32) || (dst net 149.0.136.221/32) || (dst net 149.0.153.81/32) || (dst net 149.0.203.173/32))),
	((dst port 18543) || (dst port 23786) || (dst port 45009) || (dst port 49106) || (dst port 58112)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.10.247/32) || (dst net 150.0.15.116/32) || (dst net 150.0.135.238/32) || (dst net 150.0.200.13/32) || (dst net 150.0.219.254/32))),
	((dst port 9668) || (dst port 22865) || (dst port 28931) || (dst port 38315) || (dst port 50202)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.1.19/32) || (dst net 151.0.61.190/32) || (dst net 151.0.86.39/32) || (dst net 151.0.127.248/32) || (dst net 151.0.134.35/32))),
	((dst port 18622) || (dst port 38668) || (dst port 44332) || (dst port 46780) || (dst port 60087)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.93.90/32) || (dst net 152.0.176.177/32) || (dst net 152.0.181.51/32) || (dst net 152.0.235.34/32) || (dst net 152.0.249.1/32))),
	((dst port 10516) || (dst port 12964) || (dst port 17934) || (dst port 47293) || (dst port 59974)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.31.109/32) || (dst net 153.0.40.197/32) || (dst net 153.0.44.232/32) || (dst net 153.0.58.52/32) || (dst net 153.0.144.64/32))),
	((dst port 37407) || (dst port 40814) || (dst port 44990) || (dst port 49705) || (dst port 62456)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.17.201/32) || (dst net 154.0.83.38/32) || (dst net 154.0.117.76/32) || (dst net 154.0.188.78/32) || (dst net 154.0.227.87/32))),
	((dst port 10149) || (dst port 26469) || (dst port 27855) || (dst port 32065) || (dst port 52324)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.0.96/32) || (dst net 155.0.19.94/32) || (dst net 155.0.187.71/32) || (dst net 155.0.198.124/32) || (dst net 155.0.200.210/32))),
	((dst port 3652) || (dst port 13048) || (dst port 17996) || (dst port 35386) || (dst port 38298)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.58.228/32) || (dst net 156.0.89.149/32) || (dst net 156.0.96.11/32) || (dst net 156.0.117.191/32) || (dst net 156.0.247.178/32))),
	((dst port 20112) || (dst port 39280) || (dst port 44441) || (dst port 52681) || (dst port 64846)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.30.215/32) || (dst net 157.0.48.215/32) || (dst net 157.0.94.50/32) || (dst net 157.0.162.194/32) || (dst net 157.0.212.67/32))),
	((dst port 10430) || (dst port 17797) || (dst port 43343) || (dst port 60226) || (dst port 61337)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.30.223/32) || (dst net 158.0.76.207/32) || (dst net 158.0.171.185/32) || (dst net 158.0.181.81/32) || (dst net 158.0.188.221/32))),
	((dst port 3388) || (dst port 8385) || (dst port 30479) || (dst port 57813) || (dst port 62750)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.123.237/32) || (dst net 159.0.194.107/32) || (dst net 159.0.196.167/32) || (dst net 159.0.209.210/32) || (dst net 159.0.240.202/32))),
	((dst port 38765) || (dst port 42241) || (dst port 45239) || (dst port 50009) || (dst port 56802)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.28.65/32) || (dst net 160.0.101.208/32) || (dst net 160.0.181.43/32) || (dst net 160.0.189.147/32) || (dst net 160.0.247.27/32))),
	((dst port 24788) || (dst port 42016) || (dst port 62747) || (dst port 63407) || (dst port 64835)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.66.139/32) || (dst net 161.0.69.69/32) || (dst net 161.0.174.168/32) || (dst net 161.0.181.8/32) || (dst net 161.0.211.171/32))),
	((dst port 29939) || (dst port 31076) || (dst port 44861) || (dst port 59142) || (dst port 59679)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.105.168/32) || (dst net 162.0.115.102/32) || (dst net 162.0.159.9/32) || (dst net 162.0.228.230/32) || (dst net 162.0.247.58/32))),
	((dst port 23166) || (dst port 29880) || (dst port 36636) || (dst port 51330) || (dst port 56630)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.32.221/32) || (dst net 163.0.68.3/32) || (dst net 163.0.138.73/32) || (dst net 163.0.176.1/32) || (dst net 163.0.212.114/32))),
	((dst port 692) || (dst port 35452) || (dst port 37372) || (dst port 49282) || (dst port 65033)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.61.145/32) || (dst net 164.0.154.178/32) || (dst net 164.0.210.65/32) || (dst net 164.0.217.178/32) || (dst net 164.0.220.13/32))),
	((dst port 12292) || (dst port 27520) || (dst port 31060) || (dst port 43188) || (dst port 60586)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.12.72/32) || (dst net 165.0.105.166/32) || (dst net 165.0.131.193/32) || (dst net 165.0.191.155/32) || (dst net 165.0.235.26/32))),
	((dst port 2524) || (dst port 18120) || (dst port 18364) || (dst port 27821) || (dst port 43462)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.21.149/32) || (dst net 166.0.34.7/32) || (dst net 166.0.70.186/32) || (dst net 166.0.163.253/32) || (dst net 166.0.238.13/32))),
	((dst port 9868) || (dst port 25349) || (dst port 29784) || (dst port 44679) || (dst port 53045)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.1.198/32) || (dst net 167.0.71.119/32) || (dst net 167.0.153.140/32) || (dst net 167.0.225.249/32) || (dst net 167.0.235.168/32))),
	((dst port 8401) || (dst port 30765) || (dst port 37584) || (dst port 46335) || (dst port 57840)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.68.83/32) || (dst net 168.0.171.103/32) || (dst net 168.0.210.87/32) || (dst net 168.0.211.66/32) || (dst net 168.0.227.70/32))),
	((dst port 8288) || (dst port 17350) || (dst port 28144) || (dst port 42383) || (dst port 45636)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.16.143/32) || (dst net 169.0.53.77/32) || (dst net 169.0.62.158/32) || (dst net 169.0.78.36/32) || (dst net 169.0.229.61/32))),
	((dst port 30929) || (dst port 34115) || (dst port 38352) || (dst port 43009) || (dst port 43976)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.165.173/32) || (dst net 170.0.196.43/32) || (dst net 170.0.201.67/32) || (dst net 170.0.234.138/32) || (dst net 170.0.245.235/32))),
	((dst port 4591) || (dst port 10956) || (dst port 34588) || (dst port 36932) || (dst port 49920)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.19.35/32) || (dst net 171.0.28.122/32) || (dst net 171.0.133.88/32) || (dst net 171.0.186.6/32) || (dst net 171.0.189.133/32))),
	((dst port 3513) || (dst port 9332) || (dst port 20584) || (dst port 46157) || (dst port 59098)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.12.92/32) || (dst net 172.0.21.16/32) || (dst net 172.0.43.144/32) || (dst net 172.0.143.219/32) || (dst net 172.0.199.84/32))),
	((dst port 3066) || (dst port 13588) || (dst port 28617) || (dst port 52762) || (dst port 57034)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.30.3/32) || (dst net 173.0.76.208/32) || (dst net 173.0.234.3/32) || (dst net 173.0.248.248/32) || (dst net 173.0.248.252/32))),
	((dst port 10362) || (dst port 27111) || (dst port 51098) || (dst port 52374) || (dst port 60040)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.6.206/32) || (dst net 174.0.139.33/32) || (dst net 174.0.213.83/32) || (dst net 174.0.236.125/32) || (dst net 174.0.249.132/32))),
	((dst port 9099) || (dst port 11946) || (dst port 13941) || (dst port 29375) || (dst port 56277)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.29.22/32) || (dst net 175.0.73.229/32) || (dst net 175.0.93.210/32) || (dst net 175.0.114.120/32) || (dst net 175.0.134.49/32))),
	((dst port 5387) || (dst port 26438) || (dst port 35034) || (dst port 35595) || (dst port 38119)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.66.204/32) || (dst net 176.0.78.94/32) || (dst net 176.0.157.94/32) || (dst net 176.0.158.241/32) || (dst net 176.0.217.13/32))),
	((dst port 1071) || (dst port 6109) || (dst port 44573) || (dst port 48040) || (dst port 57025)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.39.194/32) || (dst net 177.0.45.92/32) || (dst net 177.0.80.131/32) || (dst net 177.0.107.248/32) || (dst net 177.0.182.30/32))),
	((dst port 8259) || (dst port 19776) || (dst port 37275) || (dst port 40095) || (dst port 46241)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.46.244/32) || (dst net 178.0.92.85/32) || (dst net 178.0.130.85/32) || (dst net 178.0.178.174/32) || (dst net 178.0.210.150/32))),
	((dst port 1567) || (dst port 37110) || (dst port 43352) || (dst port 55928) || (dst port 60129)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.39.231/32) || (dst net 179.0.108.228/32) || (dst net 179.0.121.182/32) || (dst net 179.0.201.113/32) || (dst net 179.0.243.68/32))),
	((dst port 4856) || (dst port 18069) || (dst port 20169) || (dst port 60196) || (dst port 63405)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.97.245/32) || (dst net 180.0.148.168/32) || (dst net 180.0.169.42/32) || (dst net 180.0.173.210/32) || (dst net 180.0.232.57/32))),
	((dst port 15288) || (dst port 19235) || (dst port 52965) || (dst port 54128) || (dst port 61861)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.75.175/32) || (dst net 181.0.81.127/32) || (dst net 181.0.86.35/32) || (dst net 181.0.173.104/32) || (dst net 181.0.249.44/32))),
	((dst port 9599) || (dst port 18197) || (dst port 43019) || (dst port 49765) || (dst port 55105)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.1.218/32) || (dst net 182.0.139.203/32) || (dst net 182.0.164.46/32) || (dst net 182.0.178.164/32) || (dst net 182.0.195.70/32))),
	((dst port 1860) || (dst port 8920) || (dst port 16308) || (dst port 40464) || (dst port 58301)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.129.97/32) || (dst net 183.0.145.111/32) || (dst net 183.0.152.174/32) || (dst net 183.0.171.169/32) || (dst net 183.0.226.158/32))),
	((dst port 27389) || (dst port 32609) || (dst port 33493) || (dst port 56090) || (dst port 62047)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.22.139/32) || (dst net 184.0.29.158/32) || (dst net 184.0.34.128/32) || (dst net 184.0.53.146/32) || (dst net 184.0.55.220/32))),
	((dst port 946) || (dst port 9613) || (dst port 26925) || (dst port 48946) || (dst port 62409)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.2.103/32) || (dst net 185.0.87.1/32) || (dst net 185.0.154.174/32) || (dst net 185.0.221.219/32) || (dst net 185.0.251.169/32))),
	((dst port 462) || (dst port 2948) || (dst port 3395) || (dst port 5213) || (dst port 55185)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.99.111/32) || (dst net 186.0.153.188/32) || (dst net 186.0.212.19/32) || (dst net 186.0.228.45/32) || (dst net 186.0.228.175/32))),
	((dst port 15934) || (dst port 30526) || (dst port 31418) || (dst port 32534) || (dst port 33018)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.4.231/32) || (dst net 187.0.11.241/32) || (dst net 187.0.47.50/32) || (dst net 187.0.134.213/32) || (dst net 187.0.145.78/32))),
	((dst port 5208) || (dst port 13886) || (dst port 42628) || (dst port 42976) || (dst port 61535)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.17.171/32) || (dst net 188.0.18.206/32) || (dst net 188.0.72.113/32) || (dst net 188.0.199.159/32) || (dst net 188.0.209.148/32))),
	((dst port 7636) || (dst port 11039) || (dst port 24676) || (dst port 48990) || (dst port 61391)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.4.152/32) || (dst net 189.0.16.94/32) || (dst net 189.0.180.222/32) || (dst net 189.0.197.205/32) || (dst net 189.0.204.144/32))),
	((dst port 3566) || (dst port 5518) || (dst port 37275) || (dst port 37508) || (dst port 50133)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.19.243/32) || (dst net 190.0.22.77/32) || (dst net 190.0.95.188/32) || (dst net 190.0.174.255/32) || (dst net 190.0.217.76/32))),
	((dst port 923) || (dst port 30409) || (dst port 32244) || (dst port 47708) || (dst port 48998)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.19.144/32) || (dst net 191.0.22.30/32) || (dst net 191.0.22.168/32) || (dst net 191.0.119.29/32) || (dst net 191.0.213.165/32))),
	((dst port 8448) || (dst port 40030) || (dst port 40964) || (dst port 52583) || (dst port 55393)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.34.150/32) || (dst net 192.0.38.168/32) || (dst net 192.0.160.105/32) || (dst net 192.0.212.8/32) || (dst net 192.0.228.29/32))),
	((dst port 5254) || (dst port 20273) || (dst port 37254) || (dst port 40064) || (dst port 48573)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.62.56/32) || (dst net 193.0.65.157/32) || (dst net 193.0.132.169/32) || (dst net 193.0.136.155/32) || (dst net 193.0.202.78/32))),
	((dst port 1582) || (dst port 11983) || (dst port 25407) || (dst port 42099) || (dst port 47424)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.48.58/32) || (dst net 194.0.50.44/32) || (dst net 194.0.73.46/32) || (dst net 194.0.208.116/32) || (dst net 194.0.241.138/32))),
	((dst port 7458) || (dst port 32063) || (dst port 32856) || (dst port 52562) || (dst port 65437)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.15.226/32) || (dst net 195.0.132.184/32) || (dst net 195.0.209.134/32) || (dst net 195.0.240.116/32) || (dst net 195.0.250.0/32))),
	((dst port 4073) || (dst port 15100) || (dst port 31790) || (dst port 35273) || (dst port 45916)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.34.124/32) || (dst net 196.0.78.15/32) || (dst net 196.0.182.5/32) || (dst net 196.0.189.239/32) || (dst net 196.0.221.13/32))),
	((dst port 14551) || (dst port 22726) || (dst port 30937) || (dst port 44096) || (dst port 51088)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.76.128/32) || (dst net 197.0.97.133/32) || (dst net 197.0.109.201/32) || (dst net 197.0.162.179/32) || (dst net 197.0.170.61/32))),
	((dst port 9381) || (dst port 21207) || (dst port 22037) || (dst port 33683) || (dst port 49235)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.92.89/32) || (dst net 198.0.100.186/32) || (dst net 198.0.137.125/32) || (dst net 198.0.211.129/32) || (dst net 198.0.236.237/32))),
	((dst port 3992) || (dst port 11578) || (dst port 22660) || (dst port 25826) || (dst port 53512)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.57.191/32) || (dst net 199.0.68.8/32) || (dst net 199.0.70.88/32) || (dst net 199.0.125.91/32) || (dst net 199.0.182.190/32))),
	((dst port 9805) || (dst port 13441) || (dst port 41954) || (dst port 42908) || (dst port 50201)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.2.32/32) || (dst net 200.0.146.70/32) || (dst net 200.0.159.0/32) || (dst net 200.0.164.101/32) || (dst net 200.0.254.40/32))),
	((dst port 4927) || (dst port 5120) || (dst port 46745) || (dst port 48636) || (dst port 51920)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.11.173/32) || (dst net 201.0.42.112/32) || (dst net 201.0.71.23/32) || (dst net 201.0.142.111/32) || (dst net 201.0.219.61/32))),
	((dst port 27229) || (dst port 28511) || (dst port 48553) || (dst port 52924) || (dst port 60926)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.7.130/32) || (dst net 202.0.22.10/32) || (dst net 202.0.191.240/32) || (dst net 202.0.214.34/32) || (dst net 202.0.251.91/32))),
	((dst port 8221) || (dst port 11059) || (dst port 26407) || (dst port 31401) || (dst port 51286)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.11.38/32) || (dst net 203.0.17.90/32) || (dst net 203.0.26.79/32) || (dst net 203.0.46.70/32) || (dst net 203.0.105.170/32))),
	((dst port 6442) || (dst port 13136) || (dst port 33373) || (dst port 37029) || (dst port 46839)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.24.117/32) || (dst net 204.0.95.120/32) || (dst net 204.0.156.49/32) || (dst net 204.0.166.14/32) || (dst net 204.0.190.66/32))),
	((dst port 14933) || (dst port 21317) || (dst port 45463) || (dst port 46825) || (dst port 63566)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.98.148/32) || (dst net 205.0.167.188/32) || (dst net 205.0.196.147/32) || (dst net 205.0.219.168/32) || (dst net 205.0.235.144/32))),
	((dst port 617) || (dst port 7286) || (dst port 35978) || (dst port 39255) || (dst port 45294)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.61.195/32) || (dst net 206.0.143.180/32) || (dst net 206.0.194.192/32) || (dst net 206.0.204.133/32) || (dst net 206.0.215.157/32))),
	((dst port 11360) || (dst port 12091) || (dst port 25351) || (dst port 57364) || (dst port 59712)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.23.161/32) || (dst net 207.0.105.73/32) || (dst net 207.0.114.6/32) || (dst net 207.0.158.1/32) || (dst net 207.0.218.100/32))),
	((dst port 18253) || (dst port 24815) || (dst port 30838) || (dst port 40173) || (dst port 48952)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.7.89/32) || (dst net 208.0.101.201/32) || (dst net 208.0.163.10/32) || (dst net 208.0.194.128/32) || (dst net 208.0.243.142/32))),
	((dst port 3332) || (dst port 27884) || (dst port 38801) || (dst port 50837) || (dst port 60701)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.30.222/32) || (dst net 209.0.85.48/32) || (dst net 209.0.158.187/32) || (dst net 209.0.203.214/32) || (dst net 209.0.213.252/32))),
	((dst port 10144) || (dst port 21543) || (dst port 29815) || (dst port 34780) || (dst port 47226)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.6.205/32) || (dst net 210.0.57.223/32) || (dst net 210.0.104.232/32) || (dst net 210.0.171.195/32) || (dst net 210.0.184.191/32))),
	((dst port 5156) || (dst port 17437) || (dst port 34301) || (dst port 35372) || (dst port 52769)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.49.243/32) || (dst net 211.0.58.183/32) || (dst net 211.0.107.207/32) || (dst net 211.0.224.193/32) || (dst net 211.0.225.52/32))),
	((dst port 39703) || (dst port 44444) || (dst port 50660) || (dst port 51775) || (dst port 60928)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.30.167/32) || (dst net 212.0.91.80/32) || (dst net 212.0.162.178/32) || (dst net 212.0.191.192/32) || (dst net 212.0.230.106/32))),
	((dst port 7995) || (dst port 21858) || (dst port 25169) || (dst port 34253) || (dst port 37382)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.24.170/32) || (dst net 213.0.101.39/32) || (dst net 213.0.224.100/32) || (dst net 213.0.236.106/32) || (dst net 213.0.252.234/32))),
	((dst port 6641) || (dst port 22275) || (dst port 27543) || (dst port 38027) || (dst port 51716)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.22.189/32) || (dst net 214.0.110.201/32) || (dst net 214.0.153.147/32) || (dst net 214.0.214.220/32) || (dst net 214.0.236.28/32))),
	((dst port 5664) || (dst port 8154) || (dst port 10014) || (dst port 10856) || (dst port 39457)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.20.97/32) || (dst net 215.0.22.16/32) || (dst net 215.0.105.51/32) || (dst net 215.0.134.36/32) || (dst net 215.0.136.178/32))),
	((dst port 34999) || (dst port 35139) || (dst port 37851) || (dst port 62995) || (dst port 63804)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.2.137/32) || (dst net 216.0.11.40/32) || (dst net 216.0.125.114/32) || (dst net 216.0.164.250/32) || (dst net 216.0.172.183/32))),
	((dst port 2086) || (dst port 27770) || (dst port 44211) || (dst port 46512) || (dst port 53755)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.8.89/32) || (dst net 217.0.41.115/32) || (dst net 217.0.74.182/32) || (dst net 217.0.82.215/32) || (dst net 217.0.105.253/32))),
	((dst port 16599) || (dst port 31180) || (dst port 32850) || (dst port 50029) || (dst port 61055)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.33.227/32) || (dst net 218.0.39.219/32) || (dst net 218.0.73.217/32) || (dst net 218.0.172.202/32) || (dst net 218.0.203.63/32))),
	((dst port 20237) || (dst port 23275) || (dst port 29473) || (dst port 51478) || (dst port 53852)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.12.208/32) || (dst net 219.0.46.101/32) || (dst net 219.0.98.21/32) || (dst net 219.0.203.62/32) || (dst net 219.0.237.18/32))),
	((dst port 37246) || (dst port 38528) || (dst port 47229) || (dst port 53342) || (dst port 56408)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.29.20/32) || (dst net 220.0.37.84/32) || (dst net 220.0.49.123/32) || (dst net 220.0.112.231/32) || (dst net 220.0.224.212/32))),
	((dst port 14797) || (dst port 45521) || (dst port 47467) || (dst port 53111) || (dst port 54736)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.8.62/32) || (dst net 221.0.39.44/32) || (dst net 221.0.84.11/32) || (dst net 221.0.167.114/32) || (dst net 221.0.168.78/32))),
	((dst port 27681) || (dst port 30647) || (dst port 53437) || (dst port 57543) || (dst port 61211)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.16.196/32) || (dst net 222.0.87.203/32) || (dst net 222.0.191.103/32) || (dst net 222.0.222.198/32) || (dst net 222.0.229.207/32))),
	((dst port 1748) || (dst port 12925) || (dst port 25097) || (dst port 49253) || (dst port 59373)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.123.248/32) || (dst net 223.0.202.9/32) || (dst net 223.0.209.151/32) || (dst net 223.0.224.242/32) || (dst net 223.0.232.107/32))),
	((dst port 15950) || (dst port 25639) || (dst port 26681) || (dst port 29894) || (dst port 63484)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.159.12/32) || (dst net 224.0.176.255/32) || (dst net 224.0.227.188/32) || (dst net 224.0.241.51/32) || (dst net 224.0.244.218/32))),
	((dst port 22988) || (dst port 23815) || (dst port 25121) || (dst port 28094) || (dst port 59393)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.27.64/32) || (dst net 225.0.44.51/32) || (dst net 225.0.107.99/32) || (dst net 225.0.128.104/32) || (dst net 225.0.251.195/32))),
	((dst port 7415) || (dst port 11338) || (dst port 46886) || (dst port 53770) || (dst port 58921)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.16.197/32) || (dst net 226.0.162.201/32) || (dst net 226.0.167.159/32) || (dst net 226.0.241.211/32) || (dst net 226.0.251.229/32))),
	((dst port 2495) || (dst port 2590) || (dst port 2985) || (dst port 4995) || (dst port 24707)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.43.56/32) || (dst net 227.0.79.145/32) || (dst net 227.0.111.103/32) || (dst net 227.0.163.78/32) || (dst net 227.0.205.70/32))),
	((dst port 8434) || (dst port 16120) || (dst port 42319) || (dst port 51772) || (dst port 61126)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.92.200/32) || (dst net 228.0.113.7/32) || (dst net 228.0.115.224/32) || (dst net 228.0.163.17/32) || (dst net 228.0.174.177/32))),
	((dst port 13486) || (dst port 37021) || (dst port 43548) || (dst port 49513) || (dst port 61576)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.2.74/32) || (dst net 229.0.53.230/32) || (dst net 229.0.77.52/32) || (dst net 229.0.150.29/32) || (dst net 229.0.162.225/32))),
	((dst port 8533) || (dst port 20687) || (dst port 25353) || (dst port 29581) || (dst port 58091)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.25.66/32) || (dst net 230.0.33.224/32) || (dst net 230.0.100.99/32) || (dst net 230.0.104.100/32) || (dst net 230.0.119.214/32))),
	((dst port 25732) || (dst port 29591) || (dst port 37503) || (dst port 39109) || (dst port 43535)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.9.116/32) || (dst net 231.0.39.98/32) || (dst net 231.0.61.17/32) || (dst net 231.0.90.29/32) || (dst net 231.0.188.73/32))),
	((dst port 4636) || (dst port 9819) || (dst port 11617) || (dst port 25548) || (dst port 64564)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.20.236/32) || (dst net 232.0.28.232/32) || (dst net 232.0.149.0/32) || (dst net 232.0.174.66/32) || (dst net 232.0.225.1/32))),
	((dst port 728) || (dst port 857) || (dst port 21792) || (dst port 41189) || (dst port 45434)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.43.175/32) || (dst net 233.0.128.123/32) || (dst net 233.0.202.62/32) || (dst net 233.0.208.136/32) || (dst net 233.0.233.198/32))),
	((dst port 1896) || (dst port 11199) || (dst port 15337) || (dst port 30194) || (dst port 34634)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.64.102/32) || (dst net 234.0.196.126/32) || (dst net 234.0.220.54/32) || (dst net 234.0.227.136/32) || (dst net 234.0.251.11/32))),
	((dst port 4471) || (dst port 20973) || (dst port 38291) || (dst port 45387) || (dst port 45635)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.44.104/32) || (dst net 235.0.116.35/32) || (dst net 235.0.121.11/32) || (dst net 235.0.169.148/32) || (dst net 235.0.253.104/32))),
	((dst port 1657) || (dst port 20708) || (dst port 32884) || (dst port 38663) || (dst port 65020)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.73.246/32) || (dst net 236.0.86.198/32) || (dst net 236.0.199.87/32) || (dst net 236.0.232.134/32) || (dst net 236.0.237.105/32))),
	((dst port 15388) || (dst port 16571) || (dst port 20387) || (dst port 54541) || (dst port 56102)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.7.32/32) || (dst net 237.0.38.101/32) || (dst net 237.0.105.115/32) || (dst net 237.0.123.231/32) || (dst net 237.0.203.9/32))),
	((dst port 7582) || (dst port 31783) || (dst port 42531) || (dst port 56805) || (dst port 64140)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.19.3/32) || (dst net 238.0.36.66/32) || (dst net 238.0.92.185/32) || (dst net 238.0.111.38/32) || (dst net 238.0.125.113/32))),
	((dst port 386) || (dst port 8090) || (dst port 44784) || (dst port 51402) || (dst port 62890)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.8.214/32) || (dst net 239.0.80.138/32) || (dst net 239.0.146.195/32) || (dst net 239.0.162.37/32) || (dst net 239.0.254.193/32))),
	((dst port 473) || (dst port 20767) || (dst port 25007) || (dst port 54051) || (dst port 55002)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.80.26/32) || (dst net 240.0.129.66/32) || (dst net 240.0.238.185/32) || (dst net 240.0.242.246/32) || (dst net 240.0.250.63/32))),
	((dst port 7143) || (dst port 8333) || (dst port 13734) || (dst port 49780) || (dst port 63485)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.134.72/32) || (dst net 241.0.142.33/32) || (dst net 241.0.180.38/32) || (dst net 241.0.189.60/32) || (dst net 241.0.221.19/32))),
	((dst port 10227) || (dst port 47601) || (dst port 51735) || (dst port 58319) || (dst port 62249)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.1.42/32) || (dst net 242.0.39.115/32) || (dst net 242.0.126.140/32) || (dst net 242.0.227.44/32) || (dst net 242.0.231.57/32))),
	((dst port 5052) || (dst port 38451) || (dst port 42379) || (dst port 52263) || (dst port 55270)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.2.59/32) || (dst net 243.0.28.195/32) || (dst net 243.0.92.196/32) || (dst net 243.0.103.255/32) || (dst net 243.0.134.50/32))),
	((dst port 11674) || (dst port 15438) || (dst port 16040) || (dst port 22325) || (dst port 52101)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.15.37/32) || (dst net 244.0.71.216/32) || (dst net 244.0.118.193/32) || (dst net 244.0.191.189/32) || (dst net 244.0.238.216/32))),
	((dst port 12417) || (dst port 25932) || (dst port 26692) || (dst port 27934) || (dst port 54153)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.71.37/32) || (dst net 245.0.121.223/32) || (dst net 245.0.147.185/32) || (dst net 245.0.217.149/32) || (dst net 245.0.225.195/32))),
	((dst port 5095) || (dst port 5221) || (dst port 27265) || (dst port 43714) || (dst port 57410)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.29.64/32) || (dst net 246.0.78.81/32) || (dst net 246.0.85.81/32) || (dst net 246.0.98.84/32) || (dst net 246.0.141.66/32))),
	((dst port 14601) || (dst port 34460) || (dst port 34757) || (dst port 34774) || (dst port 48464)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.103.232/32) || (dst net 247.0.149.53/32) || (dst net 247.0.154.51/32) || (dst net 247.0.171.204/32) || (dst net 247.0.213.234/32))),
	((dst port 3810) || (dst port 6217) || (dst port 50026) || (dst port 56728) || (dst port 60027)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.40.116/32) || (dst net 248.0.119.121/32) || (dst net 248.0.161.68/32) || (dst net 248.0.219.95/32) || (dst net 248.0.243.241/32))),
	((dst port 493) || (dst port 11529) || (dst port 31874) || (dst port 41063) || (dst port 52551)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.37.139/32) || (dst net 249.0.99.96/32) || (dst net 249.0.150.177/32) || (dst net 249.0.162.141/32) || (dst net 249.0.231.223/32))),
	((dst port 18170) || (dst port 41455) || (dst port 43169) || (dst port 47572) || (dst port 57297)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.61.45/32) || (dst net 250.0.100.210/32) || (dst net 250.0.187.55/32) || (dst net 250.0.229.40/32) || (dst net 250.0.230.115/32))),
	((dst port 19928) || (dst port 24754) || (dst port 29994) || (dst port 40442) || (dst port 61341)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.61.186/32) || (dst net 251.0.81.197/32) || (dst net 251.0.90.35/32) || (dst net 251.0.144.182/32) || (dst net 251.0.158.123/32))),
	((dst port 1914) || (dst port 25837) || (dst port 58350) || (dst port 59778) || (dst port 62941)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.40.14/32) || (dst net 252.0.130.187/32) || (dst net 252.0.156.54/32) || (dst net 252.0.190.45/32) || (dst net 252.0.229.162/32))),
	((dst port 16704) || (dst port 40010) || (dst port 42703) || (dst port 47229) || (dst port 50765)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.47.137/32) || (dst net 253.0.77.185/32) || (dst net 253.0.134.156/32) || (dst net 253.0.152.40/32) || (dst net 253.0.200.185/32))),
	((dst port 40956) || (dst port 41048) || (dst port 48702) || (dst port 56544) || (dst port 56615)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.36.207/32) || (dst net 254.0.92.187/32) || (dst net 254.0.127.172/32) || (dst net 254.0.192.251/32) || (dst net 254.0.195.38/32))),
	((dst port 4388) || (dst port 5506) || (dst port 28492) || (dst port 53396) || (dst port 65261)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.28.62/32) || (dst net 255.0.64.193/32) || (dst net 255.0.82.113/32) || (dst net 255.0.88.52/32) || (dst net 255.0.168.217/32))),
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
