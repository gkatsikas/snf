ipclassifier :: IPClassifier(
	((dst port 44898) || (dst port 51366) || (dst port 56184) || (dst port 56950) || (dst port 61965)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.27.137/32) || (dst net 0.0.32.121/32) || (dst net 0.0.35.90/32) || (dst net 0.0.234.108/32) || (dst net 0.0.235.118/32))),
	((dst port 3459) || (dst port 11091) || (dst port 13620) || (dst port 50381) || (dst port 58827)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.32.148/32) || (dst net 1.0.72.147/32) || (dst net 1.0.89.234/32) || (dst net 1.0.183.51/32) || (dst net 1.0.203.170/32))),
	((dst port 804) || (dst port 9802) || (dst port 12630) || (dst port 38886) || (dst port 48944)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.13.70/32) || (dst net 2.0.42.119/32) || (dst net 2.0.109.0/32) || (dst net 2.0.112.133/32) || (dst net 2.0.238.196/32))),
	((dst port 16398) || (dst port 19504) || (dst port 40393) || (dst port 45731) || (dst port 49679)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.75.107/32) || (dst net 3.0.99.160/32) || (dst net 3.0.150.32/32) || (dst net 3.0.169.6/32) || (dst net 3.0.209.233/32))),
	((dst port 36510) || (dst port 50579) || (dst port 54333) || (dst port 58951) || (dst port 64592)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.55.54/32) || (dst net 4.0.67.162/32) || (dst net 4.0.160.92/32) || (dst net 4.0.160.243/32) || (dst net 4.0.200.168/32))),
	((dst port 15516) || (dst port 48980) || (dst port 52487) || (dst port 53043) || (dst port 57660)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.71.239/32) || (dst net 5.0.150.157/32) || (dst net 5.0.159.169/32) || (dst net 5.0.161.169/32) || (dst net 5.0.211.219/32))),
	((dst port 13597) || (dst port 18485) || (dst port 23226) || (dst port 40664) || (dst port 64632)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.46.49/32) || (dst net 6.0.64.61/32) || (dst net 6.0.113.22/32) || (dst net 6.0.130.79/32) || (dst net 6.0.223.157/32))),
	((dst port 15431) || (dst port 23080) || (dst port 24859) || (dst port 37627) || (dst port 64011)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.196.243/32) || (dst net 7.0.219.59/32) || (dst net 7.0.219.181/32) || (dst net 7.0.234.100/32) || (dst net 7.0.247.205/32))),
	((dst port 6296) || (dst port 21398) || (dst port 27024) || (dst port 39061) || (dst port 47422)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.89.27/32) || (dst net 8.0.127.242/32) || (dst net 8.0.183.235/32) || (dst net 8.0.232.30/32) || (dst net 8.0.246.241/32))),
	((dst port 3095) || (dst port 7673) || (dst port 40183) || (dst port 55579) || (dst port 55660)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.10.97/32) || (dst net 9.0.65.235/32) || (dst net 9.0.91.96/32) || (dst net 9.0.114.28/32) || (dst net 9.0.152.1/32))),
	((dst port 9356) || (dst port 10167) || (dst port 26102) || (dst port 28045) || (dst port 55002)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.19.187/32) || (dst net 10.0.84.168/32) || (dst net 10.0.134.190/32) || (dst net 10.0.204.209/32) || (dst net 10.0.226.52/32))),
	((dst port 31545) || (dst port 39673) || (dst port 47007) || (dst port 59413) || (dst port 60369)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.85.209/32) || (dst net 11.0.95.61/32) || (dst net 11.0.132.224/32) || (dst net 11.0.172.164/32) || (dst net 11.0.245.137/32))),
	((dst port 11252) || (dst port 17231) || (dst port 32661) || (dst port 48190) || (dst port 55296)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.38.215/32) || (dst net 12.0.98.91/32) || (dst net 12.0.121.18/32) || (dst net 12.0.228.127/32) || (dst net 12.0.242.222/32))),
	((dst port 8855) || (dst port 24336) || (dst port 32661) || (dst port 54318) || (dst port 56036)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.0.59/32) || (dst net 13.0.86.103/32) || (dst net 13.0.112.50/32) || (dst net 13.0.214.55/32) || (dst net 13.0.215.102/32))),
	((dst port 3735) || (dst port 8420) || (dst port 11850) || (dst port 21837) || (dst port 22137)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.177.244/32) || (dst net 14.0.181.156/32) || (dst net 14.0.190.71/32) || (dst net 14.0.218.85/32) || (dst net 14.0.232.169/32))),
	((dst port 9521) || (dst port 15775) || (dst port 33545) || (dst port 41323) || (dst port 55738)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.4.38/32) || (dst net 15.0.41.146/32) || (dst net 15.0.149.139/32) || (dst net 15.0.151.128/32) || (dst net 15.0.151.145/32))),
	((dst port 4949) || (dst port 16309) || (dst port 28890) || (dst port 32109) || (dst port 61934)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.47.18/32) || (dst net 16.0.68.176/32) || (dst net 16.0.116.243/32) || (dst net 16.0.212.188/32) || (dst net 16.0.225.143/32))),
	((dst port 31987) || (dst port 35838) || (dst port 49869) || (dst port 52374) || (dst port 64023)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.5.153/32) || (dst net 17.0.59.158/32) || (dst net 17.0.150.237/32) || (dst net 17.0.157.183/32) || (dst net 17.0.202.106/32))),
	((dst port 15467) || (dst port 26553) || (dst port 38423) || (dst port 44854) || (dst port 45063)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.2.137/32) || (dst net 18.0.88.81/32) || (dst net 18.0.156.195/32) || (dst net 18.0.163.164/32) || (dst net 18.0.165.141/32))),
	((dst port 3468) || (dst port 25083) || (dst port 33221) || (dst port 42582) || (dst port 43832)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.8.148/32) || (dst net 19.0.16.144/32) || (dst net 19.0.87.97/32) || (dst net 19.0.160.66/32) || (dst net 19.0.162.107/32))),
	((dst port 8155) || (dst port 17432) || (dst port 30482) || (dst port 37870) || (dst port 47177)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.112.50/32) || (dst net 20.0.125.16/32) || (dst net 20.0.128.159/32) || (dst net 20.0.162.230/32) || (dst net 20.0.201.233/32))),
	((dst port 12585) || (dst port 15671) || (dst port 28147) || (dst port 28698) || (dst port 57630)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.50.162/32) || (dst net 21.0.71.113/32) || (dst net 21.0.99.152/32) || (dst net 21.0.128.18/32) || (dst net 21.0.249.51/32))),
	((dst port 15402) || (dst port 42502) || (dst port 44316) || (dst port 48683) || (dst port 56412)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.19.130/32) || (dst net 22.0.63.252/32) || (dst net 22.0.154.42/32) || (dst net 22.0.206.250/32) || (dst net 22.0.208.58/32))),
	((dst port 1453) || (dst port 12235) || (dst port 41634) || (dst port 50334) || (dst port 62417)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.45.79/32) || (dst net 23.0.61.241/32) || (dst net 23.0.183.191/32) || (dst net 23.0.195.142/32) || (dst net 23.0.218.110/32))),
	((dst port 8285) || (dst port 28807) || (dst port 32545) || (dst port 34328) || (dst port 41566)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.15.159/32) || (dst net 24.0.98.170/32) || (dst net 24.0.137.203/32) || (dst net 24.0.197.225/32) || (dst net 24.0.244.196/32))),
	((dst port 7586) || (dst port 16029) || (dst port 23020) || (dst port 31372) || (dst port 40130)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.2.244/32) || (dst net 25.0.137.221/32) || (dst net 25.0.140.138/32) || (dst net 25.0.154.149/32) || (dst net 25.0.176.215/32))),
	((dst port 28820) || (dst port 37686) || (dst port 39446) || (dst port 40922) || (dst port 53877)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.128.91/32) || (dst net 26.0.157.216/32) || (dst net 26.0.159.78/32) || (dst net 26.0.180.139/32) || (dst net 26.0.240.103/32))),
	((dst port 2805) || (dst port 21947) || (dst port 30108) || (dst port 56689) || (dst port 60854)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.2.127/32) || (dst net 27.0.117.30/32) || (dst net 27.0.165.103/32) || (dst net 27.0.224.77/32) || (dst net 27.0.243.138/32))),
	((dst port 6929) || (dst port 8429) || (dst port 11433) || (dst port 47565) || (dst port 55029)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.46.72/32) || (dst net 28.0.105.187/32) || (dst net 28.0.109.232/32) || (dst net 28.0.142.220/32) || (dst net 28.0.155.174/32))),
	((dst port 8724) || (dst port 23999) || (dst port 32812) || (dst port 35944) || (dst port 52666)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.51.75/32) || (dst net 29.0.97.205/32) || (dst net 29.0.128.144/32) || (dst net 29.0.167.162/32) || (dst net 29.0.240.188/32))),
	((dst port 2605) || (dst port 10291) || (dst port 11750) || (dst port 16717)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.28.146/32) || (dst net 30.0.68.19/32) || (dst net 30.0.83.203/32) || (dst net 30.0.172.75/32) || (dst net 30.0.178.179/32))),
	((dst port 9752) || (dst port 11556) || (dst port 29332) || (dst port 37452) || (dst port 58061)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.12.179/32) || (dst net 31.0.16.185/32) || (dst net 31.0.74.249/32) || (dst net 31.0.225.26/32) || (dst net 31.0.254.175/32))),
	((dst port 7000) || (dst port 20969) || (dst port 27530) || (dst port 35569) || (dst port 46539)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.116.218/32) || (dst net 32.0.123.241/32) || (dst net 32.0.131.61/32) || (dst net 32.0.236.38/32) || (dst net 32.0.253.218/32))),
	((dst port 12001) || (dst port 29979) || (dst port 33915) || (dst port 53582) || (dst port 61330)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.71.172/32) || (dst net 33.0.123.238/32) || (dst net 33.0.132.249/32) || (dst net 33.0.199.121/32) || (dst net 33.0.240.192/32))),
	((dst port 6425) || (dst port 18538) || (dst port 28370) || (dst port 33916) || (dst port 47757)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.10.202/32) || (dst net 34.0.87.20/32) || (dst net 34.0.146.126/32) || (dst net 34.0.213.122/32) || (dst net 34.0.227.163/32))),
	((dst port 35505) || (dst port 45844) || (dst port 45886) || (dst port 58240) || (dst port 64597)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.87.28/32) || (dst net 35.0.102.120/32) || (dst net 35.0.119.46/32) || (dst net 35.0.191.216/32) || (dst net 35.0.193.46/32))),
	((dst port 15842) || (dst port 34520) || (dst port 41328) || (dst port 48341) || (dst port 62427)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.41.206/32) || (dst net 36.0.56.43/32) || (dst net 36.0.94.14/32) || (dst net 36.0.128.210/32) || (dst net 36.0.186.203/32))),
	((dst port 29989) || (dst port 48274) || (dst port 49619) || (dst port 51954) || (dst port 56525)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.20.193/32) || (dst net 37.0.85.157/32) || (dst net 37.0.120.126/32) || (dst net 37.0.131.7/32) || (dst net 37.0.170.155/32))),
	((dst port 9573) || (dst port 10519) || (dst port 25916) || (dst port 42633) || (dst port 45235)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.17.156/32) || (dst net 38.0.28.47/32) || (dst net 38.0.85.119/32) || (dst net 38.0.192.43/32) || (dst net 38.0.218.151/32))),
	((dst port 6844) || (dst port 22511) || (dst port 46501) || (dst port 59795) || (dst port 64312)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.44.252/32) || (dst net 39.0.72.109/32) || (dst net 39.0.92.139/32) || (dst net 39.0.98.107/32) || (dst net 39.0.145.198/32))),
	((dst port 1503) || (dst port 9233) || (dst port 28556) || (dst port 56885) || (dst port 64601)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.13.210/32) || (dst net 40.0.76.199/32) || (dst net 40.0.86.25/32) || (dst net 40.0.106.204/32) || (dst net 40.0.134.38/32))),
	((dst port 23106) || (dst port 34287) || (dst port 37924) || (dst port 42520) || (dst port 55393)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.23.182/32) || (dst net 41.0.110.202/32) || (dst net 41.0.136.37/32) || (dst net 41.0.152.25/32) || (dst net 41.0.219.44/32))),
	((dst port 8835) || (dst port 21436) || (dst port 47599) || (dst port 53263) || (dst port 61635)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.0.229/32) || (dst net 42.0.32.4/32) || (dst net 42.0.163.136/32) || (dst net 42.0.229.164/32) || (dst net 42.0.239.125/32))),
	((dst port 79) || (dst port 13998) || (dst port 43864) || (dst port 55114) || (dst port 55928)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.97.142/32) || (dst net 43.0.98.72/32) || (dst net 43.0.157.25/32) || (dst net 43.0.170.175/32) || (dst net 43.0.173.72/32))),
	((dst port 13994) || (dst port 40748) || (dst port 44912) || (dst port 51838) || (dst port 53031)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.26.25/32) || (dst net 44.0.85.74/32) || (dst net 44.0.97.117/32) || (dst net 44.0.100.196/32) || (dst net 44.0.108.237/32))),
	((dst port 29949) || (dst port 35027) || (dst port 36797) || (dst port 38989) || (dst port 41449)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.83.249/32) || (dst net 45.0.124.5/32) || (dst net 45.0.214.230/32) || (dst net 45.0.239.187/32) || (dst net 45.0.249.239/32))),
	((dst port 4317) || (dst port 17008) || (dst port 39232) || (dst port 53748) || (dst port 53988)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.29.169/32) || (dst net 46.0.107.198/32) || (dst net 46.0.115.179/32) || (dst net 46.0.122.144/32) || (dst net 46.0.149.55/32))),
	((dst port 10632) || (dst port 19932) || (dst port 28395) || (dst port 40212) || (dst port 48767)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.29.119/32) || (dst net 47.0.118.133/32) || (dst net 47.0.201.138/32) || (dst net 47.0.241.0/32) || (dst net 47.0.247.75/32))),
	((dst port 41430) || (dst port 41861) || (dst port 44278) || (dst port 59543) || (dst port 62687)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.14.242/32) || (dst net 48.0.77.185/32) || (dst net 48.0.111.111/32) || (dst net 48.0.124.182/32) || (dst net 48.0.172.224/32))),
	((dst port 8947) || (dst port 16687) || (dst port 30547) || (dst port 38660) || (dst port 56355)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.38.8/32) || (dst net 49.0.40.62/32) || (dst net 49.0.93.206/32) || (dst net 49.0.105.190/32) || (dst net 49.0.224.29/32))),
	((dst port 6241) || (dst port 24964) || (dst port 42374) || (dst port 46581) || (dst port 51462)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.0.41/32) || (dst net 50.0.57.40/32) || (dst net 50.0.143.100/32) || (dst net 50.0.154.111/32) || (dst net 50.0.225.205/32))),
	((dst port 7794) || (dst port 10523) || (dst port 23447) || (dst port 32444) || (dst port 42014)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.72.72/32) || (dst net 51.0.115.26/32) || (dst net 51.0.132.57/32) || (dst net 51.0.144.72/32) || (dst net 51.0.181.3/32))),
	((dst port 23916) || (dst port 24718) || (dst port 29197) || (dst port 35287) || (dst port 43741)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.44.77/32) || (dst net 52.0.91.153/32) || (dst net 52.0.136.37/32) || (dst net 52.0.148.101/32) || (dst net 52.0.229.166/32))),
	((dst port 780) || (dst port 6426) || (dst port 26072) || (dst port 34482) || (dst port 61628)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.7.125/32) || (dst net 53.0.22.178/32) || (dst net 53.0.195.174/32) || (dst net 53.0.243.8/32) || (dst net 53.0.244.36/32))),
	((dst port 1231) || (dst port 35231) || (dst port 36771) || (dst port 57690) || (dst port 62475)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.14.227/32) || (dst net 54.0.92.61/32) || (dst net 54.0.124.8/32) || (dst net 54.0.125.144/32) || (dst net 54.0.192.171/32))),
	((dst port 11829) || (dst port 35148) || (dst port 40646) || (dst port 50631) || (dst port 51553)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.8.77/32) || (dst net 55.0.16.155/32) || (dst net 55.0.48.168/32) || (dst net 55.0.137.88/32) || (dst net 55.0.202.63/32))),
	((dst port 1246) || (dst port 33769) || (dst port 36215) || (dst port 39308) || (dst port 43453)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.14.87/32) || (dst net 56.0.40.23/32) || (dst net 56.0.58.106/32) || (dst net 56.0.157.158/32) || (dst net 56.0.182.174/32))),
	((dst port 561) || (dst port 4355) || (dst port 12704) || (dst port 40866) || (dst port 55582)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.61.102/32) || (dst net 57.0.123.198/32) || (dst net 57.0.213.85/32) || (dst net 57.0.250.167/32) || (dst net 57.0.252.15/32))),
	((dst port 8297) || (dst port 17335) || (dst port 47055) || (dst port 47211) || (dst port 58759)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.13.30/32) || (dst net 58.0.35.54/32) || (dst net 58.0.40.20/32) || (dst net 58.0.72.48/32) || (dst net 58.0.210.111/32))),
	((dst port 18183) || (dst port 22580) || (dst port 38847) || (dst port 57672) || (dst port 63453)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.85.144/32) || (dst net 59.0.109.252/32) || (dst net 59.0.133.82/32) || (dst net 59.0.135.112/32) || (dst net 59.0.192.214/32))),
	((dst port 8521) || (dst port 10260) || (dst port 12650) || (dst port 23734) || (dst port 42879)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.7.137/32) || (dst net 60.0.38.20/32) || (dst net 60.0.187.207/32) || (dst net 60.0.199.118/32) || (dst net 60.0.204.149/32))),
	((dst port 3088) || (dst port 4483) || (dst port 24011) || (dst port 45052) || (dst port 48723)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.77.146/32) || (dst net 61.0.79.171/32) || (dst net 61.0.142.150/32) || (dst net 61.0.217.160/32) || (dst net 61.0.253.67/32))),
	((dst port 17534) || (dst port 42996) || (dst port 44736) || (dst port 50364) || (dst port 58287)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.40.158/32) || (dst net 62.0.54.27/32) || (dst net 62.0.158.54/32) || (dst net 62.0.163.34/32) || (dst net 62.0.225.61/32))),
	((dst port 10747) || (dst port 28971) || (dst port 40550) || (dst port 41179) || (dst port 43508)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.142.180/32) || (dst net 63.0.150.20/32) || (dst net 63.0.163.228/32) || (dst net 63.0.189.81/32) || (dst net 63.0.209.170/32))),
	((dst port 13382) || (dst port 14282) || (dst port 22941) || (dst port 28323) || (dst port 37919)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.11.196/32) || (dst net 64.0.37.242/32) || (dst net 64.0.48.47/32) || (dst net 64.0.79.23/32) || (dst net 64.0.91.245/32))),
	((dst port 3359) || (dst port 9557) || (dst port 20163) || (dst port 42644) || (dst port 52190)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.51.86/32) || (dst net 65.0.96.120/32) || (dst net 65.0.97.176/32) || (dst net 65.0.101.134/32) || (dst net 65.0.216.54/32))),
	((dst port 17902) || (dst port 37429) || (dst port 38401) || (dst port 47860) || (dst port 64193)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.20.226/32) || (dst net 66.0.83.87/32) || (dst net 66.0.126.25/32) || (dst net 66.0.230.99/32) || (dst net 66.0.254.160/32))),
	((dst port 14434) || (dst port 17675) || (dst port 41201) || (dst port 49519) || (dst port 63547)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.52.37/32) || (dst net 67.0.131.184/32) || (dst net 67.0.136.202/32) || (dst net 67.0.144.134/32) || (dst net 67.0.245.207/32))),
	((dst port 14154) || (dst port 38794) || (dst port 43473) || (dst port 51925) || (dst port 52056)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.133.246/32) || (dst net 68.0.165.145/32) || (dst net 68.0.190.157/32) || (dst net 68.0.206.120/32) || (dst net 68.0.220.147/32))),
	((dst port 5191) || (dst port 7893) || (dst port 24629) || (dst port 28885) || (dst port 30978)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.117.154/32) || (dst net 69.0.131.170/32) || (dst net 69.0.137.24/32) || (dst net 69.0.167.249/32) || (dst net 69.0.234.85/32))),
	((dst port 31795) || (dst port 38653) || (dst port 38966) || (dst port 43215) || (dst port 55990)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.28.144/32) || (dst net 70.0.34.173/32) || (dst net 70.0.59.28/32) || (dst net 70.0.68.70/32) || (dst net 70.0.183.214/32))),
	((dst port 112) || (dst port 13415) || (dst port 25661) || (dst port 29808) || (dst port 50862)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.58.228/32) || (dst net 71.0.81.238/32) || (dst net 71.0.120.136/32) || (dst net 71.0.196.197/32) || (dst net 71.0.237.231/32))),
	((dst port 5355) || (dst port 12237) || (dst port 17926) || (dst port 20381) || (dst port 45499)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.29.135/32) || (dst net 72.0.83.109/32) || (dst net 72.0.148.99/32) || (dst net 72.0.209.102/32) || (dst net 72.0.231.253/32))),
	((dst port 13588) || (dst port 13643) || (dst port 13777) || (dst port 39699) || (dst port 50892)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.70.60/32) || (dst net 73.0.127.181/32) || (dst net 73.0.196.83/32) || (dst net 73.0.196.160/32) || (dst net 73.0.247.199/32))),
	((dst port 24530) || (dst port 38638) || (dst port 48023) || (dst port 51882) || (dst port 65449)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.110.20/32) || (dst net 74.0.152.100/32) || (dst net 74.0.199.160/32) || (dst net 74.0.226.124/32) || (dst net 74.0.255.173/32))),
	((dst port 2946) || (dst port 17539) || (dst port 47046) || (dst port 57536) || (dst port 64763)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.43.101/32) || (dst net 75.0.59.235/32) || (dst net 75.0.163.141/32) || (dst net 75.0.208.20/32) || (dst net 75.0.226.143/32))),
	((dst port 14385) || (dst port 27230) || (dst port 43533) || (dst port 53768) || (dst port 61008)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.2.198/32) || (dst net 76.0.4.117/32) || (dst net 76.0.46.105/32) || (dst net 76.0.187.160/32) || (dst net 76.0.217.15/32))),
	((dst port 29809) || (dst port 33319) || (dst port 34418) || (dst port 35156) || (dst port 54044)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.17.141/32) || (dst net 77.0.86.238/32) || (dst net 77.0.112.178/32) || (dst net 77.0.156.105/32) || (dst net 77.0.250.163/32))),
	((dst port 7134) || (dst port 8789) || (dst port 22101) || (dst port 45304) || (dst port 55916)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.18.103/32) || (dst net 78.0.106.69/32) || (dst net 78.0.149.122/32) || (dst net 78.0.157.128/32) || (dst net 78.0.201.30/32))),
	((dst port 22019) || (dst port 34257) || (dst port 43691) || (dst port 51090) || (dst port 60802)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.13.187/32) || (dst net 79.0.65.29/32) || (dst net 79.0.74.203/32) || (dst net 79.0.129.9/32) || (dst net 79.0.131.190/32))),
	((dst port 11259) || (dst port 13165) || (dst port 17103) || (dst port 24519) || (dst port 57748)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.23.10/32) || (dst net 80.0.136.203/32) || (dst net 80.0.168.14/32) || (dst net 80.0.185.93/32) || (dst net 80.0.188.141/32))),
	((dst port 5013) || (dst port 5576) || (dst port 17018) || (dst port 20948) || (dst port 41315)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.84.213/32) || (dst net 81.0.112.149/32) || (dst net 81.0.117.197/32) || (dst net 81.0.178.175/32) || (dst net 81.0.187.248/32))),
	((dst port 28775) || (dst port 31383) || (dst port 44991) || (dst port 59101) || (dst port 65264)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.32.2/32) || (dst net 82.0.38.32/32) || (dst net 82.0.95.232/32) || (dst net 82.0.102.175/32) || (dst net 82.0.133.59/32))),
	((dst port 11778) || (dst port 17088) || (dst port 29335) || (dst port 40203) || (dst port 63099)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.31.118/32) || (dst net 83.0.170.238/32) || (dst net 83.0.193.162/32) || (dst net 83.0.211.26/32) || (dst net 83.0.229.182/32))),
	((dst port 8944) || (dst port 29517) || (dst port 35610) || (dst port 37502) || (dst port 58797)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.3.202/32) || (dst net 84.0.43.91/32) || (dst net 84.0.114.53/32) || (dst net 84.0.198.251/32) || (dst net 84.0.226.243/32))),
	((dst port 2652) || (dst port 9518) || (dst port 15627) || (dst port 44820) || (dst port 47657)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.92.91/32) || (dst net 85.0.101.148/32) || (dst net 85.0.165.225/32) || (dst net 85.0.210.105/32) || (dst net 85.0.211.95/32))),
	((dst port 5772) || (dst port 11803) || (dst port 14713) || (dst port 17576) || (dst port 21494)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.3.150/32) || (dst net 86.0.30.63/32) || (dst net 86.0.90.150/32) || (dst net 86.0.119.128/32) || (dst net 86.0.228.143/32))),
	((dst port 3627) || (dst port 14276) || (dst port 15226) || (dst port 53871) || (dst port 56565)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.32.135/32) || (dst net 87.0.51.228/32) || (dst net 87.0.68.249/32) || (dst net 87.0.100.187/32) || (dst net 87.0.136.100/32))),
	((dst port 4735) || (dst port 16908) || (dst port 19948) || (dst port 51608) || (dst port 60578)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.35.70/32) || (dst net 88.0.38.145/32) || (dst net 88.0.89.226/32) || (dst net 88.0.222.49/32) || (dst net 88.0.244.10/32))),
	((dst port 24597) || (dst port 35854) || (dst port 49272) || (dst port 51467) || (dst port 57051)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.49.206/32) || (dst net 89.0.58.21/32) || (dst net 89.0.103.5/32) || (dst net 89.0.121.252/32) || (dst net 89.0.216.78/32))),
	((dst port 2767) || (dst port 3494) || (dst port 15469) || (dst port 40720) || (dst port 45963)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.3.86/32) || (dst net 90.0.19.179/32) || (dst net 90.0.73.29/32) || (dst net 90.0.105.76/32) || (dst net 90.0.187.96/32))),
	((dst port 16934) || (dst port 28062) || (dst port 29168) || (dst port 39255) || (dst port 59713)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.14.182/32) || (dst net 91.0.29.170/32) || (dst net 91.0.90.243/32) || (dst net 91.0.246.98/32) || (dst net 91.0.250.189/32))),
	((dst port 4404) || (dst port 33327) || (dst port 35592) || (dst port 37265) || (dst port 39398)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.87.11/32) || (dst net 92.0.134.92/32) || (dst net 92.0.181.115/32) || (dst net 92.0.212.81/32) || (dst net 92.0.230.165/32))),
	((dst port 4729) || (dst port 9261) || (dst port 31715) || (dst port 43410) || (dst port 61742)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.110.6/32) || (dst net 93.0.129.100/32) || (dst net 93.0.154.162/32) || (dst net 93.0.178.119/32) || (dst net 93.0.228.149/32))),
	((dst port 3695) || (dst port 36970) || (dst port 37651) || (dst port 38103) || (dst port 44141)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.6.23/32) || (dst net 94.0.16.84/32) || (dst net 94.0.25.3/32) || (dst net 94.0.82.162/32) || (dst net 94.0.227.187/32))),
	((dst port 2644) || (dst port 10436) || (dst port 22681) || (dst port 31588) || (dst port 34679)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.23.152/32) || (dst net 95.0.37.172/32) || (dst net 95.0.101.63/32) || (dst net 95.0.238.180/32) || (dst net 95.0.245.25/32))),
	((dst port 12309) || (dst port 27945) || (dst port 37011) || (dst port 56241) || (dst port 60018)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.4.134/32) || (dst net 96.0.26.208/32) || (dst net 96.0.124.144/32) || (dst net 96.0.147.68/32) || (dst net 96.0.206.191/32))),
	((dst port 25657) || (dst port 43282) || (dst port 44886) || (dst port 64124) || (dst port 64593)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.27.145/32) || (dst net 97.0.89.11/32) || (dst net 97.0.158.67/32) || (dst net 97.0.188.114/32) || (dst net 97.0.239.2/32))),
	((dst port 10398) || (dst port 11102) || (dst port 12451) || (dst port 29857) || (dst port 36859)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.2.26/32) || (dst net 98.0.5.247/32) || (dst net 98.0.38.153/32) || (dst net 98.0.175.106/32) || (dst net 98.0.211.30/32))),
	((dst port 14014) || (dst port 35643) || (dst port 38099) || (dst port 40362) || (dst port 52674)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.5.152/32) || (dst net 99.0.106.95/32) || (dst net 99.0.123.119/32) || (dst net 99.0.211.37/32) || (dst net 99.0.221.59/32))),
	((dst port 18716) || (dst port 33293) || (dst port 37932) || (dst port 42146) || (dst port 59480)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.24.95/32) || (dst net 100.0.25.33/32) || (dst net 100.0.180.26/32) || (dst net 100.0.225.122/32) || (dst net 100.0.249.99/32))),
	((dst port 12561) || (dst port 27197) || (dst port 34957) || (dst port 39008) || (dst port 55037)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.65.82/32) || (dst net 101.0.83.215/32) || (dst net 101.0.109.217/32) || (dst net 101.0.158.50/32) || (dst net 101.0.217.86/32))),
	((dst port 19523) || (dst port 21297) || (dst port 33845) || (dst port 42996) || (dst port 50815)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.66.213/32) || (dst net 102.0.68.167/32) || (dst net 102.0.151.189/32) || (dst net 102.0.178.185/32) || (dst net 102.0.233.45/32))),
	((dst port 7989) || (dst port 24477) || (dst port 28822) || (dst port 33138) || (dst port 61669)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.62.57/32) || (dst net 103.0.117.114/32) || (dst net 103.0.127.220/32) || (dst net 103.0.172.103/32) || (dst net 103.0.252.64/32))),
	((dst port 3642) || (dst port 10891) || (dst port 30847) || (dst port 41906) || (dst port 44118)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.68.221/32) || (dst net 104.0.142.149/32) || (dst net 104.0.197.0/32) || (dst net 104.0.216.4/32) || (dst net 104.0.233.237/32))),
	((dst port 25746) || (dst port 33918) || (dst port 44213) || (dst port 45002) || (dst port 64464)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.28.112/32) || (dst net 105.0.121.24/32) || (dst net 105.0.180.13/32) || (dst net 105.0.242.108/32) || (dst net 105.0.254.130/32))),
	((dst port 4965) || (dst port 7833) || (dst port 16031) || (dst port 33017) || (dst port 63674)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.41.104/32) || (dst net 106.0.84.38/32) || (dst net 106.0.90.216/32) || (dst net 106.0.148.128/32) || (dst net 106.0.160.158/32))),
	((dst port 5740) || (dst port 11189) || (dst port 12959) || (dst port 26270) || (dst port 41198)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.93.172/32) || (dst net 107.0.128.2/32) || (dst net 107.0.193.159/32) || (dst net 107.0.214.152/32) || (dst net 107.0.226.229/32))),
	((dst port 2075) || (dst port 4968) || (dst port 10142) || (dst port 22794) || (dst port 37334)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.98.113/32) || (dst net 108.0.131.200/32) || (dst net 108.0.134.98/32) || (dst net 108.0.171.246/32) || (dst net 108.0.229.129/32))),
	((dst port 4178) || (dst port 5546) || (dst port 12258) || (dst port 37333) || (dst port 37446)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.52.61/32) || (dst net 109.0.158.27/32) || (dst net 109.0.166.57/32) || (dst net 109.0.201.87/32) || (dst net 109.0.210.62/32))),
	((dst port 12448) || (dst port 19065) || (dst port 23261) || (dst port 54049) || (dst port 55385)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.14.84/32) || (dst net 110.0.51.104/32) || (dst net 110.0.101.141/32) || (dst net 110.0.222.68/32) || (dst net 110.0.231.222/32))),
	((dst port 10192) || (dst port 19993) || (dst port 52334) || (dst port 57334) || (dst port 59584)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.38.107/32) || (dst net 111.0.89.124/32) || (dst net 111.0.109.53/32) || (dst net 111.0.166.54/32) || (dst net 111.0.227.173/32))),
	((dst port 4016) || (dst port 12546) || (dst port 16670) || (dst port 36145) || (dst port 58558)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.29.158/32) || (dst net 112.0.55.13/32) || (dst net 112.0.65.43/32) || (dst net 112.0.89.173/32) || (dst net 112.0.139.221/32))),
	((dst port 8203) || (dst port 28270) || (dst port 45360) || (dst port 56639) || (dst port 56781)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.91.181/32) || (dst net 113.0.156.64/32) || (dst net 113.0.185.6/32) || (dst net 113.0.191.235/32) || (dst net 113.0.255.218/32))),
	((dst port 15869) || (dst port 20914) || (dst port 25411) || (dst port 36687) || (dst port 42723)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.86.241/32) || (dst net 114.0.140.37/32) || (dst net 114.0.207.66/32) || (dst net 114.0.211.13/32) || (dst net 114.0.243.3/32))),
	((dst port 1256) || (dst port 18235) || (dst port 27670) || (dst port 33125) || (dst port 54964)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.1.15/32) || (dst net 115.0.26.126/32) || (dst net 115.0.133.162/32) || (dst net 115.0.141.254/32) || (dst net 115.0.149.209/32))),
	((dst port 2776) || (dst port 3542) || (dst port 33606) || (dst port 55870) || (dst port 60262)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.55.237/32) || (dst net 116.0.69.35/32) || (dst net 116.0.85.54/32) || (dst net 116.0.146.3/32) || (dst net 116.0.194.27/32))),
	((dst port 3069) || (dst port 3661) || (dst port 4157) || (dst port 17820) || (dst port 25420)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.47.209/32) || (dst net 117.0.83.220/32) || (dst net 117.0.125.17/32) || (dst net 117.0.187.114/32) || (dst net 117.0.248.206/32))),
	((dst port 35986) || (dst port 45155) || (dst port 51253) || (dst port 54910) || (dst port 59814)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.8.159/32) || (dst net 118.0.30.214/32) || (dst net 118.0.144.35/32) || (dst net 118.0.150.0/32) || (dst net 118.0.194.79/32))),
	((dst port 945) || (dst port 3471) || (dst port 8742) || (dst port 22156) || (dst port 41829)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.77.37/32) || (dst net 119.0.119.67/32) || (dst net 119.0.177.88/32) || (dst net 119.0.201.179/32) || (dst net 119.0.222.226/32))),
	((dst port 16762) || (dst port 26705) || (dst port 36557) || (dst port 49896) || (dst port 54578)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.12.194/32) || (dst net 120.0.103.235/32) || (dst net 120.0.127.146/32) || (dst net 120.0.149.29/32) || (dst net 120.0.149.203/32))),
	((dst port 15584) || (dst port 18570) || (dst port 25447) || (dst port 52554) || (dst port 63659)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.2.250/32) || (dst net 121.0.39.181/32) || (dst net 121.0.155.230/32) || (dst net 121.0.211.57/32) || (dst net 121.0.214.29/32))),
	((dst port 23750) || (dst port 32246) || (dst port 37293) || (dst port 46303) || (dst port 53048)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.6.109/32) || (dst net 122.0.23.32/32) || (dst net 122.0.146.218/32) || (dst net 122.0.180.19/32) || (dst net 122.0.221.183/32))),
	((dst port 4878) || (dst port 11442) || (dst port 21809) || (dst port 37910) || (dst port 63972)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.53.183/32) || (dst net 123.0.151.21/32) || (dst net 123.0.156.60/32) || (dst net 123.0.170.251/32) || (dst net 123.0.217.91/32))),
	((dst port 6948) || (dst port 17085) || (dst port 26530) || (dst port 49787) || (dst port 64104)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.29.42/32) || (dst net 124.0.100.230/32) || (dst net 124.0.197.133/32) || (dst net 124.0.239.158/32) || (dst net 124.0.245.26/32))),
	((dst port 4592) || (dst port 13913) || (dst port 24356) || (dst port 43584) || (dst port 63095)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.50.167/32) || (dst net 125.0.52.137/32) || (dst net 125.0.60.32/32) || (dst net 125.0.104.197/32) || (dst net 125.0.185.104/32))),
	((dst port 18412) || (dst port 35039) || (dst port 40422) || (dst port 44182) || (dst port 60537)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.18.33/32) || (dst net 126.0.64.62/32) || (dst net 126.0.141.145/32) || (dst net 126.0.167.109/32) || (dst net 126.0.189.146/32))),
	((dst port 15362) || (dst port 20469) || (dst port 24935) || (dst port 39202) || (dst port 62115)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.47.27/32) || (dst net 127.0.132.124/32) || (dst net 127.0.178.142/32) || (dst net 127.0.184.187/32) || (dst net 127.0.209.109/32))),
	((dst port 18013) || (dst port 20369) || (dst port 31998) || (dst port 39330) || (dst port 61045)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.48.164/32) || (dst net 128.0.83.254/32) || (dst net 128.0.91.4/32) || (dst net 128.0.152.58/32) || (dst net 128.0.194.93/32))),
	((dst port 5746) || (dst port 35558) || (dst port 38103) || (dst port 40213) || (dst port 58324)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.43.14/32) || (dst net 129.0.89.57/32) || (dst net 129.0.111.148/32) || (dst net 129.0.165.35/32) || (dst net 129.0.231.70/32))),
	((dst port 17249) || (dst port 30735) || (dst port 41282) || (dst port 52368) || (dst port 55096)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.10.193/32) || (dst net 130.0.38.111/32) || (dst net 130.0.69.182/32) || (dst net 130.0.116.244/32) || (dst net 130.0.163.208/32))),
	((dst port 5480) || (dst port 13071) || (dst port 21176) || (dst port 34230) || (dst port 34870)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.73.40/32) || (dst net 131.0.79.77/32) || (dst net 131.0.199.125/32) || (dst net 131.0.246.167/32) || (dst net 131.0.251.54/32))),
	((dst port 7478) || (dst port 54217) || (dst port 57450) || (dst port 57475) || (dst port 58487)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.61.0/32) || (dst net 132.0.65.222/32) || (dst net 132.0.142.34/32) || (dst net 132.0.183.132/32) || (dst net 132.0.253.52/32))),
	((dst port 24270) || (dst port 37807) || (dst port 42190) || (dst port 42626) || (dst port 49642)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.3.190/32) || (dst net 133.0.94.60/32) || (dst net 133.0.156.79/32) || (dst net 133.0.208.6/32) || (dst net 133.0.252.70/32))),
	((dst port 3757) || (dst port 4472) || (dst port 33098) || (dst port 58144) || (dst port 63933)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.44.32/32) || (dst net 134.0.105.162/32) || (dst net 134.0.211.123/32) || (dst net 134.0.219.109/32) || (dst net 134.0.249.237/32))),
	((dst port 22185) || (dst port 24756) || (dst port 31217) || (dst port 43154) || (dst port 54539)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.18.2/32) || (dst net 135.0.20.98/32) || (dst net 135.0.90.169/32) || (dst net 135.0.122.112/32) || (dst net 135.0.251.182/32))),
	((dst port 6486) || (dst port 7538) || (dst port 20102) || (dst port 42944) || (dst port 61838)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.1.19/32) || (dst net 136.0.103.174/32) || (dst net 136.0.172.81/32) || (dst net 136.0.191.148/32) || (dst net 136.0.193.95/32))),
	((dst port 1684) || (dst port 18401) || (dst port 44425) || (dst port 58356) || (dst port 61161)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.17.233/32) || (dst net 137.0.137.34/32) || (dst net 137.0.194.89/32) || (dst net 137.0.228.72/32) || (dst net 137.0.244.140/32))),
	((dst port 9692) || (dst port 45011) || (dst port 45979) || (dst port 47023) || (dst port 65462)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.114.189/32) || (dst net 138.0.154.18/32) || (dst net 138.0.169.170/32) || (dst net 138.0.194.68/32) || (dst net 138.0.203.118/32))),
	((dst port 4149) || (dst port 10989) || (dst port 54065) || (dst port 56058) || (dst port 56568)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.6.174/32) || (dst net 139.0.27.118/32) || (dst net 139.0.102.119/32) || (dst net 139.0.159.205/32) || (dst net 139.0.170.11/32))),
	((dst port 8605) || (dst port 31689) || (dst port 34141) || (dst port 41066) || (dst port 57394)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.31.210/32) || (dst net 140.0.32.83/32) || (dst net 140.0.75.166/32) || (dst net 140.0.75.180/32) || (dst net 140.0.152.103/32))),
	((dst port 264) || (dst port 3873) || (dst port 23630) || (dst port 42462) || (dst port 52422)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.49.233/32) || (dst net 141.0.107.33/32) || (dst net 141.0.128.221/32) || (dst net 141.0.163.224/32) || (dst net 141.0.242.6/32))),
	((dst port 7564) || (dst port 9681) || (dst port 10859) || (dst port 52319) || (dst port 55021)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.112.152/32) || (dst net 142.0.190.180/32) || (dst net 142.0.198.58/32) || (dst net 142.0.202.229/32) || (dst net 142.0.216.67/32))),
	((dst port 5438) || (dst port 8376) || (dst port 28399) || (dst port 32876) || (dst port 46183)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.36.35/32) || (dst net 143.0.102.164/32) || (dst net 143.0.119.21/32) || (dst net 143.0.199.120/32) || (dst net 143.0.243.253/32))),
	((dst port 12516) || (dst port 21418) || (dst port 53508) || (dst port 58584) || (dst port 60583)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.41.108/32) || (dst net 144.0.48.225/32) || (dst net 144.0.102.130/32) || (dst net 144.0.217.121/32) || (dst net 144.0.239.188/32))),
	((dst port 1623) || (dst port 6326) || (dst port 22819) || (dst port 37898) || (dst port 53551)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.18.3/32) || (dst net 145.0.93.246/32) || (dst net 145.0.181.159/32) || (dst net 145.0.200.93/32) || (dst net 145.0.219.222/32))),
	((dst port 5134) || (dst port 9609) || (dst port 10688) || (dst port 41002) || (dst port 56343)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.30.92/32) || (dst net 146.0.61.119/32) || (dst net 146.0.82.124/32) || (dst net 146.0.90.76/32) || (dst net 146.0.99.76/32))),
	((dst port 8712) || (dst port 10933) || (dst port 15715) || (dst port 52191) || (dst port 56644)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.2.21/32) || (dst net 147.0.88.122/32) || (dst net 147.0.155.100/32) || (dst net 147.0.171.220/32) || (dst net 147.0.224.83/32))),
	((dst port 25165) || (dst port 37121) || (dst port 40157) || (dst port 44635) || (dst port 48050)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.72.147/32) || (dst net 148.0.96.248/32) || (dst net 148.0.118.132/32) || (dst net 148.0.137.73/32) || (dst net 148.0.252.99/32))),
	((dst port 66) || (dst port 15664) || (dst port 39962) || (dst port 40790) || (dst port 55799)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.76.99/32) || (dst net 149.0.217.159/32) || (dst net 149.0.247.223/32) || (dst net 149.0.251.154/32) || (dst net 149.0.252.101/32))),
	((dst port 27415) || (dst port 32441) || (dst port 39483) || (dst port 41356) || (dst port 56410)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.28.164/32) || (dst net 150.0.98.131/32) || (dst net 150.0.103.172/32) || (dst net 150.0.104.14/32) || (dst net 150.0.253.202/32))),
	((dst port 3086) || (dst port 9526) || (dst port 36974) || (dst port 47098) || (dst port 63625)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.41.131/32) || (dst net 151.0.48.17/32) || (dst net 151.0.51.38/32) || (dst net 151.0.84.197/32) || (dst net 151.0.131.27/32))),
	((dst port 11831) || (dst port 17180) || (dst port 47488) || (dst port 57182) || (dst port 65256)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.14.99/32) || (dst net 152.0.21.114/32) || (dst net 152.0.127.95/32) || (dst net 152.0.160.163/32) || (dst net 152.0.248.26/32))),
	((dst port 9974) || (dst port 42573) || (dst port 48400) || (dst port 50574) || (dst port 54552)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.1.167/32) || (dst net 153.0.37.62/32) || (dst net 153.0.40.246/32) || (dst net 153.0.52.114/32) || (dst net 153.0.55.39/32))),
	((dst port 20244) || (dst port 22511) || (dst port 28057) || (dst port 48580) || (dst port 59659)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.6.150/32) || (dst net 154.0.100.85/32) || (dst net 154.0.119.241/32) || (dst net 154.0.143.163/32) || (dst net 154.0.238.151/32))),
	((dst port 746) || (dst port 15707) || (dst port 19194) || (dst port 25952) || (dst port 28139)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.23.218/32) || (dst net 155.0.86.129/32) || (dst net 155.0.133.233/32) || (dst net 155.0.144.25/32) || (dst net 155.0.236.0/32))),
	((dst port 16642) || (dst port 30927) || (dst port 37522) || (dst port 43270) || (dst port 63637)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.81.202/32) || (dst net 156.0.85.236/32) || (dst net 156.0.135.237/32) || (dst net 156.0.223.50/32) || (dst net 156.0.244.181/32))),
	((dst port 4618) || (dst port 11911) || (dst port 19400) || (dst port 37263) || (dst port 41893)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.49.63/32) || (dst net 157.0.122.81/32) || (dst net 157.0.161.4/32) || (dst net 157.0.209.15/32) || (dst net 157.0.215.41/32))),
	((dst port 2309) || (dst port 3496) || (dst port 10028) || (dst port 18931) || (dst port 43312)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.93.216/32) || (dst net 158.0.165.240/32) || (dst net 158.0.222.116/32) || (dst net 158.0.238.135/32) || (dst net 158.0.252.245/32))),
	((dst port 5244) || (dst port 17584) || (dst port 39313) || (dst port 48114) || (dst port 49991)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.7.122/32) || (dst net 159.0.23.78/32) || (dst net 159.0.50.222/32) || (dst net 159.0.117.121/32) || (dst net 159.0.181.149/32))),
	((dst port 24889) || (dst port 34232) || (dst port 48862) || (dst port 51264) || (dst port 60540)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.11.25/32) || (dst net 160.0.175.117/32) || (dst net 160.0.194.6/32) || (dst net 160.0.207.172/32) || (dst net 160.0.235.132/32))),
	((dst port 10108) || (dst port 13294) || (dst port 26905) || (dst port 26958) || (dst port 51392)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.7.130/32) || (dst net 161.0.8.46/32) || (dst net 161.0.13.220/32) || (dst net 161.0.142.232/32) || (dst net 161.0.238.83/32))),
	((dst port 5426) || (dst port 15327) || (dst port 39285) || (dst port 46610) || (dst port 48443)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.0.227/32) || (dst net 162.0.7.80/32) || (dst net 162.0.62.162/32) || (dst net 162.0.99.53/32) || (dst net 162.0.107.249/32))),
	((dst port 2817) || (dst port 3455) || (dst port 17822) || (dst port 39906) || (dst port 57988)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.136.142/32) || (dst net 163.0.139.211/32) || (dst net 163.0.215.4/32) || (dst net 163.0.250.12/32) || (dst net 163.0.255.55/32))),
	((dst port 10592) || (dst port 40386) || (dst port 49628) || (dst port 61411) || (dst port 63646)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.133.231/32) || (dst net 164.0.160.93/32) || (dst net 164.0.191.130/32) || (dst net 164.0.216.39/32) || (dst net 164.0.233.145/32))),
	((dst port 12305) || (dst port 30845) || (dst port 40736) || (dst port 51460) || (dst port 63523)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.28.114/32) || (dst net 165.0.69.85/32) || (dst net 165.0.114.101/32) || (dst net 165.0.139.7/32) || (dst net 165.0.218.178/32))),
	((dst port 34617) || (dst port 43525) || (dst port 51235) || (dst port 56139) || (dst port 60000)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.18.139/32) || (dst net 166.0.119.146/32) || (dst net 166.0.145.149/32) || (dst net 166.0.160.159/32) || (dst net 166.0.255.53/32))),
	((dst port 28682) || (dst port 33164) || (dst port 35987) || (dst port 58945) || (dst port 62928)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.14.200/32) || (dst net 167.0.39.226/32) || (dst net 167.0.92.110/32) || (dst net 167.0.97.250/32) || (dst net 167.0.161.22/32))),
	((dst port 2818) || (dst port 11464) || (dst port 13512) || (dst port 36412) || (dst port 60256)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.103.14/32) || (dst net 168.0.152.85/32) || (dst net 168.0.161.34/32) || (dst net 168.0.178.83/32) || (dst net 168.0.217.192/32))),
	((dst port 8451) || (dst port 24978) || (dst port 35434) || (dst port 61303) || (dst port 62468)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.5.74/32) || (dst net 169.0.58.173/32) || (dst net 169.0.70.71/32) || (dst net 169.0.236.228/32) || (dst net 169.0.243.182/32))),
	((dst port 10224) || (dst port 11088) || (dst port 11905) || (dst port 45502) || (dst port 57989)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.13.254/32) || (dst net 170.0.17.46/32) || (dst net 170.0.103.136/32) || (dst net 170.0.157.184/32) || (dst net 170.0.242.112/32))),
	((dst port 20652) || (dst port 29919) || (dst port 43021) || (dst port 43082) || (dst port 64720)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.41.225/32) || (dst net 171.0.53.252/32) || (dst net 171.0.54.248/32) || (dst net 171.0.155.219/32) || (dst net 171.0.188.217/32))),
	((dst port 6731) || (dst port 45210) || (dst port 48458) || (dst port 57324) || (dst port 62570)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.20.233/32) || (dst net 172.0.65.56/32) || (dst net 172.0.79.112/32) || (dst net 172.0.86.179/32) || (dst net 172.0.204.135/32))),
	((dst port 23738) || (dst port 38877) || (dst port 47507) || (dst port 49151) || (dst port 59499)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.79.234/32) || (dst net 173.0.123.241/32) || (dst net 173.0.126.50/32) || (dst net 173.0.230.136/32) || (dst net 173.0.242.121/32))),
	((dst port 559) || (dst port 14630) || (dst port 23710) || (dst port 29409) || (dst port 31633)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.14.196/32) || (dst net 174.0.119.102/32) || (dst net 174.0.168.227/32) || (dst net 174.0.203.205/32) || (dst net 174.0.208.247/32))),
	((dst port 8947) || (dst port 15111) || (dst port 16230) || (dst port 33207) || (dst port 42150)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.44.190/32) || (dst net 175.0.87.102/32) || (dst net 175.0.90.121/32) || (dst net 175.0.215.79/32) || (dst net 175.0.219.249/32))),
	((dst port 206) || (dst port 41680) || (dst port 49199) || (dst port 64871) || (dst port 64920)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.95.241/32) || (dst net 176.0.160.61/32) || (dst net 176.0.206.22/32) || (dst net 176.0.224.93/32) || (dst net 176.0.243.75/32))),
	((dst port 23450) || (dst port 29028) || (dst port 37650) || (dst port 56832) || (dst port 58670)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.42.117/32) || (dst net 177.0.99.105/32) || (dst net 177.0.118.221/32) || (dst net 177.0.143.35/32) || (dst net 177.0.222.171/32))),
	((dst port 11877) || (dst port 44503) || (dst port 44820) || (dst port 47143) || (dst port 54053)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.75.253/32) || (dst net 178.0.143.116/32) || (dst net 178.0.166.9/32) || (dst net 178.0.204.195/32) || (dst net 178.0.242.118/32))),
	((dst port 3008) || (dst port 33295) || (dst port 40026) || (dst port 41248) || (dst port 43907)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.58.39/32) || (dst net 179.0.125.195/32) || (dst net 179.0.170.202/32) || (dst net 179.0.189.118/32) || (dst net 179.0.200.45/32))),
	((dst port 10682) || (dst port 29597) || (dst port 30384) || (dst port 37549) || (dst port 61054)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.22.5/32) || (dst net 180.0.126.207/32) || (dst net 180.0.195.163/32) || (dst net 180.0.196.81/32) || (dst net 180.0.231.223/32))),
	((dst port 1558) || (dst port 36210) || (dst port 53313) || (dst port 59847) || (dst port 65451)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.6.198/32) || (dst net 181.0.25.170/32) || (dst net 181.0.64.157/32) || (dst net 181.0.175.187/32) || (dst net 181.0.237.69/32))),
	((dst port 24530) || (dst port 32646) || (dst port 37697) || (dst port 41722) || (dst port 55440)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.22.53/32) || (dst net 182.0.63.89/32) || (dst net 182.0.159.151/32) || (dst net 182.0.244.21/32) || (dst net 182.0.251.36/32))),
	((dst port 21035) || (dst port 35505) || (dst port 37948) || (dst port 43787) || (dst port 60661)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.52.47/32) || (dst net 183.0.79.76/32) || (dst net 183.0.126.204/32) || (dst net 183.0.194.102/32) || (dst net 183.0.241.117/32))),
	((dst port 21938) || (dst port 41001) || (dst port 55924) || (dst port 60284) || (dst port 63377)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.63.208/32) || (dst net 184.0.96.126/32) || (dst net 184.0.155.29/32) || (dst net 184.0.183.76/32) || (dst net 184.0.225.60/32))),
	((dst port 27602) || (dst port 42031) || (dst port 45769) || (dst port 53730) || (dst port 58304)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.26.242/32) || (dst net 185.0.52.171/32) || (dst net 185.0.64.228/32) || (dst net 185.0.158.134/32) || (dst net 185.0.204.183/32))),
	((dst port 4120) || (dst port 23483) || (dst port 25210) || (dst port 49336) || (dst port 51635)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.60.239/32) || (dst net 186.0.121.195/32) || (dst net 186.0.196.100/32) || (dst net 186.0.234.62/32) || (dst net 186.0.243.162/32))),
	((dst port 5814) || (dst port 15043) || (dst port 27865) || (dst port 32818) || (dst port 52047)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.14.177/32) || (dst net 187.0.57.95/32) || (dst net 187.0.135.187/32) || (dst net 187.0.148.206/32) || (dst net 187.0.213.120/32))),
	((dst port 371) || (dst port 19113) || (dst port 27864) || (dst port 33660) || (dst port 43707)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.45.253/32) || (dst net 188.0.85.244/32) || (dst net 188.0.201.170/32) || (dst net 188.0.230.138/32) || (dst net 188.0.234.88/32))),
	((dst port 20546) || (dst port 20719) || (dst port 28705) || (dst port 55006) || (dst port 65369)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.11.72/32) || (dst net 189.0.14.55/32) || (dst net 189.0.74.128/32) || (dst net 189.0.158.196/32) || (dst net 189.0.166.61/32))),
	((dst port 2227) || (dst port 15827) || (dst port 40826) || (dst port 45229) || (dst port 60381)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.42.44/32) || (dst net 190.0.58.169/32) || (dst net 190.0.150.234/32) || (dst net 190.0.161.186/32) || (dst net 190.0.182.112/32))),
	((dst port 19652) || (dst port 39925) || (dst port 54962) || (dst port 60166) || (dst port 64922)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.149.222/32) || (dst net 191.0.159.7/32) || (dst net 191.0.190.191/32) || (dst net 191.0.208.196/32) || (dst net 191.0.230.187/32))),
	((dst port 4259) || (dst port 32766) || (dst port 34947) || (dst port 49848) || (dst port 59023)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.26.210/32) || (dst net 192.0.62.78/32) || (dst net 192.0.99.255/32) || (dst net 192.0.100.59/32) || (dst net 192.0.218.14/32))),
	((dst port 20428) || (dst port 54591) || (dst port 56100) || (dst port 58850) || (dst port 63205)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.20.229/32) || (dst net 193.0.66.20/32) || (dst net 193.0.123.193/32) || (dst net 193.0.152.103/32) || (dst net 193.0.240.188/32))),
	((dst port 7407) || (dst port 14821) || (dst port 47272) || (dst port 64973) || (dst port 65413)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.55.188/32) || (dst net 194.0.86.206/32) || (dst net 194.0.189.32/32) || (dst net 194.0.209.49/32) || (dst net 194.0.255.95/32))),
	((dst port 25867) || (dst port 43829) || (dst port 47272) || (dst port 56964) || (dst port 57978)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.41.181/32) || (dst net 195.0.42.206/32) || (dst net 195.0.85.63/32) || (dst net 195.0.206.94/32) || (dst net 195.0.250.55/32))),
	((dst port 3472) || (dst port 20431) || (dst port 34077) || (dst port 40948) || (dst port 48401)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.8.48/32) || (dst net 196.0.73.161/32) || (dst net 196.0.80.85/32) || (dst net 196.0.188.81/32) || (dst net 196.0.255.97/32))),
	((dst port 1990) || (dst port 18947) || (dst port 24856) || (dst port 49196) || (dst port 56509)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.21.140/32) || (dst net 197.0.60.131/32) || (dst net 197.0.137.158/32) || (dst net 197.0.155.193/32) || (dst net 197.0.160.55/32))),
	((dst port 1258) || (dst port 4907) || (dst port 23031) || (dst port 29608) || (dst port 46888)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.80.80/32) || (dst net 198.0.80.196/32) || (dst net 198.0.95.4/32) || (dst net 198.0.131.117/32) || (dst net 198.0.158.232/32))),
	((dst port 6094) || (dst port 21985) || (dst port 29254) || (dst port 56535) || (dst port 62102)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.14.28/32) || (dst net 199.0.76.184/32) || (dst net 199.0.133.189/32) || (dst net 199.0.161.122/32) || (dst net 199.0.250.213/32))),
	((dst port 11064) || (dst port 26664) || (dst port 53121) || (dst port 53796) || (dst port 57310)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.13.216/32) || (dst net 200.0.87.55/32) || (dst net 200.0.182.130/32) || (dst net 200.0.225.63/32) || (dst net 200.0.227.174/32))),
	((dst port 1996) || (dst port 14196) || (dst port 33421) || (dst port 38300) || (dst port 58864)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.7.151/32) || (dst net 201.0.14.159/32) || (dst net 201.0.16.108/32) || (dst net 201.0.73.78/32) || (dst net 201.0.179.76/32))),
	((dst port 15766) || (dst port 16699) || (dst port 25255) || (dst port 52521) || (dst port 63936)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.51.254/32) || (dst net 202.0.80.170/32) || (dst net 202.0.185.64/32) || (dst net 202.0.215.1/32) || (dst net 202.0.224.17/32))),
	((dst port 7765) || (dst port 17687) || (dst port 22282) || (dst port 30686) || (dst port 60685)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.50.148/32) || (dst net 203.0.148.80/32) || (dst net 203.0.158.195/32) || (dst net 203.0.195.90/32) || (dst net 203.0.225.206/32))),
	((dst port 8726) || (dst port 40253) || (dst port 48068) || (dst port 60428) || (dst port 62238)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.11.14/32) || (dst net 204.0.44.246/32) || (dst net 204.0.133.150/32) || (dst net 204.0.186.136/32) || (dst net 204.0.232.51/32))),
	((dst port 45) || (dst port 11168) || (dst port 38121) || (dst port 40047) || (dst port 62225)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.31.32/32) || (dst net 205.0.38.28/32) || (dst net 205.0.96.57/32) || (dst net 205.0.139.243/32) || (dst net 205.0.217.227/32))),
	((dst port 10640) || (dst port 22110) || (dst port 24355) || (dst port 47765) || (dst port 51389)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.40.57/32) || (dst net 206.0.87.183/32) || (dst net 206.0.183.65/32) || (dst net 206.0.217.74/32) || (dst net 206.0.228.175/32))),
	((dst port 1122) || (dst port 52601) || (dst port 54541) || (dst port 62118) || (dst port 64476)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.165.228/32) || (dst net 207.0.190.28/32) || (dst net 207.0.244.140/32) || (dst net 207.0.248.149/32) || (dst net 207.0.250.200/32))),
	((dst port 5259) || (dst port 15629) || (dst port 22520) || (dst port 50713) || (dst port 61358)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.11.243/32) || (dst net 208.0.32.222/32) || (dst net 208.0.110.162/32) || (dst net 208.0.137.218/32) || (dst net 208.0.156.113/32))),
	((dst port 1906) || (dst port 28993) || (dst port 43267) || (dst port 53279) || (dst port 57747)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.6.184/32) || (dst net 209.0.68.216/32) || (dst net 209.0.162.79/32) || (dst net 209.0.216.216/32) || (dst net 209.0.222.195/32))),
	((dst port 23895) || (dst port 24982) || (dst port 32504) || (dst port 37486) || (dst port 43757)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.28.40/32) || (dst net 210.0.78.35/32) || (dst net 210.0.95.119/32) || (dst net 210.0.136.57/32) || (dst net 210.0.199.39/32))),
	((dst port 626) || (dst port 4697) || (dst port 39438) || (dst port 45708) || (dst port 47655)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.4.59/32) || (dst net 211.0.6.224/32) || (dst net 211.0.143.50/32) || (dst net 211.0.144.149/32) || (dst net 211.0.217.212/32))),
	((dst port 8305) || (dst port 57196) || (dst port 57539) || (dst port 60457) || (dst port 64727)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.9.42/32) || (dst net 212.0.143.107/32) || (dst net 212.0.163.0/32) || (dst net 212.0.201.167/32) || (dst net 212.0.211.229/32))),
	((dst port 4435) || (dst port 23991) || (dst port 25689) || (dst port 31707) || (dst port 41378)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.33.24/32) || (dst net 213.0.120.200/32) || (dst net 213.0.127.19/32) || (dst net 213.0.138.202/32) || (dst net 213.0.185.70/32))),
	((dst port 5070) || (dst port 10041) || (dst port 17133) || (dst port 20732) || (dst port 49461)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.88.244/32) || (dst net 214.0.115.233/32) || (dst net 214.0.140.90/32) || (dst net 214.0.190.54/32) || (dst net 214.0.234.19/32))),
	((dst port 10816) || (dst port 10996) || (dst port 49525) || (dst port 60966) || (dst port 63639)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.64.29/32) || (dst net 215.0.72.113/32) || (dst net 215.0.90.170/32) || (dst net 215.0.214.234/32) || (dst net 215.0.215.107/32))),
	((dst port 19993) || (dst port 22225) || (dst port 42424) || (dst port 43826) || (dst port 54932)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.38.176/32) || (dst net 216.0.57.72/32) || (dst net 216.0.159.65/32) || (dst net 216.0.168.232/32) || (dst net 216.0.248.249/32))),
	((dst port 7037) || (dst port 28571) || (dst port 51359) || (dst port 62585) || (dst port 62714)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.39.3/32) || (dst net 217.0.75.41/32) || (dst net 217.0.95.245/32) || (dst net 217.0.218.47/32) || (dst net 217.0.244.37/32))),
	((dst port 3216) || (dst port 31884) || (dst port 37995) || (dst port 42603) || (dst port 47881)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.50.219/32) || (dst net 218.0.66.196/32) || (dst net 218.0.91.97/32) || (dst net 218.0.191.51/32) || (dst net 218.0.227.248/32))),
	((dst port 21082) || (dst port 40568) || (dst port 42865) || (dst port 45314) || (dst port 50950)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.3.251/32) || (dst net 219.0.69.220/32) || (dst net 219.0.108.39/32) || (dst net 219.0.134.3/32) || (dst net 219.0.225.86/32))),
	((dst port 1309) || (dst port 20969) || (dst port 30396) || (dst port 35316) || (dst port 59320)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.18.101/32) || (dst net 220.0.110.146/32) || (dst net 220.0.174.137/32) || (dst net 220.0.186.24/32) || (dst net 220.0.253.109/32))),
	((dst port 6702) || (dst port 42327) || (dst port 53454) || (dst port 57055) || (dst port 60666)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.18.234/32) || (dst net 221.0.24.217/32) || (dst net 221.0.73.132/32) || (dst net 221.0.124.235/32) || (dst net 221.0.202.37/32))),
	((dst port 20216) || (dst port 21690) || (dst port 24387) || (dst port 34035) || (dst port 36563)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.85.66/32) || (dst net 222.0.92.11/32) || (dst net 222.0.99.35/32) || (dst net 222.0.158.173/32) || (dst net 222.0.201.252/32))),
	((dst port 167) || (dst port 808) || (dst port 13386) || (dst port 17465) || (dst port 32190)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.6.186/32) || (dst net 223.0.30.128/32) || (dst net 223.0.143.27/32) || (dst net 223.0.200.76/32) || (dst net 223.0.203.240/32))),
	((dst port 9614) || (dst port 10804) || (dst port 39815) || (dst port 41184) || (dst port 47047)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.10.153/32) || (dst net 224.0.34.113/32) || (dst net 224.0.94.222/32) || (dst net 224.0.109.68/32) || (dst net 224.0.238.205/32))),
	((dst port 23488) || (dst port 30140) || (dst port 36550) || (dst port 53226) || (dst port 57035)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.61.113/32) || (dst net 225.0.142.126/32) || (dst net 225.0.153.221/32) || (dst net 225.0.170.171/32) || (dst net 225.0.221.96/32))),
	((dst port 20231) || (dst port 20934) || (dst port 34614) || (dst port 40515) || (dst port 56033)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.31.94/32) || (dst net 226.0.144.67/32) || (dst net 226.0.214.236/32) || (dst net 226.0.237.206/32) || (dst net 226.0.241.55/32))),
	((dst port 13876) || (dst port 17778) || (dst port 29798) || (dst port 35206) || (dst port 50472)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.22.210/32) || (dst net 227.0.82.18/32) || (dst net 227.0.143.47/32) || (dst net 227.0.217.110/32) || (dst net 227.0.243.14/32))),
	((dst port 32944) || (dst port 36208) || (dst port 38520) || (dst port 44080) || (dst port 46050)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.73.230/32) || (dst net 228.0.125.231/32) || (dst net 228.0.130.16/32) || (dst net 228.0.156.206/32) || (dst net 228.0.167.70/32))),
	((dst port 22874) || (dst port 33388) || (dst port 39040) || (dst port 49823) || (dst port 62993)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.11.231/32) || (dst net 229.0.75.177/32) || (dst net 229.0.86.253/32) || (dst net 229.0.100.40/32) || (dst net 229.0.132.138/32))),
	((dst port 3683) || (dst port 36696) || (dst port 37017) || (dst port 50323) || (dst port 59804)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.39.73/32) || (dst net 230.0.83.182/32) || (dst net 230.0.118.210/32) || (dst net 230.0.193.194/32) || (dst net 230.0.205.2/32))),
	((dst port 4740) || (dst port 26375) || (dst port 47288) || (dst port 56422) || (dst port 65460)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.49.168/32) || (dst net 231.0.100.109/32) || (dst net 231.0.156.219/32) || (dst net 231.0.213.93/32) || (dst net 231.0.244.210/32))),
	((dst port 8237) || (dst port 20959) || (dst port 38369) || (dst port 50212) || (dst port 62703)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.2.160/32) || (dst net 232.0.57.234/32) || (dst net 232.0.102.217/32) || (dst net 232.0.133.138/32) || (dst net 232.0.223.60/32))),
	((dst port 3798) || (dst port 19887) || (dst port 29140) || (dst port 58403) || (dst port 58824)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.4.176/32) || (dst net 233.0.62.120/32) || (dst net 233.0.88.25/32) || (dst net 233.0.183.117/32) || (dst net 233.0.220.183/32))),
	((dst port 22623) || (dst port 44304) || (dst port 51343) || (dst port 56260) || (dst port 64533)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.16.91/32) || (dst net 234.0.24.8/32) || (dst net 234.0.179.157/32) || (dst net 234.0.206.80/32) || (dst net 234.0.225.139/32))),
	((dst port 294) || (dst port 26324) || (dst port 36209) || (dst port 54244) || (dst port 59749)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.30.217/32) || (dst net 235.0.100.158/32) || (dst net 235.0.188.111/32) || (dst net 235.0.204.20/32) || (dst net 235.0.217.7/32))),
	((dst port 7490) || (dst port 22779) || (dst port 28192) || (dst port 48740) || (dst port 58996)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.33.96/32) || (dst net 236.0.39.221/32) || (dst net 236.0.106.156/32) || (dst net 236.0.173.175/32) || (dst net 236.0.185.28/32))),
	((dst port 13790) || (dst port 19568) || (dst port 36704) || (dst port 40995) || (dst port 54878)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.56.246/32) || (dst net 237.0.60.252/32) || (dst net 237.0.182.97/32) || (dst net 237.0.222.163/32) || (dst net 237.0.247.20/32))),
	((dst port 5268) || (dst port 12827) || (dst port 32860) || (dst port 36436) || (dst port 54990)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.34.136/32) || (dst net 238.0.48.241/32) || (dst net 238.0.68.69/32) || (dst net 238.0.195.131/32) || (dst net 238.0.255.105/32))),
	((dst port 574) || (dst port 3144) || (dst port 13496) || (dst port 21352) || (dst port 42897)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.15.189/32) || (dst net 239.0.20.187/32) || (dst net 239.0.27.225/32) || (dst net 239.0.73.131/32) || (dst net 239.0.100.210/32))),
	((dst port 19886) || (dst port 39593) || (dst port 47226) || (dst port 50436) || (dst port 60354)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.84.54/32) || (dst net 240.0.92.34/32) || (dst net 240.0.174.84/32) || (dst net 240.0.188.101/32) || (dst net 240.0.235.130/32))),
	((dst port 16736) || (dst port 21891) || (dst port 33197) || (dst port 54281) || (dst port 63575)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.46.203/32) || (dst net 241.0.73.208/32) || (dst net 241.0.180.173/32) || (dst net 241.0.240.41/32) || (dst net 241.0.252.110/32))),
	((dst port 24276) || (dst port 29676) || (dst port 34044) || (dst port 35266) || (dst port 62872)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.132.18/32) || (dst net 242.0.151.78/32) || (dst net 242.0.175.249/32) || (dst net 242.0.214.36/32) || (dst net 242.0.247.93/32))),
	((dst port 23138) || (dst port 24042) || (dst port 32376) || (dst port 51960) || (dst port 58446)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.14.72/32) || (dst net 243.0.120.168/32) || (dst net 243.0.148.56/32) || (dst net 243.0.156.209/32) || (dst net 243.0.160.9/32))),
	((dst port 10730) || (dst port 31494) || (dst port 46812) || (dst port 49103) || (dst port 63063)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.6.33/32) || (dst net 244.0.9.196/32) || (dst net 244.0.18.28/32) || (dst net 244.0.51.81/32) || (dst net 244.0.114.74/32))),
	((dst port 1494) || (dst port 4250) || (dst port 24987) || (dst port 32689) || (dst port 64391)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.22.211/32) || (dst net 245.0.94.105/32) || (dst net 245.0.127.210/32) || (dst net 245.0.154.186/32) || (dst net 245.0.227.119/32))),
	((dst port 1578) || (dst port 24222) || (dst port 46859) || (dst port 47403) || (dst port 65256)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.29.201/32) || (dst net 246.0.114.245/32) || (dst net 246.0.133.14/32) || (dst net 246.0.169.29/32) || (dst net 246.0.233.148/32))),
	((dst port 5602) || (dst port 7230) || (dst port 22149) || (dst port 44130) || (dst port 47813)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.12.6/32) || (dst net 247.0.99.149/32) || (dst net 247.0.168.197/32) || (dst net 247.0.198.175/32) || (dst net 247.0.215.24/32))),
	((dst port 407) || (dst port 21778) || (dst port 34001) || (dst port 37211) || (dst port 41991)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.0.114/32) || (dst net 248.0.16.202/32) || (dst net 248.0.67.104/32) || (dst net 248.0.84.153/32) || (dst net 248.0.132.109/32))),
	((dst port 2079) || (dst port 5030) || (dst port 18529) || (dst port 19965) || (dst port 53135)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.6.213/32) || (dst net 249.0.23.187/32) || (dst net 249.0.117.74/32) || (dst net 249.0.176.107/32) || (dst net 249.0.244.157/32))),
	((dst port 34447) || (dst port 39828) || (dst port 51341) || (dst port 56034) || (dst port 63083)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.2.37/32) || (dst net 250.0.11.72/32) || (dst net 250.0.33.64/32) || (dst net 250.0.164.106/32) || (dst net 250.0.245.176/32))),
	((dst port 12775) || (dst port 21656) || (dst port 26109) || (dst port 44868) || (dst port 47976)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.32.99/32) || (dst net 251.0.56.23/32) || (dst net 251.0.83.98/32) || (dst net 251.0.111.69/32) || (dst net 251.0.233.115/32))),
	((dst port 8623) || (dst port 21283) || (dst port 62817) || (dst port 64266) || (dst port 64329)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.2.11/32) || (dst net 252.0.74.158/32) || (dst net 252.0.75.51/32) || (dst net 252.0.92.62/32) || (dst net 252.0.166.99/32))),
	((dst port 2857) || (dst port 34108) || (dst port 60581) || (dst port 63089) || (dst port 64992)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.22.156/32) || (dst net 253.0.103.193/32) || (dst net 253.0.106.134/32) || (dst net 253.0.117.113/32) || (dst net 253.0.137.200/32))),
	((dst port 23890) || (dst port 26078) || (dst port 34460) || (dst port 48994) || (dst port 50501)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.26.244/32) || (dst net 254.0.53.89/32) || (dst net 254.0.131.44/32) || (dst net 254.0.138.251/32) || (dst net 254.0.168.238/32))),
	((dst port 2701) || (dst port 18427) || (dst port 35265) || (dst port 45941) || (dst port 49811)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.109.62/32) || (dst net 255.0.128.35/32) || (dst net 255.0.200.212/32) || (dst net 255.0.230.124/32) || (dst net 255.0.240.228/32))),
	((dst port 24532) || (dst port 49526) || (dst port 56110) || (dst port 57141) || (dst port 58350)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.12.100/32) || (dst net 0.0.49.172/32) || (dst net 0.0.134.248/32) || (dst net 0.0.224.239/32) || (dst net 0.0.253.37/32))),
	((dst port 8986) || (dst port 26858) || (dst port 29695) || (dst port 55801) || (dst port 64351)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.26.42/32) || (dst net 1.0.82.135/32) || (dst net 1.0.200.248/32) || (dst net 1.0.218.120/32) || (dst net 1.0.227.232/32))),
	((dst port 3750) || (dst port 6968) || (dst port 40186) || (dst port 50489) || (dst port 56704)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.24.70/32) || (dst net 2.0.75.145/32) || (dst net 2.0.167.135/32) || (dst net 2.0.204.79/32) || (dst net 2.0.248.49/32))),
	((dst port 7656) || (dst port 23829) || (dst port 25276) || (dst port 49748) || (dst port 62084)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.6.50/32) || (dst net 3.0.207.52/32) || (dst net 3.0.238.63/32) || (dst net 3.0.240.201/32) || (dst net 3.0.245.197/32))),
	((dst port 4093) || (dst port 32181) || (dst port 36565) || (dst port 50325) || (dst port 53986)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.44.116/32) || (dst net 4.0.52.205/32) || (dst net 4.0.113.74/32) || (dst net 4.0.146.59/32) || (dst net 4.0.243.160/32))),
	((dst port 20236) || (dst port 27042) || (dst port 30784) || (dst port 31552) || (dst port 61023)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.1.204/32) || (dst net 5.0.32.81/32) || (dst net 5.0.149.173/32) || (dst net 5.0.198.36/32) || (dst net 5.0.212.65/32))),
	((dst port 18423) || (dst port 19607) || (dst port 27124) || (dst port 39931) || (dst port 56644)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.17.26/32) || (dst net 6.0.44.5/32) || (dst net 6.0.60.230/32) || (dst net 6.0.153.127/32) || (dst net 6.0.218.14/32))),
	((dst port 2426) || (dst port 17640) || (dst port 20661) || (dst port 31422) || (dst port 50030)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.39.148/32) || (dst net 7.0.92.35/32) || (dst net 7.0.132.217/32) || (dst net 7.0.152.196/32) || (dst net 7.0.216.159/32))),
	((dst port 5359) || (dst port 8848) || (dst port 19911) || (dst port 21234) || (dst port 36237)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.44.148/32) || (dst net 8.0.69.67/32) || (dst net 8.0.76.252/32) || (dst net 8.0.176.221/32) || (dst net 8.0.189.182/32))),
	((dst port 5485) || (dst port 5608) || (dst port 22938) || (dst port 27284) || (dst port 49457)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.1.165/32) || (dst net 9.0.10.157/32) || (dst net 9.0.34.181/32) || (dst net 9.0.44.218/32) || (dst net 9.0.147.83/32))),
	((dst port 30646) || (dst port 40501) || (dst port 47966) || (dst port 48881) || (dst port 55027)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.133.168/32) || (dst net 10.0.195.74/32) || (dst net 10.0.215.30/32) || (dst net 10.0.235.140/32) || (dst net 10.0.242.36/32))),
	((dst port 1392) || (dst port 27524) || (dst port 35899) || (dst port 43122) || (dst port 64877)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.46.163/32) || (dst net 11.0.49.51/32) || (dst net 11.0.97.106/32) || (dst net 11.0.130.255/32) || (dst net 11.0.235.177/32))),
	((dst port 1235) || (dst port 12612) || (dst port 24089) || (dst port 28169) || (dst port 46619)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.132.187/32) || (dst net 12.0.144.40/32) || (dst net 12.0.220.243/32) || (dst net 12.0.226.59/32) || (dst net 12.0.240.57/32))),
	((dst port 8736) || (dst port 21660) || (dst port 50474) || (dst port 55312) || (dst port 63918)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.2.170/32) || (dst net 13.0.31.30/32) || (dst net 13.0.48.88/32) || (dst net 13.0.191.38/32) || (dst net 13.0.206.245/32))),
	((dst port 20073) || (dst port 36511) || (dst port 42942) || (dst port 50991) || (dst port 57367)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.146.35/32) || (dst net 14.0.151.114/32) || (dst net 14.0.157.251/32) || (dst net 14.0.243.48/32) || (dst net 14.0.248.240/32))),
	((dst port 27161) || (dst port 37399) || (dst port 38081) || (dst port 50359) || (dst port 59701)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.90.39/32) || (dst net 15.0.140.180/32) || (dst net 15.0.178.96/32) || (dst net 15.0.184.157/32) || (dst net 15.0.241.210/32))),
	((dst port 9433) || (dst port 11439) || (dst port 13990) || (dst port 21989) || (dst port 34869)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.80.56/32) || (dst net 16.0.98.144/32) || (dst net 16.0.117.44/32) || (dst net 16.0.156.69/32) || (dst net 16.0.190.253/32))),
	((dst port 4330) || (dst port 25977) || (dst port 40073) || (dst port 40190) || (dst port 51095)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.2.50/32) || (dst net 17.0.46.61/32) || (dst net 17.0.150.255/32) || (dst net 17.0.215.164/32) || (dst net 17.0.251.123/32))),
	((dst port 16876) || (dst port 24505) || (dst port 41009) || (dst port 48038) || (dst port 53040)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.10.151/32) || (dst net 18.0.113.211/32) || (dst net 18.0.125.236/32) || (dst net 18.0.157.247/32) || (dst net 18.0.221.58/32))),
	((dst port 5846) || (dst port 19071) || (dst port 20092) || (dst port 36113) || (dst port 50466)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.44.102/32) || (dst net 19.0.59.35/32) || (dst net 19.0.95.76/32) || (dst net 19.0.117.238/32) || (dst net 19.0.218.49/32))),
	((dst port 14138) || (dst port 39977) || (dst port 46192) || (dst port 52609) || (dst port 60414)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.54.76/32) || (dst net 20.0.96.42/32) || (dst net 20.0.108.124/32) || (dst net 20.0.214.76/32) || (dst net 20.0.216.143/32))),
	((dst port 5334) || (dst port 5537) || (dst port 17933) || (dst port 28026) || (dst port 59823)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.1.123/32) || (dst net 21.0.32.74/32) || (dst net 21.0.38.1/32) || (dst net 21.0.62.8/32) || (dst net 21.0.159.232/32))),
	((dst port 3660) || (dst port 12090) || (dst port 38014) || (dst port 40863) || (dst port 42471)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.32.123/32) || (dst net 22.0.91.26/32) || (dst net 22.0.150.216/32) || (dst net 22.0.232.225/32) || (dst net 22.0.253.204/32))),
	((dst port 19391) || (dst port 19602) || (dst port 29978) || (dst port 60408) || (dst port 65348)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.15.133/32) || (dst net 23.0.29.159/32) || (dst net 23.0.163.180/32) || (dst net 23.0.189.152/32) || (dst net 23.0.203.29/32))),
	((dst port 15507) || (dst port 17552) || (dst port 18030) || (dst port 41732) || (dst port 52565)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.99.29/32) || (dst net 24.0.100.154/32) || (dst net 24.0.175.139/32) || (dst net 24.0.243.243/32) || (dst net 24.0.254.230/32))),
	((dst port 7570) || (dst port 23730) || (dst port 31155) || (dst port 37949) || (dst port 52401)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.1.63/32) || (dst net 25.0.5.138/32) || (dst net 25.0.6.101/32) || (dst net 25.0.217.192/32) || (dst net 25.0.225.252/32))),
	((dst port 9068) || (dst port 14391) || (dst port 35175) || (dst port 36473) || (dst port 41814)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.39.235/32) || (dst net 26.0.48.87/32) || (dst net 26.0.150.248/32) || (dst net 26.0.151.219/32) || (dst net 26.0.210.134/32))),
	((dst port 3792) || (dst port 13998) || (dst port 32692) || (dst port 38688) || (dst port 51741)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.72.33/32) || (dst net 27.0.73.97/32) || (dst net 27.0.98.169/32) || (dst net 27.0.122.245/32) || (dst net 27.0.148.222/32))),
	((dst port 16391) || (dst port 21807) || (dst port 22684) || (dst port 29111) || (dst port 42403)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.2.27/32) || (dst net 28.0.31.176/32) || (dst net 28.0.60.93/32) || (dst net 28.0.112.121/32) || (dst net 28.0.242.139/32))),
	((dst port 913) || (dst port 10225) || (dst port 22204) || (dst port 26548) || (dst port 58370)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.3.225/32) || (dst net 29.0.124.79/32) || (dst net 29.0.137.170/32) || (dst net 29.0.166.224/32) || (dst net 29.0.234.65/32))),
	((dst port 1786) || (dst port 12665) || (dst port 13050) || (dst port 44485) || (dst port 46278)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.16.176/32) || (dst net 30.0.43.48/32) || (dst net 30.0.49.51/32) || (dst net 30.0.82.189/32) || (dst net 30.0.205.182/32))),
	((dst port 16999) || (dst port 26864) || (dst port 27048) || (dst port 35583) || (dst port 38457)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.16.205/32) || (dst net 31.0.17.61/32) || (dst net 31.0.30.118/32) || (dst net 31.0.221.243/32) || (dst net 31.0.240.172/32))),
	((dst port 43377) || (dst port 44940) || (dst port 54142) || (dst port 55649) || (dst port 60113)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.10.155/32) || (dst net 32.0.69.209/32) || (dst net 32.0.93.33/32) || (dst net 32.0.129.240/32) || (dst net 32.0.147.152/32))),
	((dst port 22201) || (dst port 32185) || (dst port 53117) || (dst port 53174) || (dst port 59837)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.11.176/32) || (dst net 33.0.51.203/32) || (dst net 33.0.97.156/32) || (dst net 33.0.122.91/32) || (dst net 33.0.235.62/32))),
	((dst port 27330) || (dst port 33900) || (dst port 50516) || (dst port 55003) || (dst port 57362)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.64.23/32) || (dst net 34.0.112.82/32) || (dst net 34.0.156.77/32) || (dst net 34.0.184.241/32) || (dst net 34.0.243.147/32))),
	((dst port 5605) || (dst port 26796) || (dst port 33801) || (dst port 55418) || (dst port 62049)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.73.3/32) || (dst net 35.0.127.52/32) || (dst net 35.0.183.225/32) || (dst net 35.0.230.119/32) || (dst net 35.0.248.96/32))),
	((dst port 788) || (dst port 2438) || (dst port 7137) || (dst port 24804) || (dst port 30713)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.63.12/32) || (dst net 36.0.67.146/32) || (dst net 36.0.75.23/32) || (dst net 36.0.153.13/32) || (dst net 36.0.184.23/32))),
	((dst port 4934) || (dst port 16794) || (dst port 30494) || (dst port 32846) || (dst port 57062)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.12.61/32) || (dst net 37.0.72.219/32) || (dst net 37.0.152.199/32) || (dst net 37.0.158.147/32) || (dst net 37.0.175.120/32))),
	((dst port 23497) || (dst port 23708) || (dst port 24045) || (dst port 29765) || (dst port 57873)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.31.239/32) || (dst net 38.0.101.77/32) || (dst net 38.0.146.177/32) || (dst net 38.0.164.216/32) || (dst net 38.0.179.35/32))),
	((dst port 10393) || (dst port 14761) || (dst port 19915) || (dst port 22797) || (dst port 33907)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.3.52/32) || (dst net 39.0.15.2/32) || (dst net 39.0.42.229/32) || (dst net 39.0.83.199/32) || (dst net 39.0.86.106/32))),
	((dst port 26528) || (dst port 37030) || (dst port 58818) || (dst port 59333) || (dst port 60034)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.1.46/32) || (dst net 40.0.28.69/32) || (dst net 40.0.42.131/32) || (dst net 40.0.64.91/32) || (dst net 40.0.149.105/32))),
	((dst port 2295) || (dst port 41620) || (dst port 47670) || (dst port 52539) || (dst port 63029)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.56.24/32) || (dst net 41.0.56.96/32) || (dst net 41.0.92.164/32) || (dst net 41.0.152.226/32) || (dst net 41.0.209.251/32))),
	((dst port 574) || (dst port 15279) || (dst port 19643) || (dst port 19870) || (dst port 43783)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.30.116/32) || (dst net 42.0.77.3/32) || (dst net 42.0.80.167/32) || (dst net 42.0.154.198/32) || (dst net 42.0.237.161/32))),
	((dst port 687) || (dst port 5489) || (dst port 12989) || (dst port 22821) || (dst port 46411)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.77.237/32) || (dst net 43.0.85.179/32) || (dst net 43.0.158.80/32) || (dst net 43.0.249.242/32) || (dst net 43.0.252.222/32))),
	((dst port 2685) || (dst port 10159) || (dst port 28327) || (dst port 32412) || (dst port 51754)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.105.124/32) || (dst net 44.0.140.239/32) || (dst net 44.0.146.2/32) || (dst net 44.0.154.125/32) || (dst net 44.0.169.104/32))),
	((dst port 9721) || (dst port 23657) || (dst port 24455) || (dst port 30323) || (dst port 60778)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.22.97/32) || (dst net 45.0.55.13/32) || (dst net 45.0.72.61/32) || (dst net 45.0.136.252/32) || (dst net 45.0.168.235/32))),
	((dst port 2896) || (dst port 28214) || (dst port 29246) || (dst port 48877) || (dst port 55959)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.5.195/32) || (dst net 46.0.23.200/32) || (dst net 46.0.96.226/32) || (dst net 46.0.137.202/32) || (dst net 46.0.230.243/32))),
	((dst port 15044) || (dst port 16594) || (dst port 29378) || (dst port 35205) || (dst port 64217)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.1.65/32) || (dst net 47.0.83.132/32) || (dst net 47.0.113.254/32) || (dst net 47.0.134.109/32) || (dst net 47.0.182.195/32))),
	((dst port 237) || (dst port 8630) || (dst port 12375) || (dst port 45124) || (dst port 64426)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.21.207/32) || (dst net 48.0.139.32/32) || (dst net 48.0.202.21/32) || (dst net 48.0.209.121/32) || (dst net 48.0.215.14/32))),
	((dst port 678) || (dst port 690) || (dst port 2191) || (dst port 6820) || (dst port 31160)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.79.17/32) || (dst net 49.0.80.188/32) || (dst net 49.0.167.111/32) || (dst net 49.0.229.197/32) || (dst net 49.0.233.248/32))),
	((dst port 344) || (dst port 10720) || (dst port 16612) || (dst port 17918) || (dst port 25947)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.83.216/32) || (dst net 50.0.101.233/32) || (dst net 50.0.112.206/32) || (dst net 50.0.186.11/32) || (dst net 50.0.242.108/32))),
	((dst port 6095) || (dst port 11809) || (dst port 40581) || (dst port 41568) || (dst port 60227)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.57.114/32) || (dst net 51.0.86.122/32) || (dst net 51.0.100.123/32) || (dst net 51.0.134.192/32) || (dst net 51.0.194.176/32))),
	((dst port 9215) || (dst port 10167) || (dst port 23543) || (dst port 32295) || (dst port 40626)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.27.5/32) || (dst net 52.0.36.79/32) || (dst net 52.0.58.5/32) || (dst net 52.0.194.226/32) || (dst net 52.0.244.87/32))),
	((dst port 14428) || (dst port 15120) || (dst port 36595) || (dst port 43810) || (dst port 64100)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.35.97/32) || (dst net 53.0.104.118/32) || (dst net 53.0.145.97/32) || (dst net 53.0.196.117/32) || (dst net 53.0.255.153/32))),
	((dst port 951) || (dst port 4414) || (dst port 10120) || (dst port 44200) || (dst port 64983)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.39.28/32) || (dst net 54.0.76.55/32) || (dst net 54.0.83.238/32) || (dst net 54.0.156.216/32) || (dst net 54.0.166.110/32))),
	((dst port 2973) || (dst port 6015) || (dst port 14482) || (dst port 35294) || (dst port 40211)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.5.129/32) || (dst net 55.0.73.17/32) || (dst net 55.0.90.146/32) || (dst net 55.0.138.141/32) || (dst net 55.0.239.164/32))),
	((dst port 4662) || (dst port 9990) || (dst port 15882) || (dst port 32058) || (dst port 59580)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.94.194/32) || (dst net 56.0.95.154/32) || (dst net 56.0.184.182/32) || (dst net 56.0.238.76/32) || (dst net 56.0.239.122/32))),
	((dst port 10045) || (dst port 18146) || (dst port 19407) || (dst port 38191) || (dst port 57143)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.52.77/32) || (dst net 57.0.103.81/32) || (dst net 57.0.163.67/32) || (dst net 57.0.175.239/32) || (dst net 57.0.239.236/32))),
	((dst port 4541) || (dst port 10231) || (dst port 41323) || (dst port 50282) || (dst port 54601)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.55.76/32) || (dst net 58.0.90.195/32) || (dst net 58.0.139.236/32) || (dst net 58.0.151.205/32) || (dst net 58.0.234.44/32))),
	((dst port 1031) || (dst port 11155) || (dst port 19520) || (dst port 46911) || (dst port 54016)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.21.220/32) || (dst net 59.0.71.3/32) || (dst net 59.0.127.60/32) || (dst net 59.0.241.156/32) || (dst net 59.0.242.9/32))),
	((dst port 9439) || (dst port 15777) || (dst port 39703) || (dst port 58962) || (dst port 64860)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.34.121/32) || (dst net 60.0.43.154/32) || (dst net 60.0.109.231/32) || (dst net 60.0.152.229/32) || (dst net 60.0.202.6/32))),
	((dst port 754) || (dst port 24830) || (dst port 28455) || (dst port 39776) || (dst port 46280)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.99.161/32) || (dst net 61.0.155.32/32) || (dst net 61.0.205.185/32) || (dst net 61.0.211.161/32) || (dst net 61.0.220.118/32))),
	((dst port 17925) || (dst port 24507) || (dst port 46381) || (dst port 57515) || (dst port 59843)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.0.251/32) || (dst net 62.0.87.179/32) || (dst net 62.0.127.154/32) || (dst net 62.0.146.238/32) || (dst net 62.0.173.77/32))),
	((dst port 22434) || (dst port 27714) || (dst port 40829) || (dst port 41951) || (dst port 44658)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.13.161/32) || (dst net 63.0.41.48/32) || (dst net 63.0.137.234/32) || (dst net 63.0.174.9/32) || (dst net 63.0.208.227/32))),
	((dst port 12652) || (dst port 21447) || (dst port 41549) || (dst port 41932) || (dst port 44167)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.15.174/32) || (dst net 64.0.43.105/32) || (dst net 64.0.62.25/32) || (dst net 64.0.142.253/32) || (dst net 64.0.227.93/32))),
	((dst port 3759) || (dst port 8286) || (dst port 40549) || (dst port 48353) || (dst port 61919)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.76.124/32) || (dst net 65.0.85.164/32) || (dst net 65.0.107.114/32) || (dst net 65.0.183.248/32) || (dst net 65.0.228.40/32))),
	((dst port 14094) || (dst port 21804) || (dst port 33201) || (dst port 47054) || (dst port 61752)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.23.208/32) || (dst net 66.0.103.142/32) || (dst net 66.0.115.238/32) || (dst net 66.0.146.16/32) || (dst net 66.0.252.142/32))),
	((dst port 334) || (dst port 9493) || (dst port 34708) || (dst port 45208) || (dst port 50432)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.22.251/32) || (dst net 67.0.50.97/32) || (dst net 67.0.149.124/32) || (dst net 67.0.196.195/32) || (dst net 67.0.216.201/32))),
	((dst port 24530) || (dst port 46120) || (dst port 54854) || (dst port 55183) || (dst port 61899)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.15.30/32) || (dst net 68.0.118.28/32) || (dst net 68.0.135.242/32) || (dst net 68.0.235.86/32) || (dst net 68.0.236.204/32))),
	((dst port 14423) || (dst port 21528) || (dst port 48892) || (dst port 58220) || (dst port 65486)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.32.235/32) || (dst net 69.0.54.24/32) || (dst net 69.0.73.211/32) || (dst net 69.0.77.201/32) || (dst net 69.0.170.139/32))),
	((dst port 11437) || (dst port 14078) || (dst port 21577) || (dst port 24408) || (dst port 27768)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.25.175/32) || (dst net 70.0.125.250/32) || (dst net 70.0.154.198/32) || (dst net 70.0.159.195/32) || (dst net 70.0.196.31/32))),
	((dst port 18664) || (dst port 21734) || (dst port 34271) || (dst port 54836) || (dst port 55951)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.73.226/32) || (dst net 71.0.97.111/32) || (dst net 71.0.153.104/32) || (dst net 71.0.162.229/32) || (dst net 71.0.171.134/32))),
	((dst port 30378) || (dst port 31289) || (dst port 37996) || (dst port 60544) || (dst port 64200)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.60.141/32) || (dst net 72.0.103.131/32) || (dst net 72.0.108.173/32) || (dst net 72.0.164.225/32) || (dst net 72.0.175.17/32))),
	((dst port 609) || (dst port 15358) || (dst port 38894) || (dst port 50638) || (dst port 61992)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.1.85/32) || (dst net 73.0.103.21/32) || (dst net 73.0.111.38/32) || (dst net 73.0.155.230/32) || (dst net 73.0.255.84/32))),
	((dst port 5341) || (dst port 13940) || (dst port 14510) || (dst port 39701) || (dst port 61221)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.60.221/32) || (dst net 74.0.80.87/32) || (dst net 74.0.88.54/32) || (dst net 74.0.102.206/32) || (dst net 74.0.213.47/32))),
	((dst port 27299) || (dst port 31526) || (dst port 36820) || (dst port 51308) || (dst port 63996)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.22.56/32) || (dst net 75.0.77.104/32) || (dst net 75.0.186.31/32) || (dst net 75.0.213.206/32) || (dst net 75.0.239.217/32))),
	((dst port 13727) || (dst port 30602) || (dst port 36588) || (dst port 53250) || (dst port 57221)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.95.174/32) || (dst net 76.0.143.151/32) || (dst net 76.0.193.237/32) || (dst net 76.0.200.135/32) || (dst net 76.0.206.2/32))),
	((dst port 2533) || (dst port 6155) || (dst port 19520) || (dst port 28915) || (dst port 54725)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.15.116/32) || (dst net 77.0.114.207/32) || (dst net 77.0.120.204/32) || (dst net 77.0.147.229/32) || (dst net 77.0.216.138/32))),
	((dst port 16777) || (dst port 31621) || (dst port 36751) || (dst port 38642) || (dst port 45454)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.16.50/32) || (dst net 78.0.20.218/32) || (dst net 78.0.113.47/32) || (dst net 78.0.175.98/32) || (dst net 78.0.204.19/32))),
	((dst port 2892) || (dst port 36303) || (dst port 51560) || (dst port 55106) || (dst port 60359)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.120.33/32) || (dst net 79.0.122.174/32) || (dst net 79.0.160.165/32) || (dst net 79.0.175.123/32) || (dst net 79.0.253.106/32))),
	((dst port 7708) || (dst port 34472) || (dst port 38393) || (dst port 56519) || (dst port 60299)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.69.216/32) || (dst net 80.0.102.87/32) || (dst net 80.0.187.12/32) || (dst net 80.0.192.188/32) || (dst net 80.0.229.76/32))),
	((dst port 2746) || (dst port 10895) || (dst port 24881) || (dst port 29900) || (dst port 56702)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.59.95/32) || (dst net 81.0.65.6/32) || (dst net 81.0.138.208/32) || (dst net 81.0.197.239/32) || (dst net 81.0.246.212/32))),
	((dst port 892) || (dst port 3462) || (dst port 24082) || (dst port 30388) || (dst port 57573)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.49.38/32) || (dst net 82.0.93.24/32) || (dst net 82.0.212.235/32) || (dst net 82.0.219.151/32) || (dst net 82.0.228.34/32))),
	((dst port 6958) || (dst port 9172) || (dst port 15637) || (dst port 26101) || (dst port 45281)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.29.89/32) || (dst net 83.0.137.161/32) || (dst net 83.0.149.176/32) || (dst net 83.0.222.232/32) || (dst net 83.0.229.146/32))),
	((dst port 27361) || (dst port 29875) || (dst port 41044) || (dst port 45645) || (dst port 51759)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.15.252/32) || (dst net 84.0.86.74/32) || (dst net 84.0.190.228/32) || (dst net 84.0.205.247/32) || (dst net 84.0.244.86/32))),
	((dst port 15853) || (dst port 30726) || (dst port 36138) || (dst port 42569) || (dst port 51244)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.70.147/32) || (dst net 85.0.152.73/32) || (dst net 85.0.174.146/32) || (dst net 85.0.190.105/32) || (dst net 85.0.194.214/32))),
	((dst port 6421) || (dst port 7556) || (dst port 42701) || (dst port 44957) || (dst port 58386)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.21.18/32) || (dst net 86.0.76.150/32) || (dst net 86.0.124.184/32) || (dst net 86.0.180.127/32) || (dst net 86.0.226.37/32))),
	((dst port 10243) || (dst port 19652) || (dst port 28490) || (dst port 50069) || (dst port 64748)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.3.172/32) || (dst net 87.0.36.134/32) || (dst net 87.0.50.31/32) || (dst net 87.0.161.5/32) || (dst net 87.0.216.165/32))),
	((dst port 7376) || (dst port 34729) || (dst port 35145) || (dst port 49911) || (dst port 57546)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.1.13/32) || (dst net 88.0.12.134/32) || (dst net 88.0.69.110/32) || (dst net 88.0.107.213/32) || (dst net 88.0.254.7/32))),
	((dst port 1662) || (dst port 14884) || (dst port 29847) || (dst port 44225) || (dst port 61403)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.38.65/32) || (dst net 89.0.103.84/32) || (dst net 89.0.122.122/32) || (dst net 89.0.177.143/32) || (dst net 89.0.207.248/32))),
	((dst port 5944) || (dst port 23597) || (dst port 35204) || (dst port 55993) || (dst port 62183)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.44.253/32) || (dst net 90.0.77.196/32) || (dst net 90.0.100.62/32) || (dst net 90.0.158.109/32) || (dst net 90.0.235.19/32))),
	((dst port 30547) || (dst port 40088) || (dst port 43365) || (dst port 50531) || (dst port 59624)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.11.90/32) || (dst net 91.0.47.231/32) || (dst net 91.0.87.125/32) || (dst net 91.0.120.43/32) || (dst net 91.0.214.250/32))),
	((dst port 6262) || (dst port 28124) || (dst port 35625) || (dst port 61807) || (dst port 65359)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.35.64/32) || (dst net 92.0.82.90/32) || (dst net 92.0.95.226/32) || (dst net 92.0.109.188/32) || (dst net 92.0.132.231/32))),
	((dst port 16476) || (dst port 23866) || (dst port 37074) || (dst port 38857) || (dst port 49145)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.57.185/32) || (dst net 93.0.152.3/32) || (dst net 93.0.180.52/32) || (dst net 93.0.191.104/32) || (dst net 93.0.244.213/32))),
	((dst port 8461) || (dst port 12773) || (dst port 22658) || (dst port 44836) || (dst port 52140)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.50.25/32) || (dst net 94.0.70.240/32) || (dst net 94.0.78.137/32) || (dst net 94.0.229.149/32) || (dst net 94.0.254.168/32))),
	((dst port 313) || (dst port 13085) || (dst port 44398) || (dst port 44672) || (dst port 58024)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.43.22/32) || (dst net 95.0.170.44/32) || (dst net 95.0.209.201/32) || (dst net 95.0.230.56/32) || (dst net 95.0.234.76/32))),
	((dst port 843) || (dst port 8924) || (dst port 25444) || (dst port 28099) || (dst port 40823)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.101.170/32) || (dst net 96.0.103.135/32) || (dst net 96.0.125.183/32) || (dst net 96.0.176.42/32) || (dst net 96.0.189.182/32))),
	((dst port 5156) || (dst port 14309) || (dst port 18634) || (dst port 39921) || (dst port 49691)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.21.40/32) || (dst net 97.0.25.203/32) || (dst net 97.0.75.26/32) || (dst net 97.0.94.31/32) || (dst net 97.0.122.115/32))),
	((dst port 1541) || (dst port 5664) || (dst port 11733) || (dst port 20037) || (dst port 37321)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.39.237/32) || (dst net 98.0.62.69/32) || (dst net 98.0.151.152/32) || (dst net 98.0.213.223/32) || (dst net 98.0.243.103/32))),
	((dst port 6830) || (dst port 25810) || (dst port 34565) || (dst port 47685) || (dst port 64401)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.3.157/32) || (dst net 99.0.50.94/32) || (dst net 99.0.125.127/32) || (dst net 99.0.179.244/32) || (dst net 99.0.203.212/32))),
	((dst port 3266) || (dst port 10426) || (dst port 20064) || (dst port 42696) || (dst port 51784)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.72.75/32) || (dst net 100.0.111.103/32) || (dst net 100.0.170.201/32) || (dst net 100.0.176.233/32) || (dst net 100.0.224.54/32))),
	((dst port 12505) || (dst port 48036) || (dst port 51570) || (dst port 53907) || (dst port 62066)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.63.53/32) || (dst net 101.0.109.18/32) || (dst net 101.0.157.105/32) || (dst net 101.0.161.245/32) || (dst net 101.0.179.238/32))),
	((dst port 7890) || (dst port 16867) || (dst port 28833) || (dst port 34921) || (dst port 43594)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.73.238/32) || (dst net 102.0.122.135/32) || (dst net 102.0.168.165/32) || (dst net 102.0.208.33/32) || (dst net 102.0.222.31/32))),
	((dst port 4380) || (dst port 32255) || (dst port 45143) || (dst port 53698) || (dst port 59727)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.52.199/32) || (dst net 103.0.131.245/32) || (dst net 103.0.175.183/32) || (dst net 103.0.243.52/32) || (dst net 103.0.243.144/32))),
	((dst port 32953) || (dst port 33673) || (dst port 39723) || (dst port 58982) || (dst port 59222)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.149.65/32) || (dst net 104.0.157.213/32) || (dst net 104.0.179.195/32) || (dst net 104.0.241.214/32) || (dst net 104.0.250.121/32))),
	((dst port 3142) || (dst port 7020) || (dst port 9752) || (dst port 31505) || (dst port 31523)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.17.164/32) || (dst net 105.0.40.230/32) || (dst net 105.0.50.162/32) || (dst net 105.0.52.110/32) || (dst net 105.0.208.69/32))),
	((dst port 8771) || (dst port 9013) || (dst port 19778) || (dst port 32498) || (dst port 39927)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.17.147/32) || (dst net 106.0.82.148/32) || (dst net 106.0.128.11/32) || (dst net 106.0.236.241/32) || (dst net 106.0.238.10/32))),
	((dst port 1101) || (dst port 5705) || (dst port 27471) || (dst port 49600) || (dst port 59158)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.81.8/32) || (dst net 107.0.101.156/32) || (dst net 107.0.125.185/32) || (dst net 107.0.207.100/32) || (dst net 107.0.217.106/32))),
	((dst port 27716) || (dst port 41117) || (dst port 52429) || (dst port 57343) || (dst port 57867)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.20.217/32) || (dst net 108.0.32.24/32) || (dst net 108.0.177.105/32) || (dst net 108.0.223.163/32) || (dst net 108.0.253.113/32))),
	((dst port 8059) || (dst port 38126) || (dst port 40270) || (dst port 51008) || (dst port 62752)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.28.17/32) || (dst net 109.0.70.228/32) || (dst net 109.0.132.26/32) || (dst net 109.0.150.183/32) || (dst net 109.0.205.168/32))),
	((dst port 16088) || (dst port 26644) || (dst port 31431) || (dst port 34636) || (dst port 64782)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.5.94/32) || (dst net 110.0.104.113/32) || (dst net 110.0.107.175/32) || (dst net 110.0.158.65/32) || (dst net 110.0.169.62/32))),
	((dst port 37944) || (dst port 44628) || (dst port 47866) || (dst port 48640) || (dst port 61407)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.31.164/32) || (dst net 111.0.77.68/32) || (dst net 111.0.177.92/32) || (dst net 111.0.224.125/32) || (dst net 111.0.233.56/32))),
	((dst port 2302) || (dst port 23913) || (dst port 23984) || (dst port 38737) || (dst port 56867)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.11.159/32) || (dst net 112.0.25.127/32) || (dst net 112.0.30.217/32) || (dst net 112.0.48.94/32) || (dst net 112.0.92.177/32))),
	((dst port 19414) || (dst port 26900) || (dst port 33307) || (dst port 44185) || (dst port 54980)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.16.213/32) || (dst net 113.0.69.83/32) || (dst net 113.0.90.36/32) || (dst net 113.0.112.134/32) || (dst net 113.0.210.138/32))),
	((dst port 7356) || (dst port 13609) || (dst port 20733) || (dst port 28497) || (dst port 64489)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.93.233/32) || (dst net 114.0.155.21/32) || (dst net 114.0.171.80/32) || (dst net 114.0.176.226/32) || (dst net 114.0.222.79/32))),
	((dst port 11491) || (dst port 16520) || (dst port 47771) || (dst port 52491) || (dst port 60306)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.2.126/32) || (dst net 115.0.18.169/32) || (dst net 115.0.73.165/32) || (dst net 115.0.162.143/32) || (dst net 115.0.215.121/32))),
	((dst port 8731) || (dst port 15856) || (dst port 16582) || (dst port 30988) || (dst port 60555)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.46.20/32) || (dst net 116.0.104.246/32) || (dst net 116.0.141.204/32) || (dst net 116.0.158.182/32) || (dst net 116.0.204.42/32))),
	((dst port 2100) || (dst port 28865) || (dst port 31070) || (dst port 37987) || (dst port 47010)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.39.233/32) || (dst net 117.0.67.126/32) || (dst net 117.0.96.153/32) || (dst net 117.0.234.175/32) || (dst net 117.0.248.31/32))),
	((dst port 2991) || (dst port 21472) || (dst port 29260) || (dst port 36183) || (dst port 45508)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.124.76/32) || (dst net 118.0.135.105/32) || (dst net 118.0.190.9/32) || (dst net 118.0.215.33/32) || (dst net 118.0.241.217/32))),
	((dst port 507) || (dst port 5776) || (dst port 9379) || (dst port 16740) || (dst port 37668)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.8.62/32) || (dst net 119.0.54.185/32) || (dst net 119.0.56.237/32) || (dst net 119.0.191.64/32) || (dst net 119.0.203.29/32))),
	((dst port 1900) || (dst port 9243) || (dst port 23196) || (dst port 31265) || (dst port 43093)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.21.4/32) || (dst net 120.0.56.180/32) || (dst net 120.0.97.23/32) || (dst net 120.0.228.53/32) || (dst net 120.0.238.126/32))),
	((dst port 3923) || (dst port 6430) || (dst port 8352) || (dst port 32693) || (dst port 59737)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.41.115/32) || (dst net 121.0.95.38/32) || (dst net 121.0.128.244/32) || (dst net 121.0.182.20/32) || (dst net 121.0.197.249/32))),
	((dst port 5495) || (dst port 13210) || (dst port 52213) || (dst port 57524) || (dst port 58367)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.52.207/32) || (dst net 122.0.135.57/32) || (dst net 122.0.137.196/32) || (dst net 122.0.141.63/32) || (dst net 122.0.249.99/32))),
	((dst port 9029) || (dst port 18260) || (dst port 29683) || (dst port 29941) || (dst port 53645)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.95.86/32) || (dst net 123.0.100.110/32) || (dst net 123.0.170.159/32) || (dst net 123.0.204.46/32) || (dst net 123.0.254.185/32))),
	((dst port 10642) || (dst port 13339) || (dst port 20929) || (dst port 43373) || (dst port 62444)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.16.10/32) || (dst net 124.0.63.38/32) || (dst net 124.0.173.102/32) || (dst net 124.0.218.216/32) || (dst net 124.0.231.57/32))),
	((dst port 1949) || (dst port 22581) || (dst port 33056) || (dst port 44256) || (dst port 53832)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.6.240/32) || (dst net 125.0.24.126/32) || (dst net 125.0.128.65/32) || (dst net 125.0.227.96/32) || (dst net 125.0.238.210/32))),
	((dst port 14441) || (dst port 25372) || (dst port 38283) || (dst port 43851) || (dst port 51566)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.32.165/32) || (dst net 126.0.55.220/32) || (dst net 126.0.83.56/32) || (dst net 126.0.149.20/32) || (dst net 126.0.149.146/32))),
	((dst port 9156) || (dst port 13258) || (dst port 16404) || (dst port 21535) || (dst port 53431)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.18.185/32) || (dst net 127.0.21.133/32) || (dst net 127.0.48.169/32) || (dst net 127.0.155.180/32) || (dst net 127.0.236.228/32))),
	((dst port 21895) || (dst port 41253) || (dst port 50618) || (dst port 61700) || (dst port 64729)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.145.213/32) || (dst net 128.0.187.98/32) || (dst net 128.0.188.177/32) || (dst net 128.0.193.0/32) || (dst net 128.0.201.46/32))),
	((dst port 361) || (dst port 18478) || (dst port 36978) || (dst port 46786) || (dst port 55167)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.6.151/32) || (dst net 129.0.116.80/32) || (dst net 129.0.201.57/32) || (dst net 129.0.211.122/32) || (dst net 129.0.247.47/32))),
	((dst port 25150) || (dst port 38077) || (dst port 44904) || (dst port 54725) || (dst port 61565)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.0.136/32) || (dst net 130.0.128.6/32) || (dst net 130.0.144.139/32) || (dst net 130.0.157.71/32) || (dst net 130.0.217.34/32))),
	((dst port 22276) || (dst port 44970) || (dst port 47256) || (dst port 55318) || (dst port 56412)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.20.118/32) || (dst net 131.0.55.196/32) || (dst net 131.0.75.213/32) || (dst net 131.0.98.152/32) || (dst net 131.0.126.29/32))),
	((dst port 6221) || (dst port 15344) || (dst port 28791) || (dst port 30202) || (dst port 48041)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.1.250/32) || (dst net 132.0.36.193/32) || (dst net 132.0.147.249/32) || (dst net 132.0.154.218/32) || (dst net 132.0.239.242/32))),
	((dst port 23679) || (dst port 41645) || (dst port 43644) || (dst port 49743) || (dst port 57066)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.0.51/32) || (dst net 133.0.23.77/32) || (dst net 133.0.25.125/32) || (dst net 133.0.108.219/32) || (dst net 133.0.138.63/32))),
	((dst port 7367) || (dst port 17116) || (dst port 29432) || (dst port 58764) || (dst port 62005)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.12.65/32) || (dst net 134.0.29.12/32) || (dst net 134.0.49.0/32) || (dst net 134.0.162.190/32) || (dst net 134.0.163.116/32))),
	((dst port 2618) || (dst port 18388) || (dst port 29258) || (dst port 43732) || (dst port 49456)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.18.249/32) || (dst net 135.0.156.29/32) || (dst net 135.0.189.159/32) || (dst net 135.0.210.171/32) || (dst net 135.0.219.117/32))),
	((dst port 8906) || (dst port 10066) || (dst port 11745) || (dst port 11979) || (dst port 64899)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.47.73/32) || (dst net 136.0.56.96/32) || (dst net 136.0.91.105/32) || (dst net 136.0.210.228/32) || (dst net 136.0.236.235/32))),
	((dst port 12799) || (dst port 19358) || (dst port 21092) || (dst port 48572) || (dst port 64975)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.13.151/32) || (dst net 137.0.64.13/32) || (dst net 137.0.103.179/32) || (dst net 137.0.114.180/32) || (dst net 137.0.131.43/32))),
	((dst port 28213) || (dst port 29396) || (dst port 46194) || (dst port 50955) || (dst port 55472)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.17.0/32) || (dst net 138.0.64.102/32) || (dst net 138.0.100.84/32) || (dst net 138.0.199.170/32) || (dst net 138.0.205.247/32))),
	((dst port 22221) || (dst port 27225) || (dst port 33724) || (dst port 49680) || (dst port 56369)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.10.5/32) || (dst net 139.0.29.222/32) || (dst net 139.0.97.251/32) || (dst net 139.0.157.117/32) || (dst net 139.0.204.204/32))),
	((dst port 4762) || (dst port 17845) || (dst port 26230) || (dst port 30330) || (dst port 46330)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.48.121/32) || (dst net 140.0.62.120/32) || (dst net 140.0.64.222/32) || (dst net 140.0.173.73/32) || (dst net 140.0.220.74/32))),
	((dst port 6662) || (dst port 18470) || (dst port 20564) || (dst port 31497) || (dst port 39482)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.69.5/32) || (dst net 141.0.74.71/32) || (dst net 141.0.112.6/32) || (dst net 141.0.130.240/32) || (dst net 141.0.135.41/32))),
	((dst port 11111) || (dst port 18478) || (dst port 30038) || (dst port 35134) || (dst port 46319)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.52.89/32) || (dst net 142.0.164.121/32) || (dst net 142.0.193.192/32) || (dst net 142.0.219.227/32) || (dst net 142.0.221.243/32))),
	((dst port 9217) || (dst port 23733) || (dst port 31784) || (dst port 32235) || (dst port 44353)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.38.178/32) || (dst net 143.0.172.230/32) || (dst net 143.0.174.85/32) || (dst net 143.0.219.161/32) || (dst net 143.0.226.96/32))),
	((dst port 35226) || (dst port 43324) || (dst port 43327) || (dst port 56747) || (dst port 58959)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.24.64/32) || (dst net 144.0.57.88/32) || (dst net 144.0.99.14/32) || (dst net 144.0.202.150/32) || (dst net 144.0.208.90/32))),
	((dst port 24611) || (dst port 24747) || (dst port 30211) || (dst port 30799) || (dst port 48918)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.25.113/32) || (dst net 145.0.51.236/32) || (dst net 145.0.106.167/32) || (dst net 145.0.200.148/32) || (dst net 145.0.206.173/32))),
	((dst port 11462) || (dst port 39177) || (dst port 52733) || (dst port 56767) || (dst port 60584)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.38.80/32) || (dst net 146.0.62.174/32) || (dst net 146.0.89.123/32) || (dst net 146.0.109.129/32) || (dst net 146.0.254.31/32))),
	((dst port 5195) || (dst port 12533) || (dst port 18472) || (dst port 19866) || (dst port 49356)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.84.120/32) || (dst net 147.0.86.243/32) || (dst net 147.0.117.191/32) || (dst net 147.0.166.202/32) || (dst net 147.0.232.118/32))),
	((dst port 4717) || (dst port 21934) || (dst port 36822) || (dst port 38087) || (dst port 56610)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.1.63/32) || (dst net 148.0.12.120/32) || (dst net 148.0.12.191/32) || (dst net 148.0.60.180/32) || (dst net 148.0.74.69/32))),
	((dst port 8516) || (dst port 27179) || (dst port 27839) || (dst port 41077) || (dst port 63773)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.5.68/32) || (dst net 149.0.51.59/32) || (dst net 149.0.108.143/32) || (dst net 149.0.194.121/32) || (dst net 149.0.241.29/32))),
	((dst port 5211) || (dst port 13309) || (dst port 28585) || (dst port 42734) || (dst port 44249)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.30.141/32) || (dst net 150.0.34.131/32) || (dst net 150.0.144.99/32) || (dst net 150.0.209.146/32) || (dst net 150.0.225.205/32))),
	((dst port 4429) || (dst port 15781) || (dst port 57833) || (dst port 58944) || (dst port 63907)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.62.115/32) || (dst net 151.0.101.90/32) || (dst net 151.0.108.236/32) || (dst net 151.0.215.228/32) || (dst net 151.0.223.145/32))),
	((dst port 7550) || (dst port 13026) || (dst port 25838) || (dst port 36624) || (dst port 51067)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.61.178/32) || (dst net 152.0.84.47/32) || (dst net 152.0.94.51/32) || (dst net 152.0.139.1/32) || (dst net 152.0.228.40/32))),
	((dst port 34192) || (dst port 39332) || (dst port 44163) || (dst port 46921) || (dst port 47150)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.0.91/32) || (dst net 153.0.66.31/32) || (dst net 153.0.72.97/32) || (dst net 153.0.122.219/32) || (dst net 153.0.166.87/32))),
	((dst port 5225) || (dst port 19973) || (dst port 22030) || (dst port 53961) || (dst port 61495)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.23.128/32) || (dst net 154.0.147.200/32) || (dst net 154.0.211.147/32) || (dst net 154.0.247.67/32) || (dst net 154.0.247.89/32))),
	((dst port 8807) || (dst port 30034) || (dst port 36214) || (dst port 61128) || (dst port 62964)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.22.230/32) || (dst net 155.0.106.76/32) || (dst net 155.0.118.176/32) || (dst net 155.0.128.74/32) || (dst net 155.0.173.97/32))),
	((dst port 21957) || (dst port 39333) || (dst port 54399) || (dst port 56055) || (dst port 65408)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.22.36/32) || (dst net 156.0.25.223/32) || (dst net 156.0.111.19/32) || (dst net 156.0.125.31/32) || (dst net 156.0.154.133/32))),
	((dst port 34580) || (dst port 38922) || (dst port 48573) || (dst port 62222) || (dst port 64890)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.24.162/32) || (dst net 157.0.48.231/32) || (dst net 157.0.64.90/32) || (dst net 157.0.155.149/32) || (dst net 157.0.233.82/32))),
	((dst port 14659) || (dst port 18776) || (dst port 18828) || (dst port 27425) || (dst port 34272)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.75.101/32) || (dst net 158.0.80.246/32) || (dst net 158.0.113.170/32) || (dst net 158.0.139.194/32) || (dst net 158.0.191.231/32))),
	((dst port 3002) || (dst port 26363) || (dst port 55619) || (dst port 62037) || (dst port 64679)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.9.82/32) || (dst net 159.0.25.130/32) || (dst net 159.0.34.140/32) || (dst net 159.0.164.28/32) || (dst net 159.0.165.161/32))),
	((dst port 630) || (dst port 25158) || (dst port 40732) || (dst port 44930) || (dst port 59014)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.62.15/32) || (dst net 160.0.98.217/32) || (dst net 160.0.121.93/32) || (dst net 160.0.172.159/32) || (dst net 160.0.219.22/32))),
	((dst port 5782) || (dst port 17167) || (dst port 28676) || (dst port 54892) || (dst port 59089)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.110.81/32) || (dst net 161.0.130.164/32) || (dst net 161.0.179.19/32) || (dst net 161.0.180.219/32) || (dst net 161.0.201.233/32))),
	((dst port 8157) || (dst port 29495) || (dst port 59700) || (dst port 61068) || (dst port 62088)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.48.32/32) || (dst net 162.0.50.87/32) || (dst net 162.0.99.3/32) || (dst net 162.0.110.139/32) || (dst net 162.0.149.13/32))),
	((dst port 8054) || (dst port 11118) || (dst port 14679) || (dst port 29948) || (dst port 39425)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.4.141/32) || (dst net 163.0.31.120/32) || (dst net 163.0.49.196/32) || (dst net 163.0.93.123/32) || (dst net 163.0.205.54/32))),
	((dst port 2125) || (dst port 26777) || (dst port 46150) || (dst port 57905) || (dst port 64476)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.128.188/32) || (dst net 164.0.135.194/32) || (dst net 164.0.142.199/32) || (dst net 164.0.180.33/32) || (dst net 164.0.197.118/32))),
	((dst port 30827) || (dst port 38465) || (dst port 41012) || (dst port 41519) || (dst port 42293)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.22.189/32) || (dst net 165.0.27.23/32) || (dst net 165.0.45.61/32) || (dst net 165.0.51.50/32) || (dst net 165.0.245.116/32))),
	((dst port 5140) || (dst port 11248) || (dst port 29967) || (dst port 37442) || (dst port 59689)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.92.209/32) || (dst net 166.0.146.144/32) || (dst net 166.0.174.95/32) || (dst net 166.0.234.117/32) || (dst net 166.0.255.57/32))),
	((dst port 6347) || (dst port 24007) || (dst port 39654) || (dst port 41821) || (dst port 42584)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.44.229/32) || (dst net 167.0.97.172/32) || (dst net 167.0.110.91/32) || (dst net 167.0.150.43/32) || (dst net 167.0.249.197/32))),
	((dst port 81) || (dst port 1670) || (dst port 17426) || (dst port 17988) || (dst port 50697)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.37.178/32) || (dst net 168.0.115.252/32) || (dst net 168.0.126.47/32) || (dst net 168.0.175.51/32) || (dst net 168.0.252.236/32))),
	((dst port 20668) || (dst port 26873) || (dst port 28867) || (dst port 34889) || (dst port 37092)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.25.23/32) || (dst net 169.0.78.147/32) || (dst net 169.0.135.97/32) || (dst net 169.0.212.115/32) || (dst net 169.0.220.218/32))),
	((dst port 2495) || (dst port 42565) || (dst port 49217) || (dst port 57200) || (dst port 64600)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.9.84/32) || (dst net 170.0.51.11/32) || (dst net 170.0.140.92/32) || (dst net 170.0.144.91/32) || (dst net 170.0.216.47/32))),
	((dst port 19664) || (dst port 29944) || (dst port 48600) || (dst port 58494) || (dst port 64332)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.48.168/32) || (dst net 171.0.118.236/32) || (dst net 171.0.154.209/32) || (dst net 171.0.188.112/32) || (dst net 171.0.214.162/32))),
	((dst port 426) || (dst port 1473) || (dst port 28789) || (dst port 40942) || (dst port 61387)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.11.129/32) || (dst net 172.0.116.98/32) || (dst net 172.0.149.73/32) || (dst net 172.0.186.30/32) || (dst net 172.0.218.227/32))),
	((dst port 6816) || (dst port 33032) || (dst port 54414) || (dst port 62676) || (dst port 64445)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.51.120/32) || (dst net 173.0.83.143/32) || (dst net 173.0.85.129/32) || (dst net 173.0.116.124/32) || (dst net 173.0.222.128/32))),
	((dst port 605) || (dst port 18623) || (dst port 48864) || (dst port 51307) || (dst port 55948)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.42.251/32) || (dst net 174.0.59.30/32) || (dst net 174.0.68.50/32) || (dst net 174.0.108.5/32) || (dst net 174.0.176.167/32))),
	((dst port 1153) || (dst port 13328) || (dst port 16125) || (dst port 41370) || (dst port 56446)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.35.203/32) || (dst net 175.0.61.110/32) || (dst net 175.0.155.59/32) || (dst net 175.0.215.67/32) || (dst net 175.0.255.141/32))),
	((dst port 3641) || (dst port 21525) || (dst port 27829) || (dst port 46864) || (dst port 52043)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.68.71/32) || (dst net 176.0.101.111/32) || (dst net 176.0.118.24/32) || (dst net 176.0.220.19/32) || (dst net 176.0.238.70/32))),
	((dst port 4048) || (dst port 14627) || (dst port 15437) || (dst port 57208) || (dst port 62443)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.25.172/32) || (dst net 177.0.32.126/32) || (dst net 177.0.90.124/32) || (dst net 177.0.99.115/32) || (dst net 177.0.144.158/32))),
	((dst port 87) || (dst port 22151) || (dst port 28243) || (dst port 41208) || (dst port 45102)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.22.174/32) || (dst net 178.0.40.44/32) || (dst net 178.0.48.3/32) || (dst net 178.0.89.40/32) || (dst net 178.0.125.27/32))),
	((dst port 5528) || (dst port 6263) || (dst port 8617) || (dst port 47503) || (dst port 63376)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.30.50/32) || (dst net 179.0.95.55/32) || (dst net 179.0.111.13/32) || (dst net 179.0.142.49/32) || (dst net 179.0.245.158/32))),
	((dst port 27311) || (dst port 50997) || (dst port 52322) || (dst port 55507) || (dst port 60853)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.33.222/32) || (dst net 180.0.44.75/32) || (dst net 180.0.148.96/32) || (dst net 180.0.227.48/32) || (dst net 180.0.252.36/32))),
	((dst port 4790) || (dst port 18658) || (dst port 25553) || (dst port 39065) || (dst port 45898)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.2.95/32) || (dst net 181.0.31.27/32) || (dst net 181.0.39.123/32) || (dst net 181.0.210.200/32) || (dst net 181.0.226.244/32))),
	((dst port 6338) || (dst port 11313) || (dst port 26157) || (dst port 27870) || (dst port 61713)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.6.113/32) || (dst net 182.0.120.76/32) || (dst net 182.0.200.139/32) || (dst net 182.0.208.184/32) || (dst net 182.0.248.126/32))),
	((dst port 6078) || (dst port 21564) || (dst port 45113) || (dst port 45634) || (dst port 54888)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.53.246/32) || (dst net 183.0.73.47/32) || (dst net 183.0.140.45/32) || (dst net 183.0.181.195/32) || (dst net 183.0.193.162/32))),
	((dst port 8315) || (dst port 14948) || (dst port 15567) || (dst port 29981) || (dst port 30241)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.1.3/32) || (dst net 184.0.47.118/32) || (dst net 184.0.170.185/32) || (dst net 184.0.247.243/32) || (dst net 184.0.251.132/32))),
	((dst port 12263) || (dst port 20675) || (dst port 50205) || (dst port 61027) || (dst port 64378)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.71.67/32) || (dst net 185.0.119.52/32) || (dst net 185.0.139.103/32) || (dst net 185.0.150.132/32) || (dst net 185.0.248.54/32))),
	((dst port 23172) || (dst port 34702) || (dst port 48270) || (dst port 54207) || (dst port 62986)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.22.111/32) || (dst net 186.0.56.101/32) || (dst net 186.0.106.114/32) || (dst net 186.0.129.136/32) || (dst net 186.0.228.98/32))),
	((dst port 16903) || (dst port 20767) || (dst port 35720) || (dst port 44591) || (dst port 58279)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.6.57/32) || (dst net 187.0.16.88/32) || (dst net 187.0.78.32/32) || (dst net 187.0.93.234/32) || (dst net 187.0.125.144/32))),
	((dst port 18427) || (dst port 26337) || (dst port 42612) || (dst port 56221) || (dst port 57771)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.5.214/32) || (dst net 188.0.47.88/32) || (dst net 188.0.73.120/32) || (dst net 188.0.77.20/32) || (dst net 188.0.191.116/32))),
	((dst port 87) || (dst port 39243) || (dst port 56338) || (dst port 58398) || (dst port 63037)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.55.101/32) || (dst net 189.0.56.33/32) || (dst net 189.0.223.223/32) || (dst net 189.0.228.192/32) || (dst net 189.0.241.152/32))),
	((dst port 16706) || (dst port 21692) || (dst port 25757) || (dst port 29429) || (dst port 63515)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.24.8/32) || (dst net 190.0.89.20/32) || (dst net 190.0.91.59/32) || (dst net 190.0.133.206/32) || (dst net 190.0.210.229/32))),
	((dst port 4917) || (dst port 13103) || (dst port 19219) || (dst port 24863) || (dst port 47560)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.44.201/32) || (dst net 191.0.51.164/32) || (dst net 191.0.62.32/32) || (dst net 191.0.117.153/32) || (dst net 191.0.184.104/32))),
	((dst port 3330) || (dst port 5520) || (dst port 41572) || (dst port 43578) || (dst port 46604)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.27.55/32) || (dst net 192.0.27.160/32) || (dst net 192.0.163.81/32) || (dst net 192.0.200.187/32) || (dst net 192.0.219.33/32))),
	((dst port 5162) || (dst port 11863) || (dst port 17867) || (dst port 40796) || (dst port 59402)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.67.11/32) || (dst net 193.0.108.165/32) || (dst net 193.0.121.146/32) || (dst net 193.0.142.11/32) || (dst net 193.0.152.154/32))),
	((dst port 22947) || (dst port 48009) || (dst port 48930) || (dst port 61994) || (dst port 62600)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.36.105/32) || (dst net 194.0.51.11/32) || (dst net 194.0.86.65/32) || (dst net 194.0.130.92/32) || (dst net 194.0.210.248/32))),
	((dst port 2509) || (dst port 39709) || (dst port 51234) || (dst port 54057) || (dst port 64082)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.53.216/32) || (dst net 195.0.74.211/32) || (dst net 195.0.84.71/32) || (dst net 195.0.220.159/32) || (dst net 195.0.228.229/32))),
	((dst port 15014) || (dst port 21881) || (dst port 26513) || (dst port 27246) || (dst port 42052)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.49.216/32) || (dst net 196.0.80.154/32) || (dst net 196.0.87.228/32) || (dst net 196.0.117.86/32) || (dst net 196.0.158.93/32))),
	((dst port 3479) || (dst port 15404) || (dst port 26647) || (dst port 30812) || (dst port 45892)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.19.185/32) || (dst net 197.0.53.144/32) || (dst net 197.0.88.192/32) || (dst net 197.0.144.95/32) || (dst net 197.0.209.51/32))),
	((dst port 26741) || (dst port 37112) || (dst port 48295) || (dst port 55286) || (dst port 64409)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.43.227/32) || (dst net 198.0.68.57/32) || (dst net 198.0.150.12/32) || (dst net 198.0.182.223/32) || (dst net 198.0.197.97/32))),
	((dst port 21401) || (dst port 24171) || (dst port 28872) || (dst port 38101) || (dst port 46116)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.38.80/32) || (dst net 199.0.50.151/32) || (dst net 199.0.93.203/32) || (dst net 199.0.102.183/32) || (dst net 199.0.123.125/32))),
	((dst port 30320) || (dst port 30848) || (dst port 35935) || (dst port 58636) || (dst port 62429)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.21.100/32) || (dst net 200.0.125.68/32) || (dst net 200.0.185.121/32) || (dst net 200.0.193.32/32) || (dst net 200.0.233.9/32))),
	((dst port 5368) || (dst port 23649) || (dst port 49499) || (dst port 52310) || (dst port 55737)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.23.98/32) || (dst net 201.0.34.72/32) || (dst net 201.0.156.17/32) || (dst net 201.0.222.136/32) || (dst net 201.0.234.209/32))),
	((dst port 12404) || (dst port 22304) || (dst port 34736) || (dst port 61741) || (dst port 63262)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.71.198/32) || (dst net 202.0.125.55/32) || (dst net 202.0.133.112/32) || (dst net 202.0.207.43/32) || (dst net 202.0.217.247/32))),
	((dst port 6401) || (dst port 15140) || (dst port 24109) || (dst port 49033) || (dst port 54928)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.74.140/32) || (dst net 203.0.143.229/32) || (dst net 203.0.172.205/32) || (dst net 203.0.193.236/32) || (dst net 203.0.247.144/32))),
	((dst port 18048) || (dst port 24382) || (dst port 41768) || (dst port 53497) || (dst port 60405)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.74.189/32) || (dst net 204.0.78.204/32) || (dst net 204.0.91.246/32) || (dst net 204.0.101.53/32) || (dst net 204.0.158.135/32))),
	((dst port 20750) || (dst port 21312) || (dst port 26472) || (dst port 35709) || (dst port 47866)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.7.143/32) || (dst net 205.0.40.142/32) || (dst net 205.0.106.179/32) || (dst net 205.0.107.213/32) || (dst net 205.0.152.193/32))),
	((dst port 7982) || (dst port 12134) || (dst port 13091) || (dst port 47794) || (dst port 54364)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.82.33/32) || (dst net 206.0.163.202/32) || (dst net 206.0.170.147/32) || (dst net 206.0.236.255/32) || (dst net 206.0.238.155/32))),
	((dst port 15760) || (dst port 42298) || (dst port 46016) || (dst port 47205) || (dst port 54743)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.33.39/32) || (dst net 207.0.35.106/32) || (dst net 207.0.167.176/32) || (dst net 207.0.174.103/32) || (dst net 207.0.239.252/32))),
	((dst port 9062) || (dst port 17367) || (dst port 29419) || (dst port 33746) || (dst port 53771)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.191.185/32) || (dst net 208.0.225.228/32) || (dst net 208.0.250.45/32) || (dst net 208.0.252.140/32) || (dst net 208.0.255.94/32))),
	((dst port 2021) || (dst port 19937) || (dst port 35885) || (dst port 43252) || (dst port 62381)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.27.20/32) || (dst net 209.0.135.221/32) || (dst net 209.0.135.248/32) || (dst net 209.0.141.7/32) || (dst net 209.0.182.168/32))),
	((dst port 10839) || (dst port 11455) || (dst port 30350) || (dst port 48461) || (dst port 48795)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.53.155/32) || (dst net 210.0.105.139/32) || (dst net 210.0.124.175/32) || (dst net 210.0.145.65/32) || (dst net 210.0.154.192/32))),
	((dst port 2947) || (dst port 6676) || (dst port 17859) || (dst port 23300) || (dst port 63129)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.62.221/32) || (dst net 211.0.90.35/32) || (dst net 211.0.160.203/32) || (dst net 211.0.171.39/32) || (dst net 211.0.225.106/32))),
	((dst port 9039) || (dst port 10434) || (dst port 41847) || (dst port 46914) || (dst port 62916)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.25.23/32) || (dst net 212.0.25.242/32) || (dst net 212.0.80.43/32) || (dst net 212.0.137.62/32) || (dst net 212.0.252.90/32))),
	((dst port 6380) || (dst port 13975) || (dst port 24562) || (dst port 34269) || (dst port 57085)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.19.188/32) || (dst net 213.0.127.250/32) || (dst net 213.0.161.15/32) || (dst net 213.0.186.134/32) || (dst net 213.0.209.29/32))),
	((dst port 21134) || (dst port 44846) || (dst port 52489) || (dst port 55946) || (dst port 65345)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.44.164/32) || (dst net 214.0.107.145/32) || (dst net 214.0.163.47/32) || (dst net 214.0.179.115/32) || (dst net 214.0.250.93/32))),
	((dst port 7980) || (dst port 23124) || (dst port 25359) || (dst port 37416) || (dst port 49597)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.73.199/32) || (dst net 215.0.129.81/32) || (dst net 215.0.172.170/32) || (dst net 215.0.195.179/32) || (dst net 215.0.230.178/32))),
	((dst port 1434) || (dst port 19563) || (dst port 40342) || (dst port 42836) || (dst port 61644)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.53.110/32) || (dst net 216.0.183.81/32) || (dst net 216.0.184.235/32) || (dst net 216.0.230.55/32) || (dst net 216.0.255.34/32))),
	((dst port 19433) || (dst port 27500) || (dst port 40954) || (dst port 41616) || (dst port 43083)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.9.13/32) || (dst net 217.0.54.165/32) || (dst net 217.0.115.224/32) || (dst net 217.0.124.159/32) || (dst net 217.0.136.0/32))),
	((dst port 14164) || (dst port 24819) || (dst port 26089) || (dst port 37536) || (dst port 54695)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.10.65/32) || (dst net 218.0.73.216/32) || (dst net 218.0.85.238/32) || (dst net 218.0.109.67/32) || (dst net 218.0.115.74/32))),
	((dst port 9516) || (dst port 35418) || (dst port 43193) || (dst port 52046) || (dst port 61820)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.35.194/32) || (dst net 219.0.82.225/32) || (dst net 219.0.134.0/32) || (dst net 219.0.222.107/32) || (dst net 219.0.229.177/32))),
	((dst port 11232) || (dst port 20857) || (dst port 35727) || (dst port 42948) || (dst port 47355)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.46.2/32) || (dst net 220.0.128.212/32) || (dst net 220.0.135.225/32) || (dst net 220.0.170.132/32) || (dst net 220.0.196.10/32))),
	((dst port 15269) || (dst port 31690) || (dst port 45165) || (dst port 58547) || (dst port 61384)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.14.197/32) || (dst net 221.0.54.204/32) || (dst net 221.0.147.214/32) || (dst net 221.0.157.78/32) || (dst net 221.0.195.96/32))),
	((dst port 2886) || (dst port 16040) || (dst port 36775) || (dst port 56026) || (dst port 61094)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.75.19/32) || (dst net 222.0.91.79/32) || (dst net 222.0.122.171/32) || (dst net 222.0.140.188/32) || (dst net 222.0.151.40/32))),
	((dst port 14408) || (dst port 36243) || (dst port 39463) || (dst port 60005) || (dst port 61848)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.6.197/32) || (dst net 223.0.70.207/32) || (dst net 223.0.119.155/32) || (dst net 223.0.175.81/32) || (dst net 223.0.199.181/32))),
	((dst port 904) || (dst port 4159) || (dst port 14708) || (dst port 24883) || (dst port 49582)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.30.244/32) || (dst net 224.0.69.109/32) || (dst net 224.0.80.225/32) || (dst net 224.0.88.186/32) || (dst net 224.0.216.11/32))),
	((dst port 25614) || (dst port 40101) || (dst port 41994) || (dst port 46793) || (dst port 58677)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.76.187/32) || (dst net 225.0.106.35/32) || (dst net 225.0.214.98/32) || (dst net 225.0.219.73/32) || (dst net 225.0.249.15/32))),
	((dst port 19566) || (dst port 27258) || (dst port 31247) || (dst port 55017) || (dst port 61078)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.6.46/32) || (dst net 226.0.175.10/32) || (dst net 226.0.213.254/32) || (dst net 226.0.228.138/32) || (dst net 226.0.241.82/32))),
	((dst port 13381) || (dst port 17362) || (dst port 33195) || (dst port 61202) || (dst port 63195)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.9.51/32) || (dst net 227.0.10.6/32) || (dst net 227.0.22.244/32) || (dst net 227.0.45.76/32) || (dst net 227.0.113.201/32))),
	((dst port 1150) || (dst port 3129) || (dst port 33764) || (dst port 44092) || (dst port 57263)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.80.5/32) || (dst net 228.0.89.234/32) || (dst net 228.0.105.159/32) || (dst net 228.0.190.92/32) || (dst net 228.0.248.110/32))),
	((dst port 15208) || (dst port 17803) || (dst port 35009) || (dst port 59568) || (dst port 61700)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.23.73/32) || (dst net 229.0.79.141/32) || (dst net 229.0.86.242/32) || (dst net 229.0.181.240/32) || (dst net 229.0.200.182/32))),
	((dst port 767) || (dst port 20745) || (dst port 23694) || (dst port 53804) || (dst port 59624)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.34.160/32) || (dst net 230.0.45.71/32) || (dst net 230.0.117.179/32) || (dst net 230.0.164.122/32) || (dst net 230.0.249.64/32))),
	((dst port 14328) || (dst port 15896) || (dst port 22453) || (dst port 28124) || (dst port 35770)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.104.8/32) || (dst net 231.0.133.156/32) || (dst net 231.0.153.3/32) || (dst net 231.0.157.55/32) || (dst net 231.0.214.169/32))),
	((dst port 9471) || (dst port 23504) || (dst port 47268) || (dst port 56757) || (dst port 64023)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.120.127/32) || (dst net 232.0.124.163/32) || (dst net 232.0.148.1/32) || (dst net 232.0.157.67/32) || (dst net 232.0.172.154/32))),
	((dst port 2215) || (dst port 9486) || (dst port 12489) || (dst port 31484) || (dst port 63288)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.90.120/32) || (dst net 233.0.128.40/32) || (dst net 233.0.149.104/32) || (dst net 233.0.150.27/32) || (dst net 233.0.177.141/32))),
	((dst port 6430) || (dst port 13664) || (dst port 16108) || (dst port 59622) || (dst port 62571)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.21.215/32) || (dst net 234.0.97.84/32) || (dst net 234.0.163.47/32) || (dst net 234.0.205.11/32) || (dst net 234.0.214.207/32))),
	((dst port 11633) || (dst port 24323) || (dst port 26132) || (dst port 44097) || (dst port 45296)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.72.178/32) || (dst net 235.0.107.187/32) || (dst net 235.0.123.169/32) || (dst net 235.0.130.15/32) || (dst net 235.0.139.253/32))),
	((dst port 13377) || (dst port 15489) || (dst port 30651) || (dst port 37572) || (dst port 48370)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.1.150/32) || (dst net 236.0.14.194/32) || (dst net 236.0.62.27/32) || (dst net 236.0.154.118/32) || (dst net 236.0.161.16/32))),
	((dst port 2984) || (dst port 21595) || (dst port 31375) || (dst port 38107) || (dst port 65060)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.9.38/32) || (dst net 237.0.36.10/32) || (dst net 237.0.112.5/32) || (dst net 237.0.163.146/32) || (dst net 237.0.251.120/32))),
	((dst port 3327) || (dst port 13676) || (dst port 19095) || (dst port 24616) || (dst port 62863)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.7.48/32) || (dst net 238.0.8.124/32) || (dst net 238.0.72.115/32) || (dst net 238.0.121.185/32) || (dst net 238.0.124.106/32))),
	((dst port 14653) || (dst port 32994) || (dst port 37841) || (dst port 43738) || (dst port 61749)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.41.97/32) || (dst net 239.0.117.50/32) || (dst net 239.0.141.93/32) || (dst net 239.0.156.249/32) || (dst net 239.0.230.213/32))),
	((dst port 9345) || (dst port 46972) || (dst port 47408) || (dst port 48192) || (dst port 61004)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.51.197/32) || (dst net 240.0.71.252/32) || (dst net 240.0.181.142/32) || (dst net 240.0.208.71/32) || (dst net 240.0.224.189/32))),
	((dst port 19180) || (dst port 22104) || (dst port 24117) || (dst port 45492) || (dst port 55018)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.52.189/32) || (dst net 241.0.80.33/32) || (dst net 241.0.132.114/32) || (dst net 241.0.145.87/32) || (dst net 241.0.173.42/32))),
	((dst port 640) || (dst port 18379) || (dst port 20374) || (dst port 55048) || (dst port 59559)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.83.10/32) || (dst net 242.0.134.0/32) || (dst net 242.0.162.163/32) || (dst net 242.0.169.167/32) || (dst net 242.0.253.39/32))),
	((dst port 22759) || (dst port 28602) || (dst port 35876) || (dst port 44143) || (dst port 65505)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.5.186/32) || (dst net 243.0.21.130/32) || (dst net 243.0.71.86/32) || (dst net 243.0.114.41/32) || (dst net 243.0.187.169/32))),
	((dst port 3036) || (dst port 25381) || (dst port 38450) || (dst port 41722) || (dst port 51950)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.3.106/32) || (dst net 244.0.39.230/32) || (dst net 244.0.95.30/32) || (dst net 244.0.154.8/32) || (dst net 244.0.236.197/32))),
	((dst port 19843) || (dst port 29340) || (dst port 36673) || (dst port 56089) || (dst port 64229)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.68.228/32) || (dst net 245.0.96.26/32) || (dst net 245.0.175.138/32) || (dst net 245.0.186.185/32) || (dst net 245.0.217.228/32))),
	((dst port 6062) || (dst port 22370) || (dst port 29254) || (dst port 43300) || (dst port 49715)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.93.169/32) || (dst net 246.0.139.16/32) || (dst net 246.0.161.103/32) || (dst net 246.0.222.226/32) || (dst net 246.0.233.117/32))),
	((dst port 7921) || (dst port 9911) || (dst port 35718) || (dst port 42594) || (dst port 61290)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.21.222/32) || (dst net 247.0.66.111/32) || (dst net 247.0.112.197/32) || (dst net 247.0.125.96/32) || (dst net 247.0.191.198/32))),
	((dst port 363) || (dst port 18533) || (dst port 37496) || (dst port 50056) || (dst port 59571)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.58.147/32) || (dst net 248.0.106.255/32) || (dst net 248.0.169.93/32) || (dst net 248.0.209.106/32) || (dst net 248.0.234.78/32))),
	((dst port 13786) || (dst port 29569) || (dst port 44457) || (dst port 62725) || (dst port 65219)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.106.69/32) || (dst net 249.0.133.117/32) || (dst net 249.0.164.178/32) || (dst net 249.0.202.236/32) || (dst net 249.0.228.121/32))),
	((dst port 6694) || (dst port 21478) || (dst port 24197) || (dst port 50893) || (dst port 63328)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.52.9/32) || (dst net 250.0.52.200/32) || (dst net 250.0.67.185/32) || (dst net 250.0.87.98/32) || (dst net 250.0.180.191/32))),
	((dst port 20096) || (dst port 41704) || (dst port 41894) || (dst port 43286) || (dst port 47599)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.1.190/32) || (dst net 251.0.101.250/32) || (dst net 251.0.121.229/32) || (dst net 251.0.152.175/32) || (dst net 251.0.239.135/32))),
	((dst port 8776) || (dst port 14139) || (dst port 17470) || (dst port 37307) || (dst port 40496)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.55.168/32) || (dst net 252.0.75.138/32) || (dst net 252.0.127.144/32) || (dst net 252.0.226.204/32) || (dst net 252.0.241.56/32))),
	((dst port 12067) || (dst port 38219) || (dst port 40490) || (dst port 45298) || (dst port 65515)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.14.38/32) || (dst net 253.0.18.67/32) || (dst net 253.0.147.87/32) || (dst net 253.0.186.111/32) || (dst net 253.0.255.171/32))),
	((dst port 274) || (dst port 3263) || (dst port 30207) || (dst port 32291) || (dst port 44547)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.69.206/32) || (dst net 254.0.123.135/32) || (dst net 254.0.148.199/32) || (dst net 254.0.176.117/32) || (dst net 254.0.205.24/32))),
	((dst port 10653) || (dst port 25492) || (dst port 31165) || (dst port 47920) || (dst port 62665)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.4.120/32) || (dst net 255.0.58.156/32) || (dst net 255.0.98.173/32) || (dst net 255.0.110.16/32) || (dst net 255.0.214.195/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 2029) || (dst port 32135) || (dst port 36064) || (dst port 43714) || (dst port 56033)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.58.203/32) || (dst net 1.0.201.63/32) || (dst net 1.0.226.206/32) || (dst net 1.0.230.250/32) || (dst net 1.0.248.220/32))),
	((dst port 6010) || (dst port 15647) || (dst port 25183) || (dst port 28813) || (dst port 29473)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.53.47/32) || (dst net 2.0.57.243/32) || (dst net 2.0.74.125/32) || (dst net 2.0.176.69/32) || (dst net 2.0.183.246/32))),
	((dst port 28056) || (dst port 29329) || (dst port 34907) || (dst port 51948) || (dst port 63246)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.63.135/32) || (dst net 3.0.132.43/32) || (dst net 3.0.169.80/32) || (dst net 3.0.186.153/32) || (dst net 3.0.243.130/32))),
	((dst port 16142) || (dst port 28263) || (dst port 51973) || (dst port 60388) || (dst port 64400)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.24.47/32) || (dst net 4.0.128.85/32) || (dst net 4.0.140.151/32) || (dst net 4.0.215.115/32) || (dst net 4.0.225.250/32))),
	((dst port 11614) || (dst port 12401) || (dst port 19206) || (dst port 23600) || (dst port 36004)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.3.63/32) || (dst net 5.0.76.10/32) || (dst net 5.0.104.40/32) || (dst net 5.0.210.174/32) || (dst net 5.0.255.105/32))),
	((dst port 1990) || (dst port 31786) || (dst port 34130) || (dst port 39599) || (dst port 49733)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.90.211/32) || (dst net 6.0.129.43/32) || (dst net 6.0.157.22/32) || (dst net 6.0.187.241/32) || (dst net 6.0.253.160/32))),
	((dst port 5734) || (dst port 9999) || (dst port 21310) || (dst port 23397) || (dst port 37451)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.35.46/32) || (dst net 7.0.163.151/32) || (dst net 7.0.186.143/32) || (dst net 7.0.187.78/32) || (dst net 7.0.219.77/32))),
	((dst port 2634) || (dst port 18116) || (dst port 35605) || (dst port 63447) || (dst port 64781)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.26.106/32) || (dst net 8.0.88.128/32) || (dst net 8.0.103.73/32) || (dst net 8.0.213.159/32) || (dst net 8.0.243.112/32))),
	((dst port 5725) || (dst port 18923) || (dst port 28953) || (dst port 49258) || (dst port 62585)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.91.197/32) || (dst net 9.0.115.65/32) || (dst net 9.0.172.232/32) || (dst net 9.0.215.37/32) || (dst net 9.0.232.224/32))),
	((dst port 16537) || (dst port 46172) || (dst port 61381) || (dst port 62951) || (dst port 64813)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.66.108/32) || (dst net 10.0.114.77/32) || (dst net 10.0.203.220/32) || (dst net 10.0.214.57/32) || (dst net 10.0.254.82/32))),
	((dst port 13973) || (dst port 23970) || (dst port 29649) || (dst port 36696) || (dst port 38999)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.20.84/32) || (dst net 11.0.67.22/32) || (dst net 11.0.102.236/32) || (dst net 11.0.138.239/32) || (dst net 11.0.231.227/32))),
	((dst port 8562) || (dst port 13801) || (dst port 15477) || (dst port 38047) || (dst port 52190)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.113.31/32) || (dst net 12.0.116.113/32) || (dst net 12.0.118.194/32) || (dst net 12.0.146.248/32) || (dst net 12.0.166.56/32))),
	((dst port 1839) || (dst port 22662) || (dst port 43763) || (dst port 63979) || (dst port 65253)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.2.247/32) || (dst net 13.0.6.168/32) || (dst net 13.0.46.197/32) || (dst net 13.0.144.149/32) || (dst net 13.0.215.129/32))),
	((dst port 15551) || (dst port 53083) || (dst port 53433) || (dst port 53733) || (dst port 63487)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.75.183/32) || (dst net 14.0.135.150/32) || (dst net 14.0.137.228/32) || (dst net 14.0.172.154/32) || (dst net 14.0.188.129/32))),
	((dst port 4432) || (dst port 14942) || (dst port 20291) || (dst port 30116) || (dst port 43877)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.15.237/32) || (dst net 15.0.52.49/32) || (dst net 15.0.119.127/32) || (dst net 15.0.154.83/32) || (dst net 15.0.167.135/32))),
	((dst port 20751) || (dst port 27117) || (dst port 37358) || (dst port 37555) || (dst port 45449)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.9.84/32) || (dst net 16.0.47.1/32) || (dst net 16.0.123.131/32) || (dst net 16.0.155.107/32) || (dst net 16.0.207.224/32))),
	((dst port 7713) || (dst port 13649) || (dst port 16469) || (dst port 20219) || (dst port 47554)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.61.113/32) || (dst net 17.0.87.191/32) || (dst net 17.0.171.103/32) || (dst net 17.0.193.174/32) || (dst net 17.0.255.40/32))),
	((dst port 1028) || (dst port 21847) || (dst port 31160) || (dst port 53271) || (dst port 54581)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.53.124/32) || (dst net 18.0.71.121/32) || (dst net 18.0.93.233/32) || (dst net 18.0.110.100/32) || (dst net 18.0.153.228/32))),
	((dst port 30528) || (dst port 32470) || (dst port 48613) || (dst port 61890) || (dst port 64998)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.1.194/32) || (dst net 19.0.75.81/32) || (dst net 19.0.109.39/32) || (dst net 19.0.123.134/32) || (dst net 19.0.168.94/32))),
	((dst port 13475) || (dst port 20731) || (dst port 36648) || (dst port 42233) || (dst port 42645)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.2.186/32) || (dst net 20.0.4.14/32) || (dst net 20.0.29.203/32) || (dst net 20.0.151.229/32) || (dst net 20.0.175.108/32))),
	((dst port 12979) || (dst port 23108) || (dst port 28768) || (dst port 31833) || (dst port 34468)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.29.84/32) || (dst net 21.0.79.253/32) || (dst net 21.0.120.146/32) || (dst net 21.0.121.10/32) || (dst net 21.0.172.172/32))),
	((dst port 24978) || (dst port 34267) || (dst port 43102) || (dst port 46612) || (dst port 50250)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.106.120/32) || (dst net 22.0.116.147/32) || (dst net 22.0.153.4/32) || (dst net 22.0.163.173/32) || (dst net 22.0.218.170/32))),
	((dst port 42002) || (dst port 42409) || (dst port 52731) || (dst port 53530) || (dst port 54828)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.108.204/32) || (dst net 23.0.153.211/32) || (dst net 23.0.169.221/32) || (dst net 23.0.171.1/32) || (dst net 23.0.185.125/32))),
	((dst port 11560) || (dst port 22954) || (dst port 38468) || (dst port 42577) || (dst port 52524)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.57.28/32) || (dst net 24.0.77.219/32) || (dst net 24.0.88.152/32) || (dst net 24.0.111.8/32) || (dst net 24.0.126.118/32))),
	((dst port 8010) || (dst port 19309) || (dst port 47487) || (dst port 51514) || (dst port 58593)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.157.22/32) || (dst net 25.0.191.169/32) || (dst net 25.0.207.136/32) || (dst net 25.0.211.75/32) || (dst net 25.0.225.118/32))),
	((dst port 26511) || (dst port 29053) || (dst port 37724) || (dst port 44552) || (dst port 50862)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.10.58/32) || (dst net 26.0.39.215/32) || (dst net 26.0.92.145/32) || (dst net 26.0.175.126/32) || (dst net 26.0.236.236/32))),
	((dst port 4430) || (dst port 4951) || (dst port 10461) || (dst port 43872) || (dst port 58053)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.45.69/32) || (dst net 27.0.92.77/32) || (dst net 27.0.165.77/32) || (dst net 27.0.178.182/32) || (dst net 27.0.180.2/32))),
	((dst port 977) || (dst port 11579) || (dst port 40078) || (dst port 41631) || (dst port 61857)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.11.121/32) || (dst net 28.0.81.4/32) || (dst net 28.0.158.172/32) || (dst net 28.0.162.240/32) || (dst net 28.0.218.163/32))),
	((dst port 13381) || (dst port 25077) || (dst port 31432) || (dst port 35763) || (dst port 54527)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.9.245/32) || (dst net 29.0.68.46/32) || (dst net 29.0.84.241/32) || (dst net 29.0.161.37/32) || (dst net 29.0.214.133/32))),
	((dst port 10154) || (dst port 32087) || (dst port 42467) || (dst port 49277) || (dst port 63106)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.9.195/32) || (dst net 30.0.33.214/32) || (dst net 30.0.89.195/32) || (dst net 30.0.236.87/32) || (dst net 30.0.243.105/32))),
	((dst port 26983) || (dst port 36420) || (dst port 54755) || (dst port 55100) || (dst port 59145)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.1.174/32) || (dst net 31.0.56.74/32) || (dst net 31.0.112.134/32) || (dst net 31.0.159.126/32) || (dst net 31.0.222.149/32))),
	((dst port 8879) || (dst port 15003) || (dst port 20028) || (dst port 25014) || (dst port 46829)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.70.248/32) || (dst net 32.0.171.183/32) || (dst net 32.0.206.50/32) || (dst net 32.0.247.169/32) || (dst net 32.0.251.251/32))),
	((dst port 7119) || (dst port 9572) || (dst port 52046) || (dst port 55107) || (dst port 56912)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.71.149/32) || (dst net 33.0.128.228/32) || (dst net 33.0.200.158/32) || (dst net 33.0.214.158/32) || (dst net 33.0.215.21/32))),
	((dst port 3468) || (dst port 20611) || (dst port 29954) || (dst port 44178) || (dst port 50193)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.6.236/32) || (dst net 34.0.11.216/32) || (dst net 34.0.127.0/32) || (dst net 34.0.172.75/32) || (dst net 34.0.214.96/32))),
	((dst port 12787) || (dst port 22112) || (dst port 34000) || (dst port 44935) || (dst port 50839)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.86.161/32) || (dst net 35.0.88.137/32) || (dst net 35.0.113.25/32) || (dst net 35.0.163.139/32) || (dst net 35.0.243.142/32))),
	((dst port 13721) || (dst port 30784) || (dst port 31053) || (dst port 35835) || (dst port 59316)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.2.13/32) || (dst net 36.0.142.29/32) || (dst net 36.0.186.128/32) || (dst net 36.0.200.45/32) || (dst net 36.0.225.11/32))),
	((dst port 3334) || (dst port 15920) || (dst port 27126) || (dst port 50177) || (dst port 55237)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.3.85/32) || (dst net 37.0.130.185/32) || (dst net 37.0.205.211/32) || (dst net 37.0.219.197/32) || (dst net 37.0.226.77/32))),
	((dst port 6885) || (dst port 12427) || (dst port 36814) || (dst port 51989) || (dst port 59651)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.34.238/32) || (dst net 38.0.49.167/32) || (dst net 38.0.118.95/32) || (dst net 38.0.157.40/32) || (dst net 38.0.233.100/32))),
	((dst port 1123) || (dst port 21049) || (dst port 48488) || (dst port 48789) || (dst port 65036)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.4.53/32) || (dst net 39.0.84.254/32) || (dst net 39.0.114.243/32) || (dst net 39.0.164.109/32) || (dst net 39.0.240.15/32))),
	((dst port 20041) || (dst port 20706) || (dst port 33360) || (dst port 39641) || (dst port 57550)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.55.237/32) || (dst net 40.0.97.64/32) || (dst net 40.0.124.142/32) || (dst net 40.0.134.246/32) || (dst net 40.0.170.213/32))),
	((dst port 26766) || (dst port 28592) || (dst port 33527) || (dst port 47454) || (dst port 60068)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.60.228/32) || (dst net 41.0.128.44/32) || (dst net 41.0.178.31/32) || (dst net 41.0.200.26/32) || (dst net 41.0.205.51/32))),
	((dst port 5965) || (dst port 47757) || (dst port 59123) || (dst port 61845) || (dst port 62815)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.36.101/32) || (dst net 42.0.90.173/32) || (dst net 42.0.151.52/32) || (dst net 42.0.195.129/32) || (dst net 42.0.253.124/32))),
	((dst port 33266) || (dst port 41107) || (dst port 53229) || (dst port 62701) || (dst port 64004)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.90.4/32) || (dst net 43.0.168.83/32) || (dst net 43.0.189.253/32) || (dst net 43.0.211.100/32) || (dst net 43.0.254.252/32))),
	((dst port 2890) || (dst port 10177) || (dst port 10590) || (dst port 17481) || (dst port 60255)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.101.225/32) || (dst net 44.0.114.22/32) || (dst net 44.0.157.86/32) || (dst net 44.0.196.20/32) || (dst net 44.0.210.227/32))),
	((dst port 16122) || (dst port 22747) || (dst port 27326) || (dst port 28521) || (dst port 48217)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.101.124/32) || (dst net 45.0.161.104/32) || (dst net 45.0.168.64/32) || (dst net 45.0.219.37/32) || (dst net 45.0.237.204/32))),
	((dst port 38252) || (dst port 43181) || (dst port 43302) || (dst port 49568) || (dst port 57117)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.11.103/32) || (dst net 46.0.102.115/32) || (dst net 46.0.150.231/32) || (dst net 46.0.197.180/32) || (dst net 46.0.231.181/32))),
	((dst port 7530) || (dst port 8744) || (dst port 12708) || (dst port 30579) || (dst port 64138)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.157.143/32) || (dst net 47.0.191.83/32) || (dst net 47.0.217.177/32) || (dst net 47.0.227.28/32) || (dst net 47.0.243.195/32))),
	((dst port 2839) || (dst port 22689) || (dst port 25659) || (dst port 35001) || (dst port 53724)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.0.6/32) || (dst net 48.0.67.252/32) || (dst net 48.0.91.68/32) || (dst net 48.0.170.184/32) || (dst net 48.0.201.52/32))),
	((dst port 35025) || (dst port 44422) || (dst port 45064) || (dst port 61192) || (dst port 61318)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.35.28/32) || (dst net 49.0.46.201/32) || (dst net 49.0.56.18/32) || (dst net 49.0.62.210/32) || (dst net 49.0.65.175/32))),
	((dst port 2464) || (dst port 3511) || (dst port 33581) || (dst port 60835) || (dst port 63783)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.16.124/32) || (dst net 50.0.25.94/32) || (dst net 50.0.54.66/32) || (dst net 50.0.134.104/32) || (dst net 50.0.244.184/32))),
	((dst port 5953) || (dst port 13478) || (dst port 26820) || (dst port 50870) || (dst port 62785)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.42.42/32) || (dst net 51.0.48.13/32) || (dst net 51.0.117.253/32) || (dst net 51.0.169.116/32) || (dst net 51.0.200.28/32))),
	((dst port 3333) || (dst port 18427) || (dst port 36377) || (dst port 48708) || (dst port 57968)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.8.230/32) || (dst net 52.0.9.219/32) || (dst net 52.0.16.4/32) || (dst net 52.0.117.62/32) || (dst net 52.0.125.123/32))),
	((dst port 7248) || (dst port 30930) || (dst port 44324) || (dst port 48678) || (dst port 54672)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.0.7/32) || (dst net 53.0.70.157/32) || (dst net 53.0.93.206/32) || (dst net 53.0.230.150/32) || (dst net 53.0.239.218/32))),
	((dst port 631) || (dst port 4130) || (dst port 51968) || (dst port 52217) || (dst port 55433)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.62.161/32) || (dst net 54.0.79.250/32) || (dst net 54.0.122.11/32) || (dst net 54.0.154.27/32) || (dst net 54.0.184.214/32))),
	((dst port 14092) || (dst port 46302) || (dst port 48960) || (dst port 59945) || (dst port 60331)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.43.147/32) || (dst net 55.0.81.70/32) || (dst net 55.0.146.57/32) || (dst net 55.0.174.114/32) || (dst net 55.0.219.3/32))),
	((dst port 19051) || (dst port 25624) || (dst port 42876) || (dst port 43271) || (dst port 49352)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.14.181/32) || (dst net 56.0.192.125/32) || (dst net 56.0.196.211/32) || (dst net 56.0.211.154/32) || (dst net 56.0.238.28/32))),
	((dst port 10745) || (dst port 34103) || (dst port 49947) || (dst port 50558) || (dst port 56031)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.28.57/32) || (dst net 57.0.126.20/32) || (dst net 57.0.188.127/32) || (dst net 57.0.231.194/32) || (dst net 57.0.236.175/32))),
	((dst port 8531) || (dst port 45973) || (dst port 50435) || (dst port 51217) || (dst port 63891)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.20.169/32) || (dst net 58.0.103.103/32) || (dst net 58.0.109.88/32) || (dst net 58.0.125.139/32) || (dst net 58.0.249.109/32))),
	((dst port 9818) || (dst port 15032) || (dst port 15799) || (dst port 31722) || (dst port 54523)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.66.225/32) || (dst net 59.0.140.115/32) || (dst net 59.0.164.56/32) || (dst net 59.0.171.184/32) || (dst net 59.0.214.239/32))),
	((dst port 2305) || (dst port 18481) || (dst port 29236) || (dst port 31080) || (dst port 35515)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.126.115/32) || (dst net 60.0.138.54/32) || (dst net 60.0.164.116/32) || (dst net 60.0.166.183/32) || (dst net 60.0.217.91/32))),
	((dst port 3373) || (dst port 19247) || (dst port 26536) || (dst port 64443) || (dst port 64641)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.136.40/32) || (dst net 61.0.181.125/32) || (dst net 61.0.204.157/32) || (dst net 61.0.213.140/32) || (dst net 61.0.239.63/32))),
	((dst port 3567) || (dst port 20095) || (dst port 33794) || (dst port 36881) || (dst port 64577)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.35.58/32) || (dst net 62.0.114.27/32) || (dst net 62.0.132.101/32) || (dst net 62.0.196.163/32) || (dst net 62.0.213.148/32))),
	((dst port 4925) || (dst port 5314) || (dst port 11753) || (dst port 50892) || (dst port 55546)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.27.11/32) || (dst net 63.0.114.77/32) || (dst net 63.0.147.221/32) || (dst net 63.0.152.24/32) || (dst net 63.0.153.140/32))),
	((dst port 4883) || (dst port 25173) || (dst port 32075) || (dst port 37826) || (dst port 48877)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.62.7/32) || (dst net 64.0.64.2/32) || (dst net 64.0.90.245/32) || (dst net 64.0.140.6/32) || (dst net 64.0.181.204/32))),
	((dst port 18501) || (dst port 22954) || (dst port 27858) || (dst port 35369) || (dst port 41770)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.98.22/32) || (dst net 65.0.135.178/32) || (dst net 65.0.143.190/32) || (dst net 65.0.145.35/32) || (dst net 65.0.230.10/32))),
	((dst port 24350) || (dst port 26866) || (dst port 28155) || (dst port 38032) || (dst port 39651)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.28.43/32) || (dst net 66.0.112.150/32) || (dst net 66.0.163.27/32) || (dst net 66.0.169.135/32) || (dst net 66.0.216.129/32))),
	((dst port 19356) || (dst port 46847) || (dst port 52931) || (dst port 64390) || (dst port 65082)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.113.78/32) || (dst net 67.0.153.215/32) || (dst net 67.0.181.3/32) || (dst net 67.0.217.98/32) || (dst net 67.0.233.8/32))),
	((dst port 6895) || (dst port 27436) || (dst port 31587) || (dst port 33487) || (dst port 56824)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.11.212/32) || (dst net 68.0.170.215/32) || (dst net 68.0.181.112/32) || (dst net 68.0.209.249/32) || (dst net 68.0.255.223/32))),
	((dst port 169) || (dst port 24577) || (dst port 41856) || (dst port 56314) || (dst port 56529)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.58.207/32) || (dst net 69.0.159.52/32) || (dst net 69.0.197.158/32) || (dst net 69.0.218.137/32) || (dst net 69.0.234.13/32))),
	((dst port 1591) || (dst port 13033) || (dst port 25182) || (dst port 25920) || (dst port 26638)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.128.65/32) || (dst net 70.0.202.134/32) || (dst net 70.0.222.238/32) || (dst net 70.0.234.117/32) || (dst net 70.0.238.109/32))),
	((dst port 2178) || (dst port 20700) || (dst port 21015) || (dst port 36563) || (dst port 37724)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.24.125/32) || (dst net 71.0.69.149/32) || (dst net 71.0.72.174/32) || (dst net 71.0.154.81/32) || (dst net 71.0.208.7/32))),
	((dst port 15962) || (dst port 17742) || (dst port 27845) || (dst port 37256) || (dst port 50740)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.44.190/32) || (dst net 72.0.106.52/32) || (dst net 72.0.122.85/32) || (dst net 72.0.183.7/32) || (dst net 72.0.213.25/32))),
	((dst port 30367) || (dst port 47824) || (dst port 48153) || (dst port 50551) || (dst port 55176)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.16.53/32) || (dst net 73.0.18.89/32) || (dst net 73.0.53.67/32) || (dst net 73.0.149.90/32) || (dst net 73.0.201.38/32))),
	((dst port 5736) || (dst port 9514) || (dst port 20443) || (dst port 43824) || (dst port 65383)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.2.215/32) || (dst net 74.0.29.35/32) || (dst net 74.0.35.137/32) || (dst net 74.0.144.110/32) || (dst net 74.0.213.162/32))),
	((dst port 7858) || (dst port 14293) || (dst port 24593) || (dst port 32784) || (dst port 58733)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.11.157/32) || (dst net 75.0.19.84/32) || (dst net 75.0.117.67/32) || (dst net 75.0.132.207/32) || (dst net 75.0.163.149/32))),
	((dst port 21928) || (dst port 25948) || (dst port 26182) || (dst port 32869) || (dst port 62841)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.61.151/32) || (dst net 76.0.78.111/32) || (dst net 76.0.104.80/32) || (dst net 76.0.126.46/32) || (dst net 76.0.143.243/32))),
	((dst port 9270) || (dst port 11000) || (dst port 22684) || (dst port 25356) || (dst port 27016)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.55.57/32) || (dst net 77.0.72.170/32) || (dst net 77.0.103.153/32) || (dst net 77.0.119.112/32) || (dst net 77.0.153.248/32))),
	((dst port 1772) || (dst port 2971) || (dst port 31262) || (dst port 33974) || (dst port 47193)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.32.227/32) || (dst net 78.0.60.207/32) || (dst net 78.0.67.77/32) || (dst net 78.0.127.87/32) || (dst net 78.0.137.157/32))),
	((dst port 13969) || (dst port 14516) || (dst port 21414) || (dst port 43834) || (dst port 51017)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.33.77/32) || (dst net 79.0.133.126/32) || (dst net 79.0.179.126/32) || (dst net 79.0.204.177/32) || (dst net 79.0.211.111/32))),
	((dst port 3637) || (dst port 4718) || (dst port 5515) || (dst port 8844) || (dst port 55251)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.36.50/32) || (dst net 80.0.43.90/32) || (dst net 80.0.51.222/32) || (dst net 80.0.75.102/32) || (dst net 80.0.84.201/32))),
	((dst port 9094) || (dst port 9500) || (dst port 17880) || (dst port 18164) || (dst port 18182)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.79.219/32) || (dst net 81.0.146.226/32) || (dst net 81.0.159.130/32) || (dst net 81.0.166.240/32) || (dst net 81.0.200.247/32))),
	((dst port 26527) || (dst port 34289) || (dst port 40155) || (dst port 54336) || (dst port 57048)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.181.226/32) || (dst net 82.0.200.213/32) || (dst net 82.0.201.26/32) || (dst net 82.0.203.135/32) || (dst net 82.0.226.96/32))),
	((dst port 6849) || (dst port 8754) || (dst port 29349) || (dst port 36175) || (dst port 64033)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.4.127/32) || (dst net 83.0.66.132/32) || (dst net 83.0.198.176/32) || (dst net 83.0.243.198/32) || (dst net 83.0.249.206/32))),
	((dst port 17055) || (dst port 17703) || (dst port 42048) || (dst port 54186) || (dst port 60859)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.27.45/32) || (dst net 84.0.32.116/32) || (dst net 84.0.74.60/32) || (dst net 84.0.145.32/32) || (dst net 84.0.165.35/32))),
	((dst port 6408) || (dst port 27704) || (dst port 29103) || (dst port 38454) || (dst port 46596)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.60.95/32) || (dst net 85.0.99.213/32) || (dst net 85.0.112.60/32) || (dst net 85.0.186.254/32) || (dst net 85.0.245.149/32))),
	((dst port 11510) || (dst port 14754) || (dst port 18447) || (dst port 41518) || (dst port 47453)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.46.162/32) || (dst net 86.0.124.20/32) || (dst net 86.0.129.16/32) || (dst net 86.0.181.157/32) || (dst net 86.0.225.98/32))),
	((dst port 12036) || (dst port 17230) || (dst port 33766) || (dst port 49766) || (dst port 51278)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.36.90/32) || (dst net 87.0.40.62/32) || (dst net 87.0.114.175/32) || (dst net 87.0.208.72/32) || (dst net 87.0.220.126/32))),
	((dst port 34789) || (dst port 41981) || (dst port 53276) || (dst port 61010) || (dst port 63077)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.62.13/32) || (dst net 88.0.99.180/32) || (dst net 88.0.161.101/32) || (dst net 88.0.167.226/32) || (dst net 88.0.172.184/32))),
	((dst port 16207) || (dst port 17336) || (dst port 22521) || (dst port 34364) || (dst port 46338)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.0.58/32) || (dst net 89.0.2.249/32) || (dst net 89.0.5.117/32) || (dst net 89.0.14.198/32) || (dst net 89.0.123.163/32))),
	((dst port 6207) || (dst port 22307) || (dst port 40815) || (dst port 45149) || (dst port 63992)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.15.19/32) || (dst net 90.0.66.80/32) || (dst net 90.0.142.100/32) || (dst net 90.0.197.205/32) || (dst net 90.0.245.221/32))),
	((dst port 7510) || (dst port 14029) || (dst port 26520) || (dst port 50708) || (dst port 57332)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.83.68/32) || (dst net 91.0.120.13/32) || (dst net 91.0.145.204/32) || (dst net 91.0.151.234/32) || (dst net 91.0.195.127/32))),
	((dst port 11844) || (dst port 30181) || (dst port 39026) || (dst port 58377) || (dst port 61320)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.18.4/32) || (dst net 92.0.54.12/32) || (dst net 92.0.101.55/32) || (dst net 92.0.175.212/32) || (dst net 92.0.201.245/32))),
	((dst port 22294) || (dst port 32461) || (dst port 33545) || (dst port 39557) || (dst port 48732)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.61.65/32) || (dst net 93.0.95.125/32) || (dst net 93.0.96.105/32) || (dst net 93.0.136.85/32) || (dst net 93.0.230.25/32))),
	((dst port 12543) || (dst port 36763) || (dst port 49859) || (dst port 53900) || (dst port 60933)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.16.55/32) || (dst net 94.0.83.48/32) || (dst net 94.0.90.76/32) || (dst net 94.0.125.164/32) || (dst net 94.0.138.21/32))),
	((dst port 20353) || (dst port 35995) || (dst port 38002) || (dst port 52269) || (dst port 57642)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.18.5/32) || (dst net 95.0.56.40/32) || (dst net 95.0.72.41/32) || (dst net 95.0.114.37/32) || (dst net 95.0.236.65/32))),
	((dst port 5487) || (dst port 7736) || (dst port 9997) || (dst port 11948) || (dst port 49987)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.39.222/32) || (dst net 96.0.43.230/32) || (dst net 96.0.110.59/32) || (dst net 96.0.160.31/32) || (dst net 96.0.188.161/32))),
	((dst port 11179) || (dst port 23019) || (dst port 24476) || (dst port 59561) || (dst port 63857)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.3.80/32) || (dst net 97.0.78.139/32) || (dst net 97.0.120.241/32) || (dst net 97.0.185.7/32) || (dst net 97.0.251.117/32))),
	((dst port 54669) || (dst port 56643) || (dst port 58388) || (dst port 59509) || (dst port 64332)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.15.29/32) || (dst net 98.0.59.64/32) || (dst net 98.0.106.170/32) || (dst net 98.0.130.65/32) || (dst net 98.0.160.68/32))),
	((dst port 9922) || (dst port 32632) || (dst port 34719) || (dst port 55688) || (dst port 61064)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.130.91/32) || (dst net 99.0.143.146/32) || (dst net 99.0.155.253/32) || (dst net 99.0.205.244/32) || (dst net 99.0.234.83/32))),
	((dst port 15722) || (dst port 35440) || (dst port 41771) || (dst port 62753) || (dst port 63309)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.27.176/32) || (dst net 100.0.90.33/32) || (dst net 100.0.202.167/32) || (dst net 100.0.203.179/32) || (dst net 100.0.249.56/32))),
	((dst port 1423) || (dst port 9365) || (dst port 15137) || (dst port 43483) || (dst port 43968)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.37.244/32) || (dst net 101.0.102.95/32) || (dst net 101.0.163.110/32) || (dst net 101.0.220.42/32) || (dst net 101.0.232.106/32))),
	((dst port 24081) || (dst port 40748) || (dst port 45033) || (dst port 45373) || (dst port 49399)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.9.159/32) || (dst net 102.0.45.93/32) || (dst net 102.0.50.191/32) || (dst net 102.0.113.251/32) || (dst net 102.0.167.120/32))),
	((dst port 9609) || (dst port 16023) || (dst port 17649) || (dst port 31081) || (dst port 44111)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.113.83/32) || (dst net 103.0.117.20/32) || (dst net 103.0.153.62/32) || (dst net 103.0.212.166/32) || (dst net 103.0.228.137/32))),
	((dst port 15561) || (dst port 28416) || (dst port 30150) || (dst port 42316) || (dst port 63153)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.35.226/32) || (dst net 104.0.66.37/32) || (dst net 104.0.80.131/32) || (dst net 104.0.189.243/32) || (dst net 104.0.190.138/32))),
	((dst port 2311) || (dst port 3570) || (dst port 5293) || (dst port 32061) || (dst port 37041)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.114.243/32) || (dst net 105.0.143.206/32) || (dst net 105.0.154.122/32) || (dst net 105.0.243.245/32) || (dst net 105.0.245.67/32))),
	((dst port 4060) || (dst port 18474) || (dst port 20285) || (dst port 42046) || (dst port 50359)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.15.175/32) || (dst net 106.0.120.246/32) || (dst net 106.0.123.177/32) || (dst net 106.0.170.253/32) || (dst net 106.0.202.170/32))),
	((dst port 16871) || (dst port 41912) || (dst port 45000) || (dst port 50068) || (dst port 56634)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.117.150/32) || (dst net 107.0.119.79/32) || (dst net 107.0.170.242/32) || (dst net 107.0.188.43/32) || (dst net 107.0.220.123/32))),
	((dst port 15432) || (dst port 22037) || (dst port 26041) || (dst port 35524) || (dst port 51922)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.56.97/32) || (dst net 108.0.102.196/32) || (dst net 108.0.134.88/32) || (dst net 108.0.189.224/32) || (dst net 108.0.239.227/32))),
	((dst port 418) || (dst port 5139) || (dst port 17953) || (dst port 58557) || (dst port 64318)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.77.48/32) || (dst net 109.0.140.151/32) || (dst net 109.0.174.73/32) || (dst net 109.0.238.48/32) || (dst net 109.0.252.66/32))),
	((dst port 6047) || (dst port 30769) || (dst port 32043) || (dst port 40574) || (dst port 53354)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.15.59/32) || (dst net 110.0.26.164/32) || (dst net 110.0.53.117/32) || (dst net 110.0.170.192/32) || (dst net 110.0.230.68/32))),
	((dst port 26799) || (dst port 37298) || (dst port 48879) || (dst port 54164) || (dst port 62140)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.15.137/32) || (dst net 111.0.17.128/32) || (dst net 111.0.47.163/32) || (dst net 111.0.64.25/32) || (dst net 111.0.247.181/32))),
	((dst port 21066) || (dst port 32683) || (dst port 38293) || (dst port 48971) || (dst port 56217)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.2.178/32) || (dst net 112.0.4.225/32) || (dst net 112.0.71.209/32) || (dst net 112.0.79.225/32) || (dst net 112.0.243.7/32))),
	((dst port 30613) || (dst port 36141) || (dst port 47042) || (dst port 50949) || (dst port 57905)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.14.119/32) || (dst net 113.0.62.24/32) || (dst net 113.0.98.208/32) || (dst net 113.0.171.151/32) || (dst net 113.0.218.191/32))),
	((dst port 7215) || (dst port 13180) || (dst port 48055) || (dst port 48667) || (dst port 51976)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.39.204/32) || (dst net 114.0.43.217/32) || (dst net 114.0.160.12/32) || (dst net 114.0.216.88/32) || (dst net 114.0.216.126/32))),
	((dst port 4136) || (dst port 38337) || (dst port 39427) || (dst port 46181) || (dst port 61991)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.64.16/32) || (dst net 115.0.103.218/32) || (dst net 115.0.109.216/32) || (dst net 115.0.223.77/32) || (dst net 115.0.229.83/32))),
	((dst port 5812) || (dst port 30022) || (dst port 45977) || (dst port 48198) || (dst port 56386)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.5.207/32) || (dst net 116.0.42.234/32) || (dst net 116.0.98.11/32) || (dst net 116.0.138.149/32) || (dst net 116.0.160.41/32))),
	((dst port 3390) || (dst port 20509) || (dst port 31461) || (dst port 35216) || (dst port 40565)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.5.248/32) || (dst net 117.0.26.127/32) || (dst net 117.0.36.250/32) || (dst net 117.0.177.50/32) || (dst net 117.0.252.152/32))),
	((dst port 20095) || (dst port 30754) || (dst port 37094) || (dst port 38123) || (dst port 61492)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.32.122/32) || (dst net 118.0.72.41/32) || (dst net 118.0.75.13/32) || (dst net 118.0.95.141/32) || (dst net 118.0.224.99/32))),
	((dst port 3823) || (dst port 16682) || (dst port 32785) || (dst port 46921) || (dst port 56863)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.69.175/32) || (dst net 119.0.103.129/32) || (dst net 119.0.172.231/32) || (dst net 119.0.221.190/32) || (dst net 119.0.247.248/32))),
	((dst port 3190) || (dst port 4935) || (dst port 40952) || (dst port 59021) || (dst port 61915)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.52.160/32) || (dst net 120.0.96.12/32) || (dst net 120.0.115.242/32) || (dst net 120.0.183.142/32) || (dst net 120.0.235.122/32))),
	((dst port 4464) || (dst port 20655) || (dst port 25795) || (dst port 47410) || (dst port 57496)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.38.232/32) || (dst net 121.0.69.56/32) || (dst net 121.0.116.67/32) || (dst net 121.0.117.200/32) || (dst net 121.0.200.168/32))),
	((dst port 312) || (dst port 605) || (dst port 14510) || (dst port 17689) || (dst port 26578)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.22.159/32) || (dst net 122.0.55.203/32) || (dst net 122.0.143.171/32) || (dst net 122.0.221.120/32) || (dst net 122.0.253.5/32))),
	((dst port 6843) || (dst port 33986) || (dst port 39955) || (dst port 51065) || (dst port 64129)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.23.51/32) || (dst net 123.0.48.163/32) || (dst net 123.0.92.19/32) || (dst net 123.0.229.218/32) || (dst net 123.0.230.232/32))),
	((dst port 12908) || (dst port 23342) || (dst port 33896) || (dst port 36691) || (dst port 41426)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.28.125/32) || (dst net 124.0.66.46/32) || (dst net 124.0.116.232/32) || (dst net 124.0.117.43/32) || (dst net 124.0.213.19/32))),
	((dst port 20423) || (dst port 34597) || (dst port 36996) || (dst port 39238) || (dst port 43470)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.13.198/32) || (dst net 125.0.95.139/32) || (dst net 125.0.102.228/32) || (dst net 125.0.121.203/32) || (dst net 125.0.217.24/32))),
	((dst port 9896) || (dst port 26484) || (dst port 59712) || (dst port 60356) || (dst port 64470)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.21.100/32) || (dst net 126.0.25.179/32) || (dst net 126.0.80.19/32) || (dst net 126.0.107.186/32) || (dst net 126.0.250.115/32))),
	((dst port 25210) || (dst port 28153) || (dst port 30522) || (dst port 49229) || (dst port 55607)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.43.202/32) || (dst net 127.0.53.188/32) || (dst net 127.0.196.91/32) || (dst net 127.0.202.182/32) || (dst net 127.0.208.226/32))),
	((dst port 5152) || (dst port 13086) || (dst port 21130) || (dst port 30572) || (dst port 63428)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.47.74/32) || (dst net 128.0.60.0/32) || (dst net 128.0.179.32/32) || (dst net 128.0.197.166/32) || (dst net 128.0.200.4/32))),
	((dst port 2630) || (dst port 15601) || (dst port 21869) || (dst port 41996) || (dst port 53965)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.39.90/32) || (dst net 129.0.134.27/32) || (dst net 129.0.150.113/32) || (dst net 129.0.185.131/32) || (dst net 129.0.249.49/32))),
	((dst port 2959) || (dst port 9995) || (dst port 33666) || (dst port 34951) || (dst port 55409)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.7.33/32) || (dst net 130.0.17.169/32) || (dst net 130.0.90.77/32) || (dst net 130.0.94.186/32) || (dst net 130.0.150.1/32))),
	((dst port 5505) || (dst port 9460) || (dst port 11901) || (dst port 29059) || (dst port 57613)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.32.202/32) || (dst net 131.0.57.23/32) || (dst net 131.0.73.187/32) || (dst net 131.0.176.11/32) || (dst net 131.0.249.141/32))),
	((dst port 7952) || (dst port 15199) || (dst port 26688) || (dst port 41057) || (dst port 53884)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.60.223/32) || (dst net 132.0.87.94/32) || (dst net 132.0.92.1/32) || (dst net 132.0.207.255/32) || (dst net 132.0.214.172/32))),
	((dst port 87) || (dst port 23694) || (dst port 27917) || (dst port 48637) || (dst port 54561)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.33.30/32) || (dst net 133.0.42.153/32) || (dst net 133.0.63.139/32) || (dst net 133.0.164.254/32) || (dst net 133.0.230.154/32))),
	((dst port 3494) || (dst port 3627) || (dst port 5717) || (dst port 14139) || (dst port 43475)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.28.216/32) || (dst net 134.0.54.238/32) || (dst net 134.0.72.47/32) || (dst net 134.0.77.251/32) || (dst net 134.0.115.64/32))),
	((dst port 894) || (dst port 7498) || (dst port 19407) || (dst port 28025) || (dst port 63915)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.10.120/32) || (dst net 135.0.87.124/32) || (dst net 135.0.96.61/32) || (dst net 135.0.155.105/32) || (dst net 135.0.217.218/32))),
	((dst port 3275) || (dst port 14974) || (dst port 17852) || (dst port 28993) || (dst port 34648)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.2.68/32) || (dst net 136.0.69.57/32) || (dst net 136.0.137.185/32) || (dst net 136.0.139.179/32) || (dst net 136.0.206.16/32))),
	((dst port 31241) || (dst port 38701) || (dst port 48441) || (dst port 53905) || (dst port 63777)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.1.121/32) || (dst net 137.0.20.81/32) || (dst net 137.0.120.218/32) || (dst net 137.0.215.80/32) || (dst net 137.0.216.141/32))),
	((dst port 18389) || (dst port 38512) || (dst port 41374) || (dst port 46651) || (dst port 55725)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.14.249/32) || (dst net 138.0.33.31/32) || (dst net 138.0.119.220/32) || (dst net 138.0.223.240/32) || (dst net 138.0.233.17/32))),
	((dst port 1980) || (dst port 22117) || (dst port 22196) || (dst port 45843) || (dst port 61216)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.50.219/32) || (dst net 139.0.52.160/32) || (dst net 139.0.77.0/32) || (dst net 139.0.177.249/32) || (dst net 139.0.230.60/32))),
	((dst port 14840) || (dst port 31518) || (dst port 49402) || (dst port 53398) || (dst port 56758)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.106.177/32) || (dst net 140.0.131.193/32) || (dst net 140.0.167.124/32) || (dst net 140.0.198.147/32) || (dst net 140.0.250.225/32))),
	((dst port 13676) || (dst port 18482) || (dst port 23428) || (dst port 37880) || (dst port 47801)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.129.85/32) || (dst net 141.0.161.5/32) || (dst net 141.0.195.171/32) || (dst net 141.0.230.235/32) || (dst net 141.0.238.237/32))),
	((dst port 3220) || (dst port 17526) || (dst port 37529) || (dst port 51710) || (dst port 63684)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.11.204/32) || (dst net 142.0.70.130/32) || (dst net 142.0.93.8/32) || (dst net 142.0.153.241/32) || (dst net 142.0.237.202/32))),
	((dst port 26647) || (dst port 37526) || (dst port 39684) || (dst port 43048) || (dst port 55370)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.48.60/32) || (dst net 143.0.60.239/32) || (dst net 143.0.133.146/32) || (dst net 143.0.174.255/32) || (dst net 143.0.190.84/32))),
	((dst port 23087) || (dst port 33007) || (dst port 35401) || (dst port 49701) || (dst port 58232)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.124.180/32) || (dst net 144.0.159.184/32) || (dst net 144.0.167.190/32) || (dst net 144.0.206.173/32) || (dst net 144.0.251.220/32))),
	((dst port 2938) || (dst port 27838) || (dst port 41207) || (dst port 45350) || (dst port 58544)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.132.253/32) || (dst net 145.0.144.117/32) || (dst net 145.0.149.224/32) || (dst net 145.0.190.128/32) || (dst net 145.0.202.133/32))),
	((dst port 10147) || (dst port 22141) || (dst port 23001) || (dst port 36144) || (dst port 45559)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.18.141/32) || (dst net 146.0.22.255/32) || (dst net 146.0.121.144/32) || (dst net 146.0.200.140/32) || (dst net 146.0.218.115/32))),
	((dst port 137) || (dst port 2275) || (dst port 17769) || (dst port 36416) || (dst port 57409)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.21.121/32) || (dst net 147.0.147.165/32) || (dst net 147.0.179.87/32) || (dst net 147.0.197.153/32) || (dst net 147.0.207.8/32))),
	((dst port 13953) || (dst port 21953) || (dst port 22717) || (dst port 54355) || (dst port 55160)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.40.250/32) || (dst net 148.0.61.107/32) || (dst net 148.0.61.169/32) || (dst net 148.0.98.87/32) || (dst net 148.0.135.41/32))),
	((dst port 11744) || (dst port 21620) || (dst port 29268) || (dst port 46599) || (dst port 55505)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.68.208/32) || (dst net 149.0.157.36/32) || (dst net 149.0.195.183/32) || (dst net 149.0.217.101/32) || (dst net 149.0.250.234/32))),
	((dst port 13308) || (dst port 29934) || (dst port 34607) || (dst port 62539) || (dst port 63278)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.7.152/32) || (dst net 150.0.100.108/32) || (dst net 150.0.138.130/32) || (dst net 150.0.181.204/32) || (dst net 150.0.223.96/32))),
	((dst port 8774) || (dst port 9800) || (dst port 10661) || (dst port 16300) || (dst port 19994)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.44.112/32) || (dst net 151.0.127.246/32) || (dst net 151.0.131.136/32) || (dst net 151.0.195.180/32) || (dst net 151.0.244.213/32))),
	((dst port 1801) || (dst port 5337) || (dst port 6426) || (dst port 10170) || (dst port 43010)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.93.238/32) || (dst net 152.0.132.210/32) || (dst net 152.0.181.235/32) || (dst net 152.0.193.69/32) || (dst net 152.0.194.107/32))),
	((dst port 11615) || (dst port 22796) || (dst port 32586) || (dst port 46521) || (dst port 51677)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.170.137/32) || (dst net 153.0.193.192/32) || (dst net 153.0.214.11/32) || (dst net 153.0.235.89/32) || (dst net 153.0.253.203/32))),
	((dst port 16532) || (dst port 19680) || (dst port 43708) || (dst port 61366) || (dst port 62592)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.8.53/32) || (dst net 154.0.14.198/32) || (dst net 154.0.131.234/32) || (dst net 154.0.179.191/32) || (dst net 154.0.243.236/32))),
	((dst port 24343) || (dst port 35280) || (dst port 41923) || (dst port 45203) || (dst port 59749)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.31.48/32) || (dst net 155.0.168.95/32) || (dst net 155.0.178.187/32) || (dst net 155.0.184.152/32) || (dst net 155.0.219.108/32))),
	((dst port 10161) || (dst port 19098) || (dst port 53812) || (dst port 53838) || (dst port 62232)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.8.101/32) || (dst net 156.0.66.124/32) || (dst net 156.0.210.90/32) || (dst net 156.0.214.240/32) || (dst net 156.0.246.172/32))),
	((dst port 4999) || (dst port 14948) || (dst port 23912) || (dst port 37723) || (dst port 63959)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.14.149/32) || (dst net 157.0.123.27/32) || (dst net 157.0.165.162/32) || (dst net 157.0.210.136/32) || (dst net 157.0.242.101/32))),
	((dst port 10378) || (dst port 15525) || (dst port 22703) || (dst port 31656) || (dst port 31921)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.5.202/32) || (dst net 158.0.25.121/32) || (dst net 158.0.36.186/32) || (dst net 158.0.45.55/32) || (dst net 158.0.111.131/32))),
	((dst port 4115) || (dst port 6747) || (dst port 17715) || (dst port 33025) || (dst port 33697)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.43.147/32) || (dst net 159.0.63.74/32) || (dst net 159.0.74.53/32) || (dst net 159.0.204.251/32) || (dst net 159.0.238.215/32))),
	((dst port 20700) || (dst port 23925) || (dst port 32001) || (dst port 45843) || (dst port 64459)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.27.93/32) || (dst net 160.0.80.74/32) || (dst net 160.0.124.191/32) || (dst net 160.0.130.192/32) || (dst net 160.0.204.104/32))),
	((dst port 13553) || (dst port 19884) || (dst port 37759) || (dst port 51106) || (dst port 54610)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.83.229/32) || (dst net 161.0.157.68/32) || (dst net 161.0.171.35/32) || (dst net 161.0.180.251/32) || (dst net 161.0.232.252/32))),
	((dst port 5558) || (dst port 9429) || (dst port 15704) || (dst port 20661) || (dst port 31032)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.3.165/32) || (dst net 162.0.7.6/32) || (dst net 162.0.60.222/32) || (dst net 162.0.126.69/32) || (dst net 162.0.187.52/32))),
	((dst port 7380) || (dst port 18535) || (dst port 29066) || (dst port 36109) || (dst port 55183)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.49.112/32) || (dst net 163.0.137.169/32) || (dst net 163.0.145.196/32) || (dst net 163.0.200.73/32) || (dst net 163.0.211.11/32))),
	((dst port 3721) || (dst port 26121) || (dst port 30265) || (dst port 49384) || (dst port 57641)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.24.171/32) || (dst net 164.0.139.31/32) || (dst net 164.0.144.136/32) || (dst net 164.0.152.237/32) || (dst net 164.0.185.213/32))),
	((dst port 10391) || (dst port 33964) || (dst port 56432) || (dst port 60989) || (dst port 64355)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.68.76/32) || (dst net 165.0.116.5/32) || (dst net 165.0.161.242/32) || (dst net 165.0.220.208/32) || (dst net 165.0.220.247/32))),
	((dst port 1007) || (dst port 24012) || (dst port 30539) || (dst port 53813) || (dst port 58721)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.164.47/32) || (dst net 166.0.191.33/32) || (dst net 166.0.192.252/32) || (dst net 166.0.206.100/32) || (dst net 166.0.226.26/32))),
	((dst port 795) || (dst port 1972) || (dst port 2427) || (dst port 33603) || (dst port 46723)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.17.219/32) || (dst net 167.0.76.27/32) || (dst net 167.0.126.129/32) || (dst net 167.0.154.249/32) || (dst net 167.0.220.204/32))),
	((dst port 6370) || (dst port 12295) || (dst port 15199) || (dst port 50311) || (dst port 53820)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.107.101/32) || (dst net 168.0.117.172/32) || (dst net 168.0.125.103/32) || (dst net 168.0.146.142/32) || (dst net 168.0.188.251/32))),
	((dst port 194) || (dst port 16252) || (dst port 53262) || (dst port 55046) || (dst port 64238)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.44.50/32) || (dst net 169.0.93.80/32) || (dst net 169.0.128.31/32) || (dst net 169.0.202.66/32) || (dst net 169.0.252.124/32))),
	((dst port 11587) || (dst port 32502) || (dst port 42183) || (dst port 48727) || (dst port 58206)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.23.140/32) || (dst net 170.0.57.230/32) || (dst net 170.0.107.104/32) || (dst net 170.0.124.232/32) || (dst net 170.0.233.249/32))),
	((dst port 9073) || (dst port 34540) || (dst port 36777) || (dst port 54807) || (dst port 62404)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.2.192/32) || (dst net 171.0.151.190/32) || (dst net 171.0.168.153/32) || (dst net 171.0.216.144/32) || (dst net 171.0.239.75/32))),
	((dst port 486) || (dst port 25727) || (dst port 43134) || (dst port 44587) || (dst port 60460)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.5.111/32) || (dst net 172.0.74.117/32) || (dst net 172.0.84.208/32) || (dst net 172.0.89.111/32) || (dst net 172.0.104.139/32))),
	((dst port 23133) || (dst port 27177) || (dst port 28966) || (dst port 35152) || (dst port 53622)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.36.66/32) || (dst net 173.0.124.147/32) || (dst net 173.0.130.75/32) || (dst net 173.0.159.222/32) || (dst net 173.0.233.197/32))),
	((dst port 1326) || (dst port 7875) || (dst port 14151) || (dst port 15834) || (dst port 51496)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.54.84/32) || (dst net 174.0.118.177/32) || (dst net 174.0.120.94/32) || (dst net 174.0.186.163/32) || (dst net 174.0.233.175/32))),
	((dst port 3786) || (dst port 22952) || (dst port 29095) || (dst port 57974) || (dst port 64605)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.39.153/32) || (dst net 175.0.78.92/32) || (dst net 175.0.181.43/32) || (dst net 175.0.182.205/32) || (dst net 175.0.214.78/32))),
	((dst port 30448) || (dst port 33896) || (dst port 43024) || (dst port 48394) || (dst port 50044)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.3.221/32) || (dst net 176.0.64.20/32) || (dst net 176.0.65.103/32) || (dst net 176.0.179.252/32) || (dst net 176.0.221.106/32))),
	((dst port 17405) || (dst port 19279) || (dst port 37412) || (dst port 40889) || (dst port 59249)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.2.148/32) || (dst net 177.0.106.236/32) || (dst net 177.0.147.223/32) || (dst net 177.0.161.219/32) || (dst net 177.0.213.86/32))),
	((dst port 33151) || (dst port 34260) || (dst port 35936) || (dst port 43983) || (dst port 57382)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.24.10/32) || (dst net 178.0.78.221/32) || (dst net 178.0.90.247/32) || (dst net 178.0.92.40/32) || (dst net 178.0.155.115/32))),
	((dst port 3170) || (dst port 38221) || (dst port 42265) || (dst port 55126) || (dst port 59640)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.49.198/32) || (dst net 179.0.122.80/32) || (dst net 179.0.165.110/32) || (dst net 179.0.212.200/32) || (dst net 179.0.252.218/32))),
	((dst port 15605) || (dst port 24521) || (dst port 30691) || (dst port 45277) || (dst port 52406)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.23.3/32) || (dst net 180.0.60.208/32) || (dst net 180.0.136.237/32) || (dst net 180.0.151.221/32) || (dst net 180.0.249.72/32))),
	((dst port 7466) || (dst port 21195) || (dst port 36796) || (dst port 41825) || (dst port 51431)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.1.190/32) || (dst net 181.0.25.26/32) || (dst net 181.0.106.49/32) || (dst net 181.0.129.55/32) || (dst net 181.0.135.220/32))),
	((dst port 9454) || (dst port 30302) || (dst port 34677) || (dst port 57155) || (dst port 58601)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.26.196/32) || (dst net 182.0.55.208/32) || (dst net 182.0.58.21/32) || (dst net 182.0.83.165/32) || (dst net 182.0.137.112/32))),
	((dst port 25216) || (dst port 26105) || (dst port 40181) || (dst port 51656) || (dst port 63398)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.36.91/32) || (dst net 183.0.136.184/32) || (dst net 183.0.190.37/32) || (dst net 183.0.224.61/32) || (dst net 183.0.246.54/32))),
	((dst port 11176) || (dst port 15131) || (dst port 16612) || (dst port 32436) || (dst port 35917)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.0.187/32) || (dst net 184.0.25.125/32) || (dst net 184.0.82.4/32) || (dst net 184.0.132.113/32) || (dst net 184.0.252.149/32))),
	((dst port 1188) || (dst port 16188) || (dst port 37800) || (dst port 57867) || (dst port 57949)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.44.3/32) || (dst net 185.0.159.18/32) || (dst net 185.0.179.48/32) || (dst net 185.0.194.206/32) || (dst net 185.0.215.42/32))),
	((dst port 2983) || (dst port 3744) || (dst port 14064) || (dst port 48754) || (dst port 58921)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.44.122/32) || (dst net 186.0.65.52/32) || (dst net 186.0.176.147/32) || (dst net 186.0.195.52/32) || (dst net 186.0.244.167/32))),
	((dst port 7157) || (dst port 21966) || (dst port 26967) || (dst port 42317) || (dst port 42405)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.27.252/32) || (dst net 187.0.30.223/32) || (dst net 187.0.87.83/32) || (dst net 187.0.200.7/32) || (dst net 187.0.208.200/32))),
	((dst port 33650) || (dst port 39015) || (dst port 41754) || (dst port 57146) || (dst port 64230)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.54.25/32) || (dst net 188.0.71.122/32) || (dst net 188.0.150.255/32) || (dst net 188.0.193.79/32) || (dst net 188.0.252.176/32))),
	((dst port 7455) || (dst port 41175) || (dst port 47919) || (dst port 59001) || (dst port 59944)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.37.165/32) || (dst net 189.0.116.115/32) || (dst net 189.0.163.101/32) || (dst net 189.0.211.182/32) || (dst net 189.0.251.40/32))),
	((dst port 25703) || (dst port 32517) || (dst port 40046) || (dst port 40778) || (dst port 55810)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.48.246/32) || (dst net 190.0.88.148/32) || (dst net 190.0.92.53/32) || (dst net 190.0.150.199/32) || (dst net 190.0.177.232/32))),
	((dst port 16569) || (dst port 18920) || (dst port 30056) || (dst port 60231) || (dst port 64809)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.8.219/32) || (dst net 191.0.95.240/32) || (dst net 191.0.123.221/32) || (dst net 191.0.131.102/32) || (dst net 191.0.179.245/32))),
	((dst port 2007) || (dst port 18813) || (dst port 38506) || (dst port 61077) || (dst port 61385)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.35.89/32) || (dst net 192.0.61.33/32) || (dst net 192.0.78.89/32) || (dst net 192.0.151.222/32) || (dst net 192.0.195.243/32))),
	((dst port 12083) || (dst port 19389) || (dst port 28248) || (dst port 44885) || (dst port 47291)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.2.170/32) || (dst net 193.0.7.103/32) || (dst net 193.0.9.126/32) || (dst net 193.0.57.159/32) || (dst net 193.0.230.135/32))),
	((dst port 5467) || (dst port 12923) || (dst port 18505) || (dst port 38915) || (dst port 44839)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.0.20/32) || (dst net 194.0.53.32/32) || (dst net 194.0.108.198/32) || (dst net 194.0.179.103/32) || (dst net 194.0.190.186/32))),
	((dst port 3167) || (dst port 14866) || (dst port 23343) || (dst port 29121) || (dst port 40992)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.141.143/32) || (dst net 195.0.200.251/32) || (dst net 195.0.228.209/32) || (dst net 195.0.235.253/32) || (dst net 195.0.254.240/32))),
	((dst port 16584) || (dst port 24365) || (dst port 26015) || (dst port 45285) || (dst port 50156)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.60.52/32) || (dst net 196.0.125.55/32) || (dst net 196.0.131.158/32) || (dst net 196.0.142.11/32) || (dst net 196.0.222.28/32))),
	((dst port 10850) || (dst port 44758) || (dst port 53584) || (dst port 59013) || (dst port 64593)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.17.108/32) || (dst net 197.0.24.6/32) || (dst net 197.0.47.60/32) || (dst net 197.0.60.66/32) || (dst net 197.0.230.33/32))),
	((dst port 5294) || (dst port 20573) || (dst port 43178) || (dst port 48522) || (dst port 52789)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.74.192/32) || (dst net 198.0.104.250/32) || (dst net 198.0.114.86/32) || (dst net 198.0.128.9/32) || (dst net 198.0.251.19/32))),
	((dst port 5976) || (dst port 27711) || (dst port 28679) || (dst port 47680) || (dst port 51664)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.7.200/32) || (dst net 199.0.15.210/32) || (dst net 199.0.151.41/32) || (dst net 199.0.163.185/32) || (dst net 199.0.219.135/32))),
	((dst port 29978) || (dst port 32661) || (dst port 45917) || (dst port 59976) || (dst port 61889)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.90.83/32) || (dst net 200.0.203.192/32) || (dst net 200.0.220.243/32) || (dst net 200.0.242.192/32) || (dst net 200.0.250.176/32))),
	((dst port 11971) || (dst port 28014) || (dst port 50029) || (dst port 55744) || (dst port 61026)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.59.193/32) || (dst net 201.0.83.12/32) || (dst net 201.0.226.249/32) || (dst net 201.0.247.35/32) || (dst net 201.0.252.202/32))),
	((dst port 5030) || (dst port 9488) || (dst port 15004) || (dst port 23655) || (dst port 52663)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.17.35/32) || (dst net 202.0.31.12/32) || (dst net 202.0.120.182/32) || (dst net 202.0.189.47/32) || (dst net 202.0.231.48/32))),
	((dst port 3699) || (dst port 12503) || (dst port 37308) || (dst port 46872) || (dst port 48934)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.17.110/32) || (dst net 203.0.72.114/32) || (dst net 203.0.113.0/32) || (dst net 203.0.185.240/32) || (dst net 203.0.224.116/32))),
	((dst port 16364) || (dst port 22292) || (dst port 23073) || (dst port 34410) || (dst port 56753)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.83.154/32) || (dst net 204.0.152.143/32) || (dst net 204.0.167.172/32) || (dst net 204.0.175.74/32) || (dst net 204.0.219.73/32))),
	((dst port 10447) || (dst port 17952) || (dst port 52173) || (dst port 53459) || (dst port 55466)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.51.57/32) || (dst net 205.0.142.56/32) || (dst net 205.0.182.94/32) || (dst net 205.0.197.15/32) || (dst net 205.0.229.217/32))),
	((dst port 2815) || (dst port 5976) || (dst port 30836) || (dst port 56744) || (dst port 63785)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.61.191/32) || (dst net 206.0.110.219/32) || (dst net 206.0.188.131/32) || (dst net 206.0.210.107/32) || (dst net 206.0.224.164/32))),
	((dst port 4754) || (dst port 12317) || (dst port 43076) || (dst port 50685) || (dst port 54072)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.23.159/32) || (dst net 207.0.117.230/32) || (dst net 207.0.179.98/32) || (dst net 207.0.187.217/32) || (dst net 207.0.198.62/32))),
	((dst port 11884) || (dst port 15373) || (dst port 34656) || (dst port 38757) || (dst port 55645)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.14.155/32) || (dst net 208.0.18.232/32) || (dst net 208.0.210.145/32) || (dst net 208.0.225.96/32) || (dst net 208.0.250.87/32))),
	((dst port 42276) || (dst port 43731) || (dst port 48535) || (dst port 56557) || (dst port 56742)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.24.225/32) || (dst net 209.0.30.217/32) || (dst net 209.0.76.162/32) || (dst net 209.0.114.36/32) || (dst net 209.0.128.247/32))),
	((dst port 6315) || (dst port 18035) || (dst port 20091) || (dst port 27160) || (dst port 59701)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.50.109/32) || (dst net 210.0.64.102/32) || (dst net 210.0.120.68/32) || (dst net 210.0.131.89/32) || (dst net 210.0.171.105/32))),
	((dst port 13539) || (dst port 22677) || (dst port 36807) || (dst port 42490) || (dst port 54706)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.91.52/32) || (dst net 211.0.127.119/32) || (dst net 211.0.149.3/32) || (dst net 211.0.153.78/32) || (dst net 211.0.179.132/32))),
	((dst port 12130) || (dst port 23130) || (dst port 29108) || (dst port 55650) || (dst port 59233)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.61.20/32) || (dst net 212.0.91.184/32) || (dst net 212.0.185.150/32) || (dst net 212.0.208.231/32) || (dst net 212.0.240.94/32))),
	((dst port 1742) || (dst port 20246) || (dst port 54102) || (dst port 57481) || (dst port 60640)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.109.26/32) || (dst net 213.0.150.9/32) || (dst net 213.0.199.76/32) || (dst net 213.0.209.100/32) || (dst net 213.0.255.220/32))),
	((dst port 3446) || (dst port 33066) || (dst port 35546) || (dst port 43465) || (dst port 57489)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.12.74/32) || (dst net 214.0.207.24/32) || (dst net 214.0.220.29/32) || (dst net 214.0.246.81/32) || (dst net 214.0.248.212/32))),
	((dst port 6021) || (dst port 15814) || (dst port 18376) || (dst port 37695) || (dst port 53239)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.44.182/32) || (dst net 215.0.75.102/32) || (dst net 215.0.92.251/32) || (dst net 215.0.175.169/32) || (dst net 215.0.248.114/32))),
	((dst port 32002) || (dst port 34427) || (dst port 43067) || (dst port 50094) || (dst port 63184)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.36.235/32) || (dst net 216.0.69.84/32) || (dst net 216.0.165.18/32) || (dst net 216.0.170.109/32) || (dst net 216.0.185.7/32))),
	((dst port 615) || (dst port 33665) || (dst port 41127) || (dst port 46374) || (dst port 58053)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.132.226/32) || (dst net 217.0.199.48/32) || (dst net 217.0.222.83/32) || (dst net 217.0.224.81/32) || (dst net 217.0.239.235/32))),
	((dst port 15421) || (dst port 15623) || (dst port 32914) || (dst port 34639) || (dst port 45573)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.8.220/32) || (dst net 218.0.23.148/32) || (dst net 218.0.89.53/32) || (dst net 218.0.159.228/32) || (dst net 218.0.195.166/32))),
	((dst port 874) || (dst port 27778) || (dst port 45533) || (dst port 46058) || (dst port 57870)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.188.228/32) || (dst net 219.0.210.153/32) || (dst net 219.0.222.176/32) || (dst net 219.0.234.92/32) || (dst net 219.0.238.19/32))),
	((dst port 9043) || (dst port 11514) || (dst port 20538) || (dst port 42758) || (dst port 64427)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.78.22/32) || (dst net 220.0.90.231/32) || (dst net 220.0.134.155/32) || (dst net 220.0.229.102/32) || (dst net 220.0.250.50/32))),
	((dst port 810) || (dst port 5742) || (dst port 24527) || (dst port 33877) || (dst port 49632)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.43.48/32) || (dst net 221.0.80.130/32) || (dst net 221.0.123.20/32) || (dst net 221.0.152.74/32) || (dst net 221.0.243.200/32))),
	((dst port 3853) || (dst port 11002) || (dst port 16193) || (dst port 27421) || (dst port 34284)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.42.77/32) || (dst net 222.0.69.100/32) || (dst net 222.0.154.49/32) || (dst net 222.0.188.104/32) || (dst net 222.0.239.210/32))),
	((dst port 9005) || (dst port 30453) || (dst port 38022) || (dst port 44215) || (dst port 60601)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.84.128/32) || (dst net 223.0.125.117/32) || (dst net 223.0.130.103/32) || (dst net 223.0.180.221/32) || (dst net 223.0.214.40/32))),
	((dst port 14726) || (dst port 35687) || (dst port 40950) || (dst port 48811) || (dst port 64471)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.9.81/32) || (dst net 224.0.62.179/32) || (dst net 224.0.80.117/32) || (dst net 224.0.187.152/32) || (dst net 224.0.189.12/32))),
	((dst port 39208) || (dst port 42674) || (dst port 49229) || (dst port 52290) || (dst port 60917)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.17.204/32) || (dst net 225.0.21.206/32) || (dst net 225.0.78.48/32) || (dst net 225.0.110.150/32) || (dst net 225.0.138.41/32))),
	((dst port 18262) || (dst port 18974) || (dst port 31784) || (dst port 48323) || (dst port 63903)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.38.144/32) || (dst net 226.0.77.125/32) || (dst net 226.0.141.164/32) || (dst net 226.0.213.101/32) || (dst net 226.0.243.40/32))),
	((dst port 7059) || (dst port 18861) || (dst port 20002) || (dst port 34351) || (dst port 55825)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.13.136/32) || (dst net 227.0.114.58/32) || (dst net 227.0.135.150/32) || (dst net 227.0.239.80/32) || (dst net 227.0.249.171/32))),
	((dst port 10591) || (dst port 13954) || (dst port 16750) || (dst port 37891) || (dst port 44371)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.15.193/32) || (dst net 228.0.50.237/32) || (dst net 228.0.78.137/32) || (dst net 228.0.105.30/32) || (dst net 228.0.127.80/32))),
	((dst port 8770) || (dst port 9948) || (dst port 15499) || (dst port 43980) || (dst port 48749)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.38.132/32) || (dst net 229.0.97.186/32) || (dst net 229.0.171.47/32) || (dst net 229.0.249.110/32) || (dst net 229.0.250.251/32))),
	((dst port 15818) || (dst port 28385) || (dst port 28716) || (dst port 60131) || (dst port 61220)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.81.179/32) || (dst net 230.0.167.100/32) || (dst net 230.0.174.33/32) || (dst net 230.0.211.14/32) || (dst net 230.0.242.60/32))),
	((dst port 4282) || (dst port 4883) || (dst port 11265) || (dst port 17777) || (dst port 60831)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.41.42/32) || (dst net 231.0.44.197/32) || (dst net 231.0.116.43/32) || (dst net 231.0.140.12/32) || (dst net 231.0.179.135/32))),
	((dst port 11577) || (dst port 13548) || (dst port 27784) || (dst port 31446) || (dst port 62134)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.61.163/32) || (dst net 232.0.157.8/32) || (dst net 232.0.176.165/32) || (dst net 232.0.205.146/32) || (dst net 232.0.241.245/32))),
	((dst port 19152) || (dst port 24679) || (dst port 36987) || (dst port 41955) || (dst port 45309)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.1.91/32) || (dst net 233.0.9.45/32) || (dst net 233.0.30.26/32) || (dst net 233.0.90.90/32) || (dst net 233.0.113.224/32))),
	((dst port 41887) || (dst port 49833) || (dst port 60557) || (dst port 62184) || (dst port 64707)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.114.173/32) || (dst net 234.0.144.90/32) || (dst net 234.0.165.67/32) || (dst net 234.0.166.178/32) || (dst net 234.0.224.69/32))),
	((dst port 1901) || (dst port 6618) || (dst port 14469) || (dst port 29952) || (dst port 46159)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.132.182/32) || (dst net 235.0.169.209/32) || (dst net 235.0.189.175/32) || (dst net 235.0.238.133/32) || (dst net 235.0.253.218/32))),
	((dst port 16544) || (dst port 28733) || (dst port 30082) || (dst port 41339) || (dst port 44623)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.1.63/32) || (dst net 236.0.162.138/32) || (dst net 236.0.214.242/32) || (dst net 236.0.222.92/32) || (dst net 236.0.234.29/32))),
	((dst port 6289) || (dst port 12451) || (dst port 19749) || (dst port 37917) || (dst port 53294)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.43.132/32) || (dst net 237.0.133.227/32) || (dst net 237.0.228.180/32) || (dst net 237.0.232.157/32) || (dst net 237.0.244.21/32))),
	((dst port 9046) || (dst port 22968) || (dst port 24951) || (dst port 47126) || (dst port 49754)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.24.214/32) || (dst net 238.0.138.133/32) || (dst net 238.0.188.227/32) || (dst net 238.0.221.168/32) || (dst net 238.0.240.153/32))),
	((dst port 6464) || (dst port 8008) || (dst port 28470) || (dst port 59435) || (dst port 65125)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.32.52/32) || (dst net 239.0.77.210/32) || (dst net 239.0.115.215/32) || (dst net 239.0.209.41/32) || (dst net 239.0.247.26/32))),
	((dst port 14626) || (dst port 17014) || (dst port 19369) || (dst port 23233) || (dst port 59249)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.6.60/32) || (dst net 240.0.7.90/32) || (dst net 240.0.18.184/32) || (dst net 240.0.175.63/32) || (dst net 240.0.178.200/32))),
	((dst port 18610) || (dst port 19429) || (dst port 35380) || (dst port 37030) || (dst port 60816)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.24.239/32) || (dst net 241.0.40.170/32) || (dst net 241.0.161.109/32) || (dst net 241.0.169.238/32) || (dst net 241.0.198.213/32))),
	((dst port 834) || (dst port 8518) || (dst port 27124) || (dst port 37034) || (dst port 64477)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.17.232/32) || (dst net 242.0.47.36/32) || (dst net 242.0.194.160/32) || (dst net 242.0.244.219/32) || (dst net 242.0.245.170/32))),
	((dst port 9913) || (dst port 14500) || (dst port 21147) || (dst port 30054) || (dst port 32588)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.124.55/32) || (dst net 243.0.199.59/32) || (dst net 243.0.202.13/32) || (dst net 243.0.205.250/32) || (dst net 243.0.225.95/32))),
	((dst port 1972) || (dst port 33430) || (dst port 48313) || (dst port 53429) || (dst port 57858)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.57.205/32) || (dst net 244.0.63.247/32) || (dst net 244.0.113.184/32) || (dst net 244.0.182.159/32) || (dst net 244.0.221.2/32))),
	((dst port 220) || (dst port 43967) || (dst port 56323) || (dst port 61775) || (dst port 63384)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.33.206/32) || (dst net 245.0.123.23/32) || (dst net 245.0.210.48/32) || (dst net 245.0.231.147/32) || (dst net 245.0.248.170/32))),
	((dst port 9398) || (dst port 14064) || (dst port 18132) || (dst port 44509) || (dst port 53657)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.23.35/32) || (dst net 246.0.58.74/32) || (dst net 246.0.58.130/32) || (dst net 246.0.241.149/32) || (dst net 246.0.248.185/32))),
	((dst port 28082) || (dst port 40687) || (dst port 45190) || (dst port 46620) || (dst port 56478)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.52.154/32) || (dst net 247.0.66.196/32) || (dst net 247.0.93.221/32) || (dst net 247.0.142.4/32) || (dst net 247.0.147.61/32))),
	((dst port 16083) || (dst port 20541) || (dst port 43825) || (dst port 45791) || (dst port 65469)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.50.213/32) || (dst net 248.0.75.104/32) || (dst net 248.0.139.154/32) || (dst net 248.0.181.154/32) || (dst net 248.0.254.44/32))),
	((dst port 10495) || (dst port 28269) || (dst port 34293) || (dst port 37045) || (dst port 65032)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.51.86/32) || (dst net 249.0.72.125/32) || (dst net 249.0.77.158/32) || (dst net 249.0.83.141/32) || (dst net 249.0.180.32/32))),
	((dst port 6549) || (dst port 15250) || (dst port 31021) || (dst port 62295) || (dst port 63630)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.87.225/32) || (dst net 250.0.108.145/32) || (dst net 250.0.134.76/32) || (dst net 250.0.164.52/32) || (dst net 250.0.167.163/32))),
	((dst port 10136) || (dst port 17354) || (dst port 26957) || (dst port 33821) || (dst port 34960)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.77.101/32) || (dst net 251.0.90.167/32) || (dst net 251.0.118.162/32) || (dst net 251.0.122.138/32) || (dst net 251.0.212.68/32))),
	((dst port 5550) || (dst port 6434) || (dst port 15309) || (dst port 22515) || (dst port 41624)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.20.96/32) || (dst net 252.0.81.196/32) || (dst net 252.0.90.108/32) || (dst net 252.0.94.146/32) || (dst net 252.0.161.170/32))),
	((dst port 20724) || (dst port 29250) || (dst port 59072) || (dst port 60780) || (dst port 62700)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.90.140/32) || (dst net 253.0.112.171/32) || (dst net 253.0.166.77/32) || (dst net 253.0.183.239/32) || (dst net 253.0.191.204/32))),
	((dst port 31963) || (dst port 32317) || (dst port 40385) || (dst port 55435) || (dst port 58154)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.71.96/32) || (dst net 254.0.95.125/32) || (dst net 254.0.176.202/32) || (dst net 254.0.217.234/32) || (dst net 254.0.246.48/32))),
	((dst port 291) || (dst port 3781) || (dst port 29678) || (dst port 44395) || (dst port 44824)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.3.48/32) || (dst net 255.0.6.250/32) || (dst net 255.0.23.31/32) || (dst net 255.0.71.182/32) || (dst net 255.0.232.175/32))),
	((dst port 33927) || (dst port 35957) || (dst port 46382) || (dst port 50091) || (dst port 55768)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.38.232/32) || (dst net 0.0.96.157/32) || (dst net 0.0.161.187/32) || (dst net 0.0.193.231/32) || (dst net 0.0.208.71/32))),
	((dst port 8061) || (dst port 12260) || (dst port 20417) || (dst port 31691) || (dst port 58333)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.14.212/32) || (dst net 1.0.78.142/32) || (dst net 1.0.90.183/32) || (dst net 1.0.132.189/32) || (dst net 1.0.183.90/32))),
	((dst port 11147) || (dst port 23018) || (dst port 37779) || (dst port 56672) || (dst port 63963)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.7.112/32) || (dst net 2.0.37.244/32) || (dst net 2.0.40.148/32) || (dst net 2.0.43.226/32) || (dst net 2.0.166.218/32))),
	((dst port 48064) || (dst port 53222) || (dst port 54887) || (dst port 57633) || (dst port 58131)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.94.166/32) || (dst net 3.0.96.199/32) || (dst net 3.0.113.81/32) || (dst net 3.0.146.93/32) || (dst net 3.0.213.221/32))),
	((dst port 15345) || (dst port 22525) || (dst port 25250) || (dst port 31621) || (dst port 43773)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.22.134/32) || (dst net 4.0.43.55/32) || (dst net 4.0.153.80/32) || (dst net 4.0.212.253/32) || (dst net 4.0.240.222/32))),
	((dst port 9001) || (dst port 27023) || (dst port 49975) || (dst port 50438) || (dst port 60790)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.7.176/32) || (dst net 5.0.19.162/32) || (dst net 5.0.21.67/32) || (dst net 5.0.74.179/32) || (dst net 5.0.255.39/32))),
	((dst port 16736) || (dst port 16741) || (dst port 37087) || (dst port 38786) || (dst port 61241)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.33.196/32) || (dst net 6.0.36.116/32) || (dst net 6.0.59.160/32) || (dst net 6.0.79.22/32) || (dst net 6.0.236.240/32))),
	((dst port 6401) || (dst port 21575) || (dst port 27425) || (dst port 40988) || (dst port 60573)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.6.151/32) || (dst net 7.0.79.109/32) || (dst net 7.0.105.126/32) || (dst net 7.0.186.176/32) || (dst net 7.0.192.204/32))),
	((dst port 4010) || (dst port 13573) || (dst port 28102) || (dst port 55423) || (dst port 59897)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.61.77/32) || (dst net 8.0.130.239/32) || (dst net 8.0.178.169/32) || (dst net 8.0.195.42/32) || (dst net 8.0.254.93/32))),
	((dst port 3294) || (dst port 53448) || (dst port 57696) || (dst port 60960) || (dst port 63794)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.28.31/32) || (dst net 9.0.74.139/32) || (dst net 9.0.150.90/32) || (dst net 9.0.170.137/32) || (dst net 9.0.199.100/32))),
	((dst port 25680) || (dst port 27297) || (dst port 42502) || (dst port 47701) || (dst port 57089)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.65.125/32) || (dst net 10.0.73.248/32) || (dst net 10.0.91.184/32) || (dst net 10.0.148.51/32) || (dst net 10.0.148.195/32))),
	((dst port 26319) || (dst port 32533) || (dst port 44152) || (dst port 44736) || (dst port 45821)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.101.102/32) || (dst net 11.0.152.167/32) || (dst net 11.0.161.34/32) || (dst net 11.0.162.86/32) || (dst net 11.0.249.22/32))),
	((dst port 7626) || (dst port 17085) || (dst port 38569) || (dst port 46131) || (dst port 52044)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.51.207/32) || (dst net 12.0.61.105/32) || (dst net 12.0.84.227/32) || (dst net 12.0.112.71/32) || (dst net 12.0.224.131/32))),
	((dst port 24061) || (dst port 28094) || (dst port 29606) || (dst port 34801) || (dst port 50402)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.54.237/32) || (dst net 13.0.100.211/32) || (dst net 13.0.127.217/32) || (dst net 13.0.176.160/32) || (dst net 13.0.253.250/32))),
	((dst port 32395) || (dst port 42558) || (dst port 44420) || (dst port 46671) || (dst port 56302)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.28.14/32) || (dst net 14.0.39.153/32) || (dst net 14.0.91.97/32) || (dst net 14.0.213.189/32) || (dst net 14.0.244.236/32))),
	((dst port 14008) || (dst port 31883) || (dst port 36599) || (dst port 42984) || (dst port 48019)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.5.194/32) || (dst net 15.0.28.99/32) || (dst net 15.0.76.220/32) || (dst net 15.0.82.136/32) || (dst net 15.0.218.72/32))),
	((dst port 2537) || (dst port 18804) || (dst port 25736) || (dst port 34834) || (dst port 51946)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.86.204/32) || (dst net 16.0.94.45/32) || (dst net 16.0.101.209/32) || (dst net 16.0.138.33/32) || (dst net 16.0.189.86/32))),
	((dst port 18438) || (dst port 19611) || (dst port 31048) || (dst port 37645) || (dst port 55362)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.13.57/32) || (dst net 17.0.63.61/32) || (dst net 17.0.65.28/32) || (dst net 17.0.167.96/32) || (dst net 17.0.244.5/32))),
	((dst port 25536) || (dst port 37944) || (dst port 49846) || (dst port 52831) || (dst port 54716)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.36.215/32) || (dst net 18.0.121.224/32) || (dst net 18.0.180.189/32) || (dst net 18.0.194.98/32) || (dst net 18.0.250.182/32))),
	((dst port 1922) || (dst port 8886) || (dst port 22361) || (dst port 60976) || (dst port 65144)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.90.19/32) || (dst net 19.0.126.144/32) || (dst net 19.0.160.207/32) || (dst net 19.0.225.53/32) || (dst net 19.0.254.239/32))),
	((dst port 24842) || (dst port 35694) || (dst port 47654) || (dst port 47960) || (dst port 52334)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.22.184/32) || (dst net 20.0.60.76/32) || (dst net 20.0.147.203/32) || (dst net 20.0.174.85/32) || (dst net 20.0.189.184/32))),
	((dst port 1155) || (dst port 1661) || (dst port 2553) || (dst port 18866) || (dst port 23689)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.16.130/32) || (dst net 21.0.33.23/32) || (dst net 21.0.148.69/32) || (dst net 21.0.151.200/32) || (dst net 21.0.234.229/32))),
	((dst port 6539) || (dst port 35604) || (dst port 35977) || (dst port 49583) || (dst port 63726)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.49.15/32) || (dst net 22.0.69.9/32) || (dst net 22.0.118.250/32) || (dst net 22.0.189.33/32) || (dst net 22.0.207.127/32))),
	((dst port 9408) || (dst port 19835) || (dst port 28287) || (dst port 51821) || (dst port 51980)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.15.96/32) || (dst net 23.0.43.129/32) || (dst net 23.0.99.5/32) || (dst net 23.0.112.149/32) || (dst net 23.0.193.198/32))),
	((dst port 12812) || (dst port 13993) || (dst port 34091) || (dst port 49632) || (dst port 52237)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.78.210/32) || (dst net 24.0.81.92/32) || (dst net 24.0.93.241/32) || (dst net 24.0.126.147/32) || (dst net 24.0.209.165/32))),
	((dst port 1145) || (dst port 15712) || (dst port 29105) || (dst port 48896) || (dst port 65534)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.127.43/32) || (dst net 25.0.143.36/32) || (dst net 25.0.160.52/32) || (dst net 25.0.187.182/32) || (dst net 25.0.201.46/32))),
	((dst port 8468) || (dst port 9777) || (dst port 21197) || (dst port 30714) || (dst port 42851)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.4.213/32) || (dst net 26.0.15.252/32) || (dst net 26.0.78.207/32) || (dst net 26.0.102.169/32) || (dst net 26.0.221.32/32))),
	((dst port 36287) || (dst port 37337) || (dst port 40994) || (dst port 53136) || (dst port 65485)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.109.37/32) || (dst net 27.0.112.15/32) || (dst net 27.0.156.71/32) || (dst net 27.0.209.56/32) || (dst net 27.0.232.6/32))),
	((dst port 882) || (dst port 21164) || (dst port 28885) || (dst port 34916) || (dst port 43130)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.0.160/32) || (dst net 28.0.53.100/32) || (dst net 28.0.92.124/32) || (dst net 28.0.186.70/32) || (dst net 28.0.223.77/32))),
	((dst port 10919) || (dst port 14916) || (dst port 25119) || (dst port 41752) || (dst port 48386)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.71.188/32) || (dst net 29.0.78.17/32) || (dst net 29.0.121.171/32) || (dst net 29.0.141.224/32) || (dst net 29.0.166.180/32))),
	((dst port 16095) || (dst port 36322) || (dst port 56826) || (dst port 59779) || (dst port 64933)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.3.166/32) || (dst net 30.0.54.154/32) || (dst net 30.0.91.174/32) || (dst net 30.0.147.215/32) || (dst net 30.0.181.96/32))),
	((dst port 977) || (dst port 12831) || (dst port 15059) || (dst port 49436) || (dst port 55758)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.49.253/32) || (dst net 31.0.155.149/32) || (dst net 31.0.175.162/32) || (dst net 31.0.204.48/32) || (dst net 31.0.223.224/32))),
	((dst port 15160) || (dst port 25715) || (dst port 35462) || (dst port 44307) || (dst port 52085)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.42.190/32) || (dst net 32.0.55.244/32) || (dst net 32.0.154.198/32) || (dst net 32.0.180.247/32) || (dst net 32.0.243.4/32))),
	((dst port 29930) || (dst port 32737) || (dst port 34158) || (dst port 41337) || (dst port 53487)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.38.154/32) || (dst net 33.0.91.188/32) || (dst net 33.0.96.105/32) || (dst net 33.0.120.157/32) || (dst net 33.0.131.32/32))),
	((dst port 3792) || (dst port 23418) || (dst port 42225) || (dst port 46857) || (dst port 50969)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.30.139/32) || (dst net 34.0.65.77/32) || (dst net 34.0.82.77/32) || (dst net 34.0.95.222/32) || (dst net 34.0.248.4/32))),
	((dst port 23591) || (dst port 42832) || (dst port 49436) || (dst port 56291) || (dst port 59616)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.97.76/32) || (dst net 35.0.121.150/32) || (dst net 35.0.139.184/32) || (dst net 35.0.153.210/32) || (dst net 35.0.158.147/32))),
	((dst port 668) || (dst port 10941) || (dst port 22322) || (dst port 28291) || (dst port 52814)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.91.224/32) || (dst net 36.0.116.126/32) || (dst net 36.0.189.117/32) || (dst net 36.0.252.45/32) || (dst net 36.0.254.125/32))),
	((dst port 4793) || (dst port 10587) || (dst port 11457) || (dst port 13365) || (dst port 20359)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.88.216/32) || (dst net 37.0.107.131/32) || (dst net 37.0.139.48/32) || (dst net 37.0.201.5/32) || (dst net 37.0.209.13/32))),
	((dst port 5674) || (dst port 12601) || (dst port 21470) || (dst port 36213) || (dst port 39163)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.63.145/32) || (dst net 38.0.95.127/32) || (dst net 38.0.110.27/32) || (dst net 38.0.159.173/32) || (dst net 38.0.243.82/32))),
	((dst port 28293) || (dst port 38754) || (dst port 46319) || (dst port 50142) || (dst port 63960)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.130.195/32) || (dst net 39.0.203.221/32) || (dst net 39.0.210.118/32) || (dst net 39.0.239.200/32) || (dst net 39.0.246.17/32))),
	((dst port 3337) || (dst port 7604) || (dst port 39809) || (dst port 40609) || (dst port 57901)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.13.138/32) || (dst net 40.0.105.236/32) || (dst net 40.0.109.230/32) || (dst net 40.0.224.205/32) || (dst net 40.0.242.39/32))),
	((dst port 4220) || (dst port 14162) || (dst port 39669) || (dst port 49248) || (dst port 61976)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.23.181/32) || (dst net 41.0.101.93/32) || (dst net 41.0.123.48/32) || (dst net 41.0.140.212/32) || (dst net 41.0.142.59/32))),
	((dst port 19760) || (dst port 33399) || (dst port 38782) || (dst port 44541) || (dst port 46105)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.127.200/32) || (dst net 42.0.131.200/32) || (dst net 42.0.199.157/32) || (dst net 42.0.232.177/32) || (dst net 42.0.243.248/32))),
	((dst port 15516) || (dst port 24242) || (dst port 47420) || (dst port 48424) || (dst port 62339)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.45.183/32) || (dst net 43.0.86.156/32) || (dst net 43.0.133.195/32) || (dst net 43.0.152.3/32) || (dst net 43.0.174.24/32))),
	((dst port 15264) || (dst port 19624) || (dst port 43005) || (dst port 47664) || (dst port 62033)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.24.183/32) || (dst net 44.0.90.176/32) || (dst net 44.0.152.134/32) || (dst net 44.0.183.198/32) || (dst net 44.0.249.101/32))),
	((dst port 22031) || (dst port 30905) || (dst port 32117) || (dst port 64051) || (dst port 64463)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.84.141/32) || (dst net 45.0.84.217/32) || (dst net 45.0.103.42/32) || (dst net 45.0.145.241/32) || (dst net 45.0.195.235/32))),
	((dst port 56639) || (dst port 57149) || (dst port 59290) || (dst port 61582) || (dst port 65081)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.62.110/32) || (dst net 46.0.146.140/32) || (dst net 46.0.155.25/32) || (dst net 46.0.192.205/32) || (dst net 46.0.193.4/32))),
	((dst port 5316) || (dst port 9150) || (dst port 35165) || (dst port 42831) || (dst port 64633)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.66.228/32) || (dst net 47.0.121.233/32) || (dst net 47.0.139.245/32) || (dst net 47.0.145.246/32) || (dst net 47.0.161.95/32))),
	((dst port 3602) || (dst port 5880) || (dst port 36276) || (dst port 51168) || (dst port 58791)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.19.102/32) || (dst net 48.0.118.198/32) || (dst net 48.0.143.171/32) || (dst net 48.0.145.246/32) || (dst net 48.0.246.62/32))),
	((dst port 14353) || (dst port 42710) || (dst port 55894) || (dst port 62452) || (dst port 63763)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.29.110/32) || (dst net 49.0.98.2/32) || (dst net 49.0.110.138/32) || (dst net 49.0.117.184/32) || (dst net 49.0.186.196/32))),
	((dst port 19554) || (dst port 24583) || (dst port 32351) || (dst port 32940) || (dst port 42622)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.14.159/32) || (dst net 50.0.15.103/32) || (dst net 50.0.43.93/32) || (dst net 50.0.229.48/32) || (dst net 50.0.232.253/32))),
	((dst port 243) || (dst port 6980) || (dst port 16289) || (dst port 27759) || (dst port 55594)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.93.136/32) || (dst net 51.0.99.77/32) || (dst net 51.0.114.18/32) || (dst net 51.0.172.145/32) || (dst net 51.0.246.248/32))),
	((dst port 8566) || (dst port 12645) || (dst port 21940) || (dst port 41124) || (dst port 57361)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.87.222/32) || (dst net 52.0.141.59/32) || (dst net 52.0.169.23/32) || (dst net 52.0.212.170/32) || (dst net 52.0.255.103/32))),
	((dst port 9839) || (dst port 21198) || (dst port 23651) || (dst port 25853) || (dst port 36863)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.27.57/32) || (dst net 53.0.61.208/32) || (dst net 53.0.67.198/32) || (dst net 53.0.199.231/32) || (dst net 53.0.200.4/32))),
	((dst port 2691) || (dst port 12522) || (dst port 22860) || (dst port 28030) || (dst port 28740)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.110.11/32) || (dst net 54.0.111.122/32) || (dst net 54.0.114.116/32) || (dst net 54.0.147.245/32) || (dst net 54.0.150.19/32))),
	((dst port 15923) || (dst port 37529) || (dst port 39172) || (dst port 44394) || (dst port 56399)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.12.4/32) || (dst net 55.0.48.5/32) || (dst net 55.0.99.146/32) || (dst net 55.0.113.143/32) || (dst net 55.0.245.19/32))),
	((dst port 31710) || (dst port 40955) || (dst port 51406) || (dst port 57120) || (dst port 63385)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.53.163/32) || (dst net 56.0.96.236/32) || (dst net 56.0.112.113/32) || (dst net 56.0.115.92/32) || (dst net 56.0.226.44/32))),
	((dst port 17444) || (dst port 18184) || (dst port 40791) || (dst port 47515) || (dst port 54780)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.25.25/32) || (dst net 57.0.174.126/32) || (dst net 57.0.181.145/32) || (dst net 57.0.223.49/32) || (dst net 57.0.248.60/32))),
	((dst port 24129) || (dst port 34435) || (dst port 51544) || (dst port 51993) || (dst port 57687)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.12.234/32) || (dst net 58.0.93.159/32) || (dst net 58.0.100.198/32) || (dst net 58.0.112.84/32) || (dst net 58.0.215.193/32))),
	((dst port 14215) || (dst port 14261) || (dst port 38560) || (dst port 39112) || (dst port 54844)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.115.24/32) || (dst net 59.0.140.252/32) || (dst net 59.0.145.238/32) || (dst net 59.0.171.55/32) || (dst net 59.0.252.244/32))),
	((dst port 6155) || (dst port 22695) || (dst port 28243) || (dst port 37802) || (dst port 60419)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.14.96/32) || (dst net 60.0.109.134/32) || (dst net 60.0.129.140/32) || (dst net 60.0.187.9/32) || (dst net 60.0.206.209/32))),
	((dst port 6920) || (dst port 9416) || (dst port 24426) || (dst port 46230) || (dst port 47165)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.116.101/32) || (dst net 61.0.141.23/32) || (dst net 61.0.216.201/32) || (dst net 61.0.229.167/32) || (dst net 61.0.253.218/32))),
	((dst port 7924) || (dst port 17629) || (dst port 20901) || (dst port 21771) || (dst port 61896)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.2.218/32) || (dst net 62.0.93.26/32) || (dst net 62.0.101.185/32) || (dst net 62.0.110.64/32) || (dst net 62.0.181.205/32))),
	((dst port 20639) || (dst port 26808) || (dst port 28786) || (dst port 55903) || (dst port 61807)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.25.75/32) || (dst net 63.0.124.119/32) || (dst net 63.0.128.207/32) || (dst net 63.0.148.234/32) || (dst net 63.0.156.191/32))),
	((dst port 12013) || (dst port 15355) || (dst port 37318) || (dst port 52711) || (dst port 58975)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.18.33/32) || (dst net 64.0.24.134/32) || (dst net 64.0.50.130/32) || (dst net 64.0.241.60/32) || (dst net 64.0.246.101/32))),
	((dst port 7776) || (dst port 14254) || (dst port 25471) || (dst port 33121) || (dst port 53973)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.30.223/32) || (dst net 65.0.56.4/32) || (dst net 65.0.174.43/32) || (dst net 65.0.208.155/32) || (dst net 65.0.221.62/32))),
	((dst port 18934) || (dst port 25656) || (dst port 30013) || (dst port 33563) || (dst port 52484)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.113.232/32) || (dst net 66.0.118.53/32) || (dst net 66.0.135.82/32) || (dst net 66.0.224.61/32) || (dst net 66.0.252.138/32))),
	((dst port 13904) || (dst port 22957) || (dst port 29229) || (dst port 45958) || (dst port 55334)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.47.193/32) || (dst net 67.0.76.245/32) || (dst net 67.0.127.146/32) || (dst net 67.0.172.70/32) || (dst net 67.0.251.202/32))),
	((dst port 95) || (dst port 19405) || (dst port 35705) || (dst port 40173) || (dst port 44621)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.165.60/32) || (dst net 68.0.178.214/32) || (dst net 68.0.202.250/32) || (dst net 68.0.227.222/32) || (dst net 68.0.229.69/32))),
	((dst port 7953) || (dst port 8205) || (dst port 16151) || (dst port 21115) || (dst port 46732)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.141.241/32) || (dst net 69.0.148.29/32) || (dst net 69.0.181.168/32) || (dst net 69.0.237.146/32) || (dst net 69.0.246.206/32))),
	((dst port 25828) || (dst port 29158) || (dst port 29910) || (dst port 44712) || (dst port 56130)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.17.223/32) || (dst net 70.0.81.229/32) || (dst net 70.0.124.16/32) || (dst net 70.0.162.193/32) || (dst net 70.0.238.199/32))),
	((dst port 14770) || (dst port 23483) || (dst port 55487) || (dst port 57298) || (dst port 62441)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.67.62/32) || (dst net 71.0.92.154/32) || (dst net 71.0.163.104/32) || (dst net 71.0.175.200/32) || (dst net 71.0.184.96/32))),
	((dst port 10254) || (dst port 35922) || (dst port 43972) || (dst port 45630) || (dst port 51054)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.26.221/32) || (dst net 72.0.29.53/32) || (dst net 72.0.152.188/32) || (dst net 72.0.165.85/32) || (dst net 72.0.185.157/32))),
	((dst port 7711) || (dst port 36967) || (dst port 37675) || (dst port 41195) || (dst port 64561)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.33.5/32) || (dst net 73.0.49.13/32) || (dst net 73.0.59.244/32) || (dst net 73.0.110.174/32) || (dst net 73.0.203.191/32))),
	((dst port 27610) || (dst port 33237) || (dst port 36457) || (dst port 39828) || (dst port 62403)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.121.96/32) || (dst net 74.0.135.148/32) || (dst net 74.0.149.224/32) || (dst net 74.0.208.129/32) || (dst net 74.0.212.218/32))),
	((dst port 12464) || (dst port 47636) || (dst port 55324) || (dst port 58000) || (dst port 61532)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.1.110/32) || (dst net 75.0.18.108/32) || (dst net 75.0.60.240/32) || (dst net 75.0.104.188/32) || (dst net 75.0.173.142/32))),
	((dst port 1214) || (dst port 21928) || (dst port 27236) || (dst port 29481) || (dst port 53196)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.39.189/32) || (dst net 76.0.94.139/32) || (dst net 76.0.117.4/32) || (dst net 76.0.117.59/32) || (dst net 76.0.236.140/32))),
	((dst port 6263) || (dst port 13509) || (dst port 15391) || (dst port 29026) || (dst port 51613)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.62.183/32) || (dst net 77.0.71.50/32) || (dst net 77.0.77.160/32) || (dst net 77.0.238.68/32) || (dst net 77.0.252.19/32))),
	((dst port 2491) || (dst port 19450) || (dst port 25418) || (dst port 29628) || (dst port 63211)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.25.232/32) || (dst net 78.0.33.150/32) || (dst net 78.0.44.150/32) || (dst net 78.0.191.226/32) || (dst net 78.0.203.252/32))),
	((dst port 1636) || (dst port 2363) || (dst port 6252) || (dst port 10474) || (dst port 35883)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.30.48/32) || (dst net 79.0.146.248/32) || (dst net 79.0.163.97/32) || (dst net 79.0.222.83/32) || (dst net 79.0.223.119/32))),
	((dst port 14745) || (dst port 33290) || (dst port 36602) || (dst port 42850) || (dst port 54165)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.93.230/32) || (dst net 80.0.139.36/32) || (dst net 80.0.181.125/32) || (dst net 80.0.202.40/32) || (dst net 80.0.218.64/32))),
	((dst port 1062) || (dst port 6724) || (dst port 13888) || (dst port 27498) || (dst port 36959)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.5.133/32) || (dst net 81.0.97.10/32) || (dst net 81.0.149.71/32) || (dst net 81.0.167.219/32) || (dst net 81.0.196.242/32))),
	((dst port 13062) || (dst port 18926) || (dst port 19209) || (dst port 19424) || (dst port 38359)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.44.125/32) || (dst net 82.0.107.230/32) || (dst net 82.0.148.43/32) || (dst net 82.0.183.211/32) || (dst net 82.0.225.254/32))),
	((dst port 26274) || (dst port 28387) || (dst port 43180) || (dst port 51717) || (dst port 63184)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.97.198/32) || (dst net 83.0.145.47/32) || (dst net 83.0.150.167/32) || (dst net 83.0.193.144/32) || (dst net 83.0.225.19/32))),
	((dst port 6106) || (dst port 11275) || (dst port 36975) || (dst port 39135) || (dst port 58720)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.5.136/32) || (dst net 84.0.70.164/32) || (dst net 84.0.71.219/32) || (dst net 84.0.130.95/32) || (dst net 84.0.185.229/32))),
	((dst port 5119) || (dst port 21628) || (dst port 28746) || (dst port 53704) || (dst port 60718)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.38.111/32) || (dst net 85.0.84.211/32) || (dst net 85.0.123.211/32) || (dst net 85.0.129.142/32) || (dst net 85.0.145.67/32))),
	((dst port 11210) || (dst port 31457) || (dst port 51982) || (dst port 55816) || (dst port 56431)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.62.24/32) || (dst net 86.0.137.17/32) || (dst net 86.0.168.105/32) || (dst net 86.0.172.158/32) || (dst net 86.0.210.47/32))),
	((dst port 10425) || (dst port 28881) || (dst port 31332) || (dst port 32817) || (dst port 34687)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.8.246/32) || (dst net 87.0.21.244/32) || (dst net 87.0.83.32/32) || (dst net 87.0.87.176/32) || (dst net 87.0.232.106/32))),
	((dst port 1131) || (dst port 15801) || (dst port 17027) || (dst port 43817) || (dst port 60036)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.15.44/32) || (dst net 88.0.16.234/32) || (dst net 88.0.31.13/32) || (dst net 88.0.144.141/32) || (dst net 88.0.178.28/32))),
	((dst port 4462) || (dst port 5553) || (dst port 16065) || (dst port 17302) || (dst port 30989)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.41.135/32) || (dst net 89.0.42.66/32) || (dst net 89.0.64.138/32) || (dst net 89.0.99.252/32) || (dst net 89.0.110.45/32))),
	((dst port 582) || (dst port 18400) || (dst port 22384) || (dst port 50327) || (dst port 56967)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.103.202/32) || (dst net 90.0.108.238/32) || (dst net 90.0.189.144/32) || (dst net 90.0.213.160/32) || (dst net 90.0.230.34/32))),
	((dst port 10821) || (dst port 17790) || (dst port 21878) || (dst port 23362) || (dst port 50608)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.41.50/32) || (dst net 91.0.52.9/32) || (dst net 91.0.121.70/32) || (dst net 91.0.149.200/32) || (dst net 91.0.198.216/32))),
	((dst port 13483) || (dst port 16258) || (dst port 17176) || (dst port 59658) || (dst port 60192)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.16.77/32) || (dst net 92.0.74.57/32) || (dst net 92.0.91.248/32) || (dst net 92.0.190.178/32) || (dst net 92.0.201.243/32))),
	((dst port 22021) || (dst port 22779) || (dst port 22841) || (dst port 45150) || (dst port 46213)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.80.206/32) || (dst net 93.0.105.227/32) || (dst net 93.0.140.223/32) || (dst net 93.0.148.8/32) || (dst net 93.0.252.25/32))),
	((dst port 26646) || (dst port 26904) || (dst port 31385) || (dst port 37432) || (dst port 54597)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.24.163/32) || (dst net 94.0.31.218/32) || (dst net 94.0.147.52/32) || (dst net 94.0.189.229/32) || (dst net 94.0.207.15/32))),
	((dst port 20884) || (dst port 40558) || (dst port 41421) || (dst port 42390) || (dst port 65099)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.2.24/32) || (dst net 95.0.14.52/32) || (dst net 95.0.115.152/32) || (dst net 95.0.158.8/32) || (dst net 95.0.207.110/32))),
	((dst port 2496) || (dst port 10008) || (dst port 28218) || (dst port 38440) || (dst port 54845)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.59.74/32) || (dst net 96.0.132.250/32) || (dst net 96.0.137.246/32) || (dst net 96.0.247.3/32) || (dst net 96.0.254.204/32))),
	((dst port 11782) || (dst port 20769) || (dst port 21877) || (dst port 30509) || (dst port 34484)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.33.245/32) || (dst net 97.0.142.201/32) || (dst net 97.0.144.245/32) || (dst net 97.0.161.35/32) || (dst net 97.0.212.228/32))),
	((dst port 3954) || (dst port 6499) || (dst port 46004) || (dst port 48500) || (dst port 59770)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.12.82/32) || (dst net 98.0.39.94/32) || (dst net 98.0.86.168/32) || (dst net 98.0.182.52/32) || (dst net 98.0.246.137/32))),
	((dst port 33958) || (dst port 35566) || (dst port 54662) || (dst port 58119) || (dst port 61259)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.86.201/32) || (dst net 99.0.150.245/32) || (dst net 99.0.188.208/32) || (dst net 99.0.199.37/32) || (dst net 99.0.255.138/32))),
	((dst port 7792) || (dst port 29392) || (dst port 30637) || (dst port 39455) || (dst port 56695)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.101.214/32) || (dst net 100.0.146.120/32) || (dst net 100.0.154.250/32) || (dst net 100.0.228.73/32) || (dst net 100.0.239.134/32))),
	((dst port 30791) || (dst port 44246) || (dst port 48688) || (dst port 58209) || (dst port 58571)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.45.125/32) || (dst net 101.0.78.195/32) || (dst net 101.0.134.141/32) || (dst net 101.0.209.217/32) || (dst net 101.0.210.184/32))),
	((dst port 13061) || (dst port 15861) || (dst port 33128) || (dst port 39100) || (dst port 40410)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.106.101/32) || (dst net 102.0.144.49/32) || (dst net 102.0.144.106/32) || (dst net 102.0.222.20/32) || (dst net 102.0.223.37/32))),
	((dst port 16581) || (dst port 19730) || (dst port 20508) || (dst port 23051) || (dst port 61121)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.48.195/32) || (dst net 103.0.94.100/32) || (dst net 103.0.105.216/32) || (dst net 103.0.220.83/32) || (dst net 103.0.236.112/32))),
	((dst port 18126) || (dst port 25714) || (dst port 31197) || (dst port 37145) || (dst port 46852)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.111.25/32) || (dst net 104.0.118.176/32) || (dst net 104.0.140.36/32) || (dst net 104.0.183.184/32) || (dst net 104.0.251.9/32))),
	((dst port 11327) || (dst port 15713) || (dst port 37351) || (dst port 42007) || (dst port 49687)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.25.78/32) || (dst net 105.0.39.41/32) || (dst net 105.0.39.240/32) || (dst net 105.0.94.43/32) || (dst net 105.0.251.3/32))),
	((dst port 3994) || (dst port 23394) || (dst port 27561) || (dst port 34987) || (dst port 42852)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.0.142/32) || (dst net 106.0.89.21/32) || (dst net 106.0.92.131/32) || (dst net 106.0.138.249/32) || (dst net 106.0.182.218/32))),
	((dst port 1280) || (dst port 1567) || (dst port 22300) || (dst port 53927) || (dst port 55871)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.17.249/32) || (dst net 107.0.84.186/32) || (dst net 107.0.93.192/32) || (dst net 107.0.216.201/32) || (dst net 107.0.245.208/32))),
	((dst port 3964) || (dst port 6558) || (dst port 34932) || (dst port 48536) || (dst port 52632)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.92.4/32) || (dst net 108.0.98.138/32) || (dst net 108.0.102.199/32) || (dst net 108.0.130.16/32) || (dst net 108.0.215.142/32))),
	((dst port 30843) || (dst port 38744) || (dst port 52193) || (dst port 53437) || (dst port 61324)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.9.193/32) || (dst net 109.0.30.23/32) || (dst net 109.0.81.158/32) || (dst net 109.0.97.101/32) || (dst net 109.0.119.221/32))),
	((dst port 18742) || (dst port 19610) || (dst port 41545) || (dst port 60502) || (dst port 64614)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.13.33/32) || (dst net 110.0.13.123/32) || (dst net 110.0.220.42/32) || (dst net 110.0.221.192/32) || (dst net 110.0.249.253/32))),
	((dst port 1224) || (dst port 9342) || (dst port 39605) || (dst port 49425) || (dst port 54485)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.63.9/32) || (dst net 111.0.89.211/32) || (dst net 111.0.99.190/32) || (dst net 111.0.111.69/32) || (dst net 111.0.235.77/32))),
	((dst port 2939) || (dst port 26403) || (dst port 43900) || (dst port 56922) || (dst port 63022)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.72.52/32) || (dst net 112.0.85.47/32) || (dst net 112.0.95.25/32) || (dst net 112.0.153.162/32) || (dst net 112.0.183.72/32))),
	((dst port 22737) || (dst port 26978) || (dst port 38541) || (dst port 54822) || (dst port 61370)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.59.204/32) || (dst net 113.0.144.110/32) || (dst net 113.0.190.174/32) || (dst net 113.0.227.19/32) || (dst net 113.0.251.35/32))),
	((dst port 2267) || (dst port 36525) || (dst port 39889) || (dst port 47892) || (dst port 52528)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.58.34/32) || (dst net 114.0.104.70/32) || (dst net 114.0.130.163/32) || (dst net 114.0.189.16/32) || (dst net 114.0.253.41/32))),
	((dst port 7319) || (dst port 8539) || (dst port 11474) || (dst port 46960) || (dst port 58035)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.132.118/32) || (dst net 115.0.151.247/32) || (dst net 115.0.171.34/32) || (dst net 115.0.211.98/32) || (dst net 115.0.253.249/32))),
	((dst port 3963) || (dst port 23340) || (dst port 29998) || (dst port 40037) || (dst port 46014)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.0.123/32) || (dst net 116.0.146.210/32) || (dst net 116.0.219.45/32) || (dst net 116.0.224.163/32) || (dst net 116.0.231.197/32))),
	((dst port 34217) || (dst port 53200) || (dst port 57491) || (dst port 60450) || (dst port 64921)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.13.110/32) || (dst net 117.0.96.191/32) || (dst net 117.0.163.148/32) || (dst net 117.0.175.152/32) || (dst net 117.0.226.147/32))),
	((dst port 20887) || (dst port 29746) || (dst port 37358) || (dst port 43879) || (dst port 52674)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.114.165/32) || (dst net 118.0.115.15/32) || (dst net 118.0.183.73/32) || (dst net 118.0.185.140/32) || (dst net 118.0.225.153/32))),
	((dst port 28323) || (dst port 30889) || (dst port 33353) || (dst port 38876) || (dst port 54391)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.4.18/32) || (dst net 119.0.64.113/32) || (dst net 119.0.85.120/32) || (dst net 119.0.206.237/32) || (dst net 119.0.219.220/32))),
	((dst port 14817) || (dst port 20287) || (dst port 39903) || (dst port 43274) || (dst port 53138)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.18.33/32) || (dst net 120.0.83.104/32) || (dst net 120.0.124.164/32) || (dst net 120.0.174.113/32) || (dst net 120.0.194.245/32))),
	((dst port 1844) || (dst port 7019) || (dst port 19684) || (dst port 23919) || (dst port 59327)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.45.254/32) || (dst net 121.0.125.1/32) || (dst net 121.0.132.40/32) || (dst net 121.0.137.21/32) || (dst net 121.0.150.62/32))),
	((dst port 982) || (dst port 2298) || (dst port 18574) || (dst port 19317) || (dst port 31698)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.41.249/32) || (dst net 122.0.56.87/32) || (dst net 122.0.120.27/32) || (dst net 122.0.166.87/32) || (dst net 122.0.191.28/32))),
	((dst port 8000) || (dst port 28162) || (dst port 34866) || (dst port 42137) || (dst port 46795)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.190.137/32) || (dst net 123.0.212.139/32) || (dst net 123.0.212.249/32) || (dst net 123.0.247.102/32) || (dst net 123.0.252.0/32))),
	((dst port 10091) || (dst port 27749) || (dst port 28245) || (dst port 58608) || (dst port 63200)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.36.28/32) || (dst net 124.0.98.28/32) || (dst net 124.0.189.8/32) || (dst net 124.0.212.126/32) || (dst net 124.0.243.37/32))),
	((dst port 453) || (dst port 6153) || (dst port 24600) || (dst port 26770) || (dst port 39124)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.10.180/32) || (dst net 125.0.38.1/32) || (dst net 125.0.45.237/32) || (dst net 125.0.77.109/32) || (dst net 125.0.206.76/32))),
	((dst port 3821) || (dst port 7979) || (dst port 18550) || (dst port 18706) || (dst port 60979)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.62.251/32) || (dst net 126.0.121.187/32) || (dst net 126.0.189.109/32) || (dst net 126.0.209.172/32) || (dst net 126.0.236.113/32))),
	((dst port 9688) || (dst port 21424) || (dst port 39996) || (dst port 50319) || (dst port 59155)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.7.33/32) || (dst net 127.0.35.51/32) || (dst net 127.0.38.19/32) || (dst net 127.0.191.131/32) || (dst net 127.0.243.61/32))),
	((dst port 1408) || (dst port 14862) || (dst port 27565) || (dst port 29087) || (dst port 42330)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.23.232/32) || (dst net 128.0.44.243/32) || (dst net 128.0.168.69/32) || (dst net 128.0.242.209/32) || (dst net 128.0.248.130/32))),
	((dst port 4506) || (dst port 27920) || (dst port 29383) || (dst port 33963) || (dst port 52418)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.66.81/32) || (dst net 129.0.81.145/32) || (dst net 129.0.168.167/32) || (dst net 129.0.187.124/32) || (dst net 129.0.229.18/32))),
	((dst port 20143) || (dst port 27632) || (dst port 30784) || (dst port 31758) || (dst port 36332)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.129.120/32) || (dst net 130.0.134.9/32) || (dst net 130.0.145.20/32) || (dst net 130.0.214.157/32) || (dst net 130.0.225.129/32))),
	((dst port 19173) || (dst port 22243) || (dst port 47042) || (dst port 59226) || (dst port 62248)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.35.233/32) || (dst net 131.0.57.23/32) || (dst net 131.0.94.183/32) || (dst net 131.0.160.76/32) || (dst net 131.0.169.107/32))),
	((dst port 19636) || (dst port 26587) || (dst port 47950) || (dst port 49241) || (dst port 56525)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.71.232/32) || (dst net 132.0.91.121/32) || (dst net 132.0.218.195/32) || (dst net 132.0.228.244/32) || (dst net 132.0.235.127/32))),
	((dst port 16930) || (dst port 17593) || (dst port 41253) || (dst port 45280) || (dst port 51590)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.29.84/32) || (dst net 133.0.101.132/32) || (dst net 133.0.156.196/32) || (dst net 133.0.205.140/32) || (dst net 133.0.232.63/32))),
	((dst port 7404) || (dst port 52252) || (dst port 55765) || (dst port 60831) || (dst port 64941)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.24.46/32) || (dst net 134.0.33.197/32) || (dst net 134.0.37.251/32) || (dst net 134.0.167.130/32) || (dst net 134.0.174.81/32))),
	((dst port 8526) || (dst port 20180) || (dst port 27377) || (dst port 34276) || (dst port 54948)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.28.5/32) || (dst net 135.0.125.201/32) || (dst net 135.0.136.44/32) || (dst net 135.0.203.21/32) || (dst net 135.0.219.253/32))),
	((dst port 11074) || (dst port 26454) || (dst port 33826) || (dst port 35778) || (dst port 47563)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.7.212/32) || (dst net 136.0.26.126/32) || (dst net 136.0.39.15/32) || (dst net 136.0.93.76/32) || (dst net 136.0.98.229/32))),
	((dst port 22934) || (dst port 23371) || (dst port 24146) || (dst port 39592) || (dst port 64353)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.17.125/32) || (dst net 137.0.42.28/32) || (dst net 137.0.123.113/32) || (dst net 137.0.163.228/32) || (dst net 137.0.178.245/32))),
	((dst port 29623) || (dst port 30040) || (dst port 41940) || (dst port 43890) || (dst port 53242)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.2.190/32) || (dst net 138.0.3.107/32) || (dst net 138.0.51.1/32) || (dst net 138.0.96.127/32) || (dst net 138.0.104.137/32))),
	((dst port 16985) || (dst port 48758) || (dst port 59185) || (dst port 63907) || (dst port 64493)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.11.206/32) || (dst net 139.0.57.41/32) || (dst net 139.0.145.119/32) || (dst net 139.0.171.228/32) || (dst net 139.0.201.170/32))),
	((dst port 5663) || (dst port 6715) || (dst port 11058) || (dst port 14592) || (dst port 57665)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.65.210/32) || (dst net 140.0.167.80/32) || (dst net 140.0.186.96/32) || (dst net 140.0.223.178/32) || (dst net 140.0.230.157/32))),
	((dst port 21371) || (dst port 35823) || (dst port 37364) || (dst port 50550) || (dst port 62491)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.102.21/32) || (dst net 141.0.112.147/32) || (dst net 141.0.123.145/32) || (dst net 141.0.152.29/32) || (dst net 141.0.217.94/32))),
	((dst port 27247) || (dst port 53661) || (dst port 54486) || (dst port 55847) || (dst port 58865)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.13.232/32) || (dst net 142.0.34.210/32) || (dst net 142.0.113.71/32) || (dst net 142.0.175.32/32) || (dst net 142.0.252.204/32))),
	((dst port 11339) || (dst port 22865) || (dst port 32897) || (dst port 48015) || (dst port 57894)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.31.226/32) || (dst net 143.0.69.36/32) || (dst net 143.0.106.138/32) || (dst net 143.0.134.63/32) || (dst net 143.0.137.98/32))),
	((dst port 26363) || (dst port 27028) || (dst port 39214) || (dst port 51775) || (dst port 63504)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.17.219/32) || (dst net 144.0.28.162/32) || (dst net 144.0.80.160/32) || (dst net 144.0.194.104/32) || (dst net 144.0.235.140/32))),
	((dst port 3756) || (dst port 22653) || (dst port 24721) || (dst port 43356) || (dst port 44158)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.5.169/32) || (dst net 145.0.38.232/32) || (dst net 145.0.69.231/32) || (dst net 145.0.73.123/32) || (dst net 145.0.152.51/32))),
	((dst port 446) || (dst port 8995) || (dst port 13407) || (dst port 14466) || (dst port 60231)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.23.255/32) || (dst net 146.0.44.69/32) || (dst net 146.0.99.236/32) || (dst net 146.0.100.113/32) || (dst net 146.0.154.128/32))),
	((dst port 3690) || (dst port 13716) || (dst port 22510) || (dst port 33313) || (dst port 46951)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.83.211/32) || (dst net 147.0.105.52/32) || (dst net 147.0.145.4/32) || (dst net 147.0.171.168/32) || (dst net 147.0.221.144/32))),
	((dst port 698) || (dst port 2956) || (dst port 18905) || (dst port 22573) || (dst port 23850)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.1.229/32) || (dst net 148.0.41.14/32) || (dst net 148.0.110.114/32) || (dst net 148.0.114.168/32) || (dst net 148.0.127.49/32))),
	((dst port 10097) || (dst port 32064) || (dst port 52475) || (dst port 55012) || (dst port 60448)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.26.152/32) || (dst net 149.0.78.110/32) || (dst net 149.0.94.141/32) || (dst net 149.0.102.9/32) || (dst net 149.0.198.236/32))),
	((dst port 4774) || (dst port 17721) || (dst port 39181) || (dst port 45624) || (dst port 62631)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.34.101/32) || (dst net 150.0.47.140/32) || (dst net 150.0.124.87/32) || (dst net 150.0.167.48/32) || (dst net 150.0.197.243/32))),
	((dst port 1963) || (dst port 7280) || (dst port 42825) || (dst port 44472) || (dst port 53871)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.1.222/32) || (dst net 151.0.8.127/32) || (dst net 151.0.9.14/32) || (dst net 151.0.107.173/32) || (dst net 151.0.180.70/32))),
	((dst port 3901) || (dst port 4644) || (dst port 39727) || (dst port 53539) || (dst port 62592)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.1.72/32) || (dst net 152.0.57.193/32) || (dst net 152.0.94.141/32) || (dst net 152.0.132.217/32) || (dst net 152.0.144.172/32))),
	((dst port 5811) || (dst port 13476) || (dst port 15645) || (dst port 27901) || (dst port 64263)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.77.144/32) || (dst net 153.0.123.7/32) || (dst net 153.0.184.39/32) || (dst net 153.0.197.86/32) || (dst net 153.0.251.13/32))),
	((dst port 2163) || (dst port 22753) || (dst port 58430) || (dst port 61129) || (dst port 65260)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.33.236/32) || (dst net 154.0.50.181/32) || (dst net 154.0.73.173/32) || (dst net 154.0.82.14/32) || (dst net 154.0.252.173/32))),
	((dst port 9917) || (dst port 15233) || (dst port 18621) || (dst port 21108) || (dst port 35455)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.1.212/32) || (dst net 155.0.34.137/32) || (dst net 155.0.71.63/32) || (dst net 155.0.110.195/32) || (dst net 155.0.165.135/32))),
	((dst port 444) || (dst port 9261) || (dst port 12402) || (dst port 31741) || (dst port 63742)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.96.173/32) || (dst net 156.0.104.181/32) || (dst net 156.0.168.158/32) || (dst net 156.0.215.173/32) || (dst net 156.0.241.213/32))),
	((dst port 753) || (dst port 10102) || (dst port 31488) || (dst port 45466) || (dst port 53077)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.74.10/32) || (dst net 157.0.116.131/32) || (dst net 157.0.123.116/32) || (dst net 157.0.193.214/32) || (dst net 157.0.206.34/32))),
	((dst port 6049) || (dst port 28953) || (dst port 56791) || (dst port 59930) || (dst port 62331)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.48.27/32) || (dst net 158.0.51.28/32) || (dst net 158.0.57.53/32) || (dst net 158.0.139.131/32) || (dst net 158.0.162.245/32))),
	((dst port 12995) || (dst port 28648) || (dst port 35319) || (dst port 39109) || (dst port 57283)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.23.248/32) || (dst net 159.0.183.49/32) || (dst net 159.0.197.158/32) || (dst net 159.0.206.113/32) || (dst net 159.0.209.127/32))),
	((dst port 23397) || (dst port 35381) || (dst port 39266) || (dst port 44046) || (dst port 46811)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.118.178/32) || (dst net 160.0.126.233/32) || (dst net 160.0.160.60/32) || (dst net 160.0.169.33/32) || (dst net 160.0.222.239/32))),
	((dst port 734) || (dst port 4613) || (dst port 12608) || (dst port 27452) || (dst port 33561)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.25.155/32) || (dst net 161.0.66.61/32) || (dst net 161.0.88.178/32) || (dst net 161.0.117.28/32) || (dst net 161.0.209.25/32))),
	((dst port 17650) || (dst port 20223) || (dst port 22598) || (dst port 32698) || (dst port 32936)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.89.80/32) || (dst net 162.0.106.197/32) || (dst net 162.0.122.152/32) || (dst net 162.0.142.234/32) || (dst net 162.0.181.217/32))),
	((dst port 10937) || (dst port 15247) || (dst port 31739) || (dst port 37817) || (dst port 42381)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.0.93/32) || (dst net 163.0.73.181/32) || (dst net 163.0.161.190/32) || (dst net 163.0.222.204/32) || (dst net 163.0.226.220/32))),
	((dst port 1610) || (dst port 3609) || (dst port 20632) || (dst port 21586) || (dst port 35439)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.89.40/32) || (dst net 164.0.110.238/32) || (dst net 164.0.130.22/32) || (dst net 164.0.149.216/32) || (dst net 164.0.207.124/32))),
	((dst port 4225) || (dst port 17134) || (dst port 18804) || (dst port 36770) || (dst port 51450)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.40.189/32) || (dst net 165.0.105.42/32) || (dst net 165.0.159.12/32) || (dst net 165.0.181.22/32) || (dst net 165.0.213.86/32))),
	((dst port 16028) || (dst port 24036) || (dst port 31555) || (dst port 32671) || (dst port 59799)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.37.176/32) || (dst net 166.0.77.46/32) || (dst net 166.0.140.232/32) || (dst net 166.0.177.15/32) || (dst net 166.0.232.19/32))),
	((dst port 34131) || (dst port 41593) || (dst port 48255) || (dst port 53572) || (dst port 60666)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.39.133/32) || (dst net 167.0.47.237/32) || (dst net 167.0.54.232/32) || (dst net 167.0.94.159/32) || (dst net 167.0.175.227/32))),
	((dst port 17097) || (dst port 33829) || (dst port 47194) || (dst port 59941) || (dst port 63187)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.70.143/32) || (dst net 168.0.72.186/32) || (dst net 168.0.125.103/32) || (dst net 168.0.190.40/32) || (dst net 168.0.238.142/32))),
	((dst port 44703) || (dst port 45627) || (dst port 47708) || (dst port 62682) || (dst port 65381)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.27.222/32) || (dst net 169.0.50.35/32) || (dst net 169.0.88.34/32) || (dst net 169.0.165.220/32) || (dst net 169.0.191.97/32))),
	((dst port 1003) || (dst port 16306) || (dst port 26613) || (dst port 49109) || (dst port 60395)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.90.23/32) || (dst net 170.0.128.224/32) || (dst net 170.0.160.91/32) || (dst net 170.0.163.13/32) || (dst net 170.0.231.19/32))),
	((dst port 6081) || (dst port 8087) || (dst port 18117) || (dst port 33857) || (dst port 35249)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.1.0/32) || (dst net 171.0.35.149/32) || (dst net 171.0.52.9/32) || (dst net 171.0.202.220/32) || (dst net 171.0.221.118/32))),
	((dst port 19867) || (dst port 34778) || (dst port 36236) || (dst port 51556) || (dst port 61128)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.18.48/32) || (dst net 172.0.46.133/32) || (dst net 172.0.48.48/32) || (dst net 172.0.65.225/32) || (dst net 172.0.138.107/32))),
	((dst port 1576) || (dst port 10691) || (dst port 18815) || (dst port 23324) || (dst port 57887)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.25.180/32) || (dst net 173.0.116.58/32) || (dst net 173.0.141.42/32) || (dst net 173.0.144.49/32) || (dst net 173.0.213.41/32))),
	((dst port 4454) || (dst port 5984) || (dst port 18670) || (dst port 19054) || (dst port 43350)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.29.178/32) || (dst net 174.0.31.19/32) || (dst net 174.0.99.244/32) || (dst net 174.0.101.57/32) || (dst net 174.0.193.49/32))),
	((dst port 13316) || (dst port 41693) || (dst port 57737) || (dst port 64324) || (dst port 65261)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.137.104/32) || (dst net 175.0.186.156/32) || (dst net 175.0.205.17/32) || (dst net 175.0.227.149/32) || (dst net 175.0.232.124/32))),
	((dst port 294) || (dst port 10076) || (dst port 19607) || (dst port 45073) || (dst port 59093)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.57.197/32) || (dst net 176.0.65.81/32) || (dst net 176.0.68.10/32) || (dst net 176.0.141.193/32) || (dst net 176.0.222.234/32))),
	((dst port 3785) || (dst port 39181) || (dst port 49163) || (dst port 52950) || (dst port 55485)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.138.128/32) || (dst net 177.0.161.159/32) || (dst net 177.0.163.127/32) || (dst net 177.0.182.78/32) || (dst net 177.0.185.44/32))),
	((dst port 12394) || (dst port 39340) || (dst port 49735) || (dst port 52670) || (dst port 56521)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.0.107/32) || (dst net 178.0.149.11/32) || (dst net 178.0.176.157/32) || (dst net 178.0.194.135/32) || (dst net 178.0.225.48/32))),
	((dst port 28366) || (dst port 38770) || (dst port 51936) || (dst port 56513) || (dst port 61722)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.46.159/32) || (dst net 179.0.53.192/32) || (dst net 179.0.108.112/32) || (dst net 179.0.150.236/32) || (dst net 179.0.230.213/32))),
	((dst port 9265) || (dst port 26466) || (dst port 30265) || (dst port 38961) || (dst port 43520)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.95.112/32) || (dst net 180.0.151.30/32) || (dst net 180.0.159.226/32) || (dst net 180.0.168.219/32) || (dst net 180.0.233.137/32))),
	((dst port 9884) || (dst port 25524) || (dst port 32012) || (dst port 45691) || (dst port 48398)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.5.97/32) || (dst net 181.0.17.101/32) || (dst net 181.0.89.150/32) || (dst net 181.0.95.244/32) || (dst net 181.0.109.242/32))),
	((dst port 11003) || (dst port 39262) || (dst port 42311) || (dst port 52877) || (dst port 56789)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.1.11/32) || (dst net 182.0.24.86/32) || (dst net 182.0.79.225/32) || (dst net 182.0.143.74/32) || (dst net 182.0.158.142/32))),
	((dst port 10856) || (dst port 13881) || (dst port 17942) || (dst port 30928) || (dst port 54882)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.1.119/32) || (dst net 183.0.47.116/32) || (dst net 183.0.98.34/32) || (dst net 183.0.145.217/32) || (dst net 183.0.163.148/32))),
	((dst port 15693) || (dst port 18981) || (dst port 31383) || (dst port 38294) || (dst port 49399)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.94.224/32) || (dst net 184.0.107.209/32) || (dst net 184.0.158.100/32) || (dst net 184.0.170.40/32) || (dst net 184.0.253.135/32))),
	((dst port 8565) || (dst port 9106) || (dst port 15491) || (dst port 35272) || (dst port 54725)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.35.0/32) || (dst net 185.0.35.22/32) || (dst net 185.0.124.239/32) || (dst net 185.0.245.131/32) || (dst net 185.0.255.227/32))),
	((dst port 15814) || (dst port 27721) || (dst port 37656) || (dst port 43640) || (dst port 53444)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.98.246/32) || (dst net 186.0.139.143/32) || (dst net 186.0.142.2/32) || (dst net 186.0.225.207/32) || (dst net 186.0.243.216/32))),
	((dst port 829) || (dst port 33488) || (dst port 47692) || (dst port 53133) || (dst port 58842)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.13.19/32) || (dst net 187.0.20.244/32) || (dst net 187.0.44.231/32) || (dst net 187.0.132.136/32) || (dst net 187.0.178.8/32))),
	((dst port 8098) || (dst port 41130) || (dst port 52463) || (dst port 53391) || (dst port 58892)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.133.87/32) || (dst net 188.0.186.150/32) || (dst net 188.0.222.111/32) || (dst net 188.0.223.196/32) || (dst net 188.0.239.28/32))),
	((dst port 3337) || (dst port 15601) || (dst port 19134) || (dst port 50354) || (dst port 58651)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.10.47/32) || (dst net 189.0.26.79/32) || (dst net 189.0.37.246/32) || (dst net 189.0.86.55/32) || (dst net 189.0.147.247/32))),
	((dst port 7685) || (dst port 49155) || (dst port 49697) || (dst port 50633) || (dst port 60806)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.97.246/32) || (dst net 190.0.107.68/32) || (dst net 190.0.217.117/32) || (dst net 190.0.224.121/32) || (dst net 190.0.249.38/32))),
	((dst port 3918) || (dst port 5907) || (dst port 6871) || (dst port 31796) || (dst port 54421)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.64.89/32) || (dst net 191.0.73.190/32) || (dst net 191.0.77.0/32) || (dst net 191.0.95.56/32) || (dst net 191.0.214.246/32))),
	((dst port 11349) || (dst port 21888) || (dst port 34021) || (dst port 50192) || (dst port 50553)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.2.166/32) || (dst net 192.0.17.162/32) || (dst net 192.0.66.70/32) || (dst net 192.0.240.186/32) || (dst net 192.0.250.26/32))),
	((dst port 331) || (dst port 30469) || (dst port 52230) || (dst port 53313) || (dst port 63773)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.11.72/32) || (dst net 193.0.159.127/32) || (dst net 193.0.180.229/32) || (dst net 193.0.192.77/32) || (dst net 193.0.232.30/32))),
	((dst port 3433) || (dst port 30718) || (dst port 36081) || (dst port 39445) || (dst port 39458)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.114.24/32) || (dst net 194.0.134.17/32) || (dst net 194.0.137.229/32) || (dst net 194.0.162.98/32) || (dst net 194.0.249.193/32))),
	((dst port 45431) || (dst port 46091) || (dst port 48234) || (dst port 53854) || (dst port 62109)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.12.179/32) || (dst net 195.0.29.21/32) || (dst net 195.0.91.1/32) || (dst net 195.0.201.17/32) || (dst net 195.0.227.51/32))),
	((dst port 5318) || (dst port 15476) || (dst port 24681) || (dst port 50472) || (dst port 60036)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.2.196/32) || (dst net 196.0.122.40/32) || (dst net 196.0.157.116/32) || (dst net 196.0.157.249/32) || (dst net 196.0.192.92/32))),
	((dst port 6869) || (dst port 25833) || (dst port 38599) || (dst port 38894) || (dst port 57513)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.99.70/32) || (dst net 197.0.112.14/32) || (dst net 197.0.119.202/32) || (dst net 197.0.146.9/32) || (dst net 197.0.175.60/32))),
	((dst port 3920) || (dst port 12795) || (dst port 23955) || (dst port 25555) || (dst port 42956)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.32.212/32) || (dst net 198.0.92.75/32) || (dst net 198.0.124.153/32) || (dst net 198.0.233.26/32) || (dst net 198.0.240.151/32))),
	((dst port 1422) || (dst port 1874) || (dst port 52537) || (dst port 54404) || (dst port 58638)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.29.129/32) || (dst net 199.0.33.99/32) || (dst net 199.0.67.161/32) || (dst net 199.0.191.205/32) || (dst net 199.0.247.58/32))),
	((dst port 18715) || (dst port 26972) || (dst port 31243) || (dst port 40988) || (dst port 58200)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.43.83/32) || (dst net 200.0.90.172/32) || (dst net 200.0.167.4/32) || (dst net 200.0.174.239/32) || (dst net 200.0.176.57/32))),
	((dst port 3920) || (dst port 25552) || (dst port 42677) || (dst port 52890) || (dst port 56351)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.64.188/32) || (dst net 201.0.200.221/32) || (dst net 201.0.228.99/32) || (dst net 201.0.230.227/32) || (dst net 201.0.236.53/32))),
	((dst port 2684) || (dst port 28527) || (dst port 31534) || (dst port 38274) || (dst port 56134)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.72.185/32) || (dst net 202.0.89.181/32) || (dst net 202.0.117.3/32) || (dst net 202.0.135.219/32) || (dst net 202.0.245.97/32))),
	((dst port 11177) || (dst port 15493) || (dst port 27443) || (dst port 50089) || (dst port 55678)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.22.17/32) || (dst net 203.0.201.227/32) || (dst net 203.0.203.69/32) || (dst net 203.0.211.182/32) || (dst net 203.0.229.124/32))),
	((dst port 2412) || (dst port 5543) || (dst port 20745) || (dst port 37311) || (dst port 47738)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.162.145/32) || (dst net 204.0.173.215/32) || (dst net 204.0.197.225/32) || (dst net 204.0.213.83/32) || (dst net 204.0.217.108/32))),
	((dst port 8549) || (dst port 11232) || (dst port 30891) || (dst port 33061) || (dst port 34308)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.0.138/32) || (dst net 205.0.22.205/32) || (dst net 205.0.89.215/32) || (dst net 205.0.141.233/32) || (dst net 205.0.145.71/32))),
	((dst port 5107) || (dst port 5853) || (dst port 22398) || (dst port 23070) || (dst port 44909)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.92.3/32) || (dst net 206.0.99.70/32) || (dst net 206.0.138.232/32) || (dst net 206.0.140.40/32) || (dst net 206.0.167.30/32))),
	((dst port 12309) || (dst port 51881) || (dst port 53703) || (dst port 55734) || (dst port 65069)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.41.23/32) || (dst net 207.0.209.70/32) || (dst net 207.0.225.108/32) || (dst net 207.0.240.61/32) || (dst net 207.0.250.138/32))),
	((dst port 5820) || (dst port 40884) || (dst port 48430) || (dst port 49651) || (dst port 59911)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.9.226/32) || (dst net 208.0.149.65/32) || (dst net 208.0.199.251/32) || (dst net 208.0.211.137/32) || (dst net 208.0.216.55/32))),
	((dst port 680) || (dst port 3597) || (dst port 7717) || (dst port 36649) || (dst port 37595)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.66.228/32) || (dst net 209.0.146.90/32) || (dst net 209.0.165.79/32) || (dst net 209.0.199.184/32) || (dst net 209.0.204.41/32))),
	((dst port 6837) || (dst port 20991) || (dst port 30231) || (dst port 31965) || (dst port 53531)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.66.205/32) || (dst net 210.0.103.253/32) || (dst net 210.0.151.50/32) || (dst net 210.0.190.209/32) || (dst net 210.0.248.54/32))),
	((dst port 5049) || (dst port 8473) || (dst port 10248) || (dst port 14050) || (dst port 29683)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.27.116/32) || (dst net 211.0.102.49/32) || (dst net 211.0.195.247/32) || (dst net 211.0.238.187/32) || (dst net 211.0.244.12/32))),
	((dst port 6439) || (dst port 21482) || (dst port 23597) || (dst port 27427) || (dst port 38222)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.7.152/32) || (dst net 212.0.127.92/32) || (dst net 212.0.194.209/32) || (dst net 212.0.230.192/32) || (dst net 212.0.240.235/32))),
	((dst port 6866) || (dst port 32841) || (dst port 40612) || (dst port 56579) || (dst port 65493)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.27.230/32) || (dst net 213.0.30.170/32) || (dst net 213.0.153.130/32) || (dst net 213.0.180.244/32) || (dst net 213.0.215.38/32))),
	((dst port 966) || (dst port 30320) || (dst port 32463) || (dst port 37530) || (dst port 49528)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.55.42/32) || (dst net 214.0.75.46/32) || (dst net 214.0.178.153/32) || (dst net 214.0.188.136/32) || (dst net 214.0.225.97/32))),
	((dst port 2787) || (dst port 12607) || (dst port 28830) || (dst port 36382) || (dst port 47975)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.42.76/32) || (dst net 215.0.126.35/32) || (dst net 215.0.196.120/32) || (dst net 215.0.237.56/32) || (dst net 215.0.253.176/32))),
	((dst port 7851) || (dst port 34747) || (dst port 37005) || (dst port 47129) || (dst port 61929)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.17.70/32) || (dst net 216.0.46.28/32) || (dst net 216.0.75.207/32) || (dst net 216.0.149.146/32) || (dst net 216.0.228.192/32))),
	((dst port 7689) || (dst port 10357) || (dst port 21057) || (dst port 58559) || (dst port 65012)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.176.235/32) || (dst net 217.0.195.100/32) || (dst net 217.0.200.190/32) || (dst net 217.0.221.0/32) || (dst net 217.0.240.104/32))),
	((dst port 3364) || (dst port 35537) || (dst port 35888) || (dst port 39602) || (dst port 57760)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.52.199/32) || (dst net 218.0.68.56/32) || (dst net 218.0.85.132/32) || (dst net 218.0.176.193/32) || (dst net 218.0.240.129/32))),
	((dst port 29104) || (dst port 32833) || (dst port 48294) || (dst port 56477) || (dst port 65319)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.31.248/32) || (dst net 219.0.75.185/32) || (dst net 219.0.85.195/32) || (dst net 219.0.233.208/32) || (dst net 219.0.237.222/32))),
	((dst port 6617) || (dst port 9766) || (dst port 11223) || (dst port 24625) || (dst port 45496)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.8.76/32) || (dst net 220.0.19.177/32) || (dst net 220.0.46.201/32) || (dst net 220.0.193.111/32) || (dst net 220.0.217.233/32))),
	((dst port 7007) || (dst port 11160) || (dst port 28286) || (dst port 60419) || (dst port 63550)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.51.237/32) || (dst net 221.0.144.160/32) || (dst net 221.0.164.79/32) || (dst net 221.0.185.48/32) || (dst net 221.0.248.194/32))),
	((dst port 18028) || (dst port 27610) || (dst port 27844) || (dst port 33509) || (dst port 42577)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.12.121/32) || (dst net 222.0.33.226/32) || (dst net 222.0.85.81/32) || (dst net 222.0.97.66/32) || (dst net 222.0.230.213/32))),
	((dst port 8775) || (dst port 26630) || (dst port 30217) || (dst port 32309) || (dst port 39175)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.83.239/32) || (dst net 223.0.94.110/32) || (dst net 223.0.151.195/32) || (dst net 223.0.156.237/32) || (dst net 223.0.216.203/32))),
	((dst port 1484) || (dst port 5577) || (dst port 13332) || (dst port 37415) || (dst port 50554)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.5.96/32) || (dst net 224.0.43.79/32) || (dst net 224.0.57.34/32) || (dst net 224.0.98.183/32) || (dst net 224.0.236.119/32))),
	((dst port 23848) || (dst port 24900) || (dst port 29352) || (dst port 48857) || (dst port 54843)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.45.191/32) || (dst net 225.0.76.160/32) || (dst net 225.0.145.72/32) || (dst net 225.0.174.84/32) || (dst net 225.0.244.157/32))),
	((dst port 2355) || (dst port 3282) || (dst port 44956) || (dst port 50834) || (dst port 63548)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.2.125/32) || (dst net 226.0.100.148/32) || (dst net 226.0.144.45/32) || (dst net 226.0.159.119/32) || (dst net 226.0.214.25/32))),
	((dst port 3532) || (dst port 8840) || (dst port 38126) || (dst port 60603) || (dst port 63069)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.19.79/32) || (dst net 227.0.54.183/32) || (dst net 227.0.124.239/32) || (dst net 227.0.140.103/32) || (dst net 227.0.191.32/32))),
	((dst port 9553) || (dst port 18167) || (dst port 40200) || (dst port 63207) || (dst port 65433)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.73.46/32) || (dst net 228.0.77.2/32) || (dst net 228.0.81.59/32) || (dst net 228.0.137.16/32) || (dst net 228.0.252.115/32))),
	((dst port 52) || (dst port 13597) || (dst port 28852) || (dst port 32547) || (dst port 37575)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.41.30/32) || (dst net 229.0.60.252/32) || (dst net 229.0.74.187/32) || (dst net 229.0.106.169/32) || (dst net 229.0.188.31/32))),
	((dst port 3168) || (dst port 8566) || (dst port 16393) || (dst port 37521) || (dst port 39228)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.39.249/32) || (dst net 230.0.54.45/32) || (dst net 230.0.114.29/32) || (dst net 230.0.173.8/32) || (dst net 230.0.195.200/32))),
	((dst port 13553) || (dst port 36741) || (dst port 42624) || (dst port 50648) || (dst port 63986)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.119.246/32) || (dst net 231.0.161.197/32) || (dst net 231.0.199.9/32) || (dst net 231.0.219.98/32) || (dst net 231.0.228.235/32))),
	((dst port 21655) || (dst port 34084) || (dst port 44963) || (dst port 53989) || (dst port 63629)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.8.148/32) || (dst net 232.0.42.93/32) || (dst net 232.0.79.197/32) || (dst net 232.0.99.41/32) || (dst net 232.0.233.249/32))),
	((dst port 23879) || (dst port 43587) || (dst port 51998) || (dst port 57760) || (dst port 60723)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.95.159/32) || (dst net 233.0.127.246/32) || (dst net 233.0.144.108/32) || (dst net 233.0.202.142/32) || (dst net 233.0.227.241/32))),
	((dst port 5041) || (dst port 42671) || (dst port 45957) || (dst port 53571) || (dst port 56805)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.10.45/32) || (dst net 234.0.43.40/32) || (dst net 234.0.58.195/32) || (dst net 234.0.121.117/32) || (dst net 234.0.231.124/32))),
	((dst port 16686) || (dst port 31830) || (dst port 49444) || (dst port 51185) || (dst port 60119)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.51.35/32) || (dst net 235.0.56.124/32) || (dst net 235.0.64.206/32) || (dst net 235.0.127.234/32) || (dst net 235.0.168.220/32))),
	((dst port 3602) || (dst port 12313) || (dst port 21685) || (dst port 42530) || (dst port 58230)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.18.160/32) || (dst net 236.0.65.97/32) || (dst net 236.0.67.93/32) || (dst net 236.0.136.143/32) || (dst net 236.0.230.248/32))),
	((dst port 4808) || (dst port 5264) || (dst port 10008) || (dst port 14224) || (dst port 38791)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.7.119/32) || (dst net 237.0.37.185/32) || (dst net 237.0.162.162/32) || (dst net 237.0.191.112/32) || (dst net 237.0.243.53/32))),
	((dst port 7183) || (dst port 14766) || (dst port 34691) || (dst port 40527) || (dst port 48093)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.133.28/32) || (dst net 238.0.155.244/32) || (dst net 238.0.197.154/32) || (dst net 238.0.219.39/32) || (dst net 238.0.238.34/32))),
	((dst port 5998) || (dst port 20007) || (dst port 25716) || (dst port 55154) || (dst port 64395)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.16.221/32) || (dst net 239.0.84.34/32) || (dst net 239.0.89.103/32) || (dst net 239.0.110.42/32) || (dst net 239.0.140.226/32))),
	((dst port 23901) || (dst port 26697) || (dst port 27392) || (dst port 27742) || (dst port 29996)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.4.94/32) || (dst net 240.0.43.179/32) || (dst net 240.0.148.95/32) || (dst net 240.0.176.50/32) || (dst net 240.0.222.125/32))),
	((dst port 3349) || (dst port 19039) || (dst port 30490) || (dst port 41536) || (dst port 59827)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.61.132/32) || (dst net 241.0.133.161/32) || (dst net 241.0.158.134/32) || (dst net 241.0.186.41/32) || (dst net 241.0.228.57/32))),
	((dst port 25061) || (dst port 30425) || (dst port 33979) || (dst port 54516) || (dst port 58934)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.76.66/32) || (dst net 242.0.111.223/32) || (dst net 242.0.149.17/32) || (dst net 242.0.205.214/32) || (dst net 242.0.211.173/32))),
	((dst port 16289) || (dst port 17537) || (dst port 19547) || (dst port 26337) || (dst port 29664)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.72.82/32) || (dst net 243.0.98.185/32) || (dst net 243.0.143.218/32) || (dst net 243.0.232.197/32) || (dst net 243.0.243.208/32))),
	((dst port 16298) || (dst port 24624) || (dst port 39280) || (dst port 51308) || (dst port 63363)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.28.20/32) || (dst net 244.0.52.253/32) || (dst net 244.0.142.116/32) || (dst net 244.0.203.249/32) || (dst net 244.0.231.173/32))),
	((dst port 1740) || (dst port 21860) || (dst port 23030) || (dst port 26002) || (dst port 64607)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.74.2/32) || (dst net 245.0.168.173/32) || (dst net 245.0.192.99/32) || (dst net 245.0.193.84/32) || (dst net 245.0.206.127/32))),
	((dst port 2900) || (dst port 18249) || (dst port 45201) || (dst port 57763) || (dst port 64226)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.36.101/32) || (dst net 246.0.55.235/32) || (dst net 246.0.59.116/32) || (dst net 246.0.117.22/32) || (dst net 246.0.235.218/32))),
	((dst port 8859) || (dst port 36392) || (dst port 45089) || (dst port 51198) || (dst port 59205)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.54.196/32) || (dst net 247.0.121.47/32) || (dst net 247.0.176.83/32) || (dst net 247.0.226.191/32) || (dst net 247.0.251.95/32))),
	((dst port 5986) || (dst port 15852) || (dst port 22003) || (dst port 28606) || (dst port 54896)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.41.102/32) || (dst net 248.0.111.148/32) || (dst net 248.0.225.91/32) || (dst net 248.0.234.43/32) || (dst net 248.0.252.47/32))),
	((dst port 1937) || (dst port 3393) || (dst port 21917) || (dst port 50275) || (dst port 57463)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.0.252/32) || (dst net 249.0.199.48/32) || (dst net 249.0.221.121/32) || (dst net 249.0.236.208/32) || (dst net 249.0.243.80/32))),
	((dst port 10089) || (dst port 12410) || (dst port 21369) || (dst port 47775) || (dst port 63256)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.61.37/32) || (dst net 250.0.69.147/32) || (dst net 250.0.89.161/32) || (dst net 250.0.96.201/32) || (dst net 250.0.204.169/32))),
	((dst port 6018) || (dst port 26580) || (dst port 50735) || (dst port 61989) || (dst port 62788)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.53.29/32) || (dst net 251.0.134.5/32) || (dst net 251.0.169.139/32) || (dst net 251.0.200.215/32) || (dst net 251.0.222.70/32))),
	((dst port 7678) || (dst port 10426) || (dst port 43457) || (dst port 48240) || (dst port 65025)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.40.235/32) || (dst net 252.0.91.236/32) || (dst net 252.0.95.44/32) || (dst net 252.0.226.234/32) || (dst net 252.0.236.75/32))),
	((dst port 8145) || (dst port 17071) || (dst port 41252) || (dst port 52951) || (dst port 61045)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.103.220/32) || (dst net 253.0.120.192/32) || (dst net 253.0.147.57/32) || (dst net 253.0.147.215/32) || (dst net 253.0.251.24/32))),
	((dst port 10075) || (dst port 11383) || (dst port 18827) || (dst port 45421) || (dst port 55038)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.127.230/32) || (dst net 254.0.170.94/32) || (dst net 254.0.208.193/32) || (dst net 254.0.229.11/32) || (dst net 254.0.230.151/32))),
	((dst port 440) || (dst port 9054) || (dst port 9086) || (dst port 17360) || (dst port 35645)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.88.188/32) || (dst net 255.0.107.39/32) || (dst net 255.0.163.6/32) || (dst net 255.0.183.80/32) || (dst net 255.0.211.183/32))),
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
