ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 17768) || (dst port 24878) || (dst port 26139) || (dst port 34585) || (dst port 59327)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.90.186/32) || (dst net 1.0.115.41/32) || (dst net 1.0.127.69/32) || (dst net 1.0.135.15/32) || (dst net 1.0.223.216/32))),
	((dst port 28257) || (dst port 29397) || (dst port 39998) || (dst port 47910) || (dst port 65427)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.54.56/32) || (dst net 2.0.83.92/32) || (dst net 2.0.153.178/32) || (dst net 2.0.185.109/32) || (dst net 2.0.192.197/32))),
	((dst port 1577) || (dst port 20216) || (dst port 37456) || (dst port 38266) || (dst port 42997)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.41.15/32) || (dst net 3.0.143.86/32) || (dst net 3.0.146.72/32) || (dst net 3.0.193.204/32) || (dst net 3.0.228.197/32))),
	((dst port 1050) || (dst port 25508) || (dst port 29775) || (dst port 43342) || (dst port 60523)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.80.185/32) || (dst net 4.0.115.163/32) || (dst net 4.0.129.85/32) || (dst net 4.0.188.180/32) || (dst net 4.0.217.211/32))),
	((dst port 38349) || (dst port 41107) || (dst port 57047) || (dst port 59922) || (dst port 61879)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.44.189/32) || (dst net 5.0.59.160/32) || (dst net 5.0.79.178/32) || (dst net 5.0.142.241/32) || (dst net 5.0.239.195/32))),
	((dst port 3813) || (dst port 4872) || (dst port 28075) || (dst port 31058) || (dst port 59530)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.84.87/32) || (dst net 6.0.84.178/32) || (dst net 6.0.152.173/32) || (dst net 6.0.177.6/32) || (dst net 6.0.177.189/32))),
	((dst port 2897) || (dst port 13741) || (dst port 30825) || (dst port 60724) || (dst port 63780)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.28.96/32) || (dst net 7.0.57.136/32) || (dst net 7.0.140.189/32) || (dst net 7.0.176.53/32) || (dst net 7.0.252.205/32))),
	((dst port 16196) || (dst port 26860) || (dst port 27508) || (dst port 34921) || (dst port 38083)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.24.42/32) || (dst net 8.0.43.192/32) || (dst net 8.0.75.55/32) || (dst net 8.0.103.110/32) || (dst net 8.0.147.248/32))),
	((dst port 10600) || (dst port 32652) || (dst port 48749) || (dst port 50154) || (dst port 63847)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.64.102/32) || (dst net 9.0.90.68/32) || (dst net 9.0.224.51/32) || (dst net 9.0.234.137/32) || (dst net 9.0.251.158/32))),
	((dst port 8123) || (dst port 22057) || (dst port 27008) || (dst port 29876) || (dst port 49934)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.53.206/32) || (dst net 10.0.115.171/32) || (dst net 10.0.138.88/32) || (dst net 10.0.142.213/32) || (dst net 10.0.190.97/32))),
	((dst port 13556) || (dst port 15698) || (dst port 41174) || (dst port 49278) || (dst port 61233)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.78.39/32) || (dst net 11.0.129.56/32) || (dst net 11.0.179.29/32) || (dst net 11.0.179.215/32) || (dst net 11.0.248.181/32))),
	((dst port 28133) || (dst port 40217) || (dst port 42935) || (dst port 46433) || (dst port 56630)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.0.56/32) || (dst net 12.0.32.15/32) || (dst net 12.0.113.216/32) || (dst net 12.0.231.166/32) || (dst net 12.0.237.242/32))),
	((dst port 9565) || (dst port 13452) || (dst port 52978) || (dst port 54647) || (dst port 64465)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.78.237/32) || (dst net 13.0.85.210/32) || (dst net 13.0.85.238/32) || (dst net 13.0.151.109/32) || (dst net 13.0.181.235/32))),
	((dst port 13568) || (dst port 29415) || (dst port 34989) || (dst port 55344) || (dst port 61394)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.28.119/32) || (dst net 14.0.123.222/32) || (dst net 14.0.203.155/32) || (dst net 14.0.239.155/32) || (dst net 14.0.249.130/32))),
	((dst port 7457) || (dst port 34738) || (dst port 37814) || (dst port 38991) || (dst port 51974)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.45.202/32) || (dst net 15.0.54.167/32) || (dst net 15.0.61.31/32) || (dst net 15.0.155.249/32) || (dst net 15.0.183.141/32))),
	((dst port 17285) || (dst port 22832) || (dst port 44349) || (dst port 54242) || (dst port 54575)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.10.90/32) || (dst net 16.0.32.39/32) || (dst net 16.0.52.83/32) || (dst net 16.0.121.150/32) || (dst net 16.0.214.69/32))),
	((dst port 1009) || (dst port 10509) || (dst port 16611) || (dst port 58253) || (dst port 62711)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.23.165/32) || (dst net 17.0.103.83/32) || (dst net 17.0.124.226/32) || (dst net 17.0.131.143/32) || (dst net 17.0.196.5/32))),
	((dst port 844) || (dst port 6173) || (dst port 6866) || (dst port 10810) || (dst port 15313)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.48.16/32) || (dst net 18.0.122.65/32) || (dst net 18.0.141.77/32) || (dst net 18.0.167.80/32) || (dst net 18.0.240.122/32))),
	((dst port 386) || (dst port 6467) || (dst port 23738) || (dst port 42609) || (dst port 44493)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.11.150/32) || (dst net 19.0.102.191/32) || (dst net 19.0.137.198/32) || (dst net 19.0.159.128/32) || (dst net 19.0.166.145/32))),
	((dst port 2095) || (dst port 7159) || (dst port 8365) || (dst port 23429) || (dst port 25947)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.8.135/32) || (dst net 20.0.52.60/32) || (dst net 20.0.58.154/32) || (dst net 20.0.102.135/32) || (dst net 20.0.218.114/32))),
	((dst port 12219) || (dst port 15526) || (dst port 26325) || (dst port 34663) || (dst port 51809)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.12.180/32) || (dst net 21.0.77.110/32) || (dst net 21.0.112.8/32) || (dst net 21.0.186.109/32) || (dst net 21.0.249.135/32))),
	((dst port 17806) || (dst port 20684) || (dst port 23159) || (dst port 29937) || (dst port 51786)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.16.9/32) || (dst net 22.0.148.115/32) || (dst net 22.0.206.193/32) || (dst net 22.0.219.212/32) || (dst net 22.0.226.57/32))),
	((dst port 18878) || (dst port 22641) || (dst port 23070) || (dst port 23501) || (dst port 63531)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.36.130/32) || (dst net 23.0.118.165/32) || (dst net 23.0.215.66/32) || (dst net 23.0.215.103/32) || (dst net 23.0.218.191/32))),
	((dst port 4251) || (dst port 12813) || (dst port 17869) || (dst port 34291) || (dst port 57388)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.41.228/32) || (dst net 24.0.75.23/32) || (dst net 24.0.142.143/32) || (dst net 24.0.196.216/32) || (dst net 24.0.247.169/32))),
	((dst port 45) || (dst port 2501) || (dst port 36134) || (dst port 38865) || (dst port 61743)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.51.143/32) || (dst net 25.0.114.225/32) || (dst net 25.0.239.249/32) || (dst net 25.0.240.190/32) || (dst net 25.0.254.97/32))),
	((dst port 2738) || (dst port 10001) || (dst port 51371) || (dst port 52134) || (dst port 53102)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.103.1/32) || (dst net 26.0.106.92/32) || (dst net 26.0.119.203/32) || (dst net 26.0.145.111/32) || (dst net 26.0.164.119/32))),
	((dst port 65) || (dst port 16065) || (dst port 35108) || (dst port 44333) || (dst port 55245)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.41.57/32) || (dst net 27.0.122.224/32) || (dst net 27.0.150.231/32) || (dst net 27.0.220.83/32) || (dst net 27.0.242.104/32))),
	((dst port 18570) || (dst port 23688) || (dst port 25651) || (dst port 31672) || (dst port 49856)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.28.45/32) || (dst net 28.0.127.174/32) || (dst net 28.0.143.129/32) || (dst net 28.0.167.120/32) || (dst net 28.0.219.63/32))),
	((dst port 2791) || (dst port 46340) || (dst port 51402) || (dst port 51546) || (dst port 52739)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.68.11/32) || (dst net 29.0.74.111/32) || (dst net 29.0.83.115/32) || (dst net 29.0.154.48/32) || (dst net 29.0.202.206/32))),
	((dst port 17491) || (dst port 37728) || (dst port 41403) || (dst port 47410) || (dst port 58244)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.23.244/32) || (dst net 30.0.35.250/32) || (dst net 30.0.40.55/32) || (dst net 30.0.203.132/32) || (dst net 30.0.242.112/32))),
	((dst port 5247) || (dst port 6615) || (dst port 29203) || (dst port 41066) || (dst port 44081)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.57.88/32) || (dst net 31.0.108.221/32) || (dst net 31.0.125.55/32) || (dst net 31.0.202.129/32) || (dst net 31.0.205.79/32))),
	((dst port 9088) || (dst port 11063) || (dst port 38991) || (dst port 46819) || (dst port 49533)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.94.193/32) || (dst net 32.0.98.154/32) || (dst net 32.0.124.239/32) || (dst net 32.0.125.8/32) || (dst net 32.0.200.173/32))),
	((dst port 26360) || (dst port 28034) || (dst port 43724) || (dst port 46623) || (dst port 64312)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.47.144/32) || (dst net 33.0.53.108/32) || (dst net 33.0.65.69/32) || (dst net 33.0.66.131/32) || (dst net 33.0.155.36/32))),
	((dst port 549) || (dst port 40998) || (dst port 44592) || (dst port 54033) || (dst port 56404)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.3.237/32) || (dst net 34.0.127.12/32) || (dst net 34.0.199.212/32) || (dst net 34.0.218.218/32) || (dst net 34.0.245.121/32))),
	((dst port 2869) || (dst port 20290) || (dst port 27175) || (dst port 60887) || (dst port 63004)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.5.134/32) || (dst net 35.0.39.32/32) || (dst net 35.0.162.205/32) || (dst net 35.0.217.124/32) || (dst net 35.0.221.145/32))),
	((dst port 14886) || (dst port 37995) || (dst port 43113) || (dst port 45520) || (dst port 51315)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.35.214/32) || (dst net 36.0.118.26/32) || (dst net 36.0.162.14/32) || (dst net 36.0.201.183/32) || (dst net 36.0.216.174/32))),
	((dst port 13138) || (dst port 17697) || (dst port 25222) || (dst port 30170) || (dst port 33322)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.47.165/32) || (dst net 37.0.60.145/32) || (dst net 37.0.82.43/32) || (dst net 37.0.90.174/32) || (dst net 37.0.228.105/32))),
	((dst port 28284) || (dst port 31601) || (dst port 34654) || (dst port 63816) || (dst port 64767)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.18.113/32) || (dst net 38.0.36.93/32) || (dst net 38.0.85.45/32) || (dst net 38.0.91.137/32) || (dst net 38.0.219.253/32))),
	((dst port 34317) || (dst port 36813) || (dst port 37573) || (dst port 48669) || (dst port 61036)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.70.176/32) || (dst net 39.0.94.145/32) || (dst net 39.0.95.224/32) || (dst net 39.0.199.99/32) || (dst net 39.0.219.169/32))),
	((dst port 15576) || (dst port 16441) || (dst port 16797) || (dst port 33727) || (dst port 35801)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.27.163/32) || (dst net 40.0.81.47/32) || (dst net 40.0.109.130/32) || (dst net 40.0.185.226/32) || (dst net 40.0.231.9/32))),
	((dst port 27311) || (dst port 51558) || (dst port 61687) || (dst port 62197) || (dst port 65373)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.48.228/32) || (dst net 41.0.131.146/32) || (dst net 41.0.154.252/32) || (dst net 41.0.179.3/32) || (dst net 41.0.233.226/32))),
	((dst port 6985) || (dst port 24269) || (dst port 28799) || (dst port 49531) || (dst port 61975)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.34.227/32) || (dst net 42.0.94.81/32) || (dst net 42.0.111.33/32) || (dst net 42.0.180.179/32) || (dst net 42.0.244.160/32))),
	((dst port 9956) || (dst port 12457) || (dst port 13760) || (dst port 41037) || (dst port 51886)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.19.214/32) || (dst net 43.0.60.80/32) || (dst net 43.0.68.214/32) || (dst net 43.0.123.110/32) || (dst net 43.0.198.98/32))),
	((dst port 3119) || (dst port 6016) || (dst port 21195) || (dst port 43085) || (dst port 61565)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.100.202/32) || (dst net 44.0.127.147/32) || (dst net 44.0.158.249/32) || (dst net 44.0.243.52/32) || (dst net 44.0.251.188/32))),
	((dst port 644) || (dst port 23714) || (dst port 29206) || (dst port 35317) || (dst port 38157)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.135.97/32) || (dst net 45.0.149.27/32) || (dst net 45.0.164.124/32) || (dst net 45.0.221.46/32) || (dst net 45.0.231.149/32))),
	((dst port 18223) || (dst port 24863) || (dst port 38131) || (dst port 42908) || (dst port 52601)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.5.85/32) || (dst net 46.0.30.49/32) || (dst net 46.0.34.157/32) || (dst net 46.0.99.137/32) || (dst net 46.0.157.204/32))),
	((dst port 6051) || (dst port 18716) || (dst port 32159) || (dst port 37980) || (dst port 48234)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.39.32/32) || (dst net 47.0.107.245/32) || (dst net 47.0.115.112/32) || (dst net 47.0.145.155/32) || (dst net 47.0.205.234/32))),
	((dst port 8063) || (dst port 8880) || (dst port 18107) || (dst port 35918) || (dst port 48513)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.31.116/32) || (dst net 48.0.109.119/32) || (dst net 48.0.113.194/32) || (dst net 48.0.208.128/32) || (dst net 48.0.235.92/32))),
	((dst port 11170) || (dst port 17262) || (dst port 23935) || (dst port 42516) || (dst port 61300)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.19.90/32) || (dst net 49.0.51.159/32) || (dst net 49.0.140.171/32) || (dst net 49.0.157.93/32) || (dst net 49.0.166.84/32))),
	((dst port 11219) || (dst port 14959) || (dst port 16694) || (dst port 17076) || (dst port 23764)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.10.41/32) || (dst net 50.0.13.162/32) || (dst net 50.0.34.112/32) || (dst net 50.0.57.15/32) || (dst net 50.0.254.18/32))),
	((dst port 28241) || (dst port 32930) || (dst port 38662) || (dst port 57026) || (dst port 64740)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.30.101/32) || (dst net 51.0.104.221/32) || (dst net 51.0.128.111/32) || (dst net 51.0.146.95/32) || (dst net 51.0.227.73/32))),
	((dst port 20062) || (dst port 37314) || (dst port 54034) || (dst port 60222) || (dst port 64003)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.10.28/32) || (dst net 52.0.65.102/32) || (dst net 52.0.112.194/32) || (dst net 52.0.195.78/32) || (dst net 52.0.237.96/32))),
	((dst port 14345) || (dst port 54103) || (dst port 54112) || (dst port 57244) || (dst port 63462)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.50.133/32) || (dst net 53.0.93.105/32) || (dst net 53.0.112.172/32) || (dst net 53.0.213.215/32) || (dst net 53.0.225.171/32))),
	((dst port 7251) || (dst port 37999) || (dst port 41278) || (dst port 52945) || (dst port 55650)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.19.62/32) || (dst net 54.0.47.224/32) || (dst net 54.0.95.241/32) || (dst net 54.0.153.6/32) || (dst net 54.0.171.233/32))),
	((dst port 6) || (dst port 43342) || (dst port 43715) || (dst port 50528) || (dst port 58291)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.17.194/32) || (dst net 55.0.27.239/32) || (dst net 55.0.110.5/32) || (dst net 55.0.204.227/32) || (dst net 55.0.254.45/32))),
	((dst port 39) || (dst port 7377) || (dst port 14982) || (dst port 26011) || (dst port 35700)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.43.53/32) || (dst net 56.0.163.158/32) || (dst net 56.0.186.82/32) || (dst net 56.0.189.216/32) || (dst net 56.0.195.237/32))),
	((dst port 17173) || (dst port 29079) || (dst port 45619) || (dst port 63484) || (dst port 64145)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.20.181/32) || (dst net 57.0.24.76/32) || (dst net 57.0.38.27/32) || (dst net 57.0.84.216/32) || (dst net 57.0.117.140/32))),
	((dst port 5988) || (dst port 8420) || (dst port 33508) || (dst port 38173) || (dst port 48796)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.6.74/32) || (dst net 58.0.46.183/32) || (dst net 58.0.102.213/32) || (dst net 58.0.246.28/32) || (dst net 58.0.253.93/32))),
	((dst port 23138) || (dst port 45886) || (dst port 54658) || (dst port 59817) || (dst port 60978)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.105.158/32) || (dst net 59.0.117.130/32) || (dst net 59.0.166.153/32) || (dst net 59.0.209.46/32) || (dst net 59.0.211.78/32))),
	((dst port 12004) || (dst port 13036) || (dst port 31596) || (dst port 41250) || (dst port 48355)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.109.42/32) || (dst net 60.0.147.226/32) || (dst net 60.0.148.101/32) || (dst net 60.0.158.81/32) || (dst net 60.0.195.116/32))),
	((dst port 22077) || (dst port 23429) || (dst port 40173) || (dst port 40351) || (dst port 44417)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.79.235/32) || (dst net 61.0.142.173/32) || (dst net 61.0.147.182/32) || (dst net 61.0.190.155/32) || (dst net 61.0.191.180/32))),
	((dst port 10616) || (dst port 20425) || (dst port 33000) || (dst port 61459) || (dst port 64065)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.24.43/32) || (dst net 62.0.86.72/32) || (dst net 62.0.134.182/32) || (dst net 62.0.187.37/32) || (dst net 62.0.244.71/32))),
	((dst port 10098) || (dst port 12809) || (dst port 47960) || (dst port 50260) || (dst port 64368)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.49.210/32) || (dst net 63.0.90.44/32) || (dst net 63.0.212.90/32) || (dst net 63.0.214.115/32) || (dst net 63.0.230.170/32))),
	((dst port 2403) || (dst port 6014) || (dst port 21446) || (dst port 26427) || (dst port 51527)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.13.164/32) || (dst net 64.0.144.211/32) || (dst net 64.0.151.80/32) || (dst net 64.0.187.31/32) || (dst net 64.0.249.39/32))),
	((dst port 36178) || (dst port 48484) || (dst port 49514) || (dst port 57214) || (dst port 60315)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.28.248/32) || (dst net 65.0.62.208/32) || (dst net 65.0.108.68/32) || (dst net 65.0.200.140/32) || (dst net 65.0.244.111/32))),
	((dst port 32946) || (dst port 37800) || (dst port 50800) || (dst port 58908) || (dst port 59862)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.55.179/32) || (dst net 66.0.70.237/32) || (dst net 66.0.135.32/32) || (dst net 66.0.190.244/32) || (dst net 66.0.195.253/32))),
	((dst port 3344) || (dst port 30940) || (dst port 37117) || (dst port 44192) || (dst port 46900)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.63.232/32) || (dst net 67.0.191.224/32) || (dst net 67.0.197.175/32) || (dst net 67.0.229.159/32) || (dst net 67.0.231.236/32))),
	((dst port 14064) || (dst port 43840) || (dst port 48277) || (dst port 52361) || (dst port 59508)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.27.96/32) || (dst net 68.0.133.195/32) || (dst net 68.0.161.62/32) || (dst net 68.0.165.209/32) || (dst net 68.0.194.59/32))),
	((dst port 13801) || (dst port 22980) || (dst port 26015) || (dst port 35823) || (dst port 58987)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.16.182/32) || (dst net 69.0.68.174/32) || (dst net 69.0.79.1/32) || (dst net 69.0.167.8/32) || (dst net 69.0.203.176/32))),
	((dst port 14425) || (dst port 26434) || (dst port 35244) || (dst port 60271) || (dst port 63451)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.46.16/32) || (dst net 70.0.58.47/32) || (dst net 70.0.106.172/32) || (dst net 70.0.198.135/32) || (dst net 70.0.244.41/32))),
	((dst port 13912) || (dst port 24681) || (dst port 42625) || (dst port 50249) || (dst port 52918)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.125.227/32) || (dst net 71.0.160.255/32) || (dst net 71.0.168.138/32) || (dst net 71.0.198.35/32) || (dst net 71.0.233.157/32))),
	((dst port 7478) || (dst port 9900) || (dst port 48135) || (dst port 56665) || (dst port 61947)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.24.113/32) || (dst net 72.0.45.163/32) || (dst net 72.0.98.102/32) || (dst net 72.0.106.238/32) || (dst net 72.0.210.57/32))),
	((dst port 16285) || (dst port 19541) || (dst port 24382) || (dst port 37972) || (dst port 62470)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.2.238/32) || (dst net 73.0.43.157/32) || (dst net 73.0.83.84/32) || (dst net 73.0.122.10/32) || (dst net 73.0.198.100/32))),
	((dst port 11128) || (dst port 13088) || (dst port 37419) || (dst port 42828) || (dst port 62015)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.12.212/32) || (dst net 74.0.20.13/32) || (dst net 74.0.104.114/32) || (dst net 74.0.108.159/32) || (dst net 74.0.214.215/32))),
	((dst port 736) || (dst port 18401) || (dst port 43776) || (dst port 64418) || (dst port 65458)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.46.63/32) || (dst net 75.0.54.155/32) || (dst net 75.0.67.218/32) || (dst net 75.0.138.192/32) || (dst net 75.0.229.118/32))),
	((dst port 11233) || (dst port 20253) || (dst port 22252) || (dst port 39798) || (dst port 53712)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.62.193/32) || (dst net 76.0.86.161/32) || (dst net 76.0.109.87/32) || (dst net 76.0.218.185/32) || (dst net 76.0.222.17/32))),
	((dst port 18771) || (dst port 26067) || (dst port 45776) || (dst port 51073) || (dst port 63357)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.68.153/32) || (dst net 77.0.126.142/32) || (dst net 77.0.155.61/32) || (dst net 77.0.177.199/32) || (dst net 77.0.235.173/32))),
	((dst port 7926) || (dst port 27651) || (dst port 34604) || (dst port 43765) || (dst port 55499)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.14.234/32) || (dst net 78.0.67.225/32) || (dst net 78.0.87.206/32) || (dst net 78.0.134.98/32) || (dst net 78.0.185.158/32))),
	((dst port 14648) || (dst port 25987) || (dst port 34018) || (dst port 44962) || (dst port 57511)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.24.205/32) || (dst net 79.0.65.55/32) || (dst net 79.0.118.67/32) || (dst net 79.0.234.31/32) || (dst net 79.0.248.14/32))),
	((dst port 5403) || (dst port 7459) || (dst port 39964) || (dst port 42468) || (dst port 50933)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.15.180/32) || (dst net 80.0.36.236/32) || (dst net 80.0.41.200/32) || (dst net 80.0.107.101/32) || (dst net 80.0.126.125/32))),
	((dst port 17959) || (dst port 39301) || (dst port 39806) || (dst port 44736) || (dst port 55206)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.106.14/32) || (dst net 81.0.118.82/32) || (dst net 81.0.139.39/32) || (dst net 81.0.198.144/32) || (dst net 81.0.231.28/32))),
	((dst port 685) || (dst port 5816) || (dst port 7358) || (dst port 35798) || (dst port 44594)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.79.109/32) || (dst net 82.0.103.97/32) || (dst net 82.0.133.129/32) || (dst net 82.0.201.113/32) || (dst net 82.0.212.223/32))),
	((dst port 5258) || (dst port 24225) || (dst port 31125) || (dst port 34651) || (dst port 35499)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.18.185/32) || (dst net 83.0.61.43/32) || (dst net 83.0.76.222/32) || (dst net 83.0.86.215/32) || (dst net 83.0.184.48/32))),
	((dst port 1339) || (dst port 9750) || (dst port 24262) || (dst port 28361) || (dst port 38697)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.20.99/32) || (dst net 84.0.83.191/32) || (dst net 84.0.121.50/32) || (dst net 84.0.139.202/32) || (dst net 84.0.171.118/32))),
	((dst port 40694) || (dst port 50227) || (dst port 58822) || (dst port 58923) || (dst port 59784)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.89.42/32) || (dst net 85.0.134.181/32) || (dst net 85.0.207.145/32) || (dst net 85.0.226.114/32) || (dst net 85.0.229.29/32))),
	((dst port 989) || (dst port 41724) || (dst port 51818) || (dst port 64359) || (dst port 64769)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.35.178/32) || (dst net 86.0.65.80/32) || (dst net 86.0.107.105/32) || (dst net 86.0.143.254/32) || (dst net 86.0.157.144/32))),
	((dst port 11787) || (dst port 13454) || (dst port 29562) || (dst port 46571) || (dst port 54835)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.141.152/32) || (dst net 87.0.184.152/32) || (dst net 87.0.192.225/32) || (dst net 87.0.229.50/32) || (dst net 87.0.230.62/32))),
	((dst port 23546) || (dst port 33315) || (dst port 34797) || (dst port 46906) || (dst port 60477)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.22.167/32) || (dst net 88.0.94.163/32) || (dst net 88.0.97.56/32) || (dst net 88.0.120.172/32) || (dst net 88.0.124.219/32))),
	((dst port 17620) || (dst port 19373) || (dst port 21674) || (dst port 21836) || (dst port 41522)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.42.132/32) || (dst net 89.0.51.210/32) || (dst net 89.0.57.165/32) || (dst net 89.0.156.151/32) || (dst net 89.0.233.146/32))),
	((dst port 12710) || (dst port 27916) || (dst port 38134) || (dst port 61036) || (dst port 63950)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.16.106/32) || (dst net 90.0.128.201/32) || (dst net 90.0.129.49/32) || (dst net 90.0.175.182/32) || (dst net 90.0.235.86/32))),
	((dst port 4499) || (dst port 32625) || (dst port 40788) || (dst port 52570) || (dst port 57435)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.129.128/32) || (dst net 91.0.148.154/32) || (dst net 91.0.200.177/32) || (dst net 91.0.244.145/32) || (dst net 91.0.248.25/32))),
	((dst port 4071) || (dst port 8054) || (dst port 18244) || (dst port 33840) || (dst port 49623)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.0.63/32) || (dst net 92.0.15.63/32) || (dst net 92.0.48.246/32) || (dst net 92.0.85.221/32) || (dst net 92.0.109.173/32))),
	((dst port 3856) || (dst port 4536) || (dst port 14088) || (dst port 56249) || (dst port 65378)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.36.2/32) || (dst net 93.0.42.122/32) || (dst net 93.0.190.242/32) || (dst net 93.0.193.123/32) || (dst net 93.0.214.187/32))),
	((dst port 30395) || (dst port 30835) || (dst port 45989) || (dst port 51156) || (dst port 54555)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.82.232/32) || (dst net 94.0.93.153/32) || (dst net 94.0.151.47/32) || (dst net 94.0.193.120/32) || (dst net 94.0.225.172/32))),
	((dst port 4235) || (dst port 5995) || (dst port 38856) || (dst port 47865) || (dst port 63288)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.4.69/32) || (dst net 95.0.102.239/32) || (dst net 95.0.182.25/32) || (dst net 95.0.204.39/32) || (dst net 95.0.218.90/32))),
	((dst port 8921) || (dst port 12141) || (dst port 37898) || (dst port 55025) || (dst port 62777)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.5.216/32) || (dst net 96.0.18.77/32) || (dst net 96.0.144.145/32) || (dst net 96.0.158.81/32) || (dst net 96.0.228.126/32))),
	((dst port 3546) || (dst port 17256) || (dst port 28068) || (dst port 30833) || (dst port 33219)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.76.28/32) || (dst net 97.0.104.69/32) || (dst net 97.0.135.72/32) || (dst net 97.0.143.153/32) || (dst net 97.0.166.142/32))),
	((dst port 6192) || (dst port 58046) || (dst port 59045) || (dst port 60144) || (dst port 61526)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.0.54/32) || (dst net 98.0.141.254/32) || (dst net 98.0.241.219/32) || (dst net 98.0.247.34/32) || (dst net 98.0.254.143/32))),
	((dst port 9580) || (dst port 15612) || (dst port 42341) || (dst port 54692) || (dst port 56121)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.11.139/32) || (dst net 99.0.67.47/32) || (dst net 99.0.89.86/32) || (dst net 99.0.173.67/32) || (dst net 99.0.215.232/32))),
	((dst port 9547) || (dst port 10813) || (dst port 30100) || (dst port 40119) || (dst port 54707)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.13.165/32) || (dst net 100.0.58.51/32) || (dst net 100.0.83.245/32) || (dst net 100.0.204.57/32) || (dst net 100.0.228.89/32))),
	((dst port 27487) || (dst port 33322) || (dst port 48589) || (dst port 61801) || (dst port 65194)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.14.4/32) || (dst net 101.0.39.59/32) || (dst net 101.0.77.223/32) || (dst net 101.0.110.25/32) || (dst net 101.0.116.171/32))),
	((dst port 3007) || (dst port 7756) || (dst port 25380) || (dst port 51153) || (dst port 57115)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.49.254/32) || (dst net 102.0.64.121/32) || (dst net 102.0.180.49/32) || (dst net 102.0.186.53/32) || (dst net 102.0.195.91/32))),
	((dst port 2354) || (dst port 13941) || (dst port 18788) || (dst port 21548) || (dst port 54222)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.27.97/32) || (dst net 103.0.128.127/32) || (dst net 103.0.168.123/32) || (dst net 103.0.210.147/32) || (dst net 103.0.251.173/32))),
	((dst port 14252) || (dst port 25704) || (dst port 28584) || (dst port 29641) || (dst port 58029)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.40.37/32) || (dst net 104.0.137.82/32) || (dst net 104.0.153.53/32) || (dst net 104.0.178.234/32) || (dst net 104.0.246.123/32))),
	((dst port 16118) || (dst port 18301) || (dst port 29984) || (dst port 32624) || (dst port 35755)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.57.219/32) || (dst net 105.0.85.97/32) || (dst net 105.0.95.186/32) || (dst net 105.0.96.182/32) || (dst net 105.0.231.66/32))),
	((dst port 8978) || (dst port 29576) || (dst port 52817) || (dst port 57524) || (dst port 59626)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.98.46/32) || (dst net 106.0.105.207/32) || (dst net 106.0.108.102/32) || (dst net 106.0.148.171/32) || (dst net 106.0.176.93/32))),
	((dst port 4258) || (dst port 8383) || (dst port 18308) || (dst port 19143) || (dst port 62295)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.17.231/32) || (dst net 107.0.32.120/32) || (dst net 107.0.80.228/32) || (dst net 107.0.138.48/32) || (dst net 107.0.206.203/32))),
	((dst port 16214) || (dst port 17045) || (dst port 22812) || (dst port 52577) || (dst port 60191)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.3.38/32) || (dst net 108.0.68.209/32) || (dst net 108.0.114.33/32) || (dst net 108.0.214.167/32) || (dst net 108.0.236.248/32))),
	((dst port 6435) || (dst port 20024) || (dst port 22416) || (dst port 43384) || (dst port 57151)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.59.5/32) || (dst net 109.0.111.118/32) || (dst net 109.0.139.4/32) || (dst net 109.0.226.40/32) || (dst net 109.0.227.246/32))),
	((dst port 8309) || (dst port 29673) || (dst port 37487) || (dst port 37953) || (dst port 56861)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.8.129/32) || (dst net 110.0.53.99/32) || (dst net 110.0.88.198/32) || (dst net 110.0.90.18/32) || (dst net 110.0.138.111/32))),
	((dst port 7286) || (dst port 9573) || (dst port 38818) || (dst port 48260) || (dst port 57961)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.70.128/32) || (dst net 111.0.94.131/32) || (dst net 111.0.143.235/32) || (dst net 111.0.183.40/32) || (dst net 111.0.212.128/32))),
	((dst port 12191) || (dst port 32773) || (dst port 36229) || (dst port 44112) || (dst port 44273)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.20.239/32) || (dst net 112.0.57.146/32) || (dst net 112.0.129.211/32) || (dst net 112.0.141.48/32) || (dst net 112.0.187.139/32))),
	((dst port 15823) || (dst port 38489) || (dst port 40516) || (dst port 50792) || (dst port 54993)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.44.3/32) || (dst net 113.0.112.47/32) || (dst net 113.0.127.176/32) || (dst net 113.0.240.20/32) || (dst net 113.0.255.141/32))),
	((dst port 34053) || (dst port 39707) || (dst port 44252) || (dst port 51876) || (dst port 52714)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.36.235/32) || (dst net 114.0.67.123/32) || (dst net 114.0.132.142/32) || (dst net 114.0.199.117/32) || (dst net 114.0.200.107/32))),
	((dst port 3553) || (dst port 18931) || (dst port 24843) || (dst port 47672) || (dst port 54614)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.117.9/32) || (dst net 115.0.137.69/32) || (dst net 115.0.155.233/32) || (dst net 115.0.195.186/32) || (dst net 115.0.254.41/32))),
	((dst port 7286) || (dst port 11546) || (dst port 34526) || (dst port 52552) || (dst port 60055)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.125.87/32) || (dst net 116.0.154.107/32) || (dst net 116.0.189.189/32) || (dst net 116.0.195.10/32) || (dst net 116.0.197.236/32))),
	((dst port 5020) || (dst port 9682) || (dst port 10838) || (dst port 29234) || (dst port 34584)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.7.85/32) || (dst net 117.0.45.44/32) || (dst net 117.0.123.108/32) || (dst net 117.0.145.53/32) || (dst net 117.0.214.121/32))),
	((dst port 6263) || (dst port 16479) || (dst port 21455) || (dst port 23124) || (dst port 27570)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.35.135/32) || (dst net 118.0.82.27/32) || (dst net 118.0.107.119/32) || (dst net 118.0.161.155/32) || (dst net 118.0.164.6/32))),
	((dst port 14867) || (dst port 39455) || (dst port 40108) || (dst port 47300) || (dst port 62700)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.55.135/32) || (dst net 119.0.57.240/32) || (dst net 119.0.138.0/32) || (dst net 119.0.160.13/32) || (dst net 119.0.205.225/32))),
	((dst port 4421) || (dst port 5534) || (dst port 24788) || (dst port 55873) || (dst port 58998)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.25.188/32) || (dst net 120.0.64.34/32) || (dst net 120.0.90.105/32) || (dst net 120.0.117.167/32) || (dst net 120.0.176.131/32))),
	((dst port 14453) || (dst port 32671) || (dst port 33868) || (dst port 37527) || (dst port 57630)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.132.217/32) || (dst net 121.0.133.134/32) || (dst net 121.0.134.194/32) || (dst net 121.0.221.159/32) || (dst net 121.0.248.102/32))),
	((dst port 15009) || (dst port 23795) || (dst port 25600) || (dst port 56249) || (dst port 58613)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.37.146/32) || (dst net 122.0.38.93/32) || (dst net 122.0.122.225/32) || (dst net 122.0.169.11/32) || (dst net 122.0.179.6/32))),
	((dst port 7811) || (dst port 10998) || (dst port 11705) || (dst port 30252) || (dst port 54126)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.11.54/32) || (dst net 123.0.22.176/32) || (dst net 123.0.57.54/32) || (dst net 123.0.104.251/32) || (dst net 123.0.120.157/32))),
	((dst port 3386) || (dst port 24273) || (dst port 33372) || (dst port 35689) || (dst port 58004)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.24.190/32) || (dst net 124.0.82.80/32) || (dst net 124.0.155.23/32) || (dst net 124.0.156.229/32) || (dst net 124.0.205.5/32))),
	((dst port 21492) || (dst port 36140) || (dst port 45399) || (dst port 54845) || (dst port 59947)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.20.202/32) || (dst net 125.0.91.244/32) || (dst net 125.0.120.55/32) || (dst net 125.0.246.120/32) || (dst net 125.0.247.181/32))),
	((dst port 13002) || (dst port 15232) || (dst port 22207) || (dst port 53189) || (dst port 64504)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.57.44/32) || (dst net 126.0.90.74/32) || (dst net 126.0.109.95/32) || (dst net 126.0.114.125/32) || (dst net 126.0.173.172/32))),
	((dst port 5338) || (dst port 17331) || (dst port 33825) || (dst port 40507) || (dst port 61067)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.22.60/32) || (dst net 127.0.33.18/32) || (dst net 127.0.94.219/32) || (dst net 127.0.138.219/32) || (dst net 127.0.230.139/32))),
	((dst port 4735) || (dst port 46129) || (dst port 50371) || (dst port 50560) || (dst port 56568)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.73.243/32) || (dst net 128.0.84.187/32) || (dst net 128.0.171.213/32) || (dst net 128.0.199.168/32) || (dst net 128.0.219.57/32))),
	((dst port 7699) || (dst port 41512) || (dst port 46782) || (dst port 46807) || (dst port 61317)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.129.82/32) || (dst net 129.0.141.27/32) || (dst net 129.0.182.74/32) || (dst net 129.0.197.166/32) || (dst net 129.0.254.173/32))),
	((dst port 18395) || (dst port 22088) || (dst port 36099) || (dst port 43508) || (dst port 45246)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.33.57/32) || (dst net 130.0.119.64/32) || (dst net 130.0.120.91/32) || (dst net 130.0.152.121/32) || (dst net 130.0.218.166/32))),
	((dst port 20227) || (dst port 21718) || (dst port 28747) || (dst port 35397) || (dst port 48460)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.33.83/32) || (dst net 131.0.100.119/32) || (dst net 131.0.183.8/32) || (dst net 131.0.203.3/32) || (dst net 131.0.238.58/32))),
	((dst port 37562) || (dst port 48156) || (dst port 51417) || (dst port 63350) || (dst port 65010)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.85.17/32) || (dst net 132.0.118.10/32) || (dst net 132.0.205.71/32) || (dst net 132.0.209.112/32) || (dst net 132.0.227.168/32))),
	((dst port 13056) || (dst port 13394) || (dst port 28256) || (dst port 63355) || (dst port 64609)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.58.73/32) || (dst net 133.0.91.199/32) || (dst net 133.0.140.206/32) || (dst net 133.0.167.10/32) || (dst net 133.0.251.42/32))),
	((dst port 13611) || (dst port 17673) || (dst port 22309) || (dst port 46063) || (dst port 58707)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.13.89/32) || (dst net 134.0.48.35/32) || (dst net 134.0.50.59/32) || (dst net 134.0.100.234/32) || (dst net 134.0.183.163/32))),
	((dst port 9221) || (dst port 18748) || (dst port 27679) || (dst port 55813) || (dst port 57392)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.55.174/32) || (dst net 135.0.77.5/32) || (dst net 135.0.101.170/32) || (dst net 135.0.126.247/32) || (dst net 135.0.154.75/32))),
	((dst port 8029) || (dst port 15788) || (dst port 31121) || (dst port 61546) || (dst port 64356)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.59.67/32) || (dst net 136.0.76.50/32) || (dst net 136.0.92.71/32) || (dst net 136.0.186.30/32) || (dst net 136.0.227.67/32))),
	((dst port 1776) || (dst port 16347) || (dst port 24660) || (dst port 41475) || (dst port 51372)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.7.12/32) || (dst net 137.0.118.245/32) || (dst net 137.0.159.141/32) || (dst net 137.0.201.213/32) || (dst net 137.0.209.244/32))),
	((dst port 9325) || (dst port 28780) || (dst port 34117) || (dst port 44398) || (dst port 57154)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.40.77/32) || (dst net 138.0.58.142/32) || (dst net 138.0.78.119/32) || (dst net 138.0.115.216/32) || (dst net 138.0.238.75/32))),
	((dst port 12425) || (dst port 20344) || (dst port 21861) || (dst port 38887) || (dst port 62482)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.12.179/32) || (dst net 139.0.28.144/32) || (dst net 139.0.34.88/32) || (dst net 139.0.44.204/32) || (dst net 139.0.234.249/32))),
	((dst port 6442) || (dst port 13459) || (dst port 14950) || (dst port 15547) || (dst port 46809)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.105.103/32) || (dst net 140.0.117.69/32) || (dst net 140.0.186.176/32) || (dst net 140.0.209.167/32) || (dst net 140.0.253.22/32))),
	((dst port 7824) || (dst port 12890) || (dst port 40613) || (dst port 40702) || (dst port 62902)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.71.146/32) || (dst net 141.0.80.95/32) || (dst net 141.0.150.191/32) || (dst net 141.0.188.132/32) || (dst net 141.0.253.225/32))),
	((dst port 308) || (dst port 14072) || (dst port 40504) || (dst port 51082) || (dst port 55128)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.78.221/32) || (dst net 142.0.114.255/32) || (dst net 142.0.130.242/32) || (dst net 142.0.150.45/32) || (dst net 142.0.158.45/32))),
	((dst port 350) || (dst port 11972) || (dst port 13358) || (dst port 50220) || (dst port 53413)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.9.62/32) || (dst net 143.0.31.67/32) || (dst net 143.0.106.114/32) || (dst net 143.0.120.226/32) || (dst net 143.0.230.124/32))),
	((dst port 4573) || (dst port 12440) || (dst port 15071) || (dst port 37314) || (dst port 58929)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.16.108/32) || (dst net 144.0.28.214/32) || (dst net 144.0.60.134/32) || (dst net 144.0.98.211/32) || (dst net 144.0.209.25/32))),
	((dst port 2750) || (dst port 4617) || (dst port 21863) || (dst port 28306) || (dst port 64532)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.26.14/32) || (dst net 145.0.70.181/32) || (dst net 145.0.190.32/32) || (dst net 145.0.223.212/32) || (dst net 145.0.241.156/32))),
	((dst port 495) || (dst port 19934) || (dst port 33687) || (dst port 52426) || (dst port 64702)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.60.28/32) || (dst net 146.0.64.84/32) || (dst net 146.0.83.159/32) || (dst net 146.0.212.176/32) || (dst net 146.0.239.85/32))),
	((dst port 20177) || (dst port 26440) || (dst port 26551) || (dst port 32929) || (dst port 38512)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.17.178/32) || (dst net 147.0.74.137/32) || (dst net 147.0.110.102/32) || (dst net 147.0.232.99/32) || (dst net 147.0.233.49/32))),
	((dst port 180) || (dst port 11791) || (dst port 13971) || (dst port 26062) || (dst port 39182)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.46.83/32) || (dst net 148.0.72.240/32) || (dst net 148.0.99.69/32) || (dst net 148.0.105.190/32) || (dst net 148.0.253.244/32))),
	((dst port 4823) || (dst port 12356) || (dst port 55424) || (dst port 56779) || (dst port 58698)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.9.96/32) || (dst net 149.0.56.130/32) || (dst net 149.0.154.171/32) || (dst net 149.0.228.166/32) || (dst net 149.0.249.63/32))),
	((dst port 16305) || (dst port 34432) || (dst port 36189) || (dst port 38211) || (dst port 64458)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.113.109/32) || (dst net 150.0.129.65/32) || (dst net 150.0.146.120/32) || (dst net 150.0.186.68/32) || (dst net 150.0.192.6/32))),
	((dst port 1256) || (dst port 4856) || (dst port 12630) || (dst port 19085) || (dst port 21490)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.34.206/32) || (dst net 151.0.80.184/32) || (dst net 151.0.84.244/32) || (dst net 151.0.114.24/32) || (dst net 151.0.139.14/32))),
	((dst port 15895) || (dst port 19580) || (dst port 24428) || (dst port 33957) || (dst port 42435)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.60.159/32) || (dst net 152.0.135.9/32) || (dst net 152.0.136.9/32) || (dst net 152.0.234.43/32) || (dst net 152.0.239.105/32))),
	((dst port 512) || (dst port 772) || (dst port 22269) || (dst port 31707) || (dst port 32417)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.81.19/32) || (dst net 153.0.100.142/32) || (dst net 153.0.103.170/32) || (dst net 153.0.187.209/32) || (dst net 153.0.188.55/32))),
	((dst port 10909) || (dst port 26084) || (dst port 26381) || (dst port 38378) || (dst port 60634)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.61.127/32) || (dst net 154.0.99.163/32) || (dst net 154.0.117.17/32) || (dst net 154.0.118.172/32) || (dst net 154.0.226.21/32))),
	((dst port 21054) || (dst port 24376) || (dst port 27820) || (dst port 31134) || (dst port 51177)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.4.141/32) || (dst net 155.0.103.117/32) || (dst net 155.0.140.247/32) || (dst net 155.0.206.163/32) || (dst net 155.0.249.174/32))),
	((dst port 2820) || (dst port 13717) || (dst port 41754) || (dst port 46877) || (dst port 60312)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.67.188/32) || (dst net 156.0.78.37/32) || (dst net 156.0.188.180/32) || (dst net 156.0.234.111/32) || (dst net 156.0.242.72/32))),
	((dst port 4867) || (dst port 6703) || (dst port 10081) || (dst port 19535) || (dst port 47390)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.83.131/32) || (dst net 157.0.122.60/32) || (dst net 157.0.146.184/32) || (dst net 157.0.184.26/32) || (dst net 157.0.206.160/32))),
	((dst port 14240) || (dst port 21134) || (dst port 34785) || (dst port 37049) || (dst port 57994)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.2.213/32) || (dst net 158.0.41.139/32) || (dst net 158.0.42.196/32) || (dst net 158.0.81.248/32) || (dst net 158.0.159.151/32))),
	((dst port 4764) || (dst port 8553) || (dst port 9561) || (dst port 49550) || (dst port 61666)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.30.2/32) || (dst net 159.0.59.133/32) || (dst net 159.0.168.26/32) || (dst net 159.0.219.197/32) || (dst net 159.0.250.2/32))),
	((dst port 1248) || (dst port 3914) || (dst port 8797) || (dst port 50157) || (dst port 64192)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.27.37/32) || (dst net 160.0.42.210/32) || (dst net 160.0.47.243/32) || (dst net 160.0.69.156/32) || (dst net 160.0.152.250/32))),
	((dst port 2666) || (dst port 5572) || (dst port 9518) || (dst port 46960) || (dst port 59603)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.38.4/32) || (dst net 161.0.167.70/32) || (dst net 161.0.178.118/32) || (dst net 161.0.199.47/32) || (dst net 161.0.200.199/32))),
	((dst port 19092) || (dst port 20396) || (dst port 44010) || (dst port 46684) || (dst port 64014)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.4.9/32) || (dst net 162.0.57.3/32) || (dst net 162.0.62.50/32) || (dst net 162.0.67.121/32) || (dst net 162.0.248.144/32))),
	((dst port 8641) || (dst port 21451) || (dst port 25531) || (dst port 27420) || (dst port 59861)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.16.154/32) || (dst net 163.0.18.57/32) || (dst net 163.0.80.71/32) || (dst net 163.0.82.80/32) || (dst net 163.0.88.144/32))),
	((dst port 11108) || (dst port 22504) || (dst port 24875) || (dst port 31333) || (dst port 56458)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.108.138/32) || (dst net 164.0.114.185/32) || (dst net 164.0.179.216/32) || (dst net 164.0.203.56/32) || (dst net 164.0.252.126/32))),
	((dst port 1821) || (dst port 4759) || (dst port 23775) || (dst port 28411) || (dst port 54718)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.56.103/32) || (dst net 165.0.110.210/32) || (dst net 165.0.116.61/32) || (dst net 165.0.156.5/32) || (dst net 165.0.197.207/32))),
	((dst port 15145) || (dst port 15278) || (dst port 31726) || (dst port 59013) || (dst port 60326)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.42.71/32) || (dst net 166.0.69.133/32) || (dst net 166.0.116.46/32) || (dst net 166.0.126.228/32) || (dst net 166.0.154.227/32))),
	((dst port 11356) || (dst port 28164) || (dst port 42697) || (dst port 49122) || (dst port 53682)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.22.24/32) || (dst net 167.0.124.62/32) || (dst net 167.0.145.227/32) || (dst net 167.0.153.114/32) || (dst net 167.0.194.231/32))),
	((dst port 1324) || (dst port 39239) || (dst port 44342) || (dst port 48870) || (dst port 50314)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.105.98/32) || (dst net 168.0.128.248/32) || (dst net 168.0.142.79/32) || (dst net 168.0.177.5/32) || (dst net 168.0.233.85/32))),
	((dst port 3100) || (dst port 4403) || (dst port 20970) || (dst port 43459) || (dst port 61407)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.91.141/32) || (dst net 169.0.103.119/32) || (dst net 169.0.133.210/32) || (dst net 169.0.134.55/32) || (dst net 169.0.164.142/32))),
	((dst port 17008) || (dst port 30696) || (dst port 32553) || (dst port 55122) || (dst port 63422)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.38.135/32) || (dst net 170.0.93.49/32) || (dst net 170.0.142.193/32) || (dst net 170.0.167.194/32) || (dst net 170.0.248.75/32))),
	((dst port 17682) || (dst port 19914) || (dst port 41429) || (dst port 50643) || (dst port 58976)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.54.176/32) || (dst net 171.0.80.104/32) || (dst net 171.0.97.82/32) || (dst net 171.0.122.31/32) || (dst net 171.0.219.89/32))),
	((dst port 19094) || (dst port 43228) || (dst port 48734) || (dst port 50682) || (dst port 59773)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.6.54/32) || (dst net 172.0.98.51/32) || (dst net 172.0.110.42/32) || (dst net 172.0.216.119/32) || (dst net 172.0.227.67/32))),
	((dst port 2820) || (dst port 10315) || (dst port 20008) || (dst port 21726) || (dst port 41693)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.31.58/32) || (dst net 173.0.49.48/32) || (dst net 173.0.67.138/32) || (dst net 173.0.165.88/32) || (dst net 173.0.208.235/32))),
	((dst port 10629) || (dst port 24775) || (dst port 42251) || (dst port 53041) || (dst port 62330)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.3.11/32) || (dst net 174.0.6.183/32) || (dst net 174.0.18.136/32) || (dst net 174.0.27.251/32) || (dst net 174.0.171.139/32))),
	((dst port 2017) || (dst port 22991) || (dst port 31317) || (dst port 48546) || (dst port 63400)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.49.169/32) || (dst net 175.0.84.145/32) || (dst net 175.0.93.106/32) || (dst net 175.0.205.19/32) || (dst net 175.0.239.103/32))),
	((dst port 1698) || (dst port 4365) || (dst port 19976) || (dst port 30276) || (dst port 56276)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.112.39/32) || (dst net 176.0.120.44/32) || (dst net 176.0.124.15/32) || (dst net 176.0.168.48/32) || (dst net 176.0.199.187/32))),
	((dst port 3474) || (dst port 32726) || (dst port 33348) || (dst port 58842) || (dst port 64991)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.80.245/32) || (dst net 177.0.81.205/32) || (dst net 177.0.125.79/32) || (dst net 177.0.149.99/32) || (dst net 177.0.230.26/32))),
	((dst port 5123) || (dst port 41064) || (dst port 45674) || (dst port 50791) || (dst port 57199)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.6.24/32) || (dst net 178.0.21.78/32) || (dst net 178.0.69.57/32) || (dst net 178.0.177.143/32) || (dst net 178.0.190.158/32))),
	((dst port 8696) || (dst port 18514) || (dst port 26166) || (dst port 27911) || (dst port 47757)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.74.32/32) || (dst net 179.0.91.28/32) || (dst net 179.0.116.42/32) || (dst net 179.0.134.177/32) || (dst net 179.0.191.137/32))),
	((dst port 14976) || (dst port 29216) || (dst port 32757) || (dst port 39868) || (dst port 48951)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.58.249/32) || (dst net 180.0.66.180/32) || (dst net 180.0.162.112/32) || (dst net 180.0.177.251/32) || (dst net 180.0.243.56/32))),
	((dst port 9274) || (dst port 29526) || (dst port 34247) || (dst port 53848) || (dst port 61496)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.37.69/32) || (dst net 181.0.101.2/32) || (dst net 181.0.101.25/32) || (dst net 181.0.162.163/32) || (dst net 181.0.224.78/32))),
	((dst port 856) || (dst port 916) || (dst port 26923) || (dst port 37271) || (dst port 46771)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.58.15/32) || (dst net 182.0.123.229/32) || (dst net 182.0.173.77/32) || (dst net 182.0.198.157/32) || (dst net 182.0.205.217/32))),
	((dst port 23667) || (dst port 26702) || (dst port 28982) || (dst port 46886) || (dst port 62506)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.16.167/32) || (dst net 183.0.93.255/32) || (dst net 183.0.106.235/32) || (dst net 183.0.128.246/32) || (dst net 183.0.232.49/32))),
	((dst port 6922) || (dst port 14641) || (dst port 39858) || (dst port 44107) || (dst port 44487)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.27.138/32) || (dst net 184.0.125.153/32) || (dst net 184.0.172.179/32) || (dst net 184.0.190.253/32) || (dst net 184.0.242.6/32))),
	((dst port 6851) || (dst port 10816) || (dst port 18946) || (dst port 48639) || (dst port 61472)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.61.54/32) || (dst net 185.0.71.196/32) || (dst net 185.0.78.142/32) || (dst net 185.0.134.253/32) || (dst net 185.0.169.145/32))),
	((dst port 18713) || (dst port 40980) || (dst port 54134) || (dst port 62468) || (dst port 64736)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.37.209/32) || (dst net 186.0.41.119/32) || (dst net 186.0.87.106/32) || (dst net 186.0.128.15/32) || (dst net 186.0.212.98/32))),
	((dst port 31600) || (dst port 53194) || (dst port 61712) || (dst port 62959) || (dst port 64165)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.57.57/32) || (dst net 187.0.107.208/32) || (dst net 187.0.145.38/32) || (dst net 187.0.147.49/32) || (dst net 187.0.220.161/32))),
	((dst port 16715) || (dst port 34789) || (dst port 39600) || (dst port 41566) || (dst port 48077)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.142.82/32) || (dst net 188.0.157.255/32) || (dst net 188.0.188.181/32) || (dst net 188.0.238.43/32) || (dst net 188.0.253.62/32))),
	((dst port 9757) || (dst port 26245) || (dst port 28437) || (dst port 41464) || (dst port 45300)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.50.186/32) || (dst net 189.0.103.216/32) || (dst net 189.0.118.204/32) || (dst net 189.0.124.39/32) || (dst net 189.0.212.238/32))),
	((dst port 2972) || (dst port 4612) || (dst port 8228) || (dst port 16685) || (dst port 16834)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.24.125/32) || (dst net 190.0.36.194/32) || (dst net 190.0.55.181/32) || (dst net 190.0.130.224/32) || (dst net 190.0.193.31/32))),
	((dst port 4969) || (dst port 49261) || (dst port 49838) || (dst port 60670) || (dst port 64785)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.67.196/32) || (dst net 191.0.112.9/32) || (dst net 191.0.137.44/32) || (dst net 191.0.200.87/32) || (dst net 191.0.254.21/32))),
	((dst port 8882) || (dst port 25118) || (dst port 34810) || (dst port 58610) || (dst port 60540)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.17.252/32) || (dst net 192.0.90.14/32) || (dst net 192.0.105.162/32) || (dst net 192.0.162.3/32) || (dst net 192.0.201.159/32))),
	((dst port 13736) || (dst port 14303) || (dst port 39765) || (dst port 55599) || (dst port 62908)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.12.110/32) || (dst net 193.0.51.123/32) || (dst net 193.0.80.85/32) || (dst net 193.0.148.97/32) || (dst net 193.0.231.115/32))),
	((dst port 2656) || (dst port 7363) || (dst port 8255) || (dst port 21458) || (dst port 27889)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.36.91/32) || (dst net 194.0.123.121/32) || (dst net 194.0.151.41/32) || (dst net 194.0.199.140/32) || (dst net 194.0.212.60/32))),
	((dst port 2693) || (dst port 6895) || (dst port 14658) || (dst port 23233) || (dst port 52313)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.17.248/32) || (dst net 195.0.54.156/32) || (dst net 195.0.96.135/32) || (dst net 195.0.112.67/32) || (dst net 195.0.209.154/32))),
	((dst port 12035) || (dst port 15953) || (dst port 35226) || (dst port 47955) || (dst port 63234)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.33.5/32) || (dst net 196.0.62.102/32) || (dst net 196.0.190.219/32) || (dst net 196.0.223.121/32) || (dst net 196.0.241.99/32))),
	((dst port 2960) || (dst port 5613) || (dst port 6148) || (dst port 12778) || (dst port 44995)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.92.146/32) || (dst net 197.0.121.222/32) || (dst net 197.0.194.237/32) || (dst net 197.0.197.154/32) || (dst net 197.0.220.119/32))),
	((dst port 2748) || (dst port 5252) || (dst port 15501) || (dst port 51157) || (dst port 64735)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.14.250/32) || (dst net 198.0.108.244/32) || (dst net 198.0.187.223/32) || (dst net 198.0.233.161/32) || (dst net 198.0.244.176/32))),
	((dst port 6993) || (dst port 21110) || (dst port 26443) || (dst port 36048) || (dst port 39049)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.77.178/32) || (dst net 199.0.99.220/32) || (dst net 199.0.221.135/32) || (dst net 199.0.240.54/32) || (dst net 199.0.253.143/32))),
	((dst port 20618) || (dst port 21263) || (dst port 37474) || (dst port 38910) || (dst port 62506)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.51.203/32) || (dst net 200.0.109.48/32) || (dst net 200.0.171.247/32) || (dst net 200.0.180.198/32) || (dst net 200.0.225.4/32))),
	((dst port 13915) || (dst port 21020) || (dst port 24044) || (dst port 40583) || (dst port 45422)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.11.122/32) || (dst net 201.0.32.139/32) || (dst net 201.0.152.12/32) || (dst net 201.0.162.152/32) || (dst net 201.0.170.52/32))),
	((dst port 3912) || (dst port 9640) || (dst port 22080) || (dst port 24621) || (dst port 36309)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.12.167/32) || (dst net 202.0.56.139/32) || (dst net 202.0.119.111/32) || (dst net 202.0.161.216/32) || (dst net 202.0.245.96/32))),
	((dst port 23304) || (dst port 27069) || (dst port 31264) || (dst port 46114) || (dst port 49976)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.80.169/32) || (dst net 203.0.82.64/32) || (dst net 203.0.140.43/32) || (dst net 203.0.190.147/32) || (dst net 203.0.236.121/32))),
	((dst port 11512) || (dst port 27006) || (dst port 28185) || (dst port 43965) || (dst port 51759)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.27.70/32) || (dst net 204.0.60.215/32) || (dst net 204.0.61.200/32) || (dst net 204.0.179.184/32) || (dst net 204.0.205.77/32))),
	((dst port 12270) || (dst port 15387) || (dst port 19817) || (dst port 50354) || (dst port 54614)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.167.43/32) || (dst net 205.0.172.89/32) || (dst net 205.0.200.70/32) || (dst net 205.0.215.248/32) || (dst net 205.0.234.10/32))),
	((dst port 2879) || (dst port 9196) || (dst port 28176) || (dst port 45592) || (dst port 64282)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.7.53/32) || (dst net 206.0.33.37/32) || (dst net 206.0.49.243/32) || (dst net 206.0.65.89/32) || (dst net 206.0.65.233/32))),
	((dst port 10017) || (dst port 36581) || (dst port 40217) || (dst port 48946) || (dst port 61020)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.96.224/32) || (dst net 207.0.116.226/32) || (dst net 207.0.132.56/32) || (dst net 207.0.144.174/32) || (dst net 207.0.228.189/32))),
	((dst port 29186) || (dst port 50847) || (dst port 56378) || (dst port 56436) || (dst port 64016)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.29.192/32) || (dst net 208.0.54.81/32) || (dst net 208.0.167.171/32) || (dst net 208.0.168.121/32) || (dst net 208.0.234.220/32))),
	((dst port 3794) || (dst port 7120) || (dst port 35160) || (dst port 50316) || (dst port 63540)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.54.194/32) || (dst net 209.0.61.193/32) || (dst net 209.0.62.42/32) || (dst net 209.0.153.219/32) || (dst net 209.0.228.171/32))),
	((dst port 4779) || (dst port 13517) || (dst port 27428) || (dst port 51695) || (dst port 60063)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.105.250/32) || (dst net 210.0.115.41/32) || (dst net 210.0.154.119/32) || (dst net 210.0.192.132/32) || (dst net 210.0.195.18/32))),
	((dst port 17367) || (dst port 17632) || (dst port 28543) || (dst port 52176) || (dst port 55724)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.0.192/32) || (dst net 211.0.17.85/32) || (dst net 211.0.86.155/32) || (dst net 211.0.175.133/32) || (dst net 211.0.226.24/32))),
	((dst port 1841) || (dst port 13938) || (dst port 18731) || (dst port 28710) || (dst port 35630)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.72.31/32) || (dst net 212.0.99.64/32) || (dst net 212.0.213.14/32) || (dst net 212.0.242.2/32) || (dst net 212.0.242.183/32))),
	((dst port 4549) || (dst port 10232) || (dst port 46238) || (dst port 51609) || (dst port 63969)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.2.194/32) || (dst net 213.0.129.167/32) || (dst net 213.0.139.68/32) || (dst net 213.0.185.71/32) || (dst net 213.0.209.103/32))),
	((dst port 8009) || (dst port 11104) || (dst port 43732) || (dst port 45386) || (dst port 59547)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.72.178/32) || (dst net 214.0.131.249/32) || (dst net 214.0.138.186/32) || (dst net 214.0.163.107/32) || (dst net 214.0.166.149/32))),
	((dst port 3691) || (dst port 41195) || (dst port 48677) || (dst port 49958) || (dst port 52532)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.13.137/32) || (dst net 215.0.21.183/32) || (dst net 215.0.42.226/32) || (dst net 215.0.79.33/32) || (dst net 215.0.168.190/32))),
	((dst port 6515) || (dst port 46349) || (dst port 58043) || (dst port 62175) || (dst port 63743)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.47.99/32) || (dst net 216.0.100.232/32) || (dst net 216.0.129.169/32) || (dst net 216.0.152.219/32) || (dst net 216.0.246.7/32))),
	((dst port 5624) || (dst port 9826) || (dst port 16347) || (dst port 23565) || (dst port 26529)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.46.213/32) || (dst net 217.0.84.183/32) || (dst net 217.0.155.31/32) || (dst net 217.0.193.54/32) || (dst net 217.0.211.117/32))),
	((dst port 8960) || (dst port 37326) || (dst port 44263) || (dst port 55187) || (dst port 61773)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.37.228/32) || (dst net 218.0.72.84/32) || (dst net 218.0.91.85/32) || (dst net 218.0.154.117/32) || (dst net 218.0.172.152/32))),
	((dst port 2196) || (dst port 21162) || (dst port 26839) || (dst port 27904) || (dst port 62665)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.30.51/32) || (dst net 219.0.47.108/32) || (dst net 219.0.82.26/32) || (dst net 219.0.187.250/32) || (dst net 219.0.242.230/32))),
	((dst port 3064) || (dst port 33190) || (dst port 41765) || (dst port 46474) || (dst port 53276)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.42.67/32) || (dst net 220.0.132.198/32) || (dst net 220.0.188.60/32) || (dst net 220.0.225.10/32) || (dst net 220.0.250.84/32))),
	((dst port 32999) || (dst port 38540) || (dst port 42253) || (dst port 53055) || (dst port 63418)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.89.153/32) || (dst net 221.0.93.140/32) || (dst net 221.0.98.30/32) || (dst net 221.0.118.46/32) || (dst net 221.0.143.219/32))),
	((dst port 2397) || (dst port 16681) || (dst port 22390) || (dst port 43651) || (dst port 62407)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.16.75/32) || (dst net 222.0.46.252/32) || (dst net 222.0.82.11/32) || (dst net 222.0.128.214/32) || (dst net 222.0.149.102/32))),
	((dst port 6136) || (dst port 6783) || (dst port 46384) || (dst port 48762) || (dst port 52009)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.23.89/32) || (dst net 223.0.77.218/32) || (dst net 223.0.206.78/32) || (dst net 223.0.208.124/32) || (dst net 223.0.227.102/32))),
	((dst port 4129) || (dst port 11469) || (dst port 18448) || (dst port 21747) || (dst port 28857)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.42.239/32) || (dst net 224.0.122.202/32) || (dst net 224.0.174.205/32) || (dst net 224.0.180.2/32) || (dst net 224.0.192.158/32))),
	((dst port 13170) || (dst port 27653) || (dst port 28795) || (dst port 32479) || (dst port 39366)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.86.64/32) || (dst net 225.0.111.17/32) || (dst net 225.0.150.240/32) || (dst net 225.0.190.151/32) || (dst net 225.0.248.122/32))),
	((dst port 4043) || (dst port 14717) || (dst port 18278) || (dst port 25409) || (dst port 64342)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.16.144/32) || (dst net 226.0.91.171/32) || (dst net 226.0.116.160/32) || (dst net 226.0.124.227/32) || (dst net 226.0.126.251/32))),
	((dst port 13682) || (dst port 17348) || (dst port 39751) || (dst port 58017) || (dst port 60404)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.89.181/32) || (dst net 227.0.119.171/32) || (dst net 227.0.126.122/32) || (dst net 227.0.129.10/32) || (dst net 227.0.180.251/32))),
	((dst port 20962) || (dst port 27851) || (dst port 29898) || (dst port 34835) || (dst port 47363)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.130.180/32) || (dst net 228.0.131.129/32) || (dst net 228.0.179.203/32) || (dst net 228.0.192.194/32) || (dst net 228.0.238.226/32))),
	((dst port 2645) || (dst port 16970) || (dst port 27036) || (dst port 32178) || (dst port 35790)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.5.28/32) || (dst net 229.0.51.239/32) || (dst net 229.0.167.235/32) || (dst net 229.0.169.31/32) || (dst net 229.0.231.94/32))),
	((dst port 3779) || (dst port 12883) || (dst port 23976) || (dst port 43716) || (dst port 50432)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.25.168/32) || (dst net 230.0.43.150/32) || (dst net 230.0.125.252/32) || (dst net 230.0.133.40/32) || (dst net 230.0.142.218/32))),
	((dst port 11089) || (dst port 41225) || (dst port 47397) || (dst port 56366) || (dst port 64897)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.11.32/32) || (dst net 231.0.118.211/32) || (dst net 231.0.136.67/32) || (dst net 231.0.209.17/32) || (dst net 231.0.244.218/32))),
	((dst port 1342) || (dst port 14583) || (dst port 22849) || (dst port 39831) || (dst port 65471)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.25.221/32) || (dst net 232.0.28.223/32) || (dst net 232.0.34.232/32) || (dst net 232.0.166.51/32) || (dst net 232.0.182.240/32))),
	((dst port 5014) || (dst port 17815) || (dst port 30163) || (dst port 44301) || (dst port 51501)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.88.165/32) || (dst net 233.0.90.50/32) || (dst net 233.0.123.98/32) || (dst net 233.0.157.41/32) || (dst net 233.0.160.98/32))),
	((dst port 1822) || (dst port 21219) || (dst port 48789) || (dst port 50915) || (dst port 56358)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.149.186/32) || (dst net 234.0.151.192/32) || (dst net 234.0.168.139/32) || (dst net 234.0.232.72/32) || (dst net 234.0.246.29/32))),
	((dst port 19000) || (dst port 26639) || (dst port 35112) || (dst port 37968) || (dst port 50752)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.81.31/32) || (dst net 235.0.199.71/32) || (dst net 235.0.207.54/32) || (dst net 235.0.213.87/32) || (dst net 235.0.238.68/32))),
	((dst port 16715) || (dst port 30891) || (dst port 39830) || (dst port 40968) || (dst port 46838)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.45.169/32) || (dst net 236.0.54.152/32) || (dst net 236.0.79.244/32) || (dst net 236.0.128.226/32) || (dst net 236.0.200.185/32))),
	((dst port 7126) || (dst port 12058) || (dst port 33738) || (dst port 41724) || (dst port 42634)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.14.123/32) || (dst net 237.0.22.77/32) || (dst net 237.0.131.58/32) || (dst net 237.0.225.215/32) || (dst net 237.0.237.196/32))),
	((dst port 7649) || (dst port 10570) || (dst port 25171) || (dst port 30295) || (dst port 39007)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.73.89/32) || (dst net 238.0.76.173/32) || (dst net 238.0.88.230/32) || (dst net 238.0.118.95/32) || (dst net 238.0.227.92/32))),
	((dst port 30399) || (dst port 40775) || (dst port 53599) || (dst port 54406) || (dst port 61570)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.73.8/32) || (dst net 239.0.146.100/32) || (dst net 239.0.160.34/32) || (dst net 239.0.189.18/32) || (dst net 239.0.189.67/32))),
	((dst port 577) || (dst port 13795) || (dst port 36579) || (dst port 39947) || (dst port 55304)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.65.134/32) || (dst net 240.0.76.229/32) || (dst net 240.0.126.195/32) || (dst net 240.0.134.83/32) || (dst net 240.0.181.10/32))),
	((dst port 9543) || (dst port 19202) || (dst port 31432) || (dst port 42479) || (dst port 53942)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.47.207/32) || (dst net 241.0.69.242/32) || (dst net 241.0.83.1/32) || (dst net 241.0.198.62/32) || (dst net 241.0.207.5/32))),
	((dst port 3611) || (dst port 6762) || (dst port 11509) || (dst port 19171) || (dst port 38093)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.2.131/32) || (dst net 242.0.13.223/32) || (dst net 242.0.91.158/32) || (dst net 242.0.182.185/32) || (dst net 242.0.201.216/32))),
	((dst port 11399) || (dst port 27608) || (dst port 41829) || (dst port 60429) || (dst port 65006)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.5.62/32) || (dst net 243.0.6.93/32) || (dst net 243.0.104.233/32) || (dst net 243.0.131.85/32) || (dst net 243.0.233.169/32))),
	((dst port 6480) || (dst port 9345) || (dst port 18857) || (dst port 43533) || (dst port 57287)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.14.152/32) || (dst net 244.0.42.233/32) || (dst net 244.0.52.180/32) || (dst net 244.0.55.99/32) || (dst net 244.0.224.2/32))),
	((dst port 11767) || (dst port 40798) || (dst port 45661) || (dst port 47150) || (dst port 47663)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.48.53/32) || (dst net 245.0.69.119/32) || (dst net 245.0.108.117/32) || (dst net 245.0.240.32/32) || (dst net 245.0.254.97/32))),
	((dst port 1816) || (dst port 23211) || (dst port 32277) || (dst port 40753) || (dst port 46557)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.80.63/32) || (dst net 246.0.172.156/32) || (dst net 246.0.204.222/32) || (dst net 246.0.214.55/32) || (dst net 246.0.248.25/32))),
	((dst port 6792) || (dst port 13484) || (dst port 46091) || (dst port 58295) || (dst port 64480)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.6.164/32) || (dst net 247.0.7.190/32) || (dst net 247.0.81.140/32) || (dst net 247.0.85.127/32) || (dst net 247.0.159.248/32))),
	((dst port 16747) || (dst port 51555) || (dst port 53480) || (dst port 53633) || (dst port 56459)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.19.60/32) || (dst net 248.0.52.65/32) || (dst net 248.0.136.49/32) || (dst net 248.0.143.243/32) || (dst net 248.0.173.72/32))),
	((dst port 4592) || (dst port 13188) || (dst port 52163) || (dst port 54525) || (dst port 59856)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.29.71/32) || (dst net 249.0.78.102/32) || (dst net 249.0.173.164/32) || (dst net 249.0.198.3/32) || (dst net 249.0.230.133/32))),
	((dst port 597) || (dst port 1507) || (dst port 18378) || (dst port 44949) || (dst port 54947)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.6.53/32) || (dst net 250.0.120.100/32) || (dst net 250.0.122.105/32) || (dst net 250.0.182.111/32) || (dst net 250.0.191.114/32))),
	((dst port 1334) || (dst port 8218) || (dst port 11421) || (dst port 13344) || (dst port 37618)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.8.189/32) || (dst net 251.0.42.60/32) || (dst net 251.0.86.132/32) || (dst net 251.0.176.108/32) || (dst net 251.0.240.206/32))),
	((dst port 11300) || (dst port 27405) || (dst port 29294) || (dst port 37820) || (dst port 65243)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.27.47/32) || (dst net 252.0.127.191/32) || (dst net 252.0.148.178/32) || (dst net 252.0.206.25/32) || (dst net 252.0.240.114/32))),
	((dst port 16728) || (dst port 26467) || (dst port 28903) || (dst port 45059) || (dst port 57804)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.13.198/32) || (dst net 253.0.82.76/32) || (dst net 253.0.157.211/32) || (dst net 253.0.225.145/32) || (dst net 253.0.249.163/32))),
	((dst port 4938) || (dst port 11422) || (dst port 18464) || (dst port 29776) || (dst port 34964)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.89.25/32) || (dst net 254.0.110.145/32) || (dst net 254.0.111.29/32) || (dst net 254.0.184.72/32) || (dst net 254.0.235.47/32))),
	((dst port 354) || (dst port 2395) || (dst port 21895) || (dst port 51632) || (dst port 61022)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.26.113/32) || (dst net 255.0.50.152/32) || (dst net 255.0.179.153/32) || (dst net 255.0.185.244/32) || (dst net 255.0.232.139/32))),
	((dst port 21084) || (dst port 42235) || (dst port 58659) || (dst port 60659) || (dst port 62845)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.85.99/32) || (dst net 0.0.135.33/32) || (dst net 0.0.148.70/32) || (dst net 0.0.194.208/32) || (dst net 0.0.212.170/32))),
	((dst port 2612) || (dst port 20054) || (dst port 45474) || (dst port 56144) || (dst port 64671)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.8.34/32) || (dst net 1.0.22.124/32) || (dst net 1.0.24.25/32) || (dst net 1.0.31.90/32) || (dst net 1.0.113.41/32))),
	((dst port 929) || (dst port 19834) || (dst port 21218) || (dst port 36163) || (dst port 59829)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.4.169/32) || (dst net 2.0.20.222/32) || (dst net 2.0.137.147/32) || (dst net 2.0.212.19/32) || (dst net 2.0.236.136/32))),
	((dst port 23086) || (dst port 32263) || (dst port 33401) || (dst port 55279) || (dst port 57407)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.33.121/32) || (dst net 3.0.36.12/32) || (dst net 3.0.136.72/32) || (dst net 3.0.155.57/32) || (dst net 3.0.170.132/32))),
	((dst port 9944) || (dst port 12928) || (dst port 28939) || (dst port 30827) || (dst port 34374)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.16.0/32) || (dst net 4.0.102.190/32) || (dst net 4.0.103.45/32) || (dst net 4.0.154.59/32) || (dst net 4.0.158.29/32))),
	((dst port 6859) || (dst port 28933) || (dst port 59240) || (dst port 61936) || (dst port 64941)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.95.90/32) || (dst net 5.0.118.207/32) || (dst net 5.0.233.71/32) || (dst net 5.0.237.87/32) || (dst net 5.0.247.86/32))),
	((dst port 3689) || (dst port 7678) || (dst port 12952) || (dst port 14892) || (dst port 36679)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.3.27/32) || (dst net 6.0.16.231/32) || (dst net 6.0.122.37/32) || (dst net 6.0.230.110/32) || (dst net 6.0.234.44/32))),
	((dst port 33792) || (dst port 57150) || (dst port 61185) || (dst port 64635) || (dst port 65011)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.25.182/32) || (dst net 7.0.89.49/32) || (dst net 7.0.116.40/32) || (dst net 7.0.131.215/32) || (dst net 7.0.216.127/32))),
	((dst port 19144) || (dst port 27077) || (dst port 42132) || (dst port 58399) || (dst port 64722)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.49.119/32) || (dst net 8.0.50.248/32) || (dst net 8.0.79.187/32) || (dst net 8.0.150.194/32) || (dst net 8.0.195.204/32))),
	((dst port 5914) || (dst port 12300) || (dst port 30720) || (dst port 33612) || (dst port 59480)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.61.82/32) || (dst net 9.0.70.18/32) || (dst net 9.0.202.95/32) || (dst net 9.0.221.29/32) || (dst net 9.0.243.133/32))),
	((dst port 553) || (dst port 6629) || (dst port 27333) || (dst port 44438) || (dst port 53517)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.22.94/32) || (dst net 10.0.120.85/32) || (dst net 10.0.184.27/32) || (dst net 10.0.196.251/32) || (dst net 10.0.239.76/32))),
	((dst port 1571) || (dst port 3583) || (dst port 4211) || (dst port 5926) || (dst port 51601)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.37.138/32) || (dst net 11.0.47.208/32) || (dst net 11.0.54.20/32) || (dst net 11.0.121.107/32) || (dst net 11.0.170.169/32))),
	((dst port 4240) || (dst port 4773) || (dst port 23088) || (dst port 46154) || (dst port 56052)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.24.246/32) || (dst net 12.0.139.252/32) || (dst net 12.0.206.80/32) || (dst net 12.0.221.245/32) || (dst net 12.0.234.119/32))),
	((dst port 1698) || (dst port 3893) || (dst port 27264) || (dst port 32375) || (dst port 40133)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.113.253/32) || (dst net 13.0.119.211/32) || (dst net 13.0.130.116/32) || (dst net 13.0.150.229/32) || (dst net 13.0.188.244/32))),
	((dst port 425) || (dst port 16001) || (dst port 20047) || (dst port 26790) || (dst port 64984)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.14.201/32) || (dst net 14.0.111.211/32) || (dst net 14.0.135.251/32) || (dst net 14.0.179.93/32) || (dst net 14.0.214.155/32))),
	((dst port 9711) || (dst port 11578) || (dst port 26857) || (dst port 31508) || (dst port 39089)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.0.165/32) || (dst net 15.0.43.214/32) || (dst net 15.0.61.166/32) || (dst net 15.0.82.132/32) || (dst net 15.0.221.24/32))),
	((dst port 7569) || (dst port 12123) || (dst port 37400) || (dst port 43573) || (dst port 62810)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.137.202/32) || (dst net 16.0.148.145/32) || (dst net 16.0.148.227/32) || (dst net 16.0.177.161/32) || (dst net 16.0.246.209/32))),
	((dst port 6069) || (dst port 20226) || (dst port 27773) || (dst port 38356) || (dst port 43620)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.38.138/32) || (dst net 17.0.67.242/32) || (dst net 17.0.83.229/32) || (dst net 17.0.228.197/32) || (dst net 17.0.243.195/32))),
	((dst port 7246) || (dst port 23315) || (dst port 24911) || (dst port 50356) || (dst port 53072)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.57.244/32) || (dst net 18.0.116.52/32) || (dst net 18.0.144.144/32) || (dst net 18.0.207.175/32) || (dst net 18.0.213.135/32))),
	((dst port 21216) || (dst port 37676) || (dst port 59297) || (dst port 62558) || (dst port 64318)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.56.90/32) || (dst net 19.0.65.81/32) || (dst net 19.0.117.144/32) || (dst net 19.0.143.27/32) || (dst net 19.0.238.225/32))),
	((dst port 8642) || (dst port 38058) || (dst port 51132) || (dst port 54257) || (dst port 58939)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.49.81/32) || (dst net 20.0.133.238/32) || (dst net 20.0.178.98/32) || (dst net 20.0.217.223/32) || (dst net 20.0.245.245/32))),
	((dst port 8097) || (dst port 13598) || (dst port 31352) || (dst port 47023) || (dst port 55788)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.28.28/32) || (dst net 21.0.77.52/32) || (dst net 21.0.142.41/32) || (dst net 21.0.160.154/32) || (dst net 21.0.195.113/32))),
	((dst port 13221) || (dst port 18800) || (dst port 22079) || (dst port 46952) || (dst port 54670)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.57.225/32) || (dst net 22.0.95.199/32) || (dst net 22.0.179.237/32) || (dst net 22.0.249.204/32) || (dst net 22.0.251.13/32))),
	((dst port 5627) || (dst port 8433) || (dst port 42493) || (dst port 44550) || (dst port 57055)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.1.79/32) || (dst net 23.0.2.57/32) || (dst net 23.0.4.184/32) || (dst net 23.0.238.55/32) || (dst net 23.0.243.113/32))),
	((dst port 4137) || (dst port 6907) || (dst port 8444) || (dst port 30372) || (dst port 32923)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.69.115/32) || (dst net 24.0.100.234/32) || (dst net 24.0.101.66/32) || (dst net 24.0.192.78/32) || (dst net 24.0.234.176/32))),
	((dst port 3700) || (dst port 9136) || (dst port 59646) || (dst port 62029) || (dst port 64961)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.110.183/32) || (dst net 25.0.153.199/32) || (dst net 25.0.154.200/32) || (dst net 25.0.162.25/32) || (dst net 25.0.230.104/32))),
	((dst port 15011) || (dst port 26535) || (dst port 42224) || (dst port 50874) || (dst port 63027)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.77.23/32) || (dst net 26.0.93.194/32) || (dst net 26.0.108.180/32) || (dst net 26.0.129.79/32) || (dst net 26.0.253.228/32))),
	((dst port 49947) || (dst port 53289) || (dst port 56712) || (dst port 58335) || (dst port 58742)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.55.240/32) || (dst net 27.0.92.31/32) || (dst net 27.0.132.249/32) || (dst net 27.0.135.236/32) || (dst net 27.0.229.76/32))),
	((dst port 6063) || (dst port 28655) || (dst port 38224) || (dst port 40782) || (dst port 41509)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.7.16/32) || (dst net 28.0.67.90/32) || (dst net 28.0.87.196/32) || (dst net 28.0.183.181/32) || (dst net 28.0.229.200/32))),
	((dst port 4728) || (dst port 36665) || (dst port 44552) || (dst port 45311) || (dst port 54536)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.34.73/32) || (dst net 29.0.58.108/32) || (dst net 29.0.218.102/32) || (dst net 29.0.224.203/32) || (dst net 29.0.244.177/32))),
	((dst port 24283) || (dst port 27357) || (dst port 48090) || (dst port 49721) || (dst port 58510)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.31.77/32) || (dst net 30.0.32.141/32) || (dst net 30.0.78.17/32) || (dst net 30.0.221.154/32) || (dst net 30.0.239.192/32))),
	((dst port 556) || (dst port 6236) || (dst port 16268) || (dst port 32443) || (dst port 47261)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.56.28/32) || (dst net 31.0.78.196/32) || (dst net 31.0.151.109/32) || (dst net 31.0.198.96/32) || (dst net 31.0.218.174/32))),
	((dst port 8857) || (dst port 10261) || (dst port 24590) || (dst port 25257) || (dst port 27752)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.7.73/32) || (dst net 32.0.40.173/32) || (dst net 32.0.132.207/32) || (dst net 32.0.148.157/32) || (dst net 32.0.157.28/32))),
	((dst port 23035) || (dst port 27767) || (dst port 28264) || (dst port 38835) || (dst port 56279)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.31.13/32) || (dst net 33.0.45.37/32) || (dst net 33.0.159.67/32) || (dst net 33.0.176.22/32) || (dst net 33.0.183.17/32))),
	((dst port 4985) || (dst port 19539) || (dst port 26364) || (dst port 37197) || (dst port 55882)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.7.160/32) || (dst net 34.0.107.117/32) || (dst net 34.0.183.191/32) || (dst net 34.0.203.153/32) || (dst net 34.0.212.122/32))),
	((dst port 4727) || (dst port 17822) || (dst port 24971) || (dst port 28147) || (dst port 51839)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.117.41/32) || (dst net 35.0.152.209/32) || (dst net 35.0.174.231/32) || (dst net 35.0.179.22/32) || (dst net 35.0.220.45/32))),
	((dst port 8945) || (dst port 8973) || (dst port 9955) || (dst port 18420) || (dst port 57752)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.6.116/32) || (dst net 36.0.52.121/32) || (dst net 36.0.57.51/32) || (dst net 36.0.191.3/32) || (dst net 36.0.198.66/32))),
	((dst port 6770) || (dst port 13515) || (dst port 24300) || (dst port 27978) || (dst port 58867)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.42.135/32) || (dst net 37.0.43.212/32) || (dst net 37.0.95.148/32) || (dst net 37.0.128.206/32) || (dst net 37.0.209.91/32))),
	((dst port 2085) || (dst port 3072) || (dst port 30575) || (dst port 53116) || (dst port 57001)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.121.249/32) || (dst net 38.0.159.246/32) || (dst net 38.0.178.77/32) || (dst net 38.0.179.167/32) || (dst net 38.0.190.51/32))),
	((dst port 4665) || (dst port 11013) || (dst port 33449) || (dst port 35438) || (dst port 63604)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.4.93/32) || (dst net 39.0.151.103/32) || (dst net 39.0.180.158/32) || (dst net 39.0.209.144/32) || (dst net 39.0.235.59/32))),
	((dst port 9845) || (dst port 29063) || (dst port 37796) || (dst port 46706) || (dst port 60209)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.78.57/32) || (dst net 40.0.84.135/32) || (dst net 40.0.86.215/32) || (dst net 40.0.94.127/32) || (dst net 40.0.201.33/32))),
	((dst port 12698) || (dst port 14712) || (dst port 32649) || (dst port 35875) || (dst port 62707)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.91.129/32) || (dst net 41.0.129.17/32) || (dst net 41.0.198.148/32) || (dst net 41.0.209.119/32) || (dst net 41.0.215.214/32))),
	((dst port 3653) || (dst port 27924) || (dst port 30910) || (dst port 58901) || (dst port 64498)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.175.174/32) || (dst net 42.0.180.77/32) || (dst net 42.0.216.126/32) || (dst net 42.0.229.57/32) || (dst net 42.0.253.43/32))),
	((dst port 32827) || (dst port 33901) || (dst port 35919) || (dst port 43001) || (dst port 61921)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.38.89/32) || (dst net 43.0.63.208/32) || (dst net 43.0.69.232/32) || (dst net 43.0.143.246/32) || (dst net 43.0.202.85/32))),
	((dst port 5121) || (dst port 20410) || (dst port 28621) || (dst port 33590) || (dst port 57810)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.30.50/32) || (dst net 44.0.47.72/32) || (dst net 44.0.93.2/32) || (dst net 44.0.132.29/32) || (dst net 44.0.132.37/32))),
	((dst port 24987) || (dst port 43817) || (dst port 48779) || (dst port 58661) || (dst port 64639)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.52.140/32) || (dst net 45.0.80.212/32) || (dst net 45.0.126.167/32) || (dst net 45.0.138.146/32) || (dst net 45.0.197.243/32))),
	((dst port 23797) || (dst port 37128) || (dst port 40241) || (dst port 46039) || (dst port 49334)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.56.86/32) || (dst net 46.0.111.153/32) || (dst net 46.0.156.12/32) || (dst net 46.0.170.59/32) || (dst net 46.0.231.3/32))),
	((dst port 12163) || (dst port 13319) || (dst port 13326) || (dst port 19279) || (dst port 48552)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.6.97/32) || (dst net 47.0.21.57/32) || (dst net 47.0.129.27/32) || (dst net 47.0.171.225/32) || (dst net 47.0.234.202/32))),
	((dst port 513) || (dst port 13418) || (dst port 25949) || (dst port 35731) || (dst port 48643)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.20.69/32) || (dst net 48.0.86.16/32) || (dst net 48.0.124.170/32) || (dst net 48.0.182.70/32) || (dst net 48.0.217.142/32))),
	((dst port 7729) || (dst port 9690) || (dst port 12176) || (dst port 14218) || (dst port 40695)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.69.44/32) || (dst net 49.0.82.55/32) || (dst net 49.0.150.21/32) || (dst net 49.0.154.74/32) || (dst net 49.0.244.175/32))),
	((dst port 4923) || (dst port 20072) || (dst port 34294) || (dst port 37260) || (dst port 51383)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.20.29/32) || (dst net 50.0.127.97/32) || (dst net 50.0.172.16/32) || (dst net 50.0.173.129/32) || (dst net 50.0.174.98/32))),
	((dst port 11859) || (dst port 17931) || (dst port 25677) || (dst port 26978) || (dst port 42115)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.109.171/32) || (dst net 51.0.127.206/32) || (dst net 51.0.140.74/32) || (dst net 51.0.201.89/32) || (dst net 51.0.202.121/32))),
	((dst port 4971) || (dst port 48279) || (dst port 55746) || (dst port 55781) || (dst port 63880)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.56.151/32) || (dst net 52.0.79.158/32) || (dst net 52.0.81.50/32) || (dst net 52.0.239.73/32) || (dst net 52.0.254.140/32))),
	((dst port 10333) || (dst port 20827) || (dst port 41486) || (dst port 49730) || (dst port 61068)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.60.197/32) || (dst net 53.0.88.172/32) || (dst net 53.0.139.104/32) || (dst net 53.0.161.21/32) || (dst net 53.0.247.210/32))),
	((dst port 23820) || (dst port 30913) || (dst port 39202) || (dst port 39771) || (dst port 44920)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.25.215/32) || (dst net 54.0.54.150/32) || (dst net 54.0.105.107/32) || (dst net 54.0.183.122/32) || (dst net 54.0.247.232/32))),
	((dst port 18850) || (dst port 23211) || (dst port 23432) || (dst port 28413) || (dst port 32218)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.58.238/32) || (dst net 55.0.71.43/32) || (dst net 55.0.101.129/32) || (dst net 55.0.198.107/32) || (dst net 55.0.203.17/32))),
	((dst port 10069) || (dst port 23859) || (dst port 38287) || (dst port 45278) || (dst port 48455)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.5.15/32) || (dst net 56.0.28.168/32) || (dst net 56.0.48.241/32) || (dst net 56.0.59.26/32) || (dst net 56.0.78.76/32))),
	((dst port 14152) || (dst port 22640) || (dst port 24771) || (dst port 31691) || (dst port 47699)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.1.54/32) || (dst net 57.0.97.221/32) || (dst net 57.0.121.82/32) || (dst net 57.0.177.56/32) || (dst net 57.0.220.135/32))),
	((dst port 789) || (dst port 7185) || (dst port 36216) || (dst port 46052) || (dst port 48357)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.8.4/32) || (dst net 58.0.104.187/32) || (dst net 58.0.116.38/32) || (dst net 58.0.144.214/32) || (dst net 58.0.202.133/32))),
	((dst port 5612) || (dst port 16979) || (dst port 29569) || (dst port 34123) || (dst port 48996)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.22.187/32) || (dst net 59.0.85.207/32) || (dst net 59.0.93.197/32) || (dst net 59.0.117.162/32) || (dst net 59.0.191.47/32))),
	((dst port 12889) || (dst port 30508) || (dst port 54708) || (dst port 56008) || (dst port 57165)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.42.132/32) || (dst net 60.0.67.127/32) || (dst net 60.0.103.177/32) || (dst net 60.0.123.73/32) || (dst net 60.0.238.95/32))),
	((dst port 12039) || (dst port 25585) || (dst port 28376) || (dst port 30547) || (dst port 57537)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.53.241/32) || (dst net 61.0.196.18/32) || (dst net 61.0.221.35/32) || (dst net 61.0.232.203/32) || (dst net 61.0.249.144/32))),
	((dst port 4424) || (dst port 9738) || (dst port 28164) || (dst port 36927) || (dst port 55579)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.7.116/32) || (dst net 62.0.18.16/32) || (dst net 62.0.58.250/32) || (dst net 62.0.77.222/32) || (dst net 62.0.106.250/32))),
	((dst port 27141) || (dst port 27794) || (dst port 28124) || (dst port 32400) || (dst port 59304)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.21.10/32) || (dst net 63.0.64.151/32) || (dst net 63.0.104.151/32) || (dst net 63.0.130.237/32) || (dst net 63.0.197.112/32))),
	((dst port 33916) || (dst port 35779) || (dst port 39929) || (dst port 43692) || (dst port 47758)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.3.144/32) || (dst net 64.0.43.187/32) || (dst net 64.0.190.112/32) || (dst net 64.0.232.125/32) || (dst net 64.0.242.79/32))),
	((dst port 13349) || (dst port 28609) || (dst port 30574) || (dst port 48431) || (dst port 49680)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.88.33/32) || (dst net 65.0.126.143/32) || (dst net 65.0.178.177/32) || (dst net 65.0.209.245/32) || (dst net 65.0.231.75/32))),
	((dst port 21728) || (dst port 40323) || (dst port 51611) || (dst port 52990) || (dst port 57102)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.57.3/32) || (dst net 66.0.60.28/32) || (dst net 66.0.75.39/32) || (dst net 66.0.214.43/32) || (dst net 66.0.216.116/32))),
	((dst port 12787) || (dst port 17104) || (dst port 18234) || (dst port 25388) || (dst port 55417)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.34.139/32) || (dst net 67.0.52.67/32) || (dst net 67.0.150.209/32) || (dst net 67.0.164.108/32) || (dst net 67.0.217.177/32))),
	((dst port 8265) || (dst port 38759) || (dst port 40345) || (dst port 42900) || (dst port 44725)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.93.223/32) || (dst net 68.0.138.124/32) || (dst net 68.0.153.96/32) || (dst net 68.0.172.28/32) || (dst net 68.0.196.62/32))),
	((dst port 19592) || (dst port 25424) || (dst port 38166) || (dst port 41775) || (dst port 63373)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.13.101/32) || (dst net 69.0.129.194/32) || (dst net 69.0.134.216/32) || (dst net 69.0.176.0/32) || (dst net 69.0.213.44/32))),
	((dst port 3639) || (dst port 15217) || (dst port 17172) || (dst port 52103) || (dst port 57478)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.4.184/32) || (dst net 70.0.6.234/32) || (dst net 70.0.33.178/32) || (dst net 70.0.65.15/32) || (dst net 70.0.219.103/32))),
	((dst port 5068) || (dst port 7920) || (dst port 42613) || (dst port 47591) || (dst port 50013)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.9.159/32) || (dst net 71.0.103.243/32) || (dst net 71.0.133.16/32) || (dst net 71.0.159.252/32) || (dst net 71.0.189.163/32))),
	((dst port 4158) || (dst port 23516) || (dst port 25030) || (dst port 44252) || (dst port 49862)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.13.207/32) || (dst net 72.0.26.138/32) || (dst net 72.0.118.167/32) || (dst net 72.0.178.196/32) || (dst net 72.0.199.107/32))),
	((dst port 8892) || (dst port 27536) || (dst port 29728) || (dst port 41322) || (dst port 46089)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.30.24/32) || (dst net 73.0.32.177/32) || (dst net 73.0.35.161/32) || (dst net 73.0.54.103/32) || (dst net 73.0.223.109/32))),
	((dst port 12851) || (dst port 12857) || (dst port 40707) || (dst port 40748) || (dst port 57920)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.27.199/32) || (dst net 74.0.40.70/32) || (dst net 74.0.144.27/32) || (dst net 74.0.192.143/32) || (dst net 74.0.203.62/32))),
	((dst port 8456) || (dst port 23877) || (dst port 33138) || (dst port 34827) || (dst port 43952)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.10.218/32) || (dst net 75.0.20.105/32) || (dst net 75.0.22.217/32) || (dst net 75.0.134.161/32) || (dst net 75.0.162.174/32))),
	((dst port 21413) || (dst port 24202) || (dst port 28935) || (dst port 39625) || (dst port 52073)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.26.229/32) || (dst net 76.0.64.209/32) || (dst net 76.0.93.150/32) || (dst net 76.0.204.94/32) || (dst net 76.0.224.162/32))),
	((dst port 24850) || (dst port 27596) || (dst port 48101) || (dst port 60144) || (dst port 61357)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.43.58/32) || (dst net 77.0.68.95/32) || (dst net 77.0.170.124/32) || (dst net 77.0.209.52/32) || (dst net 77.0.225.243/32))),
	((dst port 5816) || (dst port 35585) || (dst port 42445) || (dst port 43433) || (dst port 49221)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.19.66/32) || (dst net 78.0.115.100/32) || (dst net 78.0.124.148/32) || (dst net 78.0.186.249/32) || (dst net 78.0.217.154/32))),
	((dst port 7337) || (dst port 11972) || (dst port 25448) || (dst port 37154) || (dst port 40816)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.1.85/32) || (dst net 79.0.97.50/32) || (dst net 79.0.110.165/32) || (dst net 79.0.164.11/32) || (dst net 79.0.249.138/32))),
	((dst port 16562) || (dst port 18410) || (dst port 21875) || (dst port 57270) || (dst port 60491)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.35.251/32) || (dst net 80.0.50.216/32) || (dst net 80.0.65.10/32) || (dst net 80.0.231.225/32) || (dst net 80.0.244.60/32))),
	((dst port 8459) || (dst port 14512) || (dst port 19876) || (dst port 59209) || (dst port 64305)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.34.166/32) || (dst net 81.0.93.240/32) || (dst net 81.0.99.216/32) || (dst net 81.0.187.209/32) || (dst net 81.0.195.138/32))),
	((dst port 17664) || (dst port 23339) || (dst port 24017) || (dst port 53544) || (dst port 65213)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.9.181/32) || (dst net 82.0.22.166/32) || (dst net 82.0.26.208/32) || (dst net 82.0.113.123/32) || (dst net 82.0.184.200/32))),
	((dst port 7207) || (dst port 13939) || (dst port 22305) || (dst port 43390) || (dst port 45436)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.6.194/32) || (dst net 83.0.64.171/32) || (dst net 83.0.99.113/32) || (dst net 83.0.132.232/32) || (dst net 83.0.149.12/32))),
	((dst port 12253) || (dst port 18657) || (dst port 26002) || (dst port 35086) || (dst port 61688)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.0.141/32) || (dst net 84.0.4.160/32) || (dst net 84.0.72.232/32) || (dst net 84.0.99.33/32) || (dst net 84.0.212.250/32))),
	((dst port 560) || (dst port 4926) || (dst port 32786) || (dst port 35373) || (dst port 45204)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.156.130/32) || (dst net 85.0.196.118/32) || (dst net 85.0.196.203/32) || (dst net 85.0.209.164/32) || (dst net 85.0.250.188/32))),
	((dst port 24263) || (dst port 31407) || (dst port 36271) || (dst port 42583) || (dst port 51845)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.37.126/32) || (dst net 86.0.115.190/32) || (dst net 86.0.120.23/32) || (dst net 86.0.168.212/32) || (dst net 86.0.194.16/32))),
	((dst port 1777) || (dst port 21603) || (dst port 48520) || (dst port 55477) || (dst port 61343)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.5.205/32) || (dst net 87.0.66.154/32) || (dst net 87.0.81.232/32) || (dst net 87.0.87.220/32) || (dst net 87.0.118.29/32))),
	((dst port 42800) || (dst port 49132) || (dst port 50859) || (dst port 58303) || (dst port 62099)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.12.113/32) || (dst net 88.0.29.196/32) || (dst net 88.0.46.195/32) || (dst net 88.0.64.200/32) || (dst net 88.0.229.96/32))),
	((dst port 13165) || (dst port 22658) || (dst port 38962) || (dst port 39546) || (dst port 54013)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.15.122/32) || (dst net 89.0.36.22/32) || (dst net 89.0.40.241/32) || (dst net 89.0.132.223/32) || (dst net 89.0.243.189/32))),
	((dst port 1282) || (dst port 30571) || (dst port 37645) || (dst port 55272) || (dst port 56746)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.36.229/32) || (dst net 90.0.41.7/32) || (dst net 90.0.138.97/32) || (dst net 90.0.145.174/32) || (dst net 90.0.170.245/32))),
	((dst port 11512) || (dst port 30615) || (dst port 34151) || (dst port 62355) || (dst port 63145)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.21.193/32) || (dst net 91.0.63.153/32) || (dst net 91.0.71.29/32) || (dst net 91.0.135.76/32) || (dst net 91.0.189.2/32))),
	((dst port 2882) || (dst port 4342) || (dst port 19017) || (dst port 29733) || (dst port 39758)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.47.140/32) || (dst net 92.0.67.160/32) || (dst net 92.0.157.9/32) || (dst net 92.0.182.96/32) || (dst net 92.0.199.137/32))),
	((dst port 9166) || (dst port 21009) || (dst port 43422) || (dst port 52156) || (dst port 61225)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.3.45/32) || (dst net 93.0.11.167/32) || (dst net 93.0.57.198/32) || (dst net 93.0.157.131/32) || (dst net 93.0.212.147/32))),
	((dst port 5535) || (dst port 7301) || (dst port 35602) || (dst port 40004) || (dst port 61578)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.80.190/32) || (dst net 94.0.131.33/32) || (dst net 94.0.167.202/32) || (dst net 94.0.204.76/32) || (dst net 94.0.210.254/32))),
	((dst port 2045) || (dst port 4974) || (dst port 16623) || (dst port 37776) || (dst port 46069)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.126.150/32) || (dst net 95.0.146.194/32) || (dst net 95.0.181.20/32) || (dst net 95.0.214.142/32) || (dst net 95.0.217.193/32))),
	((dst port 6105) || (dst port 13925) || (dst port 29539) || (dst port 38810) || (dst port 49228)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.102.141/32) || (dst net 96.0.138.178/32) || (dst net 96.0.156.149/32) || (dst net 96.0.189.173/32) || (dst net 96.0.208.227/32))),
	((dst port 24191) || (dst port 35420) || (dst port 40455) || (dst port 48362) || (dst port 49525)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.78.77/32) || (dst net 97.0.159.36/32) || (dst net 97.0.181.232/32) || (dst net 97.0.201.3/32) || (dst net 97.0.211.64/32))),
	((dst port 9034) || (dst port 45299) || (dst port 47437) || (dst port 61894) || (dst port 65061)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.107.145/32) || (dst net 98.0.121.159/32) || (dst net 98.0.133.46/32) || (dst net 98.0.136.36/32) || (dst net 98.0.246.138/32))),
	((dst port 22724) || (dst port 23698) || (dst port 33226) || (dst port 45779) || (dst port 60563)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.111.138/32) || (dst net 99.0.139.175/32) || (dst net 99.0.184.236/32) || (dst net 99.0.203.178/32) || (dst net 99.0.230.163/32))),
	((dst port 2199) || (dst port 3577) || (dst port 33608) || (dst port 41956) || (dst port 45175)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.105.145/32) || (dst net 100.0.155.94/32) || (dst net 100.0.172.88/32) || (dst net 100.0.176.237/32) || (dst net 100.0.235.38/32))),
	((dst port 1688) || (dst port 7615) || (dst port 30411) || (dst port 55240) || (dst port 62284)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.39.222/32) || (dst net 101.0.82.131/32) || (dst net 101.0.105.55/32) || (dst net 101.0.118.104/32) || (dst net 101.0.126.197/32))),
	((dst port 5609) || (dst port 19271) || (dst port 41992) || (dst port 50920) || (dst port 51255)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.90.0/32) || (dst net 102.0.135.125/32) || (dst net 102.0.165.188/32) || (dst net 102.0.176.245/32) || (dst net 102.0.254.204/32))),
	((dst port 5310) || (dst port 22447) || (dst port 27024) || (dst port 46111) || (dst port 58812)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.79.106/32) || (dst net 103.0.136.148/32) || (dst net 103.0.168.160/32) || (dst net 103.0.194.107/32) || (dst net 103.0.198.128/32))),
	((dst port 2972) || (dst port 9557) || (dst port 10774) || (dst port 20759) || (dst port 42776)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.43.21/32) || (dst net 104.0.94.121/32) || (dst net 104.0.119.138/32) || (dst net 104.0.174.238/32) || (dst net 104.0.233.218/32))),
	((dst port 12830) || (dst port 20287) || (dst port 36871) || (dst port 43602) || (dst port 48272)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.64.7/32) || (dst net 105.0.69.78/32) || (dst net 105.0.95.150/32) || (dst net 105.0.233.209/32) || (dst net 105.0.246.91/32))),
	((dst port 2103) || (dst port 7113) || (dst port 8770) || (dst port 16927) || (dst port 24321)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.13.174/32) || (dst net 106.0.40.160/32) || (dst net 106.0.68.152/32) || (dst net 106.0.159.103/32) || (dst net 106.0.245.92/32))),
	((dst port 7680) || (dst port 12252) || (dst port 36547) || (dst port 40852) || (dst port 45351)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.27.137/32) || (dst net 107.0.46.207/32) || (dst net 107.0.59.136/32) || (dst net 107.0.71.152/32) || (dst net 107.0.234.157/32))),
	((dst port 30640) || (dst port 38480) || (dst port 40111) || (dst port 54560) || (dst port 55288)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.23.163/32) || (dst net 108.0.33.111/32) || (dst net 108.0.83.222/32) || (dst net 108.0.127.250/32) || (dst net 108.0.201.248/32))),
	((dst port 10223) || (dst port 28948) || (dst port 42243) || (dst port 50764) || (dst port 57796)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.31.244/32) || (dst net 109.0.61.38/32) || (dst net 109.0.123.113/32) || (dst net 109.0.161.131/32) || (dst net 109.0.191.195/32))),
	((dst port 7185) || (dst port 11138) || (dst port 24269) || (dst port 52292) || (dst port 55878)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.9.219/32) || (dst net 110.0.61.249/32) || (dst net 110.0.63.137/32) || (dst net 110.0.85.41/32) || (dst net 110.0.180.54/32))),
	((dst port 3246) || (dst port 6373) || (dst port 27105) || (dst port 31918) || (dst port 32826)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.66.241/32) || (dst net 111.0.79.68/32) || (dst net 111.0.154.8/32) || (dst net 111.0.197.82/32) || (dst net 111.0.217.138/32))),
	((dst port 9769) || (dst port 18587) || (dst port 25282) || (dst port 35267) || (dst port 43795)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.67.210/32) || (dst net 112.0.82.225/32) || (dst net 112.0.111.231/32) || (dst net 112.0.138.39/32) || (dst net 112.0.229.48/32))),
	((dst port 24782) || (dst port 29329) || (dst port 30232) || (dst port 47052) || (dst port 62735)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.65.182/32) || (dst net 113.0.93.12/32) || (dst net 113.0.167.252/32) || (dst net 113.0.195.239/32) || (dst net 113.0.250.230/32))),
	((dst port 1430) || (dst port 8544) || (dst port 12669) || (dst port 28950) || (dst port 54275)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.61.250/32) || (dst net 114.0.74.113/32) || (dst net 114.0.84.113/32) || (dst net 114.0.171.39/32) || (dst net 114.0.232.68/32))),
	((dst port 7445) || (dst port 16784) || (dst port 36861) || (dst port 38156) || (dst port 64035)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.34.192/32) || (dst net 115.0.40.83/32) || (dst net 115.0.79.99/32) || (dst net 115.0.179.236/32) || (dst net 115.0.247.173/32))),
	((dst port 7063) || (dst port 12810) || (dst port 24008) || (dst port 34354) || (dst port 53221)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.44.91/32) || (dst net 116.0.75.123/32) || (dst net 116.0.78.37/32) || (dst net 116.0.86.39/32) || (dst net 116.0.99.198/32))),
	((dst port 1973) || (dst port 35514) || (dst port 37690) || (dst port 39856) || (dst port 41192)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.3.60/32) || (dst net 117.0.52.117/32) || (dst net 117.0.124.181/32) || (dst net 117.0.182.191/32) || (dst net 117.0.220.96/32))),
	((dst port 8828) || (dst port 40931) || (dst port 53929) || (dst port 61681) || (dst port 63178)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.17.71/32) || (dst net 118.0.29.153/32) || (dst net 118.0.31.251/32) || (dst net 118.0.118.147/32) || (dst net 118.0.125.229/32))),
	((dst port 25363) || (dst port 30048) || (dst port 34730) || (dst port 39480) || (dst port 62042)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.10.214/32) || (dst net 119.0.30.124/32) || (dst net 119.0.127.215/32) || (dst net 119.0.142.84/32) || (dst net 119.0.231.83/32))),
	((dst port 11849) || (dst port 34283) || (dst port 35684) || (dst port 41748) || (dst port 51611)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.39.237/32) || (dst net 120.0.50.28/32) || (dst net 120.0.159.94/32) || (dst net 120.0.188.186/32) || (dst net 120.0.219.82/32))),
	((dst port 38993) || (dst port 41840) || (dst port 51494) || (dst port 56899) || (dst port 60011)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.43.183/32) || (dst net 121.0.44.31/32) || (dst net 121.0.149.94/32) || (dst net 121.0.201.190/32) || (dst net 121.0.239.199/32))),
	((dst port 8742) || (dst port 27459) || (dst port 33750) || (dst port 57179) || (dst port 64075)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.12.197/32) || (dst net 122.0.66.113/32) || (dst net 122.0.125.221/32) || (dst net 122.0.222.237/32) || (dst net 122.0.253.151/32))),
	((dst port 4512) || (dst port 4567) || (dst port 18624) || (dst port 22420) || (dst port 23420)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.73.241/32) || (dst net 123.0.82.101/32) || (dst net 123.0.123.207/32) || (dst net 123.0.198.5/32) || (dst net 123.0.209.225/32))),
	((dst port 20966) || (dst port 32213) || (dst port 43080) || (dst port 44046) || (dst port 57066)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.71.23/32) || (dst net 124.0.122.8/32) || (dst net 124.0.140.102/32) || (dst net 124.0.187.132/32) || (dst net 124.0.191.216/32))),
	((dst port 21702) || (dst port 22101) || (dst port 30884) || (dst port 48855) || (dst port 61741)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.14.78/32) || (dst net 125.0.47.143/32) || (dst net 125.0.64.249/32) || (dst net 125.0.115.17/32) || (dst net 125.0.136.128/32))),
	((dst port 24962) || (dst port 27283) || (dst port 29738) || (dst port 41823) || (dst port 52243)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.10.91/32) || (dst net 126.0.15.93/32) || (dst net 126.0.112.218/32) || (dst net 126.0.220.139/32) || (dst net 126.0.227.75/32))),
	((dst port 3319) || (dst port 3842) || (dst port 9768) || (dst port 32267) || (dst port 34188)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.29.229/32) || (dst net 127.0.157.50/32) || (dst net 127.0.159.205/32) || (dst net 127.0.174.118/32) || (dst net 127.0.200.158/32))),
	((dst port 10083) || (dst port 25672) || (dst port 31901) || (dst port 45129) || (dst port 55147)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.181.148/32) || (dst net 128.0.194.45/32) || (dst net 128.0.202.234/32) || (dst net 128.0.226.198/32) || (dst net 128.0.255.124/32))),
	((dst port 7507) || (dst port 16943) || (dst port 19398) || (dst port 28466) || (dst port 51278)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.62.231/32) || (dst net 129.0.127.163/32) || (dst net 129.0.160.190/32) || (dst net 129.0.167.22/32) || (dst net 129.0.230.89/32))),
	((dst port 16113) || (dst port 40148) || (dst port 40720) || (dst port 49804) || (dst port 65022)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.4.218/32) || (dst net 130.0.18.230/32) || (dst net 130.0.81.118/32) || (dst net 130.0.161.136/32) || (dst net 130.0.189.183/32))),
	((dst port 11482) || (dst port 41615) || (dst port 44697) || (dst port 50120) || (dst port 53401)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.79.71/32) || (dst net 131.0.95.132/32) || (dst net 131.0.163.158/32) || (dst net 131.0.186.81/32) || (dst net 131.0.197.102/32))),
	((dst port 24630) || (dst port 33069) || (dst port 35019) || (dst port 41050) || (dst port 53131)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.20.147/32) || (dst net 132.0.62.214/32) || (dst net 132.0.80.82/32) || (dst net 132.0.185.173/32) || (dst net 132.0.202.250/32))),
	((dst port 23273) || (dst port 29147) || (dst port 35673) || (dst port 58538) || (dst port 65047)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.130.235/32) || (dst net 133.0.169.124/32) || (dst net 133.0.210.230/32) || (dst net 133.0.227.50/32) || (dst net 133.0.231.212/32))),
	((dst port 8999) || (dst port 10252) || (dst port 25658) || (dst port 48294) || (dst port 58633)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.26.124/32) || (dst net 134.0.63.115/32) || (dst net 134.0.170.98/32) || (dst net 134.0.170.135/32) || (dst net 134.0.213.23/32))),
	((dst port 10409) || (dst port 26138) || (dst port 28638) || (dst port 49151) || (dst port 50979)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.29.154/32) || (dst net 135.0.63.215/32) || (dst net 135.0.91.11/32) || (dst net 135.0.114.68/32) || (dst net 135.0.225.144/32))),
	((dst port 9556) || (dst port 19529) || (dst port 24530) || (dst port 51687) || (dst port 56339)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.30.32/32) || (dst net 136.0.42.120/32) || (dst net 136.0.117.97/32) || (dst net 136.0.203.97/32) || (dst net 136.0.237.126/32))),
	((dst port 4913) || (dst port 26793) || (dst port 30753) || (dst port 38774) || (dst port 42002)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.14.123/32) || (dst net 137.0.86.240/32) || (dst net 137.0.150.148/32) || (dst net 137.0.167.65/32) || (dst net 137.0.228.223/32))),
	((dst port 12341) || (dst port 22919) || (dst port 39170) || (dst port 55472) || (dst port 61123)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.20.21/32) || (dst net 138.0.66.212/32) || (dst net 138.0.94.6/32) || (dst net 138.0.149.254/32) || (dst net 138.0.231.31/32))),
	((dst port 4809) || (dst port 7484) || (dst port 29049) || (dst port 41638) || (dst port 57193)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.72.35/32) || (dst net 139.0.149.229/32) || (dst net 139.0.176.157/32) || (dst net 139.0.180.67/32) || (dst net 139.0.231.172/32))),
	((dst port 14936) || (dst port 16386) || (dst port 33187) || (dst port 41047) || (dst port 47337)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.54.230/32) || (dst net 140.0.77.72/32) || (dst net 140.0.109.19/32) || (dst net 140.0.168.93/32) || (dst net 140.0.207.130/32))),
	((dst port 1389) || (dst port 17481) || (dst port 18064) || (dst port 37400) || (dst port 40633)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.121.190/32) || (dst net 141.0.136.35/32) || (dst net 141.0.148.25/32) || (dst net 141.0.190.133/32) || (dst net 141.0.221.100/32))),
	((dst port 14281) || (dst port 33463) || (dst port 43040) || (dst port 43711) || (dst port 43982)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.85.127/32) || (dst net 142.0.88.59/32) || (dst net 142.0.126.187/32) || (dst net 142.0.251.218/32) || (dst net 142.0.253.59/32))),
	((dst port 8843) || (dst port 20236) || (dst port 28034) || (dst port 32455) || (dst port 36153)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.132.96/32) || (dst net 143.0.139.235/32) || (dst net 143.0.146.45/32) || (dst net 143.0.176.81/32) || (dst net 143.0.194.184/32))),
	((dst port 7146) || (dst port 25030) || (dst port 45635) || (dst port 63268) || (dst port 65162)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.89.132/32) || (dst net 144.0.160.122/32) || (dst net 144.0.180.102/32) || (dst net 144.0.201.202/32) || (dst net 144.0.227.152/32))),
	((dst port 25243) || (dst port 33913) || (dst port 38138) || (dst port 44483) || (dst port 64228)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.76.227/32) || (dst net 145.0.84.96/32) || (dst net 145.0.186.48/32) || (dst net 145.0.190.63/32) || (dst net 145.0.194.74/32))),
	((dst port 4275) || (dst port 15174) || (dst port 30317) || (dst port 33245) || (dst port 53228)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.35.39/32) || (dst net 146.0.63.27/32) || (dst net 146.0.156.95/32) || (dst net 146.0.181.58/32) || (dst net 146.0.209.178/32))),
	((dst port 35542) || (dst port 39464) || (dst port 44694) || (dst port 52640) || (dst port 54182)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.42.43/32) || (dst net 147.0.131.91/32) || (dst net 147.0.137.67/32) || (dst net 147.0.144.216/32) || (dst net 147.0.207.132/32))),
	((dst port 13060) || (dst port 13959) || (dst port 16818) || (dst port 51943) || (dst port 55224)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.87.70/32) || (dst net 148.0.137.54/32) || (dst net 148.0.140.27/32) || (dst net 148.0.224.151/32) || (dst net 148.0.252.52/32))),
	((dst port 4120) || (dst port 11382) || (dst port 32493) || (dst port 48030) || (dst port 57041)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.28.35/32) || (dst net 149.0.63.112/32) || (dst net 149.0.88.191/32) || (dst net 149.0.189.89/32) || (dst net 149.0.229.84/32))),
	((dst port 10358) || (dst port 17902) || (dst port 20597) || (dst port 29327) || (dst port 49851)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.40.65/32) || (dst net 150.0.103.56/32) || (dst net 150.0.119.80/32) || (dst net 150.0.186.192/32) || (dst net 150.0.232.89/32))),
	((dst port 20618) || (dst port 32556) || (dst port 41832) || (dst port 44533) || (dst port 63325)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.11.140/32) || (dst net 151.0.44.27/32) || (dst net 151.0.71.90/32) || (dst net 151.0.141.206/32) || (dst net 151.0.167.26/32))),
	((dst port 16821) || (dst port 29028) || (dst port 33254) || (dst port 43804) || (dst port 50418)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.4.116/32) || (dst net 152.0.58.104/32) || (dst net 152.0.66.254/32) || (dst net 152.0.149.126/32) || (dst net 152.0.180.15/32))),
	((dst port 39169) || (dst port 47489) || (dst port 53324) || (dst port 58691) || (dst port 60264)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.62.195/32) || (dst net 153.0.121.47/32) || (dst net 153.0.153.225/32) || (dst net 153.0.197.228/32) || (dst net 153.0.238.57/32))),
	((dst port 919) || (dst port 2601) || (dst port 4812) || (dst port 9623) || (dst port 45448)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.15.180/32) || (dst net 154.0.60.75/32) || (dst net 154.0.104.44/32) || (dst net 154.0.220.92/32) || (dst net 154.0.254.2/32))),
	((dst port 3535) || (dst port 17994) || (dst port 44317) || (dst port 47623) || (dst port 50697)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.30.52/32) || (dst net 155.0.136.22/32) || (dst net 155.0.168.241/32) || (dst net 155.0.201.205/32) || (dst net 155.0.221.66/32))),
	((dst port 1382) || (dst port 28036) || (dst port 29539) || (dst port 36058) || (dst port 54347)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.61.237/32) || (dst net 156.0.82.64/32) || (dst net 156.0.153.94/32) || (dst net 156.0.213.61/32) || (dst net 156.0.221.151/32))),
	((dst port 2158) || (dst port 17274) || (dst port 28134) || (dst port 62493) || (dst port 62771)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.17.210/32) || (dst net 157.0.53.140/32) || (dst net 157.0.104.103/32) || (dst net 157.0.132.23/32) || (dst net 157.0.190.163/32))),
	((dst port 38962) || (dst port 40673) || (dst port 44549) || (dst port 49010) || (dst port 49055)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.26.44/32) || (dst net 158.0.66.20/32) || (dst net 158.0.105.48/32) || (dst net 158.0.113.125/32) || (dst net 158.0.167.96/32))),
	((dst port 18392) || (dst port 22501) || (dst port 34655) || (dst port 49824) || (dst port 53482)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.7.18/32) || (dst net 159.0.59.44/32) || (dst net 159.0.123.88/32) || (dst net 159.0.204.90/32) || (dst net 159.0.226.29/32))),
	((dst port 6732) || (dst port 30956) || (dst port 34565) || (dst port 41303) || (dst port 52403)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.10.50/32) || (dst net 160.0.32.100/32) || (dst net 160.0.36.154/32) || (dst net 160.0.68.182/32) || (dst net 160.0.118.212/32))),
	((dst port 1250) || (dst port 37894) || (dst port 38588) || (dst port 57719) || (dst port 65196)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.36.211/32) || (dst net 161.0.63.245/32) || (dst net 161.0.93.129/32) || (dst net 161.0.160.129/32) || (dst net 161.0.209.44/32))),
	((dst port 980) || (dst port 7426) || (dst port 13453) || (dst port 37726) || (dst port 63058)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.79.16/32) || (dst net 162.0.98.224/32) || (dst net 162.0.112.47/32) || (dst net 162.0.147.52/32) || (dst net 162.0.233.151/32))),
	((dst port 19360) || (dst port 21179) || (dst port 31181) || (dst port 53174) || (dst port 54934)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.89.85/32) || (dst net 163.0.145.102/32) || (dst net 163.0.169.54/32) || (dst net 163.0.178.132/32) || (dst net 163.0.210.70/32))),
	((dst port 14915) || (dst port 17150) || (dst port 25421) || (dst port 35638) || (dst port 63716)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.12.128/32) || (dst net 164.0.54.134/32) || (dst net 164.0.214.7/32) || (dst net 164.0.224.227/32) || (dst net 164.0.237.214/32))),
	((dst port 10541) || (dst port 11500) || (dst port 22009) || (dst port 27241) || (dst port 47371)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.79.36/32) || (dst net 165.0.139.24/32) || (dst net 165.0.190.11/32) || (dst net 165.0.191.27/32) || (dst net 165.0.218.101/32))),
	((dst port 11767) || (dst port 16111) || (dst port 29847) || (dst port 52546) || (dst port 55880)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.23.12/32) || (dst net 166.0.60.69/32) || (dst net 166.0.191.154/32) || (dst net 166.0.193.212/32) || (dst net 166.0.233.172/32))),
	((dst port 7656) || (dst port 10880) || (dst port 24808) || (dst port 25973) || (dst port 29453)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.19.61/32) || (dst net 167.0.20.254/32) || (dst net 167.0.42.179/32) || (dst net 167.0.57.11/32) || (dst net 167.0.162.37/32))),
	((dst port 1107) || (dst port 5162) || (dst port 9013) || (dst port 31343) || (dst port 52860)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.36.4/32) || (dst net 168.0.162.243/32) || (dst net 168.0.177.35/32) || (dst net 168.0.186.144/32) || (dst net 168.0.199.149/32))),
	((dst port 7178) || (dst port 36772) || (dst port 53547) || (dst port 57803) || (dst port 64632)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.53.136/32) || (dst net 169.0.132.186/32) || (dst net 169.0.152.139/32) || (dst net 169.0.187.67/32) || (dst net 169.0.253.84/32))),
	((dst port 1477) || (dst port 18079) || (dst port 27668) || (dst port 48603) || (dst port 52111)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.11.94/32) || (dst net 170.0.41.6/32) || (dst net 170.0.79.61/32) || (dst net 170.0.101.130/32) || (dst net 170.0.106.0/32))),
	((dst port 6684) || (dst port 28240) || (dst port 36649) || (dst port 37572) || (dst port 45769)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.46.163/32) || (dst net 171.0.129.186/32) || (dst net 171.0.142.104/32) || (dst net 171.0.166.119/32) || (dst net 171.0.221.128/32))),
	((dst port 618) || (dst port 13815) || (dst port 32840) || (dst port 34320) || (dst port 35189)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.5.108/32) || (dst net 172.0.22.180/32) || (dst net 172.0.51.151/32) || (dst net 172.0.84.173/32) || (dst net 172.0.132.146/32))),
	((dst port 18931) || (dst port 26037) || (dst port 34973) || (dst port 37698) || (dst port 55042)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.34.188/32) || (dst net 173.0.73.42/32) || (dst net 173.0.77.152/32) || (dst net 173.0.231.82/32) || (dst net 173.0.245.212/32))),
	((dst port 21212) || (dst port 26242) || (dst port 27740) || (dst port 58271) || (dst port 65235)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.21.136/32) || (dst net 174.0.82.14/32) || (dst net 174.0.159.93/32) || (dst net 174.0.190.249/32) || (dst net 174.0.196.182/32))),
	((dst port 20804) || (dst port 22346) || (dst port 44394) || (dst port 57345) || (dst port 61231)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.31.97/32) || (dst net 175.0.35.47/32) || (dst net 175.0.147.100/32) || (dst net 175.0.219.23/32) || (dst net 175.0.229.121/32))),
	((dst port 29182) || (dst port 38649) || (dst port 40037) || (dst port 43364) || (dst port 50689)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.48.168/32) || (dst net 176.0.54.28/32) || (dst net 176.0.78.103/32) || (dst net 176.0.96.12/32) || (dst net 176.0.139.182/32))),
	((dst port 18654) || (dst port 30993) || (dst port 44565) || (dst port 50764) || (dst port 57640)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.44.3/32) || (dst net 177.0.74.225/32) || (dst net 177.0.83.17/32) || (dst net 177.0.110.190/32) || (dst net 177.0.221.127/32))),
	((dst port 4142) || (dst port 27850) || (dst port 30867) || (dst port 40177) || (dst port 57389)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.27.210/32) || (dst net 178.0.30.89/32) || (dst net 178.0.97.216/32) || (dst net 178.0.127.220/32) || (dst net 178.0.130.255/32))),
	((dst port 4569) || (dst port 16420) || (dst port 26824) || (dst port 49586) || (dst port 59122)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.0.248/32) || (dst net 179.0.105.180/32) || (dst net 179.0.108.31/32) || (dst net 179.0.131.61/32) || (dst net 179.0.208.140/32))),
	((dst port 20935) || (dst port 48906) || (dst port 54687) || (dst port 55531) || (dst port 63644)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.22.196/32) || (dst net 180.0.23.128/32) || (dst net 180.0.33.127/32) || (dst net 180.0.168.5/32) || (dst net 180.0.254.253/32))),
	((dst port 3300) || (dst port 3495) || (dst port 18737) || (dst port 19622) || (dst port 64462)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.9.39/32) || (dst net 181.0.72.31/32) || (dst net 181.0.98.5/32) || (dst net 181.0.114.153/32) || (dst net 181.0.226.215/32))),
	((dst port 621) || (dst port 16274) || (dst port 17189) || (dst port 28337) || (dst port 29945)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.22.226/32) || (dst net 182.0.65.182/32) || (dst net 182.0.78.210/32) || (dst net 182.0.121.25/32) || (dst net 182.0.195.243/32))),
	((dst port 13125) || (dst port 13622) || (dst port 17665) || (dst port 35863) || (dst port 61234)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.91.123/32) || (dst net 183.0.141.23/32) || (dst net 183.0.147.123/32) || (dst net 183.0.169.60/32) || (dst net 183.0.236.160/32))),
	((dst port 30410) || (dst port 37339) || (dst port 46562) || (dst port 59719) || (dst port 64099)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.2.154/32) || (dst net 184.0.84.179/32) || (dst net 184.0.181.122/32) || (dst net 184.0.210.4/32) || (dst net 184.0.213.19/32))),
	((dst port 18649) || (dst port 32313) || (dst port 40114) || (dst port 54956) || (dst port 56642)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.34.230/32) || (dst net 185.0.59.118/32) || (dst net 185.0.67.254/32) || (dst net 185.0.74.164/32) || (dst net 185.0.171.156/32))),
	((dst port 34380) || (dst port 46496) || (dst port 49280) || (dst port 60097) || (dst port 63843)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.1.227/32) || (dst net 186.0.24.23/32) || (dst net 186.0.76.76/32) || (dst net 186.0.155.40/32) || (dst net 186.0.252.253/32))),
	((dst port 985) || (dst port 15216) || (dst port 15473) || (dst port 50430) || (dst port 56242)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.56.40/32) || (dst net 187.0.133.209/32) || (dst net 187.0.162.219/32) || (dst net 187.0.180.220/32) || (dst net 187.0.210.208/32))),
	((dst port 5005) || (dst port 10216) || (dst port 37587) || (dst port 59435) || (dst port 62305)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.7.5/32) || (dst net 188.0.45.60/32) || (dst net 188.0.115.50/32) || (dst net 188.0.167.198/32) || (dst net 188.0.179.64/32))),
	((dst port 18457) || (dst port 24449) || (dst port 26846) || (dst port 31980) || (dst port 58809)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.60.75/32) || (dst net 189.0.93.210/32) || (dst net 189.0.94.204/32) || (dst net 189.0.139.73/32) || (dst net 189.0.237.110/32))),
	((dst port 4351) || (dst port 7738) || (dst port 18167) || (dst port 39541) || (dst port 62003)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.95.67/32) || (dst net 190.0.130.234/32) || (dst net 190.0.154.114/32) || (dst net 190.0.178.209/32) || (dst net 190.0.179.1/32))),
	((dst port 8996) || (dst port 10972) || (dst port 12193) || (dst port 53698) || (dst port 56811)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.3.250/32) || (dst net 191.0.106.166/32) || (dst net 191.0.169.218/32) || (dst net 191.0.187.235/32) || (dst net 191.0.253.151/32))),
	((dst port 36552) || (dst port 45264) || (dst port 46776) || (dst port 50707) || (dst port 61046)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.0.17/32) || (dst net 192.0.40.80/32) || (dst net 192.0.132.199/32) || (dst net 192.0.204.208/32) || (dst net 192.0.235.163/32))),
	((dst port 9875) || (dst port 41089) || (dst port 41956) || (dst port 46960) || (dst port 50007)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.40.232/32) || (dst net 193.0.70.129/32) || (dst net 193.0.134.199/32) || (dst net 193.0.159.118/32) || (dst net 193.0.208.110/32))),
	((dst port 2179) || (dst port 14462) || (dst port 39862) || (dst port 42788) || (dst port 62910)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.42.254/32) || (dst net 194.0.119.126/32) || (dst net 194.0.137.134/32) || (dst net 194.0.172.236/32) || (dst net 194.0.187.132/32))),
	((dst port 21430) || (dst port 30726) || (dst port 43975) || (dst port 46469) || (dst port 63523)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.47.65/32) || (dst net 195.0.52.225/32) || (dst net 195.0.98.165/32) || (dst net 195.0.167.197/32) || (dst net 195.0.205.211/32))),
	((dst port 4374) || (dst port 4414) || (dst port 18165) || (dst port 24369) || (dst port 57942)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.8.22/32) || (dst net 196.0.50.199/32) || (dst net 196.0.167.130/32) || (dst net 196.0.170.102/32) || (dst net 196.0.221.118/32))),
	((dst port 13630) || (dst port 41217) || (dst port 42553) || (dst port 60966) || (dst port 62063)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.42.212/32) || (dst net 197.0.92.172/32) || (dst net 197.0.195.94/32) || (dst net 197.0.236.47/32) || (dst net 197.0.245.61/32))),
	((dst port 4121) || (dst port 24039) || (dst port 43456) || (dst port 47513) || (dst port 47557)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.81.150/32) || (dst net 198.0.88.250/32) || (dst net 198.0.92.88/32) || (dst net 198.0.127.58/32) || (dst net 198.0.138.146/32))),
	((dst port 964) || (dst port 4463) || (dst port 24274) || (dst port 26047) || (dst port 38602)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.20.48/32) || (dst net 199.0.63.234/32) || (dst net 199.0.119.72/32) || (dst net 199.0.128.156/32) || (dst net 199.0.233.225/32))),
	((dst port 3803) || (dst port 21119) || (dst port 29285) || (dst port 59015) || (dst port 65533)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.52.56/32) || (dst net 200.0.64.138/32) || (dst net 200.0.104.98/32) || (dst net 200.0.214.105/32) || (dst net 200.0.237.252/32))),
	((dst port 17421) || (dst port 34095) || (dst port 36631) || (dst port 39683) || (dst port 50978)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.149.198/32) || (dst net 201.0.187.54/32) || (dst net 201.0.212.152/32) || (dst net 201.0.220.134/32) || (dst net 201.0.221.156/32))),
	((dst port 1912) || (dst port 4811) || (dst port 37707) || (dst port 50129) || (dst port 64340)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.16.231/32) || (dst net 202.0.130.93/32) || (dst net 202.0.163.203/32) || (dst net 202.0.181.46/32) || (dst net 202.0.229.225/32))),
	((dst port 15502) || (dst port 24666) || (dst port 41951) || (dst port 44222) || (dst port 45637)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.122.127/32) || (dst net 203.0.163.202/32) || (dst net 203.0.189.213/32) || (dst net 203.0.249.71/32) || (dst net 203.0.255.198/32))),
	((dst port 17077) || (dst port 22873) || (dst port 25039) || (dst port 27768) || (dst port 56348)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.47.229/32) || (dst net 204.0.92.221/32) || (dst net 204.0.190.170/32) || (dst net 204.0.195.31/32) || (dst net 204.0.219.10/32))),
	((dst port 15934) || (dst port 31589) || (dst port 49085) || (dst port 57417) || (dst port 62251)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.67.12/32) || (dst net 205.0.105.165/32) || (dst net 205.0.179.228/32) || (dst net 205.0.192.45/32) || (dst net 205.0.232.54/32))),
	((dst port 2102) || (dst port 13522) || (dst port 22733) || (dst port 23316) || (dst port 65371)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.21.13/32) || (dst net 206.0.65.0/32) || (dst net 206.0.73.141/32) || (dst net 206.0.165.155/32) || (dst net 206.0.192.57/32))),
	((dst port 6468) || (dst port 10664) || (dst port 41303) || (dst port 51477) || (dst port 56654)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.55.85/32) || (dst net 207.0.101.243/32) || (dst net 207.0.152.23/32) || (dst net 207.0.188.188/32) || (dst net 207.0.208.12/32))),
	((dst port 964) || (dst port 26175) || (dst port 35858) || (dst port 49250) || (dst port 56515)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.5.13/32) || (dst net 208.0.53.41/32) || (dst net 208.0.105.204/32) || (dst net 208.0.158.99/32) || (dst net 208.0.212.193/32))),
	((dst port 989) || (dst port 26351) || (dst port 46239) || (dst port 57172) || (dst port 57661)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.39.163/32) || (dst net 209.0.69.221/32) || (dst net 209.0.71.199/32) || (dst net 209.0.141.37/32) || (dst net 209.0.183.2/32))),
	((dst port 868) || (dst port 15569) || (dst port 43889) || (dst port 52989) || (dst port 62753)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.31.201/32) || (dst net 210.0.101.38/32) || (dst net 210.0.221.92/32) || (dst net 210.0.238.43/32) || (dst net 210.0.245.146/32))),
	((dst port 18435) || (dst port 21851) || (dst port 27125) || (dst port 41454) || (dst port 44942)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.135.148/32) || (dst net 211.0.178.45/32) || (dst net 211.0.193.177/32) || (dst net 211.0.238.212/32) || (dst net 211.0.245.231/32))),
	((dst port 1816) || (dst port 11905) || (dst port 13164) || (dst port 49695) || (dst port 53712)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.76.208/32) || (dst net 212.0.101.225/32) || (dst net 212.0.111.101/32) || (dst net 212.0.229.167/32) || (dst net 212.0.238.197/32))),
	((dst port 32075) || (dst port 37626) || (dst port 45200) || (dst port 48137) || (dst port 55721)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.69.202/32) || (dst net 213.0.80.39/32) || (dst net 213.0.148.138/32) || (dst net 213.0.153.183/32) || (dst net 213.0.188.149/32))),
	((dst port 13131) || (dst port 15981) || (dst port 21488) || (dst port 34109) || (dst port 61467)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.58.124/32) || (dst net 214.0.119.2/32) || (dst net 214.0.178.171/32) || (dst net 214.0.199.68/32) || (dst net 214.0.240.196/32))),
	((dst port 20417) || (dst port 32542) || (dst port 58802) || (dst port 63982) || (dst port 64075)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.21.24/32) || (dst net 215.0.148.72/32) || (dst net 215.0.191.229/32) || (dst net 215.0.231.43/32) || (dst net 215.0.247.5/32))),
	((dst port 541) || (dst port 25428) || (dst port 25529) || (dst port 63468) || (dst port 64857)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.2.109/32) || (dst net 216.0.21.153/32) || (dst net 216.0.208.84/32) || (dst net 216.0.212.145/32) || (dst net 216.0.251.41/32))),
	((dst port 697) || (dst port 15397) || (dst port 26847) || (dst port 41164) || (dst port 52436)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.17.21/32) || (dst net 217.0.71.161/32) || (dst net 217.0.128.77/32) || (dst net 217.0.142.16/32) || (dst net 217.0.149.164/32))),
	((dst port 7922) || (dst port 24261) || (dst port 27798) || (dst port 52909) || (dst port 56004)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.13.254/32) || (dst net 218.0.48.148/32) || (dst net 218.0.123.7/32) || (dst net 218.0.210.97/32) || (dst net 218.0.226.223/32))),
	((dst port 2424) || (dst port 4340) || (dst port 16073) || (dst port 52728) || (dst port 64298)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.92.164/32) || (dst net 219.0.131.17/32) || (dst net 219.0.165.93/32) || (dst net 219.0.195.38/32) || (dst net 219.0.207.120/32))),
	((dst port 2462) || (dst port 26071) || (dst port 42471) || (dst port 45669) || (dst port 58718)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.22.27/32) || (dst net 220.0.114.181/32) || (dst net 220.0.143.49/32) || (dst net 220.0.203.97/32) || (dst net 220.0.252.155/32))),
	((dst port 11105) || (dst port 19483) || (dst port 24187) || (dst port 36687) || (dst port 47866)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.0.220/32) || (dst net 221.0.72.84/32) || (dst net 221.0.104.213/32) || (dst net 221.0.137.69/32) || (dst net 221.0.253.73/32))),
	((dst port 15370) || (dst port 36282) || (dst port 41432) || (dst port 45473) || (dst port 53222)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.36.116/32) || (dst net 222.0.46.198/32) || (dst net 222.0.91.150/32) || (dst net 222.0.198.228/32) || (dst net 222.0.227.126/32))),
	((dst port 20579) || (dst port 22220) || (dst port 24433) || (dst port 55400) || (dst port 58820)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.91.110/32) || (dst net 223.0.92.201/32) || (dst net 223.0.116.122/32) || (dst net 223.0.150.88/32) || (dst net 223.0.159.179/32))),
	((dst port 41454) || (dst port 44479) || (dst port 44897) || (dst port 50857) || (dst port 53288)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.143.103/32) || (dst net 224.0.160.201/32) || (dst net 224.0.160.248/32) || (dst net 224.0.183.241/32) || (dst net 224.0.210.50/32))),
	((dst port 531) || (dst port 12646) || (dst port 13269) || (dst port 25919) || (dst port 64555)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.36.154/32) || (dst net 225.0.106.17/32) || (dst net 225.0.110.3/32) || (dst net 225.0.149.68/32) || (dst net 225.0.248.227/32))),
	((dst port 8951) || (dst port 24867) || (dst port 30105) || (dst port 37798) || (dst port 62271)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.19.133/32) || (dst net 226.0.84.238/32) || (dst net 226.0.128.90/32) || (dst net 226.0.164.50/32) || (dst net 226.0.200.54/32))),
	((dst port 10172) || (dst port 12672) || (dst port 23116) || (dst port 46974) || (dst port 56788)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.12.197/32) || (dst net 227.0.14.17/32) || (dst net 227.0.49.234/32) || (dst net 227.0.89.199/32) || (dst net 227.0.136.68/32))),
	((dst port 11953) || (dst port 22434) || (dst port 25870) || (dst port 26232) || (dst port 34082)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.71.157/32) || (dst net 228.0.78.152/32) || (dst net 228.0.147.89/32) || (dst net 228.0.227.236/32) || (dst net 228.0.235.31/32))),
	((dst port 571) || (dst port 2464) || (dst port 20503) || (dst port 29393) || (dst port 53796)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.66.87/32) || (dst net 229.0.74.16/32) || (dst net 229.0.78.144/32) || (dst net 229.0.167.103/32) || (dst net 229.0.228.75/32))),
	((dst port 3521) || (dst port 12524) || (dst port 13671) || (dst port 52719) || (dst port 63727)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.117.123/32) || (dst net 230.0.126.170/32) || (dst net 230.0.179.248/32) || (dst net 230.0.180.235/32) || (dst net 230.0.215.189/32))),
	((dst port 2714) || (dst port 7009) || (dst port 33738) || (dst port 48437) || (dst port 59485)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.42.110/32) || (dst net 231.0.115.113/32) || (dst net 231.0.153.241/32) || (dst net 231.0.199.40/32) || (dst net 231.0.212.239/32))),
	((dst port 775) || (dst port 11356) || (dst port 14882) || (dst port 34108) || (dst port 36655)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.83.68/32) || (dst net 232.0.89.75/32) || (dst net 232.0.156.134/32) || (dst net 232.0.171.52/32) || (dst net 232.0.239.65/32))),
	((dst port 4631) || (dst port 14306) || (dst port 44244) || (dst port 57223) || (dst port 58347)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.140.34/32) || (dst net 233.0.155.151/32) || (dst net 233.0.194.53/32) || (dst net 233.0.209.129/32) || (dst net 233.0.231.98/32))),
	((dst port 7526) || (dst port 10981) || (dst port 17556) || (dst port 25208) || (dst port 39345)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.3.222/32) || (dst net 234.0.14.104/32) || (dst net 234.0.71.139/32) || (dst net 234.0.151.171/32) || (dst net 234.0.232.30/32))),
	((dst port 5450) || (dst port 12672) || (dst port 16827) || (dst port 48404) || (dst port 60890)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.9.155/32) || (dst net 235.0.122.111/32) || (dst net 235.0.188.120/32) || (dst net 235.0.213.169/32) || (dst net 235.0.231.149/32))),
	((dst port 6062) || (dst port 19049) || (dst port 36714) || (dst port 54064) || (dst port 64671)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.13.232/32) || (dst net 236.0.73.93/32) || (dst net 236.0.95.140/32) || (dst net 236.0.152.215/32) || (dst net 236.0.176.86/32))),
	((dst port 2535) || (dst port 18175) || (dst port 31255) || (dst port 60231) || (dst port 62393)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.151.162/32) || (dst net 237.0.189.7/32) || (dst net 237.0.197.166/32) || (dst net 237.0.204.223/32) || (dst net 237.0.210.198/32))),
	((dst port 20543) || (dst port 26600) || (dst port 45351) || (dst port 45376) || (dst port 47827)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.6.135/32) || (dst net 238.0.104.204/32) || (dst net 238.0.133.160/32) || (dst net 238.0.143.84/32) || (dst net 238.0.202.47/32))),
	((dst port 260) || (dst port 9230) || (dst port 18968) || (dst port 28174) || (dst port 50321)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.3.5/32) || (dst net 239.0.79.228/32) || (dst net 239.0.124.83/32) || (dst net 239.0.217.137/32) || (dst net 239.0.255.81/32))),
	((dst port 4328) || (dst port 9712) || (dst port 45994) || (dst port 49995) || (dst port 59250)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.28.74/32) || (dst net 240.0.74.158/32) || (dst net 240.0.133.134/32) || (dst net 240.0.208.229/32) || (dst net 240.0.228.47/32))),
	((dst port 2862) || (dst port 18430) || (dst port 18721) || (dst port 22481) || (dst port 29133)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.53.190/32) || (dst net 241.0.58.235/32) || (dst net 241.0.105.75/32) || (dst net 241.0.136.103/32) || (dst net 241.0.235.21/32))),
	((dst port 1593) || (dst port 5390) || (dst port 16664) || (dst port 33110) || (dst port 47112)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.24.213/32) || (dst net 242.0.52.209/32) || (dst net 242.0.110.22/32) || (dst net 242.0.151.65/32) || (dst net 242.0.170.245/32))),
	((dst port 16473) || (dst port 19276) || (dst port 31713) || (dst port 37840) || (dst port 46408)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.38.181/32) || (dst net 243.0.68.226/32) || (dst net 243.0.102.143/32) || (dst net 243.0.113.237/32) || (dst net 243.0.229.208/32))),
	((dst port 5749) || (dst port 20584) || (dst port 32111) || (dst port 47105) || (dst port 62906)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.25.224/32) || (dst net 244.0.56.34/32) || (dst net 244.0.57.180/32) || (dst net 244.0.214.136/32) || (dst net 244.0.226.46/32))),
	((dst port 29319) || (dst port 30684) || (dst port 37725) || (dst port 49775) || (dst port 57452)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.34.242/32) || (dst net 245.0.68.209/32) || (dst net 245.0.188.254/32) || (dst net 245.0.193.254/32) || (dst net 245.0.234.185/32))),
	((dst port 16575) || (dst port 30426) || (dst port 43262) || (dst port 49587) || (dst port 53907)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.7.16/32) || (dst net 246.0.121.78/32) || (dst net 246.0.186.132/32) || (dst net 246.0.198.64/32) || (dst net 246.0.239.74/32))),
	((dst port 21402) || (dst port 32648) || (dst port 33187) || (dst port 52393) || (dst port 59007)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.74.209/32) || (dst net 247.0.151.77/32) || (dst net 247.0.202.98/32) || (dst net 247.0.204.105/32) || (dst net 247.0.246.54/32))),
	((dst port 5990) || (dst port 9187) || (dst port 12736) || (dst port 18945) || (dst port 29860)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.37.62/32) || (dst net 248.0.49.189/32) || (dst net 248.0.59.26/32) || (dst net 248.0.126.44/32) || (dst net 248.0.136.144/32))),
	((dst port 24546) || (dst port 33334) || (dst port 35782) || (dst port 36185) || (dst port 54148)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.43.137/32) || (dst net 249.0.69.183/32) || (dst net 249.0.129.215/32) || (dst net 249.0.150.187/32) || (dst net 249.0.244.132/32))),
	((dst port 7010) || (dst port 12232) || (dst port 12277) || (dst port 34580) || (dst port 53376)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.18.185/32) || (dst net 250.0.22.221/32) || (dst net 250.0.44.228/32) || (dst net 250.0.47.34/32) || (dst net 250.0.130.10/32))),
	((dst port 1813) || (dst port 20977) || (dst port 40832) || (dst port 42585) || (dst port 55025)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.30.250/32) || (dst net 251.0.75.53/32) || (dst net 251.0.124.12/32) || (dst net 251.0.201.147/32) || (dst net 251.0.232.169/32))),
	((dst port 18950) || (dst port 23135) || (dst port 51177) || (dst port 56132) || (dst port 61824)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.1.183/32) || (dst net 252.0.27.114/32) || (dst net 252.0.49.40/32) || (dst net 252.0.81.165/32) || (dst net 252.0.150.96/32))),
	((dst port 13937) || (dst port 17253) || (dst port 26023) || (dst port 34528) || (dst port 52086)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.24.17/32) || (dst net 253.0.228.225/32) || (dst net 253.0.248.42/32) || (dst net 253.0.251.104/32) || (dst net 253.0.253.55/32))),
	((dst port 796) || (dst port 2366) || (dst port 35835) || (dst port 58951) || (dst port 59995)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.70.3/32) || (dst net 254.0.126.252/32) || (dst net 254.0.150.231/32) || (dst net 254.0.170.20/32) || (dst net 254.0.230.135/32))),
	((dst port 2533) || (dst port 49078) || (dst port 51558) || (dst port 58382) || (dst port 65171)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.8.212/32) || (dst net 255.0.18.149/32) || (dst net 255.0.80.222/32) || (dst net 255.0.98.39/32) || (dst net 255.0.180.137/32))),
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
