ipclassifier :: IPClassifier(
	((dst port 5081) || (dst port 11245) || (dst port 31682) || (dst port 55834) || (dst port 62691)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.89.226/32) || (dst net 0.0.137.8/32) || (dst net 0.0.167.218/32) || (dst net 0.0.225.30/32) || (dst net 0.0.235.109/32))),
	((dst port 8788) || (dst port 25994) || (dst port 27630) || (dst port 43332) || (dst port 44146)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.24.148/32) || (dst net 1.0.30.214/32) || (dst net 1.0.31.129/32) || (dst net 1.0.111.3/32) || (dst net 1.0.153.2/32))),
	((dst port 10117) || (dst port 15266) || (dst port 31823) || (dst port 39362) || (dst port 41527)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.47.228/32) || (dst net 2.0.66.2/32) || (dst net 2.0.121.50/32) || (dst net 2.0.145.231/32) || (dst net 2.0.199.205/32))),
	((dst port 16086) || (dst port 17427) || (dst port 26679) || (dst port 27077) || (dst port 61035)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.7.240/32) || (dst net 3.0.24.223/32) || (dst net 3.0.87.226/32) || (dst net 3.0.200.245/32) || (dst net 3.0.234.195/32))),
	((dst port 33846) || (dst port 36133) || (dst port 43180) || (dst port 44596) || (dst port 53955)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.36.86/32) || (dst net 4.0.150.54/32) || (dst net 4.0.151.193/32) || (dst net 4.0.204.208/32) || (dst net 4.0.207.214/32))),
	((dst port 17300) || (dst port 37507) || (dst port 39818) || (dst port 45992) || (dst port 50470)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.32.182/32) || (dst net 5.0.49.199/32) || (dst net 5.0.98.42/32) || (dst net 5.0.143.68/32) || (dst net 5.0.193.57/32))),
	((dst port 10800) || (dst port 18357) || (dst port 22652) || (dst port 52035) || (dst port 55174)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.12.24/32) || (dst net 6.0.13.26/32) || (dst net 6.0.30.19/32) || (dst net 6.0.31.139/32) || (dst net 6.0.98.32/32))),
	((dst port 7227) || (dst port 9612) || (dst port 18647) || (dst port 33469) || (dst port 64238)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.33.74/32) || (dst net 7.0.57.35/32) || (dst net 7.0.67.53/32) || (dst net 7.0.76.155/32) || (dst net 7.0.130.22/32))),
	((dst port 7257) || (dst port 10685) || (dst port 13022) || (dst port 43537) || (dst port 45811)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.57.228/32) || (dst net 8.0.78.251/32) || (dst net 8.0.176.7/32) || (dst net 8.0.210.137/32) || (dst net 8.0.232.14/32))),
	((dst port 19058) || (dst port 24158) || (dst port 31371) || (dst port 55523) || (dst port 56211)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.9.153/32) || (dst net 9.0.21.20/32) || (dst net 9.0.32.141/32) || (dst net 9.0.47.142/32) || (dst net 9.0.59.239/32))),
	((dst port 861) || (dst port 14923) || (dst port 15440) || (dst port 46833) || (dst port 57860)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.11.37/32) || (dst net 10.0.51.122/32) || (dst net 10.0.170.78/32) || (dst net 10.0.176.142/32) || (dst net 10.0.195.126/32))),
	((dst port 23573) || (dst port 37368) || (dst port 58032) || (dst port 61166) || (dst port 61404)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.13.230/32) || (dst net 11.0.16.36/32) || (dst net 11.0.47.40/32) || (dst net 11.0.163.222/32) || (dst net 11.0.224.112/32))),
	((dst port 10550) || (dst port 42206) || (dst port 43295) || (dst port 47183) || (dst port 64606)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.41.167/32) || (dst net 12.0.44.243/32) || (dst net 12.0.82.106/32) || (dst net 12.0.138.67/32) || (dst net 12.0.247.33/32))),
	((dst port 8619) || (dst port 22337) || (dst port 25051) || (dst port 32537) || (dst port 32624)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.18.152/32) || (dst net 13.0.48.246/32) || (dst net 13.0.113.93/32) || (dst net 13.0.199.26/32) || (dst net 13.0.240.58/32))),
	((dst port 85) || (dst port 25758) || (dst port 27555) || (dst port 33131) || (dst port 56758)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.93.199/32) || (dst net 14.0.160.244/32) || (dst net 14.0.185.177/32) || (dst net 14.0.197.241/32) || (dst net 14.0.239.130/32))),
	((dst port 17285) || (dst port 50202) || (dst port 50450) || (dst port 50962) || (dst port 61547)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.97.99/32) || (dst net 15.0.121.36/32) || (dst net 15.0.137.185/32) || (dst net 15.0.159.187/32) || (dst net 15.0.167.190/32))),
	((dst port 626) || (dst port 3899) || (dst port 9282) || (dst port 31042) || (dst port 47163)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.22.130/32) || (dst net 16.0.77.128/32) || (dst net 16.0.144.238/32) || (dst net 16.0.169.139/32) || (dst net 16.0.232.153/32))),
	((dst port 32341) || (dst port 38131) || (dst port 50312) || (dst port 50634) || (dst port 65279)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.16.133/32) || (dst net 17.0.156.129/32) || (dst net 17.0.159.139/32) || (dst net 17.0.176.237/32) || (dst net 17.0.192.147/32))),
	((dst port 10143) || (dst port 13973) || (dst port 24039) || (dst port 38921) || (dst port 54731)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.6.87/32) || (dst net 18.0.78.135/32) || (dst net 18.0.106.8/32) || (dst net 18.0.119.99/32) || (dst net 18.0.246.60/32))),
	((dst port 19450) || (dst port 21354) || (dst port 25851) || (dst port 28451) || (dst port 50553)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.13.183/32) || (dst net 19.0.47.117/32) || (dst net 19.0.119.153/32) || (dst net 19.0.148.95/32) || (dst net 19.0.209.70/32))),
	((dst port 16435) || (dst port 32977) || (dst port 59055) || (dst port 61743) || (dst port 64487)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.38.150/32) || (dst net 20.0.77.60/32) || (dst net 20.0.130.195/32) || (dst net 20.0.157.140/32) || (dst net 20.0.233.45/32))),
	((dst port 1637) || (dst port 3092) || (dst port 3824) || (dst port 10121) || (dst port 59131)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.0.153/32) || (dst net 21.0.70.150/32) || (dst net 21.0.125.131/32) || (dst net 21.0.231.84/32) || (dst net 21.0.255.249/32))),
	((dst port 6012) || (dst port 29186) || (dst port 29283) || (dst port 43223) || (dst port 62946)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.74.160/32) || (dst net 22.0.78.95/32) || (dst net 22.0.93.212/32) || (dst net 22.0.136.247/32) || (dst net 22.0.240.113/32))),
	((dst port 2908) || (dst port 27502) || (dst port 35291) || (dst port 45071) || (dst port 52678)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.95.54/32) || (dst net 23.0.129.44/32) || (dst net 23.0.132.88/32) || (dst net 23.0.149.109/32) || (dst net 23.0.242.207/32))),
	((dst port 3960) || (dst port 7123) || (dst port 34323) || (dst port 41566) || (dst port 53492)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.25.182/32) || (dst net 24.0.148.142/32) || (dst net 24.0.164.71/32) || (dst net 24.0.175.92/32) || (dst net 24.0.245.125/32))),
	((dst port 7552) || (dst port 14026) || (dst port 39278) || (dst port 48480) || (dst port 61050)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.42.253/32) || (dst net 25.0.95.218/32) || (dst net 25.0.167.43/32) || (dst net 25.0.171.136/32) || (dst net 25.0.190.109/32))),
	((dst port 3164) || (dst port 17344) || (dst port 36970) || (dst port 53345) || (dst port 59242)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.15.166/32) || (dst net 26.0.45.2/32) || (dst net 26.0.92.230/32) || (dst net 26.0.148.66/32) || (dst net 26.0.247.212/32))),
	((dst port 133) || (dst port 4626) || (dst port 12997) || (dst port 27342) || (dst port 32006)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.30.59/32) || (dst net 27.0.123.19/32) || (dst net 27.0.179.18/32) || (dst net 27.0.208.59/32) || (dst net 27.0.253.230/32))),
	((dst port 2120) || (dst port 20632) || (dst port 40137) || (dst port 52668) || (dst port 60029)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.0.0/32) || (dst net 28.0.26.245/32) || (dst net 28.0.108.219/32) || (dst net 28.0.152.160/32) || (dst net 28.0.248.246/32))),
	((dst port 15794) || (dst port 24888) || (dst port 38457) || (dst port 42324) || (dst port 64627)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.51.203/32) || (dst net 29.0.58.68/32) || (dst net 29.0.68.71/32) || (dst net 29.0.103.106/32) || (dst net 29.0.120.63/32))),
	((dst port 1420) || (dst port 8753) || (dst port 23176) || (dst port 31430) || (dst port 45047)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.54.176/32) || (dst net 30.0.69.12/32) || (dst net 30.0.109.221/32) || (dst net 30.0.176.248/32) || (dst net 30.0.244.24/32))),
	((dst port 17007) || (dst port 26153) || (dst port 47045) || (dst port 47170) || (dst port 51419)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.35.7/32) || (dst net 31.0.56.124/32) || (dst net 31.0.70.240/32) || (dst net 31.0.145.71/32) || (dst net 31.0.174.185/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 4013) || (dst port 18138) || (dst port 38360) || (dst port 40576) || (dst port 54654)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.30.76/32) || (dst net 33.0.39.190/32) || (dst net 33.0.39.247/32) || (dst net 33.0.50.88/32) || (dst net 33.0.255.71/32))),
	((dst port 17666) || (dst port 19937) || (dst port 34138) || (dst port 37874) || (dst port 56558)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.37.125/32) || (dst net 34.0.90.21/32) || (dst net 34.0.91.207/32) || (dst net 34.0.126.39/32) || (dst net 34.0.244.41/32))),
	((dst port 7585) || (dst port 15761) || (dst port 16794) || (dst port 59104) || (dst port 62279)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.3.19/32) || (dst net 35.0.57.131/32) || (dst net 35.0.220.47/32) || (dst net 35.0.232.67/32) || (dst net 35.0.244.32/32))),
	((dst port 18411) || (dst port 38210) || (dst port 54151) || (dst port 60955) || (dst port 61337)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.4.73/32) || (dst net 36.0.83.215/32) || (dst net 36.0.94.24/32) || (dst net 36.0.105.167/32) || (dst net 36.0.131.194/32))),
	((dst port 8743) || (dst port 8928) || (dst port 9427) || (dst port 41751) || (dst port 46218)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.28.14/32) || (dst net 37.0.132.11/32) || (dst net 37.0.218.196/32) || (dst net 37.0.223.86/32) || (dst net 37.0.234.161/32))),
	((dst port 1596) || (dst port 24063) || (dst port 34595) || (dst port 61161) || (dst port 62841)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.66.221/32) || (dst net 38.0.156.103/32) || (dst net 38.0.160.178/32) || (dst net 38.0.221.216/32) || (dst net 38.0.222.204/32))),
	((dst port 11237) || (dst port 12264) || (dst port 29886) || (dst port 36508) || (dst port 50550)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.75.206/32) || (dst net 39.0.140.202/32) || (dst net 39.0.147.221/32) || (dst net 39.0.186.205/32) || (dst net 39.0.246.90/32))),
	((dst port 9000) || (dst port 31787) || (dst port 51406) || (dst port 54513) || (dst port 63707)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.6.162/32) || (dst net 40.0.85.154/32) || (dst net 40.0.122.243/32) || (dst net 40.0.140.106/32) || (dst net 40.0.195.121/32))),
	((dst port 8870) || (dst port 15715) || (dst port 21787) || (dst port 22680) || (dst port 42427)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.7.124/32) || (dst net 41.0.92.214/32) || (dst net 41.0.93.176/32) || (dst net 41.0.186.236/32) || (dst net 41.0.219.175/32))),
	((dst port 12006) || (dst port 13375) || (dst port 15213) || (dst port 33773) || (dst port 34253)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.26.7/32) || (dst net 42.0.49.213/32) || (dst net 42.0.88.171/32) || (dst net 42.0.207.225/32) || (dst net 42.0.232.153/32))),
	((dst port 18130) || (dst port 21420) || (dst port 23160) || (dst port 23897) || (dst port 40169)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.16.234/32) || (dst net 43.0.128.96/32) || (dst net 43.0.128.160/32) || (dst net 43.0.135.6/32) || (dst net 43.0.251.47/32))),
	((dst port 2543) || (dst port 17717) || (dst port 29214) || (dst port 46365) || (dst port 53977)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.115.168/32) || (dst net 44.0.127.8/32) || (dst net 44.0.222.220/32) || (dst net 44.0.238.210/32) || (dst net 44.0.254.172/32))),
	((dst port 2294) || (dst port 25042) || (dst port 53507) || (dst port 60203) || (dst port 62208)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.38.117/32) || (dst net 45.0.156.138/32) || (dst net 45.0.221.202/32) || (dst net 45.0.239.192/32) || (dst net 45.0.245.111/32))),
	((dst port 129) || (dst port 2074) || (dst port 7146) || (dst port 9167) || (dst port 15161)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.44.22/32) || (dst net 46.0.69.219/32) || (dst net 46.0.72.212/32) || (dst net 46.0.73.210/32) || (dst net 46.0.139.50/32))),
	((dst port 25052) || (dst port 29681) || (dst port 36001) || (dst port 38988) || (dst port 45220)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.38.173/32) || (dst net 47.0.40.138/32) || (dst net 47.0.50.103/32) || (dst net 47.0.156.90/32) || (dst net 47.0.157.101/32))),
	((dst port 8647) || (dst port 39349) || (dst port 41209) || (dst port 41326) || (dst port 63469)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.27.121/32) || (dst net 48.0.36.107/32) || (dst net 48.0.78.79/32) || (dst net 48.0.186.223/32) || (dst net 48.0.229.238/32))),
	((dst port 2544) || (dst port 15261) || (dst port 39373) || (dst port 44871) || (dst port 52884)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.7.163/32) || (dst net 49.0.32.199/32) || (dst net 49.0.155.97/32) || (dst net 49.0.228.135/32) || (dst net 49.0.237.92/32))),
	((dst port 9263) || (dst port 32291) || (dst port 34677) || (dst port 44779) || (dst port 53273)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.17.125/32) || (dst net 50.0.41.3/32) || (dst net 50.0.42.210/32) || (dst net 50.0.76.146/32) || (dst net 50.0.124.27/32))),
	((dst port 13676) || (dst port 14362) || (dst port 18973) || (dst port 42793) || (dst port 53134)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.59.4/32) || (dst net 51.0.63.174/32) || (dst net 51.0.111.74/32) || (dst net 51.0.120.129/32) || (dst net 51.0.232.76/32))),
	((dst port 12999) || (dst port 32463) || (dst port 45301) || (dst port 56480) || (dst port 57352)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.2.6/32) || (dst net 52.0.23.99/32) || (dst net 52.0.57.199/32) || (dst net 52.0.81.52/32) || (dst net 52.0.94.81/32))),
	((dst port 7451) || (dst port 13047) || (dst port 37150) || (dst port 55717) || (dst port 59107)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.27.143/32) || (dst net 53.0.65.246/32) || (dst net 53.0.72.2/32) || (dst net 53.0.132.249/32) || (dst net 53.0.242.123/32))),
	((dst port 252) || (dst port 42078) || (dst port 42100) || (dst port 55944) || (dst port 58349)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.1.195/32) || (dst net 54.0.5.6/32) || (dst net 54.0.57.136/32) || (dst net 54.0.156.76/32) || (dst net 54.0.211.237/32))),
	((dst port 29446) || (dst port 31834) || (dst port 33989) || (dst port 38988) || (dst port 49421)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.24.29/32) || (dst net 55.0.60.89/32) || (dst net 55.0.63.171/32) || (dst net 55.0.220.126/32) || (dst net 55.0.221.173/32))),
	((dst port 33194) || (dst port 40588) || (dst port 45232) || (dst port 54120) || (dst port 63929)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.1.103/32) || (dst net 56.0.42.150/32) || (dst net 56.0.66.176/32) || (dst net 56.0.141.183/32) || (dst net 56.0.222.176/32))),
	((dst port 9021) || (dst port 12583) || (dst port 15356) || (dst port 27624) || (dst port 65141)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.6.188/32) || (dst net 57.0.46.122/32) || (dst net 57.0.69.106/32) || (dst net 57.0.107.192/32) || (dst net 57.0.176.138/32))),
	((dst port 20365) || (dst port 25536) || (dst port 31084) || (dst port 41456) || (dst port 49669)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.26.44/32) || (dst net 58.0.87.81/32) || (dst net 58.0.110.70/32) || (dst net 58.0.118.33/32) || (dst net 58.0.174.40/32))),
	((dst port 30511) || (dst port 31140) || (dst port 39523) || (dst port 40365) || (dst port 63717)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.17.219/32) || (dst net 59.0.108.48/32) || (dst net 59.0.110.206/32) || (dst net 59.0.144.243/32) || (dst net 59.0.164.175/32))),
	((dst port 27888) || (dst port 35099) || (dst port 43898) || (dst port 53545) || (dst port 64943)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.38.209/32) || (dst net 60.0.59.61/32) || (dst net 60.0.110.91/32) || (dst net 60.0.131.203/32) || (dst net 60.0.250.149/32))),
	((dst port 1985) || (dst port 9535) || (dst port 19804) || (dst port 21807) || (dst port 47902)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.49.219/32) || (dst net 61.0.50.108/32) || (dst net 61.0.77.174/32) || (dst net 61.0.200.69/32) || (dst net 61.0.240.58/32))),
	((dst port 7191) || (dst port 10961) || (dst port 16283) || (dst port 43050) || (dst port 43227)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.7.51/32) || (dst net 62.0.113.228/32) || (dst net 62.0.124.231/32) || (dst net 62.0.195.201/32) || (dst net 62.0.252.249/32))),
	((dst port 9397) || (dst port 38928) || (dst port 42716) || (dst port 54720) || (dst port 59808)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.39.118/32) || (dst net 63.0.113.171/32) || (dst net 63.0.135.14/32) || (dst net 63.0.135.32/32) || (dst net 63.0.199.58/32))),
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
