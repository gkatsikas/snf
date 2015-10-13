ipclassifier :: IPClassifier(
	((dst port 15395) || (dst port 27922) || (dst port 41062) || (dst port 62815) || (dst port 65428)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.95.214/32) || (dst net 0.0.140.73/32) || (dst net 0.0.171.207/32) || (dst net 0.0.236.140/32) || (dst net 0.0.247.119/32))),
	((dst port 10684) || (dst port 12297) || (dst port 35760) || (dst port 35845) || (dst port 59681)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.76.157/32) || (dst net 1.0.159.34/32) || (dst net 1.0.166.145/32) || (dst net 1.0.194.224/32) || (dst net 1.0.229.186/32))),
	((dst port 8990) || (dst port 13777) || (dst port 40389) || (dst port 46231) || (dst port 47831)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.66.175/32) || (dst net 2.0.121.74/32) || (dst net 2.0.157.86/32) || (dst net 2.0.229.123/32) || (dst net 2.0.252.2/32))),
	((dst port 12607) || (dst port 16469) || (dst port 31235) || (dst port 39857) || (dst port 49212)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.3.191/32) || (dst net 3.0.12.84/32) || (dst net 3.0.106.159/32) || (dst net 3.0.217.14/32) || (dst net 3.0.231.34/32))),
	((dst port 14072) || (dst port 16538) || (dst port 19370) || (dst port 43401) || (dst port 49447)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.50.197/32) || (dst net 4.0.53.141/32) || (dst net 4.0.66.81/32) || (dst net 4.0.176.57/32) || (dst net 4.0.225.194/32))),
	((dst port 11150) || (dst port 26262) || (dst port 45826) || (dst port 60007) || (dst port 63266)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.112.4/32) || (dst net 5.0.146.253/32) || (dst net 5.0.155.94/32) || (dst net 5.0.219.195/32) || (dst net 5.0.246.68/32))),
	((dst port 8159) || (dst port 8973) || (dst port 30655) || (dst port 40545) || (dst port 57033)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.7.12/32) || (dst net 6.0.109.174/32) || (dst net 6.0.156.185/32) || (dst net 6.0.160.227/32) || (dst net 6.0.220.89/32))),
	((dst port 640) || (dst port 15383) || (dst port 29246) || (dst port 44227) || (dst port 61550)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.24.70/32) || (dst net 7.0.41.161/32) || (dst net 7.0.176.180/32) || (dst net 7.0.188.255/32) || (dst net 7.0.199.90/32))),
	((dst port 9418) || (dst port 13719) || (dst port 14927) || (dst port 15727) || (dst port 18846)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.51.166/32) || (dst net 8.0.102.72/32) || (dst net 8.0.148.148/32) || (dst net 8.0.210.248/32) || (dst net 8.0.222.24/32))),
	((dst port 149) || (dst port 14607) || (dst port 25970) || (dst port 50985) || (dst port 63380)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.1.10/32) || (dst net 9.0.63.252/32) || (dst net 9.0.66.105/32) || (dst net 9.0.181.107/32) || (dst net 9.0.220.144/32))),
	((dst port 20879) || (dst port 36950) || (dst port 52049) || (dst port 62546) || (dst port 62891)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.13.15/32) || (dst net 10.0.101.73/32) || (dst net 10.0.114.133/32) || (dst net 10.0.115.162/32) || (dst net 10.0.117.192/32))),
	((dst port 11017) || (dst port 13141) || (dst port 31299) || (dst port 51355) || (dst port 53700)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.48.106/32) || (dst net 11.0.100.217/32) || (dst net 11.0.108.79/32) || (dst net 11.0.129.66/32) || (dst net 11.0.238.158/32))),
	((dst port 30844) || (dst port 35151) || (dst port 47782) || (dst port 54835) || (dst port 60179)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.70.172/32) || (dst net 12.0.155.191/32) || (dst net 12.0.219.143/32) || (dst net 12.0.231.240/32) || (dst net 12.0.235.58/32))),
	((dst port 20046) || (dst port 32426) || (dst port 39200) || (dst port 48316) || (dst port 59157)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.13.93/32) || (dst net 13.0.103.222/32) || (dst net 13.0.121.77/32) || (dst net 13.0.143.11/32) || (dst net 13.0.235.200/32))),
	((dst port 14740) || (dst port 24213) || (dst port 37893) || (dst port 38868) || (dst port 50588)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.129.178/32) || (dst net 14.0.196.72/32) || (dst net 14.0.202.15/32) || (dst net 14.0.208.98/32) || (dst net 14.0.242.44/32))),
	((dst port 20822) || (dst port 24635) || (dst port 37299) || (dst port 56176) || (dst port 60743)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.30.136/32) || (dst net 15.0.65.230/32) || (dst net 15.0.76.182/32) || (dst net 15.0.82.198/32) || (dst net 15.0.131.131/32))),
	((dst port 1017) || (dst port 41760) || (dst port 51347) || (dst port 55574) || (dst port 64744)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.10.144/32) || (dst net 16.0.37.107/32) || (dst net 16.0.112.16/32) || (dst net 16.0.139.84/32) || (dst net 16.0.171.205/32))),
	((dst port 2429) || (dst port 7107) || (dst port 8707) || (dst port 39903) || (dst port 49076)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.18.8/32) || (dst net 17.0.86.16/32) || (dst net 17.0.160.8/32) || (dst net 17.0.202.99/32) || (dst net 17.0.241.253/32))),
	((dst port 1247) || (dst port 22795) || (dst port 37961) || (dst port 57144) || (dst port 61805)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.77.73/32) || (dst net 18.0.144.14/32) || (dst net 18.0.216.238/32) || (dst net 18.0.248.25/32) || (dst net 18.0.248.39/32))),
	((dst port 14737) || (dst port 22354) || (dst port 49270) || (dst port 50427) || (dst port 63489)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.52.142/32) || (dst net 19.0.75.152/32) || (dst net 19.0.84.74/32) || (dst net 19.0.175.138/32) || (dst net 19.0.241.72/32))),
	((dst port 950) || (dst port 21893) || (dst port 23114) || (dst port 29216) || (dst port 47507)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.13.93/32) || (dst net 20.0.29.153/32) || (dst net 20.0.32.36/32) || (dst net 20.0.92.161/32) || (dst net 20.0.218.254/32))),
	((dst port 5130) || (dst port 44440) || (dst port 44795) || (dst port 46655) || (dst port 49024)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.31.28/32) || (dst net 21.0.98.2/32) || (dst net 21.0.113.136/32) || (dst net 21.0.124.31/32) || (dst net 21.0.197.191/32))),
	((dst port 32731) || (dst port 39734) || (dst port 48371) || (dst port 50906) || (dst port 54552)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.73.132/32) || (dst net 22.0.103.188/32) || (dst net 22.0.103.211/32) || (dst net 22.0.112.193/32) || (dst net 22.0.184.166/32))),
	((dst port 10975) || (dst port 21774) || (dst port 40602) || (dst port 41273) || (dst port 60434)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.40.25/32) || (dst net 23.0.128.149/32) || (dst net 23.0.144.243/32) || (dst net 23.0.175.69/32) || (dst net 23.0.179.109/32))),
	((dst port 11531) || (dst port 15805) || (dst port 19250) || (dst port 22411) || (dst port 42391)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.77.220/32) || (dst net 24.0.87.124/32) || (dst net 24.0.128.36/32) || (dst net 24.0.155.33/32) || (dst net 24.0.180.207/32))),
	((dst port 9374) || (dst port 41966) || (dst port 49459) || (dst port 64775) || (dst port 64920)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.8.94/32) || (dst net 25.0.55.151/32) || (dst net 25.0.95.50/32) || (dst net 25.0.171.201/32) || (dst net 25.0.187.44/32))),
	((dst port 33400) || (dst port 33619) || (dst port 35164) || (dst port 44315) || (dst port 61252)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.1.143/32) || (dst net 26.0.109.38/32) || (dst net 26.0.148.190/32) || (dst net 26.0.227.73/32) || (dst net 26.0.250.251/32))),
	((dst port 3797) || (dst port 42484) || (dst port 55298) || (dst port 55796) || (dst port 65509)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.10.226/32) || (dst net 27.0.46.167/32) || (dst net 27.0.118.91/32) || (dst net 27.0.168.211/32) || (dst net 27.0.180.10/32))),
	((dst port 10886) || (dst port 38994) || (dst port 41878) || (dst port 44916) || (dst port 58025)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.39.214/32) || (dst net 28.0.79.122/32) || (dst net 28.0.93.189/32) || (dst net 28.0.173.25/32) || (dst net 28.0.201.189/32))),
	((dst port 16072) || (dst port 18107) || (dst port 41124) || (dst port 43759) || (dst port 54039)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.32.198/32) || (dst net 29.0.106.94/32) || (dst net 29.0.112.91/32) || (dst net 29.0.114.44/32) || (dst net 29.0.167.168/32))),
	((dst port 6039) || (dst port 46320) || (dst port 49522) || (dst port 61345) || (dst port 61817)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.34.216/32) || (dst net 30.0.53.79/32) || (dst net 30.0.165.53/32) || (dst net 30.0.195.168/32) || (dst net 30.0.247.52/32))),
	((dst port 6202) || (dst port 19237) || (dst port 33476) || (dst port 36850) || (dst port 58584)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.84.67/32) || (dst net 31.0.131.225/32) || (dst net 31.0.136.101/32) || (dst net 31.0.224.119/32) || (dst net 31.0.225.207/32))),
	((dst port 21130) || (dst port 50132) || (dst port 58408) || (dst port 60380) || (dst port 64473)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.1.206/32) || (dst net 32.0.42.115/32) || (dst net 32.0.119.88/32) || (dst net 32.0.129.145/32) || (dst net 32.0.236.70/32))),
	((dst port 345) || (dst port 31128) || (dst port 34729) || (dst port 51456) || (dst port 58142)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.72.156/32) || (dst net 33.0.75.182/32) || (dst net 33.0.85.209/32) || (dst net 33.0.125.155/32) || (dst net 33.0.237.70/32))),
	((dst port 1143) || (dst port 17782) || (dst port 18714) || (dst port 19003) || (dst port 25183)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.44.106/32) || (dst net 34.0.75.76/32) || (dst net 34.0.107.138/32) || (dst net 34.0.139.11/32) || (dst net 34.0.211.90/32))),
	((dst port 1591) || (dst port 10281) || (dst port 16202) || (dst port 36946) || (dst port 63412)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.19.215/32) || (dst net 35.0.48.108/32) || (dst net 35.0.66.98/32) || (dst net 35.0.144.47/32) || (dst net 35.0.228.191/32))),
	((dst port 16067) || (dst port 24226) || (dst port 29079) || (dst port 30874) || (dst port 49715)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.41.80/32) || (dst net 36.0.89.82/32) || (dst net 36.0.177.147/32) || (dst net 36.0.250.165/32) || (dst net 36.0.251.207/32))),
	((dst port 3168) || (dst port 10492) || (dst port 35684) || (dst port 49115) || (dst port 61284)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.11.42/32) || (dst net 37.0.23.27/32) || (dst net 37.0.76.181/32) || (dst net 37.0.81.135/32) || (dst net 37.0.193.65/32))),
	((dst port 3953) || (dst port 11967) || (dst port 13816) || (dst port 51123) || (dst port 52467)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.13.70/32) || (dst net 38.0.16.64/32) || (dst net 38.0.144.66/32) || (dst net 38.0.159.127/32) || (dst net 38.0.185.118/32))),
	((dst port 12377) || (dst port 15635) || (dst port 19913) || (dst port 38689) || (dst port 45960)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.50.26/32) || (dst net 39.0.66.99/32) || (dst net 39.0.96.18/32) || (dst net 39.0.113.186/32) || (dst net 39.0.131.0/32))),
	((dst port 889) || (dst port 7138) || (dst port 7378) || (dst port 10602) || (dst port 46495)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.27.45/32) || (dst net 40.0.145.111/32) || (dst net 40.0.155.71/32) || (dst net 40.0.185.28/32) || (dst net 40.0.255.41/32))),
	((dst port 2032) || (dst port 8861) || (dst port 15183) || (dst port 22702) || (dst port 38356)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.65.227/32) || (dst net 41.0.125.146/32) || (dst net 41.0.170.41/32) || (dst net 41.0.195.81/32) || (dst net 41.0.215.51/32))),
	((dst port 5251) || (dst port 19342) || (dst port 28737) || (dst port 36167) || (dst port 44217)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.37.29/32) || (dst net 42.0.120.82/32) || (dst net 42.0.121.83/32) || (dst net 42.0.154.223/32) || (dst net 42.0.203.5/32))),
	((dst port 621) || (dst port 7172) || (dst port 29542) || (dst port 47603) || (dst port 49796)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.11.238/32) || (dst net 43.0.61.54/32) || (dst net 43.0.149.135/32) || (dst net 43.0.156.240/32) || (dst net 43.0.173.47/32))),
	((dst port 199) || (dst port 3636) || (dst port 8824) || (dst port 37871) || (dst port 43301)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.96.23/32) || (dst net 44.0.140.162/32) || (dst net 44.0.147.35/32) || (dst net 44.0.171.106/32) || (dst net 44.0.175.225/32))),
	((dst port 3145) || (dst port 15699) || (dst port 38592) || (dst port 43904) || (dst port 60000)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.17.177/32) || (dst net 45.0.57.213/32) || (dst net 45.0.167.161/32) || (dst net 45.0.203.78/32) || (dst net 45.0.241.83/32))),
	((dst port 18816) || (dst port 28367) || (dst port 50615) || (dst port 52887) || (dst port 61544)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.33.94/32) || (dst net 46.0.39.1/32) || (dst net 46.0.183.116/32) || (dst net 46.0.221.89/32) || (dst net 46.0.236.115/32))),
	((dst port 17633) || (dst port 48286) || (dst port 62680) || (dst port 63228) || (dst port 64757)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.22.80/32) || (dst net 47.0.83.111/32) || (dst net 47.0.121.24/32) || (dst net 47.0.229.234/32) || (dst net 47.0.241.103/32))),
	((dst port 12278) || (dst port 29238) || (dst port 39655) || (dst port 40349) || (dst port 56095)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.50.0/32) || (dst net 48.0.94.47/32) || (dst net 48.0.174.37/32) || (dst net 48.0.204.166/32) || (dst net 48.0.224.207/32))),
	((dst port 26596) || (dst port 27317) || (dst port 30659) || (dst port 35807) || (dst port 64194)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.5.226/32) || (dst net 49.0.93.4/32) || (dst net 49.0.104.130/32) || (dst net 49.0.193.126/32) || (dst net 49.0.244.223/32))),
	((dst port 3516) || (dst port 22952) || (dst port 34982) || (dst port 47395) || (dst port 55803)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.98.148/32) || (dst net 50.0.173.219/32) || (dst net 50.0.191.201/32) || (dst net 50.0.210.25/32) || (dst net 50.0.255.17/32))),
	((dst port 2351) || (dst port 35917) || (dst port 46835) || (dst port 49050) || (dst port 61305)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.52.16/32) || (dst net 51.0.105.16/32) || (dst net 51.0.134.29/32) || (dst net 51.0.197.161/32) || (dst net 51.0.251.183/32))),
	((dst port 2797) || (dst port 20005) || (dst port 24261) || (dst port 28204) || (dst port 63545)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.47.207/32) || (dst net 52.0.56.80/32) || (dst net 52.0.142.144/32) || (dst net 52.0.192.247/32) || (dst net 52.0.198.248/32))),
	((dst port 8580) || (dst port 25190) || (dst port 30257) || (dst port 53481) || (dst port 60278)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.67.244/32) || (dst net 53.0.76.97/32) || (dst net 53.0.77.168/32) || (dst net 53.0.86.42/32) || (dst net 53.0.201.41/32))),
	((dst port 9861) || (dst port 11121) || (dst port 20009) || (dst port 59861) || (dst port 63733)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.52.73/32) || (dst net 54.0.73.226/32) || (dst net 54.0.81.168/32) || (dst net 54.0.117.203/32) || (dst net 54.0.177.98/32))),
	((dst port 1516) || (dst port 19438) || (dst port 27069) || (dst port 58582) || (dst port 61313)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.57.96/32) || (dst net 55.0.63.98/32) || (dst net 55.0.167.0/32) || (dst net 55.0.179.39/32) || (dst net 55.0.188.35/32))),
	((dst port 7356) || (dst port 12295) || (dst port 12973) || (dst port 30340) || (dst port 62146)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.25.72/32) || (dst net 56.0.142.80/32) || (dst net 56.0.146.23/32) || (dst net 56.0.239.86/32) || (dst net 56.0.239.232/32))),
	((dst port 6442) || (dst port 9994) || (dst port 27067) || (dst port 28895) || (dst port 43667)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.19.9/32) || (dst net 57.0.55.180/32) || (dst net 57.0.186.232/32) || (dst net 57.0.210.173/32) || (dst net 57.0.246.125/32))),
	((dst port 27340) || (dst port 32765) || (dst port 40615) || (dst port 51959) || (dst port 55993)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.3.221/32) || (dst net 58.0.17.136/32) || (dst net 58.0.46.230/32) || (dst net 58.0.181.39/32) || (dst net 58.0.196.70/32))),
	((dst port 10471) || (dst port 23748) || (dst port 26153) || (dst port 26860) || (dst port 63655)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.110.253/32) || (dst net 59.0.127.148/32) || (dst net 59.0.132.204/32) || (dst net 59.0.146.7/32) || (dst net 59.0.249.157/32))),
	((dst port 7242) || (dst port 10670) || (dst port 15977) || (dst port 23346) || (dst port 36432)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.47.152/32) || (dst net 60.0.69.106/32) || (dst net 60.0.75.124/32) || (dst net 60.0.124.21/32) || (dst net 60.0.188.102/32))),
	((dst port 7491) || (dst port 16839) || (dst port 17772) || (dst port 21461) || (dst port 56012)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.7.165/32) || (dst net 61.0.30.184/32) || (dst net 61.0.89.76/32) || (dst net 61.0.141.16/32) || (dst net 61.0.232.79/32))),
	((dst port 5550) || (dst port 18249) || (dst port 29332) || (dst port 60671) || (dst port 61380)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.49.36/32) || (dst net 62.0.162.36/32) || (dst net 62.0.179.235/32) || (dst net 62.0.187.2/32) || (dst net 62.0.210.137/32))),
	((dst port 5147) || (dst port 11013) || (dst port 49869) || (dst port 53465) || (dst port 59953)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.26.206/32) || (dst net 63.0.96.117/32) || (dst net 63.0.114.129/32) || (dst net 63.0.145.200/32) || (dst net 63.0.207.116/32))),
	((dst port 743) || (dst port 9454) || (dst port 32290) || (dst port 35816) || (dst port 54362)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.72.89/32) || (dst net 64.0.74.192/32) || (dst net 64.0.81.250/32) || (dst net 64.0.194.222/32) || (dst net 64.0.233.30/32))),
	((dst port 33102) || (dst port 42402) || (dst port 45072) || (dst port 56504) || (dst port 60202)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.98.147/32) || (dst net 65.0.104.214/32) || (dst net 65.0.133.139/32) || (dst net 65.0.157.106/32) || (dst net 65.0.157.177/32))),
	((dst port 31850) || (dst port 43836) || (dst port 46539) || (dst port 46951) || (dst port 63984)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.12.24/32) || (dst net 66.0.30.39/32) || (dst net 66.0.131.212/32) || (dst net 66.0.192.140/32) || (dst net 66.0.224.9/32))),
	((dst port 4645) || (dst port 25142) || (dst port 28667) || (dst port 42006) || (dst port 51294)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.12.186/32) || (dst net 67.0.52.60/32) || (dst net 67.0.116.236/32) || (dst net 67.0.170.18/32) || (dst net 67.0.227.145/32))),
	((dst port 19284) || (dst port 22286) || (dst port 33583) || (dst port 41094) || (dst port 41717)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.8.87/32) || (dst net 68.0.104.153/32) || (dst net 68.0.111.216/32) || (dst net 68.0.163.83/32) || (dst net 68.0.191.79/32))),
	((dst port 6469) || (dst port 11132) || (dst port 13227) || (dst port 31013) || (dst port 50642)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.97.205/32) || (dst net 69.0.123.37/32) || (dst net 69.0.146.103/32) || (dst net 69.0.163.193/32) || (dst net 69.0.220.149/32))),
	((dst port 4832) || (dst port 9121) || (dst port 13217) || (dst port 25625) || (dst port 31945)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.4.160/32) || (dst net 70.0.44.235/32) || (dst net 70.0.207.21/32) || (dst net 70.0.217.222/32) || (dst net 70.0.228.21/32))),
	((dst port 16069) || (dst port 25199) || (dst port 35629) || (dst port 58702) || (dst port 62042)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.24.54/32) || (dst net 71.0.50.216/32) || (dst net 71.0.120.53/32) || (dst net 71.0.142.104/32) || (dst net 71.0.185.121/32))),
	((dst port 5009) || (dst port 8286) || (dst port 18276) || (dst port 58596) || (dst port 59954)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.14.126/32) || (dst net 72.0.74.208/32) || (dst net 72.0.113.108/32) || (dst net 72.0.144.109/32) || (dst net 72.0.207.240/32))),
	((dst port 8234) || (dst port 14493) || (dst port 43248) || (dst port 51796) || (dst port 63951)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.6.13/32) || (dst net 73.0.52.155/32) || (dst net 73.0.63.141/32) || (dst net 73.0.91.191/32) || (dst net 73.0.167.142/32))),
	((dst port 11297) || (dst port 11861) || (dst port 19732) || (dst port 23487) || (dst port 63195)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.98.96/32) || (dst net 74.0.121.151/32) || (dst net 74.0.171.190/32) || (dst net 74.0.194.4/32) || (dst net 74.0.210.31/32))),
	((dst port 24065) || (dst port 28227) || (dst port 33774) || (dst port 56781) || (dst port 57738)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.89.65/32) || (dst net 75.0.99.99/32) || (dst net 75.0.163.50/32) || (dst net 75.0.231.129/32) || (dst net 75.0.238.109/32))),
	((dst port 16392) || (dst port 21417) || (dst port 30143) || (dst port 50437) || (dst port 59097)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.156.165/32) || (dst net 76.0.197.45/32) || (dst net 76.0.217.181/32) || (dst net 76.0.228.228/32) || (dst net 76.0.239.239/32))),
	((dst port 2034) || (dst port 3327) || (dst port 27753) || (dst port 44438) || (dst port 54260)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.64.250/32) || (dst net 77.0.122.67/32) || (dst net 77.0.162.255/32) || (dst net 77.0.175.161/32) || (dst net 77.0.210.148/32))),
	((dst port 7937) || (dst port 22623) || (dst port 38618) || (dst port 45391) || (dst port 49886)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.65.88/32) || (dst net 78.0.124.30/32) || (dst net 78.0.124.213/32) || (dst net 78.0.206.165/32) || (dst net 78.0.251.255/32))),
	((dst port 14489) || (dst port 21105) || (dst port 29951) || (dst port 52285) || (dst port 56203)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.59.32/32) || (dst net 79.0.110.240/32) || (dst net 79.0.176.141/32) || (dst net 79.0.187.67/32) || (dst net 79.0.211.109/32))),
	((dst port 13373) || (dst port 26778) || (dst port 40632) || (dst port 43121) || (dst port 62205)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.33.235/32) || (dst net 80.0.204.86/32) || (dst net 80.0.216.141/32) || (dst net 80.0.224.215/32) || (dst net 80.0.238.164/32))),
	((dst port 6710) || (dst port 42767) || (dst port 49874) || (dst port 56708) || (dst port 58061)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.33.44/32) || (dst net 81.0.57.116/32) || (dst net 81.0.93.76/32) || (dst net 81.0.201.160/32) || (dst net 81.0.232.129/32))),
	((dst port 21581) || (dst port 29216) || (dst port 34833) || (dst port 36176) || (dst port 63488)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.14.247/32) || (dst net 82.0.129.4/32) || (dst net 82.0.131.168/32) || (dst net 82.0.142.230/32) || (dst net 82.0.146.220/32))),
	((dst port 9407) || (dst port 36404) || (dst port 38685) || (dst port 41975) || (dst port 55961)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.1.6/32) || (dst net 83.0.54.17/32) || (dst net 83.0.65.45/32) || (dst net 83.0.129.205/32) || (dst net 83.0.144.38/32))),
	((dst port 8810) || (dst port 25131) || (dst port 28457) || (dst port 60383) || (dst port 62630)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.39.209/32) || (dst net 84.0.42.234/32) || (dst net 84.0.101.149/32) || (dst net 84.0.128.50/32) || (dst net 84.0.215.221/32))),
	((dst port 1451) || (dst port 6952) || (dst port 28427) || (dst port 50037) || (dst port 58545)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.159.200/32) || (dst net 85.0.197.108/32) || (dst net 85.0.230.0/32) || (dst net 85.0.240.241/32) || (dst net 85.0.244.244/32))),
	((dst port 8767) || (dst port 9038) || (dst port 17629) || (dst port 28795) || (dst port 40641)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.100.215/32) || (dst net 86.0.104.56/32) || (dst net 86.0.106.169/32) || (dst net 86.0.120.180/32) || (dst net 86.0.222.105/32))),
	((dst port 24746) || (dst port 27582) || (dst port 29233) || (dst port 48925) || (dst port 57717)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.84.140/32) || (dst net 87.0.147.38/32) || (dst net 87.0.152.95/32) || (dst net 87.0.175.228/32) || (dst net 87.0.249.221/32))),
	((dst port 7788) || (dst port 24323) || (dst port 25518) || (dst port 43065) || (dst port 64760)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.27.123/32) || (dst net 88.0.48.195/32) || (dst net 88.0.50.52/32) || (dst net 88.0.164.25/32) || (dst net 88.0.227.152/32))),
	((dst port 19873) || (dst port 22233) || (dst port 36281) || (dst port 50800) || (dst port 61912)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.16.221/32) || (dst net 89.0.40.28/32) || (dst net 89.0.105.224/32) || (dst net 89.0.131.254/32) || (dst net 89.0.139.119/32))),
	((dst port 27181) || (dst port 35955) || (dst port 38289) || (dst port 51175) || (dst port 53591)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.89.113/32) || (dst net 90.0.123.130/32) || (dst net 90.0.129.64/32) || (dst net 90.0.225.37/32) || (dst net 90.0.241.232/32))),
	((dst port 20517) || (dst port 28238) || (dst port 31828) || (dst port 47835) || (dst port 51126)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.36.144/32) || (dst net 91.0.71.247/32) || (dst net 91.0.112.80/32) || (dst net 91.0.152.14/32) || (dst net 91.0.166.70/32))),
	((dst port 8510) || (dst port 14913) || (dst port 29108) || (dst port 35361) || (dst port 57954)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.47.18/32) || (dst net 92.0.97.88/32) || (dst net 92.0.163.144/32) || (dst net 92.0.231.174/32) || (dst net 92.0.242.12/32))),
	((dst port 22123) || (dst port 27579) || (dst port 30874) || (dst port 39463) || (dst port 49349)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.24.175/32) || (dst net 93.0.94.149/32) || (dst net 93.0.122.194/32) || (dst net 93.0.171.144/32) || (dst net 93.0.177.189/32))),
	((dst port 29700) || (dst port 40709) || (dst port 45444) || (dst port 49997) || (dst port 54909)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.22.9/32) || (dst net 94.0.101.223/32) || (dst net 94.0.182.247/32) || (dst net 94.0.230.83/32) || (dst net 94.0.246.96/32))),
	((dst port 15402) || (dst port 19711) || (dst port 30931) || (dst port 56415) || (dst port 58357)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.134.155/32) || (dst net 95.0.139.67/32) || (dst net 95.0.161.88/32) || (dst net 95.0.239.34/32) || (dst net 95.0.248.47/32))),
	((dst port 517) || (dst port 10292) || (dst port 32570) || (dst port 35531) || (dst port 39959)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.27.73/32) || (dst net 96.0.120.97/32) || (dst net 96.0.136.188/32) || (dst net 96.0.224.165/32) || (dst net 96.0.231.103/32))),
	((dst port 3898) || (dst port 19501) || (dst port 35808) || (dst port 47827) || (dst port 64853)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.12.193/32) || (dst net 97.0.127.222/32) || (dst net 97.0.148.73/32) || (dst net 97.0.166.41/32) || (dst net 97.0.167.231/32))),
	((dst port 1998) || (dst port 13057) || (dst port 18339) || (dst port 27216) || (dst port 31531)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.87.116/32) || (dst net 98.0.91.9/32) || (dst net 98.0.183.192/32) || (dst net 98.0.224.90/32) || (dst net 98.0.229.99/32))),
	((dst port 904) || (dst port 24467) || (dst port 38144) || (dst port 61558) || (dst port 62445)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.42.98/32) || (dst net 99.0.58.226/32) || (dst net 99.0.155.50/32) || (dst net 99.0.213.135/32) || (dst net 99.0.216.68/32))),
	((dst port 31244) || (dst port 40393) || (dst port 48304) || (dst port 49857) || (dst port 49958)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.42.67/32) || (dst net 100.0.128.67/32) || (dst net 100.0.145.117/32) || (dst net 100.0.167.28/32) || (dst net 100.0.243.226/32))),
	((dst port 18032) || (dst port 19873) || (dst port 32741) || (dst port 34129) || (dst port 36063)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.131.123/32) || (dst net 101.0.154.7/32) || (dst net 101.0.206.239/32) || (dst net 101.0.231.250/32) || (dst net 101.0.249.190/32))),
	((dst port 1486) || (dst port 11925) || (dst port 17007) || (dst port 27803) || (dst port 57330)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.73.136/32) || (dst net 102.0.83.69/32) || (dst net 102.0.127.170/32) || (dst net 102.0.138.168/32) || (dst net 102.0.232.99/32))),
	((dst port 22170) || (dst port 38764) || (dst port 52097) || (dst port 58591) || (dst port 60818)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.33.34/32) || (dst net 103.0.55.41/32) || (dst net 103.0.74.73/32) || (dst net 103.0.84.48/32) || (dst net 103.0.127.112/32))),
	((dst port 10544) || (dst port 40281) || (dst port 42117) || (dst port 54241) || (dst port 61547)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.71.60/32) || (dst net 104.0.108.231/32) || (dst net 104.0.138.228/32) || (dst net 104.0.169.139/32) || (dst net 104.0.175.157/32))),
	((dst port 6188) || (dst port 36930) || (dst port 39090) || (dst port 46370) || (dst port 61001)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.3.237/32) || (dst net 105.0.36.210/32) || (dst net 105.0.127.85/32) || (dst net 105.0.130.157/32) || (dst net 105.0.244.36/32))),
	((dst port 163) || (dst port 12153) || (dst port 27065) || (dst port 49422) || (dst port 56313)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.50.251/32) || (dst net 106.0.166.237/32) || (dst net 106.0.169.162/32) || (dst net 106.0.216.186/32) || (dst net 106.0.237.197/32))),
	((dst port 856) || (dst port 36233) || (dst port 42136) || (dst port 44062) || (dst port 49312)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.90.183/32) || (dst net 107.0.120.126/32) || (dst net 107.0.156.195/32) || (dst net 107.0.181.121/32) || (dst net 107.0.204.175/32))),
	((dst port 6263) || (dst port 9309) || (dst port 19501) || (dst port 23413) || (dst port 63709)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.25.28/32) || (dst net 108.0.99.247/32) || (dst net 108.0.168.73/32) || (dst net 108.0.170.14/32) || (dst net 108.0.247.140/32))),
	((dst port 11881) || (dst port 28145) || (dst port 54467) || (dst port 62152) || (dst port 62236)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.52.228/32) || (dst net 109.0.78.89/32) || (dst net 109.0.96.115/32) || (dst net 109.0.197.78/32) || (dst net 109.0.251.241/32))),
	((dst port 13388) || (dst port 25985) || (dst port 26068) || (dst port 49953) || (dst port 56470)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.37.219/32) || (dst net 110.0.41.225/32) || (dst net 110.0.107.220/32) || (dst net 110.0.142.29/32) || (dst net 110.0.220.226/32))),
	((dst port 5903) || (dst port 13853) || (dst port 39493) || (dst port 58199) || (dst port 61803)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.65.231/32) || (dst net 111.0.87.127/32) || (dst net 111.0.88.109/32) || (dst net 111.0.165.58/32) || (dst net 111.0.238.46/32))),
	((dst port 7417) || (dst port 10013) || (dst port 11563) || (dst port 41923) || (dst port 58219)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.135.198/32) || (dst net 112.0.198.65/32) || (dst net 112.0.202.56/32) || (dst net 112.0.223.18/32) || (dst net 112.0.238.12/32))),
	((dst port 3482) || (dst port 7702) || (dst port 25475) || (dst port 35157) || (dst port 62978)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.123.171/32) || (dst net 113.0.170.95/32) || (dst net 113.0.221.172/32) || (dst net 113.0.227.230/32) || (dst net 113.0.248.37/32))),
	((dst port 14792) || (dst port 21783) || (dst port 35788) || (dst port 39677) || (dst port 47477)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.27.163/32) || (dst net 114.0.98.199/32) || (dst net 114.0.162.207/32) || (dst net 114.0.167.151/32) || (dst net 114.0.238.171/32))),
	((dst port 12644) || (dst port 15870) || (dst port 46560) || (dst port 49181) || (dst port 61873)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.11.173/32) || (dst net 115.0.24.26/32) || (dst net 115.0.59.197/32) || (dst net 115.0.120.197/32) || (dst net 115.0.183.97/32))),
	((dst port 13736) || (dst port 26410) || (dst port 34870) || (dst port 49997) || (dst port 58874)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.17.134/32) || (dst net 116.0.102.4/32) || (dst net 116.0.119.215/32) || (dst net 116.0.119.233/32) || (dst net 116.0.126.113/32))),
	((dst port 797) || (dst port 28405) || (dst port 33796) || (dst port 40104) || (dst port 40696)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.24.174/32) || (dst net 117.0.52.85/32) || (dst net 117.0.119.178/32) || (dst net 117.0.155.68/32) || (dst net 117.0.164.71/32))),
	((dst port 21805) || (dst port 45082) || (dst port 50820) || (dst port 53393) || (dst port 63017)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.35.10/32) || (dst net 118.0.102.134/32) || (dst net 118.0.143.185/32) || (dst net 118.0.154.232/32) || (dst net 118.0.214.66/32))),
	((dst port 27029) || (dst port 46483) || (dst port 47073) || (dst port 47809) || (dst port 52403)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.72.208/32) || (dst net 119.0.76.227/32) || (dst net 119.0.99.143/32) || (dst net 119.0.139.182/32) || (dst net 119.0.199.75/32))),
	((dst port 33) || (dst port 7426) || (dst port 26842) || (dst port 33079) || (dst port 39242)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.49.234/32) || (dst net 120.0.106.69/32) || (dst net 120.0.165.54/32) || (dst net 120.0.178.233/32) || (dst net 120.0.179.93/32))),
	((dst port 11678) || (dst port 12023) || (dst port 24890) || (dst port 45444) || (dst port 51665)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.42.24/32) || (dst net 121.0.79.219/32) || (dst net 121.0.97.59/32) || (dst net 121.0.124.209/32) || (dst net 121.0.126.211/32))),
	((dst port 5548) || (dst port 11754) || (dst port 16906) || (dst port 36324) || (dst port 60165)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.41.69/32) || (dst net 122.0.94.124/32) || (dst net 122.0.121.11/32) || (dst net 122.0.150.120/32) || (dst net 122.0.191.221/32))),
	((dst port 11221) || (dst port 27360) || (dst port 37413) || (dst port 42329) || (dst port 49625)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.88.115/32) || (dst net 123.0.158.249/32) || (dst net 123.0.184.227/32) || (dst net 123.0.202.122/32) || (dst net 123.0.237.150/32))),
	((dst port 46) || (dst port 2832) || (dst port 14772) || (dst port 18459) || (dst port 31453)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.27.192/32) || (dst net 124.0.134.127/32) || (dst net 124.0.178.70/32) || (dst net 124.0.198.229/32) || (dst net 124.0.248.96/32))),
	((dst port 20025) || (dst port 23788) || (dst port 24926) || (dst port 28361) || (dst port 39208)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.77.111/32) || (dst net 125.0.157.106/32) || (dst net 125.0.180.136/32) || (dst net 125.0.193.249/32) || (dst net 125.0.253.22/32))),
	((dst port 35164) || (dst port 39881) || (dst port 54723) || (dst port 55510) || (dst port 59111)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.47.236/32) || (dst net 126.0.87.231/32) || (dst net 126.0.99.5/32) || (dst net 126.0.209.71/32) || (dst net 126.0.250.7/32))),
	((dst port 6925) || (dst port 28912) || (dst port 39603) || (dst port 51638) || (dst port 60891)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.39.50/32) || (dst net 127.0.57.240/32) || (dst net 127.0.117.17/32) || (dst net 127.0.135.167/32) || (dst net 127.0.170.119/32))),
	((dst port 23788) || (dst port 33545) || (dst port 35873) || (dst port 44841) || (dst port 46678)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.39.200/32) || (dst net 128.0.54.82/32) || (dst net 128.0.81.229/32) || (dst net 128.0.138.67/32) || (dst net 128.0.220.101/32))),
	((dst port 7715) || (dst port 20148) || (dst port 35149) || (dst port 60345) || (dst port 60995)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.27.255/32) || (dst net 129.0.34.199/32) || (dst net 129.0.54.211/32) || (dst net 129.0.94.156/32) || (dst net 129.0.111.50/32))),
	((dst port 5448) || (dst port 13690) || (dst port 21952) || (dst port 29347) || (dst port 38663)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.79.54/32) || (dst net 130.0.86.5/32) || (dst net 130.0.100.51/32) || (dst net 130.0.111.125/32) || (dst net 130.0.114.79/32))),
	((dst port 9875) || (dst port 12684) || (dst port 21071) || (dst port 37892) || (dst port 49242)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.111.18/32) || (dst net 131.0.147.91/32) || (dst net 131.0.209.29/32) || (dst net 131.0.222.95/32) || (dst net 131.0.222.145/32))),
	((dst port 5862) || (dst port 15374) || (dst port 23943) || (dst port 34522) || (dst port 46265)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.72.195/32) || (dst net 132.0.179.44/32) || (dst net 132.0.209.182/32) || (dst net 132.0.228.218/32) || (dst net 132.0.232.127/32))),
	((dst port 5654) || (dst port 22283) || (dst port 33563) || (dst port 40285) || (dst port 53147)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.4.210/32) || (dst net 133.0.10.126/32) || (dst net 133.0.141.250/32) || (dst net 133.0.181.105/32) || (dst net 133.0.200.158/32))),
	((dst port 42589) || (dst port 44858) || (dst port 46831) || (dst port 55650) || (dst port 58650)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.44.2/32) || (dst net 134.0.69.75/32) || (dst net 134.0.77.67/32) || (dst net 134.0.105.219/32) || (dst net 134.0.176.24/32))),
	((dst port 6081) || (dst port 11814) || (dst port 31426) || (dst port 46247) || (dst port 47650)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.38.121/32) || (dst net 135.0.116.87/32) || (dst net 135.0.188.50/32) || (dst net 135.0.243.53/32) || (dst net 135.0.254.158/32))),
	((dst port 1378) || (dst port 33842) || (dst port 39388) || (dst port 51706) || (dst port 58188)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.62.105/32) || (dst net 136.0.101.213/32) || (dst net 136.0.105.188/32) || (dst net 136.0.108.105/32) || (dst net 136.0.182.226/32))),
	((dst port 7726) || (dst port 10248) || (dst port 15406) || (dst port 36571) || (dst port 48498)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.25.109/32) || (dst net 137.0.67.95/32) || (dst net 137.0.77.93/32) || (dst net 137.0.206.47/32) || (dst net 137.0.252.128/32))),
	((dst port 3771) || (dst port 15351) || (dst port 43933) || (dst port 47136) || (dst port 50594)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.0.34/32) || (dst net 138.0.13.72/32) || (dst net 138.0.34.241/32) || (dst net 138.0.92.233/32) || (dst net 138.0.238.220/32))),
	((dst port 10728) || (dst port 21651) || (dst port 37889) || (dst port 42044) || (dst port 44370)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.93.211/32) || (dst net 139.0.103.248/32) || (dst net 139.0.152.208/32) || (dst net 139.0.167.158/32) || (dst net 139.0.221.225/32))),
	((dst port 2206) || (dst port 9537) || (dst port 34678) || (dst port 48169) || (dst port 53628)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.1.215/32) || (dst net 140.0.15.135/32) || (dst net 140.0.183.171/32) || (dst net 140.0.203.249/32) || (dst net 140.0.232.164/32))),
	((dst port 2845) || (dst port 7171) || (dst port 19269) || (dst port 39266) || (dst port 57276)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.20.248/32) || (dst net 141.0.27.50/32) || (dst net 141.0.154.206/32) || (dst net 141.0.165.77/32) || (dst net 141.0.193.236/32))),
	((dst port 6777) || (dst port 19930) || (dst port 32695) || (dst port 48464) || (dst port 62440)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.16.25/32) || (dst net 142.0.110.91/32) || (dst net 142.0.175.98/32) || (dst net 142.0.225.23/32) || (dst net 142.0.236.147/32))),
	((dst port 26650) || (dst port 28016) || (dst port 31789) || (dst port 61764) || (dst port 63989)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.106.50/32) || (dst net 143.0.109.197/32) || (dst net 143.0.131.170/32) || (dst net 143.0.153.237/32) || (dst net 143.0.231.238/32))),
	((dst port 10721) || (dst port 19222) || (dst port 31603) || (dst port 33953) || (dst port 39761)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.9.83/32) || (dst net 144.0.47.28/32) || (dst net 144.0.200.124/32) || (dst net 144.0.239.197/32) || (dst net 144.0.241.187/32))),
	((dst port 9312) || (dst port 13429) || (dst port 29094) || (dst port 30165) || (dst port 60887)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.16.11/32) || (dst net 145.0.59.93/32) || (dst net 145.0.68.169/32) || (dst net 145.0.148.38/32) || (dst net 145.0.157.241/32))),
	((dst port 9465) || (dst port 26009) || (dst port 26877) || (dst port 31899) || (dst port 37306)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.35.239/32) || (dst net 146.0.42.66/32) || (dst net 146.0.61.104/32) || (dst net 146.0.126.141/32) || (dst net 146.0.232.188/32))),
	((dst port 7668) || (dst port 10166) || (dst port 13021) || (dst port 26450) || (dst port 41564)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.11.89/32) || (dst net 147.0.54.151/32) || (dst net 147.0.56.248/32) || (dst net 147.0.222.18/32) || (dst net 147.0.250.255/32))),
	((dst port 8884) || (dst port 24428) || (dst port 27499) || (dst port 31984) || (dst port 45824)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.0.252/32) || (dst net 148.0.21.219/32) || (dst net 148.0.75.134/32) || (dst net 148.0.90.50/32) || (dst net 148.0.212.99/32))),
	((dst port 36633) || (dst port 39715) || (dst port 42728) || (dst port 53086) || (dst port 56085)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.149.73/32) || (dst net 149.0.150.156/32) || (dst net 149.0.180.213/32) || (dst net 149.0.186.15/32) || (dst net 149.0.250.229/32))),
	((dst port 40974) || (dst port 48827) || (dst port 48991) || (dst port 51979) || (dst port 59994)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.47.187/32) || (dst net 150.0.118.21/32) || (dst net 150.0.171.255/32) || (dst net 150.0.202.180/32) || (dst net 150.0.206.161/32))),
	((dst port 5735) || (dst port 16367) || (dst port 18916) || (dst port 38492) || (dst port 59916)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.7.93/32) || (dst net 151.0.110.184/32) || (dst net 151.0.111.173/32) || (dst net 151.0.197.112/32) || (dst net 151.0.241.207/32))),
	((dst port 15004) || (dst port 22361) || (dst port 27599) || (dst port 46720) || (dst port 49727)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.81.73/32) || (dst net 152.0.102.29/32) || (dst net 152.0.142.192/32) || (dst net 152.0.151.6/32) || (dst net 152.0.231.63/32))),
	((dst port 4398) || (dst port 25220) || (dst port 29126) || (dst port 45093) || (dst port 58789)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.85.33/32) || (dst net 153.0.232.210/32) || (dst net 153.0.235.72/32) || (dst net 153.0.244.109/32) || (dst net 153.0.254.193/32))),
	((dst port 2189) || (dst port 8865) || (dst port 30174) || (dst port 37602) || (dst port 38183)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.82.17/32) || (dst net 154.0.171.255/32) || (dst net 154.0.178.228/32) || (dst net 154.0.188.137/32) || (dst net 154.0.212.174/32))),
	((dst port 1592) || (dst port 4810) || (dst port 21813) || (dst port 38631) || (dst port 60807)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.91.185/32) || (dst net 155.0.181.136/32) || (dst net 155.0.184.149/32) || (dst net 155.0.239.189/32) || (dst net 155.0.242.183/32))),
	((dst port 6042) || (dst port 10524) || (dst port 26735) || (dst port 30079) || (dst port 47247)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.48.124/32) || (dst net 156.0.53.83/32) || (dst net 156.0.207.91/32) || (dst net 156.0.221.145/32) || (dst net 156.0.247.215/32))),
	((dst port 879) || (dst port 32387) || (dst port 36927) || (dst port 49759) || (dst port 57781)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.71.16/32) || (dst net 157.0.75.6/32) || (dst net 157.0.89.73/32) || (dst net 157.0.138.184/32) || (dst net 157.0.154.109/32))),
	((dst port 3325) || (dst port 8150) || (dst port 18258) || (dst port 52663) || (dst port 56402)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.17.52/32) || (dst net 158.0.95.0/32) || (dst net 158.0.108.12/32) || (dst net 158.0.128.211/32) || (dst net 158.0.149.187/32))),
	((dst port 32747) || (dst port 37082) || (dst port 47980) || (dst port 57446) || (dst port 64353)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.62.12/32) || (dst net 159.0.134.85/32) || (dst net 159.0.150.194/32) || (dst net 159.0.243.15/32) || (dst net 159.0.252.252/32))),
	((dst port 2107) || (dst port 13829) || (dst port 23053) || (dst port 36224) || (dst port 62274)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.22.189/32) || (dst net 160.0.38.71/32) || (dst net 160.0.68.112/32) || (dst net 160.0.75.255/32) || (dst net 160.0.205.163/32))),
	((dst port 929) || (dst port 9274) || (dst port 20382) || (dst port 22708) || (dst port 27520)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.54.0/32) || (dst net 161.0.88.38/32) || (dst net 161.0.140.27/32) || (dst net 161.0.216.85/32) || (dst net 161.0.252.229/32))),
	((dst port 1449) || (dst port 15913) || (dst port 49025) || (dst port 50801) || (dst port 62226)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.50.108/32) || (dst net 162.0.74.162/32) || (dst net 162.0.149.212/32) || (dst net 162.0.174.202/32) || (dst net 162.0.209.209/32))),
	((dst port 17506) || (dst port 39271) || (dst port 40520) || (dst port 50107) || (dst port 57998)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.46.157/32) || (dst net 163.0.74.154/32) || (dst net 163.0.78.125/32) || (dst net 163.0.236.119/32) || (dst net 163.0.241.16/32))),
	((dst port 5847) || (dst port 6466) || (dst port 25517) || (dst port 59228) || (dst port 60523)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.21.200/32) || (dst net 164.0.29.131/32) || (dst net 164.0.32.254/32) || (dst net 164.0.124.191/32) || (dst net 164.0.177.187/32))),
	((dst port 17863) || (dst port 23930) || (dst port 27902) || (dst port 57358) || (dst port 63948)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.59.138/32) || (dst net 165.0.135.214/32) || (dst net 165.0.224.21/32) || (dst net 165.0.225.144/32) || (dst net 165.0.255.97/32))),
	((dst port 11990) || (dst port 21161) || (dst port 49898) || (dst port 52609) || (dst port 60286)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.2.134/32) || (dst net 166.0.14.241/32) || (dst net 166.0.90.67/32) || (dst net 166.0.134.175/32) || (dst net 166.0.170.225/32))),
	((dst port 314) || (dst port 18376) || (dst port 23104) || (dst port 34740) || (dst port 36765)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.109.249/32) || (dst net 167.0.134.183/32) || (dst net 167.0.137.184/32) || (dst net 167.0.155.84/32) || (dst net 167.0.231.12/32))),
	((dst port 4390) || (dst port 28099) || (dst port 34659) || (dst port 34753) || (dst port 55085)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.15.29/32) || (dst net 168.0.30.202/32) || (dst net 168.0.61.231/32) || (dst net 168.0.110.255/32) || (dst net 168.0.240.185/32))),
	((dst port 196) || (dst port 8760) || (dst port 35741) || (dst port 53590) || (dst port 63179)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.100.49/32) || (dst net 169.0.162.88/32) || (dst net 169.0.162.166/32) || (dst net 169.0.186.220/32) || (dst net 169.0.252.14/32))),
	((dst port 6014) || (dst port 21382) || (dst port 30704) || (dst port 34181) || (dst port 42748)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.76.68/32) || (dst net 170.0.120.28/32) || (dst net 170.0.131.68/32) || (dst net 170.0.164.7/32) || (dst net 170.0.235.68/32))),
	((dst port 15314) || (dst port 23898) || (dst port 27892) || (dst port 44953) || (dst port 61663)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.25.207/32) || (dst net 171.0.31.214/32) || (dst net 171.0.97.224/32) || (dst net 171.0.164.54/32) || (dst net 171.0.193.6/32))),
	((dst port 7252) || (dst port 20636) || (dst port 26380) || (dst port 32062) || (dst port 53544)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.26.60/32) || (dst net 172.0.37.93/32) || (dst net 172.0.127.139/32) || (dst net 172.0.180.73/32) || (dst net 172.0.229.180/32))),
	((dst port 8870) || (dst port 31455) || (dst port 48216) || (dst port 50046) || (dst port 64519)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.2.37/32) || (dst net 173.0.6.133/32) || (dst net 173.0.32.31/32) || (dst net 173.0.46.206/32) || (dst net 173.0.211.71/32))),
	((dst port 17250) || (dst port 19944) || (dst port 46613) || (dst port 48723) || (dst port 56504)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.63.50/32) || (dst net 174.0.135.71/32) || (dst net 174.0.152.28/32) || (dst net 174.0.180.150/32) || (dst net 174.0.227.187/32))),
	((dst port 18168) || (dst port 23427) || (dst port 24970) || (dst port 42443) || (dst port 63437)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.78.99/32) || (dst net 175.0.84.76/32) || (dst net 175.0.84.119/32) || (dst net 175.0.117.125/32) || (dst net 175.0.230.104/32))),
	((dst port 19006) || (dst port 28342) || (dst port 45392) || (dst port 52453) || (dst port 64413)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.11.142/32) || (dst net 176.0.144.28/32) || (dst net 176.0.166.225/32) || (dst net 176.0.203.132/32) || (dst net 176.0.225.76/32))),
	((dst port 25568) || (dst port 26971) || (dst port 45575) || (dst port 46096) || (dst port 51782)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.54.77/32) || (dst net 177.0.83.65/32) || (dst net 177.0.220.106/32) || (dst net 177.0.223.206/32) || (dst net 177.0.225.68/32))),
	((dst port 3750) || (dst port 8525) || (dst port 25048) || (dst port 35013) || (dst port 51769)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.17.119/32) || (dst net 178.0.49.242/32) || (dst net 178.0.157.222/32) || (dst net 178.0.210.133/32) || (dst net 178.0.227.159/32))),
	((dst port 16277) || (dst port 17495) || (dst port 22529) || (dst port 38215) || (dst port 46675)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.22.143/32) || (dst net 179.0.23.113/32) || (dst net 179.0.34.238/32) || (dst net 179.0.69.71/32) || (dst net 179.0.83.5/32))),
	((dst port 2976) || (dst port 24791) || (dst port 42538) || (dst port 48142) || (dst port 60646)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.83.93/32) || (dst net 180.0.85.88/32) || (dst net 180.0.165.97/32) || (dst net 180.0.207.218/32) || (dst net 180.0.218.21/32))),
	((dst port 5427) || (dst port 7344) || (dst port 15095) || (dst port 21759) || (dst port 50884)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.25.126/32) || (dst net 181.0.57.62/32) || (dst net 181.0.108.222/32) || (dst net 181.0.159.73/32) || (dst net 181.0.205.101/32))),
	((dst port 6762) || (dst port 27950) || (dst port 29567) || (dst port 32147) || (dst port 54960)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.59.0/32) || (dst net 182.0.95.197/32) || (dst net 182.0.100.226/32) || (dst net 182.0.104.211/32) || (dst net 182.0.241.139/32))),
	((dst port 3227) || (dst port 5168) || (dst port 26364) || (dst port 34510) || (dst port 38717)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.46.209/32) || (dst net 183.0.86.38/32) || (dst net 183.0.123.130/32) || (dst net 183.0.144.190/32) || (dst net 183.0.215.255/32))),
	((dst port 22265) || (dst port 27156) || (dst port 29204) || (dst port 53260) || (dst port 62739)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.14.213/32) || (dst net 184.0.53.87/32) || (dst net 184.0.100.81/32) || (dst net 184.0.207.247/32) || (dst net 184.0.218.6/32))),
	((dst port 3082) || (dst port 12740) || (dst port 20630) || (dst port 35765) || (dst port 65484)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.78.214/32) || (dst net 185.0.79.42/32) || (dst net 185.0.133.207/32) || (dst net 185.0.160.34/32) || (dst net 185.0.160.36/32))),
	((dst port 5756) || (dst port 20376) || (dst port 20684) || (dst port 38925) || (dst port 49281)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.0.174/32) || (dst net 186.0.71.155/32) || (dst net 186.0.84.94/32) || (dst net 186.0.149.176/32) || (dst net 186.0.210.139/32))),
	((dst port 219) || (dst port 2401) || (dst port 15531) || (dst port 19376) || (dst port 64217)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.122.75/32) || (dst net 187.0.131.215/32) || (dst net 187.0.139.23/32) || (dst net 187.0.141.194/32) || (dst net 187.0.205.242/32))),
	((dst port 5961) || (dst port 20268) || (dst port 20302) || (dst port 46520) || (dst port 56098)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.76.51/32) || (dst net 188.0.79.235/32) || (dst net 188.0.95.224/32) || (dst net 188.0.138.80/32) || (dst net 188.0.194.98/32))),
	((dst port 2187) || (dst port 4254) || (dst port 7299) || (dst port 39809) || (dst port 58521)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.14.74/32) || (dst net 189.0.63.186/32) || (dst net 189.0.152.202/32) || (dst net 189.0.191.167/32) || (dst net 189.0.234.225/32))),
	((dst port 21791) || (dst port 29971) || (dst port 30514) || (dst port 46482) || (dst port 54173)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.1.197/32) || (dst net 190.0.49.89/32) || (dst net 190.0.181.148/32) || (dst net 190.0.212.241/32) || (dst net 190.0.229.84/32))),
	((dst port 11896) || (dst port 28487) || (dst port 33746) || (dst port 44387) || (dst port 47221)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.139.253/32) || (dst net 191.0.162.87/32) || (dst net 191.0.198.127/32) || (dst net 191.0.203.205/32) || (dst net 191.0.247.43/32))),
	((dst port 853) || (dst port 12805) || (dst port 48338) || (dst port 48472) || (dst port 56396)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.20.92/32) || (dst net 192.0.20.216/32) || (dst net 192.0.29.49/32) || (dst net 192.0.136.209/32) || (dst net 192.0.137.144/32))),
	((dst port 11503) || (dst port 23457) || (dst port 40172) || (dst port 45851) || (dst port 48012)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.67.164/32) || (dst net 193.0.121.229/32) || (dst net 193.0.136.15/32) || (dst net 193.0.139.51/32) || (dst net 193.0.154.160/32))),
	((dst port 24098) || (dst port 47997) || (dst port 57986) || (dst port 58220) || (dst port 61848)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.0.8/32) || (dst net 194.0.21.82/32) || (dst net 194.0.29.173/32) || (dst net 194.0.75.24/32) || (dst net 194.0.218.160/32))),
	((dst port 8457) || (dst port 39662) || (dst port 44884) || (dst port 51167) || (dst port 55488)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.55.186/32) || (dst net 195.0.95.28/32) || (dst net 195.0.129.211/32) || (dst net 195.0.179.181/32) || (dst net 195.0.218.205/32))),
	((dst port 26900) || (dst port 29094) || (dst port 35863) || (dst port 62250) || (dst port 64763)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.68.40/32) || (dst net 196.0.85.106/32) || (dst net 196.0.125.15/32) || (dst net 196.0.127.58/32) || (dst net 196.0.172.80/32))),
	((dst port 17463) || (dst port 26935) || (dst port 41036) || (dst port 49081) || (dst port 58848)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.57.10/32) || (dst net 197.0.86.110/32) || (dst net 197.0.124.155/32) || (dst net 197.0.132.228/32) || (dst net 197.0.193.15/32))),
	((dst port 1352) || (dst port 13759) || (dst port 16963) || (dst port 32711) || (dst port 50912)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.59.123/32) || (dst net 198.0.84.141/32) || (dst net 198.0.160.77/32) || (dst net 198.0.226.176/32) || (dst net 198.0.240.102/32))),
	((dst port 10569) || (dst port 14440) || (dst port 17271) || (dst port 36287) || (dst port 56797)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.80.151/32) || (dst net 199.0.82.58/32) || (dst net 199.0.154.195/32) || (dst net 199.0.166.95/32) || (dst net 199.0.254.196/32))),
	((dst port 7071) || (dst port 19444) || (dst port 35954) || (dst port 38544) || (dst port 43432)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.12.235/32) || (dst net 200.0.51.99/32) || (dst net 200.0.142.239/32) || (dst net 200.0.175.24/32) || (dst net 200.0.205.1/32))),
	((dst port 18439) || (dst port 29221) || (dst port 30039) || (dst port 42228) || (dst port 56099)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.43.50/32) || (dst net 201.0.93.47/32) || (dst net 201.0.165.169/32) || (dst net 201.0.167.9/32) || (dst net 201.0.231.35/32))),
	((dst port 6512) || (dst port 12271) || (dst port 26105) || (dst port 36573) || (dst port 62915)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.7.151/32) || (dst net 202.0.121.16/32) || (dst net 202.0.136.64/32) || (dst net 202.0.155.14/32) || (dst net 202.0.245.252/32))),
	((dst port 18740) || (dst port 21821) || (dst port 42703) || (dst port 51147) || (dst port 57845)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.25.215/32) || (dst net 203.0.110.234/32) || (dst net 203.0.142.192/32) || (dst net 203.0.155.71/32) || (dst net 203.0.239.230/32))),
	((dst port 10638) || (dst port 21062) || (dst port 27890) || (dst port 29580) || (dst port 52924)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.20.63/32) || (dst net 204.0.34.42/32) || (dst net 204.0.52.52/32) || (dst net 204.0.65.234/32) || (dst net 204.0.109.161/32))),
	((dst port 261) || (dst port 308) || (dst port 9539) || (dst port 11799) || (dst port 28041)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.22.136/32) || (dst net 205.0.88.208/32) || (dst net 205.0.108.162/32) || (dst net 205.0.202.72/32) || (dst net 205.0.231.144/32))),
	((dst port 2494) || (dst port 14433) || (dst port 26574) || (dst port 32643) || (dst port 63317)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.13.189/32) || (dst net 206.0.18.245/32) || (dst net 206.0.26.58/32) || (dst net 206.0.142.182/32) || (dst net 206.0.247.40/32))),
	((dst port 6007) || (dst port 18746) || (dst port 26192) || (dst port 42383) || (dst port 64624)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.5.124/32) || (dst net 207.0.72.64/32) || (dst net 207.0.90.161/32) || (dst net 207.0.167.248/32) || (dst net 207.0.206.45/32))),
	((dst port 7194) || (dst port 22660) || (dst port 26178) || (dst port 36553) || (dst port 62919)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.36.230/32) || (dst net 208.0.107.101/32) || (dst net 208.0.149.103/32) || (dst net 208.0.153.224/32) || (dst net 208.0.186.76/32))),
	((dst port 28617) || (dst port 42327) || (dst port 46095) || (dst port 62300) || (dst port 62713)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.93.157/32) || (dst net 209.0.100.26/32) || (dst net 209.0.194.149/32) || (dst net 209.0.209.9/32) || (dst net 209.0.224.166/32))),
	((dst port 13126) || (dst port 23199) || (dst port 29969) || (dst port 42195) || (dst port 64725)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.0.137/32) || (dst net 210.0.38.64/32) || (dst net 210.0.53.130/32) || (dst net 210.0.168.185/32) || (dst net 210.0.187.99/32))),
	((dst port 5419) || (dst port 21572) || (dst port 39541) || (dst port 44311) || (dst port 57558)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.31.80/32) || (dst net 211.0.105.99/32) || (dst net 211.0.133.176/32) || (dst net 211.0.161.131/32) || (dst net 211.0.222.119/32))),
	((dst port 8037) || (dst port 15290) || (dst port 41126) || (dst port 41987) || (dst port 47460)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.166.19/32) || (dst net 212.0.185.115/32) || (dst net 212.0.230.12/32) || (dst net 212.0.247.124/32) || (dst net 212.0.248.28/32))),
	((dst port 16406) || (dst port 18835) || (dst port 22654) || (dst port 41165) || (dst port 52505)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.55.239/32) || (dst net 213.0.77.149/32) || (dst net 213.0.87.241/32) || (dst net 213.0.116.147/32) || (dst net 213.0.138.103/32))),
	((dst port 22845) || (dst port 37028) || (dst port 44764) || (dst port 46156) || (dst port 62263)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.47.101/32) || (dst net 214.0.119.129/32) || (dst net 214.0.128.112/32) || (dst net 214.0.137.63/32) || (dst net 214.0.248.47/32))),
	((dst port 8085) || (dst port 9579) || (dst port 26584) || (dst port 41311) || (dst port 63694)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.48.158/32) || (dst net 215.0.135.9/32) || (dst net 215.0.141.254/32) || (dst net 215.0.233.165/32) || (dst net 215.0.245.20/32))),
	((dst port 509) || (dst port 24689) || (dst port 28297) || (dst port 44899) || (dst port 45527)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.132.140/32) || (dst net 216.0.139.131/32) || (dst net 216.0.153.206/32) || (dst net 216.0.200.189/32) || (dst net 216.0.211.162/32))),
	((dst port 2109) || (dst port 4370) || (dst port 31558) || (dst port 50881) || (dst port 52143)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.56.233/32) || (dst net 217.0.78.128/32) || (dst net 217.0.78.134/32) || (dst net 217.0.111.152/32) || (dst net 217.0.171.146/32))),
	((dst port 11820) || (dst port 16929) || (dst port 26402) || (dst port 55201) || (dst port 62743)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.0.104/32) || (dst net 218.0.77.56/32) || (dst net 218.0.82.220/32) || (dst net 218.0.176.202/32) || (dst net 218.0.200.156/32))),
	((dst port 14049) || (dst port 50834) || (dst port 54608) || (dst port 59270) || (dst port 62156)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.51.44/32) || (dst net 219.0.64.141/32) || (dst net 219.0.140.51/32) || (dst net 219.0.165.10/32) || (dst net 219.0.223.224/32))),
	((dst port 1662) || (dst port 27307) || (dst port 42402) || (dst port 51284) || (dst port 54014)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.48.255/32) || (dst net 220.0.91.201/32) || (dst net 220.0.96.119/32) || (dst net 220.0.206.79/32) || (dst net 220.0.211.18/32))),
	((dst port 2341) || (dst port 9471) || (dst port 23542) || (dst port 27585) || (dst port 58317)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.21.237/32) || (dst net 221.0.99.72/32) || (dst net 221.0.111.98/32) || (dst net 221.0.121.20/32) || (dst net 221.0.251.207/32))),
	((dst port 1183) || (dst port 7146) || (dst port 33241) || (dst port 43506) || (dst port 44837)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.25.212/32) || (dst net 222.0.58.123/32) || (dst net 222.0.100.50/32) || (dst net 222.0.110.181/32) || (dst net 222.0.168.117/32))),
	((dst port 26911) || (dst port 27740) || (dst port 31341) || (dst port 39549) || (dst port 44015)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.5.206/32) || (dst net 223.0.83.26/32) || (dst net 223.0.84.250/32) || (dst net 223.0.226.228/32) || (dst net 223.0.228.6/32))),
	((dst port 12102) || (dst port 17153) || (dst port 23174) || (dst port 42821) || (dst port 55228)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.36.148/32) || (dst net 224.0.96.134/32) || (dst net 224.0.118.212/32) || (dst net 224.0.208.109/32) || (dst net 224.0.240.4/32))),
	((dst port 23831) || (dst port 28210) || (dst port 33203) || (dst port 53178) || (dst port 61961)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.3.211/32) || (dst net 225.0.24.97/32) || (dst net 225.0.38.113/32) || (dst net 225.0.163.9/32) || (dst net 225.0.214.241/32))),
	((dst port 7335) || (dst port 9644) || (dst port 16556) || (dst port 42286) || (dst port 48387)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.2.44/32) || (dst net 226.0.139.56/32) || (dst net 226.0.144.206/32) || (dst net 226.0.228.65/32) || (dst net 226.0.230.12/32))),
	((dst port 7206) || (dst port 17867) || (dst port 23019) || (dst port 29709) || (dst port 51282)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.10.220/32) || (dst net 227.0.37.187/32) || (dst net 227.0.53.211/32) || (dst net 227.0.162.175/32) || (dst net 227.0.181.168/32))),
	((dst port 6552) || (dst port 13825) || (dst port 22696) || (dst port 31703) || (dst port 53067)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.15.195/32) || (dst net 228.0.21.160/32) || (dst net 228.0.56.60/32) || (dst net 228.0.181.176/32) || (dst net 228.0.235.145/32))),
	((dst port 12526) || (dst port 30368) || (dst port 35328) || (dst port 48538) || (dst port 58274)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.15.232/32) || (dst net 229.0.87.196/32) || (dst net 229.0.95.179/32) || (dst net 229.0.158.240/32) || (dst net 229.0.191.216/32))),
	((dst port 2899) || (dst port 26155) || (dst port 31039) || (dst port 31828) || (dst port 52098)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.1.129/32) || (dst net 230.0.63.110/32) || (dst net 230.0.81.129/32) || (dst net 230.0.173.135/32) || (dst net 230.0.211.220/32))),
	((dst port 32968) || (dst port 33097) || (dst port 37674) || (dst port 49423) || (dst port 57795)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.23.38/32) || (dst net 231.0.71.157/32) || (dst net 231.0.126.38/32) || (dst net 231.0.177.109/32) || (dst net 231.0.217.171/32))),
	((dst port 3143) || (dst port 5389) || (dst port 15452) || (dst port 38850) || (dst port 54029)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.53.83/32) || (dst net 232.0.108.155/32) || (dst net 232.0.178.173/32) || (dst net 232.0.214.92/32) || (dst net 232.0.227.61/32))),
	((dst port 11337) || (dst port 24191) || (dst port 34517) || (dst port 51735) || (dst port 58849)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.39.63/32) || (dst net 233.0.43.75/32) || (dst net 233.0.68.157/32) || (dst net 233.0.174.78/32) || (dst net 233.0.179.143/32))),
	((dst port 19338) || (dst port 22298) || (dst port 23115) || (dst port 25484) || (dst port 51674)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.1.60/32) || (dst net 234.0.65.173/32) || (dst net 234.0.218.55/32) || (dst net 234.0.228.127/32) || (dst net 234.0.252.134/32))),
	((dst port 4147) || (dst port 29748) || (dst port 46034) || (dst port 47341) || (dst port 65222)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.16.207/32) || (dst net 235.0.45.98/32) || (dst net 235.0.109.30/32) || (dst net 235.0.167.99/32) || (dst net 235.0.194.81/32))),
	((dst port 1894) || (dst port 3092) || (dst port 24636) || (dst port 53190) || (dst port 60659)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.56.58/32) || (dst net 236.0.77.186/32) || (dst net 236.0.80.145/32) || (dst net 236.0.86.24/32) || (dst net 236.0.208.245/32))),
	((dst port 6272) || (dst port 21431) || (dst port 34356) || (dst port 46603) || (dst port 58942)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.34.215/32) || (dst net 237.0.67.59/32) || (dst net 237.0.92.220/32) || (dst net 237.0.162.116/32) || (dst net 237.0.204.113/32))),
	((dst port 730) || (dst port 27521) || (dst port 31764) || (dst port 47099) || (dst port 58632)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.65.80/32) || (dst net 238.0.103.85/32) || (dst net 238.0.125.36/32) || (dst net 238.0.197.183/32) || (dst net 238.0.248.47/32))),
	((dst port 15467) || (dst port 31655) || (dst port 34285) || (dst port 46080) || (dst port 59843)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.159.2/32) || (dst net 239.0.191.79/32) || (dst net 239.0.213.59/32) || (dst net 239.0.222.48/32) || (dst net 239.0.241.214/32))),
	((dst port 38982) || (dst port 55153) || (dst port 55244) || (dst port 63592) || (dst port 65013)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.8.183/32) || (dst net 240.0.76.32/32) || (dst net 240.0.127.144/32) || (dst net 240.0.143.25/32) || (dst net 240.0.153.52/32))),
	((dst port 3180) || (dst port 19863) || (dst port 38280) || (dst port 39739) || (dst port 56328)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.5.219/32) || (dst net 241.0.32.106/32) || (dst net 241.0.46.226/32) || (dst net 241.0.216.142/32) || (dst net 241.0.234.45/32))),
	((dst port 6453) || (dst port 9062) || (dst port 36107) || (dst port 40014) || (dst port 64799)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.1.157/32) || (dst net 242.0.19.225/32) || (dst net 242.0.34.4/32) || (dst net 242.0.90.106/32) || (dst net 242.0.238.204/32))),
	((dst port 18136) || (dst port 31397) || (dst port 52236) || (dst port 57120) || (dst port 62498)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.35.98/32) || (dst net 243.0.43.21/32) || (dst net 243.0.94.253/32) || (dst net 243.0.122.163/32) || (dst net 243.0.236.104/32))),
	((dst port 23992) || (dst port 34789) || (dst port 52534) || (dst port 54847) || (dst port 59614)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.136.87/32) || (dst net 244.0.142.156/32) || (dst net 244.0.143.232/32) || (dst net 244.0.188.126/32) || (dst net 244.0.246.236/32))),
	((dst port 4042) || (dst port 29132) || (dst port 43018) || (dst port 53542) || (dst port 63391)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.58.102/32) || (dst net 245.0.61.226/32) || (dst net 245.0.122.50/32) || (dst net 245.0.197.153/32) || (dst net 245.0.219.92/32))),
	((dst port 18150) || (dst port 31880) || (dst port 38654) || (dst port 40561) || (dst port 59620)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.19.245/32) || (dst net 246.0.181.78/32) || (dst net 246.0.197.143/32) || (dst net 246.0.232.86/32) || (dst net 246.0.234.173/32))),
	((dst port 16661) || (dst port 18386) || (dst port 44978) || (dst port 45823) || (dst port 52029)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.15.65/32) || (dst net 247.0.170.102/32) || (dst net 247.0.180.253/32) || (dst net 247.0.198.93/32) || (dst net 247.0.243.53/32))),
	((dst port 1095) || (dst port 11880) || (dst port 38522) || (dst port 47390) || (dst port 53475)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.73.160/32) || (dst net 248.0.129.186/32) || (dst net 248.0.144.0/32) || (dst net 248.0.165.87/32) || (dst net 248.0.195.122/32))),
	((dst port 3211) || (dst port 13435) || (dst port 26537) || (dst port 32416) || (dst port 35715)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.31.118/32) || (dst net 249.0.207.24/32) || (dst net 249.0.224.101/32) || (dst net 249.0.234.202/32) || (dst net 249.0.247.211/32))),
	((dst port 10354) || (dst port 16224) || (dst port 44684) || (dst port 45723) || (dst port 47624)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.1.156/32) || (dst net 250.0.41.43/32) || (dst net 250.0.118.54/32) || (dst net 250.0.177.167/32) || (dst net 250.0.227.33/32))),
	((dst port 25018) || (dst port 29577) || (dst port 32125) || (dst port 35576) || (dst port 56099)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.36.11/32) || (dst net 251.0.96.200/32) || (dst net 251.0.186.58/32) || (dst net 251.0.217.23/32) || (dst net 251.0.238.186/32))),
	((dst port 21647) || (dst port 36327) || (dst port 36975) || (dst port 53448) || (dst port 61867)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.113.126/32) || (dst net 252.0.136.165/32) || (dst net 252.0.237.63/32) || (dst net 252.0.240.255/32) || (dst net 252.0.241.113/32))),
	((dst port 4145) || (dst port 5013) || (dst port 11743) || (dst port 33360) || (dst port 46380)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.39.6/32) || (dst net 253.0.47.190/32) || (dst net 253.0.76.122/32) || (dst net 253.0.184.13/32) || (dst net 253.0.209.230/32))),
	((dst port 5167) || (dst port 10729) || (dst port 37515) || (dst port 51044) || (dst port 63354)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.50.1/32) || (dst net 254.0.57.180/32) || (dst net 254.0.65.81/32) || (dst net 254.0.88.213/32) || (dst net 254.0.236.22/32))),
	((dst port 21485) || (dst port 27837) || (dst port 55950) || (dst port 60090) || (dst port 64615)) && ((dst net 255.0.0.0/8) && !((dst net 255.0.14.122/32) || (dst net 255.0.35.114/32) || (dst net 255.0.56.204/32) || (dst net 255.0.117.5/32) || (dst net 255.0.224.227/32))),
	((dst port 21146) || (dst port 36352) || (dst port 52461) || (dst port 57683) || (dst port 58713)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.27.109/32) || (dst net 0.0.50.237/32) || (dst net 0.0.84.1/32) || (dst net 0.0.172.128/32) || (dst net 0.0.233.178/32))),
	((dst port 8619) || (dst port 9314) || (dst port 24606) || (dst port 48986) || (dst port 49798)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.43.92/32) || (dst net 1.0.44.119/32) || (dst net 1.0.72.200/32) || (dst net 1.0.154.81/32) || (dst net 1.0.181.181/32))),
	((dst port 14680) || (dst port 39391) || (dst port 48677) || (dst port 48936) || (dst port 59227)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.61.105/32) || (dst net 2.0.105.72/32) || (dst net 2.0.136.188/32) || (dst net 2.0.194.140/32) || (dst net 2.0.244.147/32))),
	((dst port 33072) || (dst port 40977) || (dst port 41466) || (dst port 58455) || (dst port 58637)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.34.153/32) || (dst net 3.0.89.187/32) || (dst net 3.0.98.187/32) || (dst net 3.0.211.97/32) || (dst net 3.0.249.39/32))),
	((dst port 2613) || (dst port 8537) || (dst port 22180) || (dst port 22569) || (dst port 51574)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.40.86/32) || (dst net 4.0.61.212/32) || (dst net 4.0.80.59/32) || (dst net 4.0.97.165/32) || (dst net 4.0.157.145/32))),
	((dst port 1439) || (dst port 3659) || (dst port 9516) || (dst port 23315) || (dst port 37117)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.27.107/32) || (dst net 5.0.48.241/32) || (dst net 5.0.52.139/32) || (dst net 5.0.123.127/32) || (dst net 5.0.152.219/32))),
	((dst port 15081) || (dst port 34108) || (dst port 46133) || (dst port 55159) || (dst port 61091)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.39.15/32) || (dst net 6.0.61.154/32) || (dst net 6.0.63.119/32) || (dst net 6.0.172.32/32) || (dst net 6.0.196.182/32))),
	((dst port 40685) || (dst port 40892) || (dst port 42788) || (dst port 51636) || (dst port 58786)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.7.195/32) || (dst net 7.0.77.218/32) || (dst net 7.0.140.167/32) || (dst net 7.0.208.89/32) || (dst net 7.0.250.24/32))),
	((dst port 6328) || (dst port 36595) || (dst port 38871) || (dst port 45615) || (dst port 60993)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.28.185/32) || (dst net 8.0.62.150/32) || (dst net 8.0.170.209/32) || (dst net 8.0.204.208/32) || (dst net 8.0.208.107/32))),
	((dst port 7243) || (dst port 12498) || (dst port 13744) || (dst port 39437) || (dst port 40523)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.8.183/32) || (dst net 9.0.14.255/32) || (dst net 9.0.153.235/32) || (dst net 9.0.253.165/32) || (dst net 9.0.253.185/32))),
	((dst port 5843) || (dst port 9371) || (dst port 15509) || (dst port 24672) || (dst port 52405)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.72.143/32) || (dst net 10.0.128.4/32) || (dst net 10.0.144.242/32) || (dst net 10.0.161.66/32) || (dst net 10.0.185.231/32))),
	((dst port 5889) || (dst port 6552) || (dst port 18606) || (dst port 31573) || (dst port 36705)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.34.26/32) || (dst net 11.0.169.51/32) || (dst net 11.0.184.91/32) || (dst net 11.0.219.165/32) || (dst net 11.0.224.171/32))),
	((dst port 10461) || (dst port 17630) || (dst port 21202) || (dst port 37683) || (dst port 56430)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.2.27/32) || (dst net 12.0.120.231/32) || (dst net 12.0.122.138/32) || (dst net 12.0.150.187/32) || (dst net 12.0.242.8/32))),
	((dst port 15623) || (dst port 21251) || (dst port 37330) || (dst port 54321) || (dst port 59034)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.42.197/32) || (dst net 13.0.186.245/32) || (dst net 13.0.196.223/32) || (dst net 13.0.240.57/32) || (dst net 13.0.251.11/32))),
	((dst port 696) || (dst port 30534) || (dst port 31891) || (dst port 38191) || (dst port 44352)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.12.146/32) || (dst net 14.0.114.239/32) || (dst net 14.0.118.136/32) || (dst net 14.0.193.235/32) || (dst net 14.0.227.223/32))),
	((dst port 6212) || (dst port 7852) || (dst port 40667) || (dst port 48548) || (dst port 63134)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.42.145/32) || (dst net 15.0.147.214/32) || (dst net 15.0.150.75/32) || (dst net 15.0.198.235/32) || (dst net 15.0.239.180/32))),
	((dst port 20128) || (dst port 32695) || (dst port 40834) || (dst port 56059) || (dst port 63204)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.20.125/32) || (dst net 16.0.25.153/32) || (dst net 16.0.33.171/32) || (dst net 16.0.127.161/32) || (dst net 16.0.173.13/32))),
	((dst port 317) || (dst port 572) || (dst port 14412) || (dst port 31582) || (dst port 47432)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.136.1/32) || (dst net 17.0.180.139/32) || (dst net 17.0.205.201/32) || (dst net 17.0.228.160/32) || (dst net 17.0.255.39/32))),
	((dst port 22299) || (dst port 44449) || (dst port 48031) || (dst port 48527) || (dst port 54341)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.33.100/32) || (dst net 18.0.64.228/32) || (dst net 18.0.67.28/32) || (dst net 18.0.225.119/32) || (dst net 18.0.232.138/32))),
	((dst port 1516) || (dst port 4124) || (dst port 23349) || (dst port 59197) || (dst port 64048)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.40.57/32) || (dst net 19.0.105.85/32) || (dst net 19.0.119.175/32) || (dst net 19.0.167.34/32) || (dst net 19.0.198.89/32))),
	((dst port 6572) || (dst port 15099) || (dst port 15124) || (dst port 33034) || (dst port 33875)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.111.21/32) || (dst net 20.0.159.198/32) || (dst net 20.0.187.1/32) || (dst net 20.0.222.228/32) || (dst net 20.0.227.164/32))),
	((dst port 16106) || (dst port 28068) || (dst port 35379) || (dst port 55794) || (dst port 63483)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.44.210/32) || (dst net 21.0.139.141/32) || (dst net 21.0.155.143/32) || (dst net 21.0.168.115/32) || (dst net 21.0.183.129/32))),
	((dst port 391) || (dst port 27952) || (dst port 28274) || (dst port 56167) || (dst port 62380)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.47.123/32) || (dst net 22.0.67.186/32) || (dst net 22.0.68.233/32) || (dst net 22.0.96.138/32) || (dst net 22.0.246.238/32))),
	((dst port 8556) || (dst port 18018) || (dst port 21428) || (dst port 25417) || (dst port 49924)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.24.132/32) || (dst net 23.0.47.21/32) || (dst net 23.0.141.117/32) || (dst net 23.0.195.214/32) || (dst net 23.0.199.45/32))),
	((dst port 10432) || (dst port 20655) || (dst port 24370) || (dst port 46222) || (dst port 47939)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.16.12/32) || (dst net 24.0.91.77/32) || (dst net 24.0.177.145/32) || (dst net 24.0.193.206/32) || (dst net 24.0.228.83/32))),
	((dst port 18774) || (dst port 24329) || (dst port 31222) || (dst port 37826) || (dst port 65435)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.10.6/32) || (dst net 25.0.16.179/32) || (dst net 25.0.38.231/32) || (dst net 25.0.95.108/32) || (dst net 25.0.126.204/32))),
	((dst port 2018) || (dst port 26098) || (dst port 33971) || (dst port 55570) || (dst port 57002)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.110.175/32) || (dst net 26.0.137.196/32) || (dst net 26.0.169.212/32) || (dst net 26.0.207.191/32) || (dst net 26.0.212.240/32))),
	((dst port 9858) || (dst port 20115) || (dst port 27635) || (dst port 37321) || (dst port 64541)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.43.53/32) || (dst net 27.0.55.247/32) || (dst net 27.0.81.128/32) || (dst net 27.0.186.254/32) || (dst net 27.0.243.74/32))),
	((dst port 12198) || (dst port 14115) || (dst port 16226) || (dst port 29305) || (dst port 61874)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.100.36/32) || (dst net 28.0.108.231/32) || (dst net 28.0.113.46/32) || (dst net 28.0.129.71/32) || (dst net 28.0.145.12/32))),
	((dst port 8132) || (dst port 20240) || (dst port 27250) || (dst port 37444) || (dst port 38862)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.16.228/32) || (dst net 29.0.92.98/32) || (dst net 29.0.161.124/32) || (dst net 29.0.208.87/32) || (dst net 29.0.241.43/32))),
	((dst port 11910) || (dst port 24295) || (dst port 25648) || (dst port 31845) || (dst port 40820)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.5.219/32) || (dst net 30.0.93.7/32) || (dst net 30.0.112.89/32) || (dst net 30.0.114.11/32) || (dst net 30.0.190.201/32))),
	((dst port 20042) || (dst port 24325) || (dst port 24506) || (dst port 39588) || (dst port 49859)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.7.164/32) || (dst net 31.0.11.22/32) || (dst net 31.0.95.73/32) || (dst net 31.0.179.99/32) || (dst net 31.0.214.99/32))),
	((dst port 9465) || (dst port 29076) || (dst port 41941) || (dst port 44300) || (dst port 47810)) && ((dst net 32.0.0.0/8) && !((dst net 32.0.1.37/32) || (dst net 32.0.6.217/32) || (dst net 32.0.139.60/32) || (dst net 32.0.173.163/32) || (dst net 32.0.204.250/32))),
	((dst port 7474) || (dst port 11158) || (dst port 37665) || (dst port 51650) || (dst port 62516)) && ((dst net 33.0.0.0/8) && !((dst net 33.0.10.156/32) || (dst net 33.0.39.108/32) || (dst net 33.0.52.113/32) || (dst net 33.0.160.210/32) || (dst net 33.0.237.140/32))),
	((dst port 2543) || (dst port 4964) || (dst port 21072) || (dst port 23915) || (dst port 24220)) && ((dst net 34.0.0.0/8) && !((dst net 34.0.33.243/32) || (dst net 34.0.175.8/32) || (dst net 34.0.176.61/32) || (dst net 34.0.221.224/32) || (dst net 34.0.226.115/32))),
	((dst port 12871) || (dst port 17731) || (dst port 34217) || (dst port 42949) || (dst port 50819)) && ((dst net 35.0.0.0/8) && !((dst net 35.0.24.155/32) || (dst net 35.0.144.141/32) || (dst net 35.0.178.101/32) || (dst net 35.0.210.210/32) || (dst net 35.0.253.63/32))),
	((dst port 23263) || (dst port 34855) || (dst port 38350) || (dst port 52916) || (dst port 60540)) && ((dst net 36.0.0.0/8) && !((dst net 36.0.14.173/32) || (dst net 36.0.104.184/32) || (dst net 36.0.132.60/32) || (dst net 36.0.226.119/32) || (dst net 36.0.250.33/32))),
	((dst port 5411) || (dst port 10032) || (dst port 28446) || (dst port 54609) || (dst port 56457)) && ((dst net 37.0.0.0/8) && !((dst net 37.0.28.109/32) || (dst net 37.0.46.152/32) || (dst net 37.0.74.19/32) || (dst net 37.0.204.173/32) || (dst net 37.0.237.193/32))),
	((dst port 871) || (dst port 12857) || (dst port 18393) || (dst port 20418) || (dst port 22543)) && ((dst net 38.0.0.0/8) && !((dst net 38.0.58.53/32) || (dst net 38.0.111.91/32) || (dst net 38.0.197.115/32) || (dst net 38.0.218.152/32) || (dst net 38.0.224.212/32))),
	((dst port 8495) || (dst port 10995) || (dst port 36307) || (dst port 54705) || (dst port 57359)) && ((dst net 39.0.0.0/8) && !((dst net 39.0.12.186/32) || (dst net 39.0.119.221/32) || (dst net 39.0.121.198/32) || (dst net 39.0.125.127/32) || (dst net 39.0.160.177/32))),
	((dst port 25076) || (dst port 31275) || (dst port 42205) || (dst port 52101) || (dst port 53311)) && ((dst net 40.0.0.0/8) && !((dst net 40.0.5.66/32) || (dst net 40.0.72.167/32) || (dst net 40.0.115.41/32) || (dst net 40.0.118.250/32) || (dst net 40.0.166.130/32))),
	((dst port 6552) || (dst port 19308) || (dst port 35725) || (dst port 44710) || (dst port 50992)) && ((dst net 41.0.0.0/8) && !((dst net 41.0.58.172/32) || (dst net 41.0.146.125/32) || (dst net 41.0.157.7/32) || (dst net 41.0.219.74/32) || (dst net 41.0.249.32/32))),
	((dst port 6966) || (dst port 29111) || (dst port 31093) || (dst port 60726) || (dst port 62771)) && ((dst net 42.0.0.0/8) && !((dst net 42.0.43.71/32) || (dst net 42.0.78.254/32) || (dst net 42.0.152.219/32) || (dst net 42.0.158.38/32) || (dst net 42.0.225.235/32))),
	((dst port 15046) || (dst port 17337) || (dst port 31900) || (dst port 42801) || (dst port 60677)) && ((dst net 43.0.0.0/8) && !((dst net 43.0.12.93/32) || (dst net 43.0.38.211/32) || (dst net 43.0.130.161/32) || (dst net 43.0.180.160/32) || (dst net 43.0.243.128/32))),
	((dst port 9657) || (dst port 11450) || (dst port 28833) || (dst port 32415) || (dst port 48404)) && ((dst net 44.0.0.0/8) && !((dst net 44.0.77.65/32) || (dst net 44.0.84.135/32) || (dst net 44.0.128.83/32) || (dst net 44.0.153.237/32) || (dst net 44.0.202.70/32))),
	((dst port 10050) || (dst port 23268) || (dst port 26027) || (dst port 32799) || (dst port 42856)) && ((dst net 45.0.0.0/8) && !((dst net 45.0.113.93/32) || (dst net 45.0.133.164/32) || (dst net 45.0.147.155/32) || (dst net 45.0.166.193/32) || (dst net 45.0.173.97/32))),
	((dst port 28407) || (dst port 38859) || (dst port 41368) || (dst port 56228) || (dst port 58548)) && ((dst net 46.0.0.0/8) && !((dst net 46.0.78.58/32) || (dst net 46.0.86.25/32) || (dst net 46.0.137.216/32) || (dst net 46.0.147.10/32) || (dst net 46.0.166.166/32))),
	((dst port 10732) || (dst port 13574) || (dst port 14904) || (dst port 16418) || (dst port 31094)) && ((dst net 47.0.0.0/8) && !((dst net 47.0.17.167/32) || (dst net 47.0.28.140/32) || (dst net 47.0.79.91/32) || (dst net 47.0.179.77/32) || (dst net 47.0.235.39/32))),
	((dst port 17533) || (dst port 19663) || (dst port 21241) || (dst port 27542) || (dst port 43142)) && ((dst net 48.0.0.0/8) && !((dst net 48.0.6.211/32) || (dst net 48.0.11.115/32) || (dst net 48.0.78.209/32) || (dst net 48.0.113.161/32) || (dst net 48.0.202.175/32))),
	((dst port 4977) || (dst port 30660) || (dst port 45800) || (dst port 49932) || (dst port 64854)) && ((dst net 49.0.0.0/8) && !((dst net 49.0.44.171/32) || (dst net 49.0.93.102/32) || (dst net 49.0.179.225/32) || (dst net 49.0.205.174/32) || (dst net 49.0.208.14/32))),
	((dst port 34976) || (dst port 47022) || (dst port 52610) || (dst port 52630) || (dst port 55159)) && ((dst net 50.0.0.0/8) && !((dst net 50.0.123.10/32) || (dst net 50.0.126.220/32) || (dst net 50.0.153.82/32) || (dst net 50.0.186.25/32) || (dst net 50.0.195.116/32))),
	((dst port 10469) || (dst port 43027) || (dst port 54730) || (dst port 59922) || (dst port 64873)) && ((dst net 51.0.0.0/8) && !((dst net 51.0.98.101/32) || (dst net 51.0.179.114/32) || (dst net 51.0.195.142/32) || (dst net 51.0.200.229/32) || (dst net 51.0.224.66/32))),
	((dst port 17154) || (dst port 18110) || (dst port 21771) || (dst port 22752) || (dst port 26868)) && ((dst net 52.0.0.0/8) && !((dst net 52.0.32.161/32) || (dst net 52.0.91.215/32) || (dst net 52.0.101.71/32) || (dst net 52.0.151.112/32) || (dst net 52.0.237.204/32))),
	((dst port 1806) || (dst port 23713) || (dst port 24106) || (dst port 43615) || (dst port 59629)) && ((dst net 53.0.0.0/8) && !((dst net 53.0.21.179/32) || (dst net 53.0.119.175/32) || (dst net 53.0.156.28/32) || (dst net 53.0.190.111/32) || (dst net 53.0.220.99/32))),
	((dst port 2177) || (dst port 8112) || (dst port 12431) || (dst port 23580) || (dst port 25058)) && ((dst net 54.0.0.0/8) && !((dst net 54.0.44.15/32) || (dst net 54.0.94.181/32) || (dst net 54.0.96.135/32) || (dst net 54.0.155.166/32) || (dst net 54.0.199.23/32))),
	((dst port 7879) || (dst port 14789) || (dst port 46476) || (dst port 47924) || (dst port 51763)) && ((dst net 55.0.0.0/8) && !((dst net 55.0.16.93/32) || (dst net 55.0.46.246/32) || (dst net 55.0.84.107/32) || (dst net 55.0.98.191/32) || (dst net 55.0.209.191/32))),
	((dst port 18496) || (dst port 25829) || (dst port 31843) || (dst port 43905) || (dst port 61377)) && ((dst net 56.0.0.0/8) && !((dst net 56.0.15.224/32) || (dst net 56.0.114.151/32) || (dst net 56.0.168.88/32) || (dst net 56.0.211.81/32) || (dst net 56.0.238.155/32))),
	((dst port 6562) || (dst port 17425) || (dst port 34629) || (dst port 43710) || (dst port 47281)) && ((dst net 57.0.0.0/8) && !((dst net 57.0.0.76/32) || (dst net 57.0.73.135/32) || (dst net 57.0.128.106/32) || (dst net 57.0.141.216/32) || (dst net 57.0.154.227/32))),
	((dst port 8420) || (dst port 18879) || (dst port 22007) || (dst port 55796) || (dst port 60161)) && ((dst net 58.0.0.0/8) && !((dst net 58.0.7.230/32) || (dst net 58.0.9.133/32) || (dst net 58.0.106.58/32) || (dst net 58.0.201.96/32) || (dst net 58.0.246.203/32))),
	((dst port 20245) || (dst port 38767) || (dst port 47905) || (dst port 54389) || (dst port 62471)) && ((dst net 59.0.0.0/8) && !((dst net 59.0.53.234/32) || (dst net 59.0.71.82/32) || (dst net 59.0.120.133/32) || (dst net 59.0.139.165/32) || (dst net 59.0.196.98/32))),
	((dst port 6244) || (dst port 28867) || (dst port 29450) || (dst port 31802) || (dst port 45586)) && ((dst net 60.0.0.0/8) && !((dst net 60.0.32.247/32) || (dst net 60.0.71.71/32) || (dst net 60.0.94.153/32) || (dst net 60.0.111.215/32) || (dst net 60.0.238.227/32))),
	((dst port 6763) || (dst port 50606) || (dst port 50684) || (dst port 53129) || (dst port 61182)) && ((dst net 61.0.0.0/8) && !((dst net 61.0.44.89/32) || (dst net 61.0.139.34/32) || (dst net 61.0.141.226/32) || (dst net 61.0.153.145/32) || (dst net 61.0.176.207/32))),
	((dst port 33393) || (dst port 40099) || (dst port 46171) || (dst port 49060) || (dst port 64019)) && ((dst net 62.0.0.0/8) && !((dst net 62.0.66.171/32) || (dst net 62.0.99.156/32) || (dst net 62.0.150.12/32) || (dst net 62.0.174.197/32) || (dst net 62.0.196.123/32))),
	((dst port 8257) || (dst port 29361) || (dst port 36530) || (dst port 43246) || (dst port 46356)) && ((dst net 63.0.0.0/8) && !((dst net 63.0.84.39/32) || (dst net 63.0.86.115/32) || (dst net 63.0.121.25/32) || (dst net 63.0.201.152/32) || (dst net 63.0.236.39/32))),
	((dst port 5206) || (dst port 8440) || (dst port 27473) || (dst port 30755) || (dst port 37518)) && ((dst net 64.0.0.0/8) && !((dst net 64.0.16.141/32) || (dst net 64.0.31.130/32) || (dst net 64.0.40.251/32) || (dst net 64.0.134.58/32) || (dst net 64.0.196.217/32))),
	((dst port 7478) || (dst port 28118) || (dst port 47437) || (dst port 47660) || (dst port 64855)) && ((dst net 65.0.0.0/8) && !((dst net 65.0.22.83/32) || (dst net 65.0.50.179/32) || (dst net 65.0.131.42/32) || (dst net 65.0.137.226/32) || (dst net 65.0.163.154/32))),
	((dst port 17683) || (dst port 27551) || (dst port 37269) || (dst port 37891) || (dst port 61885)) && ((dst net 66.0.0.0/8) && !((dst net 66.0.1.39/32) || (dst net 66.0.14.200/32) || (dst net 66.0.112.246/32) || (dst net 66.0.167.194/32) || (dst net 66.0.243.206/32))),
	((dst port 11784) || (dst port 21897) || (dst port 29024) || (dst port 32077) || (dst port 50725)) && ((dst net 67.0.0.0/8) && !((dst net 67.0.1.183/32) || (dst net 67.0.111.95/32) || (dst net 67.0.141.246/32) || (dst net 67.0.171.36/32) || (dst net 67.0.197.181/32))),
	((dst port 1255) || (dst port 22975) || (dst port 31518) || (dst port 55389) || (dst port 58693)) && ((dst net 68.0.0.0/8) && !((dst net 68.0.52.175/32) || (dst net 68.0.89.93/32) || (dst net 68.0.196.87/32) || (dst net 68.0.237.74/32) || (dst net 68.0.239.233/32))),
	((dst port 2980) || (dst port 22749) || (dst port 24014) || (dst port 34802) || (dst port 63839)) && ((dst net 69.0.0.0/8) && !((dst net 69.0.86.159/32) || (dst net 69.0.141.153/32) || (dst net 69.0.163.141/32) || (dst net 69.0.239.240/32) || (dst net 69.0.252.68/32))),
	((dst port 2022) || (dst port 28550) || (dst port 36381) || (dst port 51622) || (dst port 59228)) && ((dst net 70.0.0.0/8) && !((dst net 70.0.44.121/32) || (dst net 70.0.146.147/32) || (dst net 70.0.191.130/32) || (dst net 70.0.219.216/32) || (dst net 70.0.243.140/32))),
	((dst port 23047) || (dst port 24291) || (dst port 25410) || (dst port 34322) || (dst port 53634)) && ((dst net 71.0.0.0/8) && !((dst net 71.0.30.26/32) || (dst net 71.0.75.230/32) || (dst net 71.0.85.78/32) || (dst net 71.0.204.146/32) || (dst net 71.0.236.38/32))),
	((dst port 5932) || (dst port 8301) || (dst port 21257) || (dst port 24005) || (dst port 54846)) && ((dst net 72.0.0.0/8) && !((dst net 72.0.39.117/32) || (dst net 72.0.128.229/32) || (dst net 72.0.133.171/32) || (dst net 72.0.137.252/32) || (dst net 72.0.201.31/32))),
	((dst port 39754) || (dst port 42383) || (dst port 45056) || (dst port 58144) || (dst port 63922)) && ((dst net 73.0.0.0/8) && !((dst net 73.0.12.110/32) || (dst net 73.0.18.120/32) || (dst net 73.0.72.215/32) || (dst net 73.0.93.135/32) || (dst net 73.0.214.223/32))),
	((dst port 19141) || (dst port 28209) || (dst port 28869) || (dst port 50593) || (dst port 57366)) && ((dst net 74.0.0.0/8) && !((dst net 74.0.26.61/32) || (dst net 74.0.123.111/32) || (dst net 74.0.143.210/32) || (dst net 74.0.157.138/32) || (dst net 74.0.189.208/32))),
	((dst port 7198) || (dst port 8260) || (dst port 23761) || (dst port 31643) || (dst port 50986)) && ((dst net 75.0.0.0/8) && !((dst net 75.0.37.84/32) || (dst net 75.0.60.33/32) || (dst net 75.0.120.94/32) || (dst net 75.0.169.153/32) || (dst net 75.0.182.229/32))),
	((dst port 16798) || (dst port 17619) || (dst port 18332) || (dst port 23723) || (dst port 46295)) && ((dst net 76.0.0.0/8) && !((dst net 76.0.80.17/32) || (dst net 76.0.109.75/32) || (dst net 76.0.149.174/32) || (dst net 76.0.198.215/32) || (dst net 76.0.240.0/32))),
	((dst port 17230) || (dst port 17467) || (dst port 30970) || (dst port 42089) || (dst port 52097)) && ((dst net 77.0.0.0/8) && !((dst net 77.0.36.226/32) || (dst net 77.0.138.143/32) || (dst net 77.0.143.40/32) || (dst net 77.0.190.17/32) || (dst net 77.0.212.163/32))),
	((dst port 20778) || (dst port 27229) || (dst port 30826) || (dst port 40313) || (dst port 54419)) && ((dst net 78.0.0.0/8) && !((dst net 78.0.71.187/32) || (dst net 78.0.74.98/32) || (dst net 78.0.76.153/32) || (dst net 78.0.164.57/32) || (dst net 78.0.190.66/32))),
	((dst port 11104) || (dst port 22683) || (dst port 41590) || (dst port 42181) || (dst port 47185)) && ((dst net 79.0.0.0/8) && !((dst net 79.0.33.241/32) || (dst net 79.0.83.98/32) || (dst net 79.0.96.74/32) || (dst net 79.0.132.190/32) || (dst net 79.0.211.93/32))),
	((dst port 4999) || (dst port 7528) || (dst port 7539) || (dst port 29737) || (dst port 35229)) && ((dst net 80.0.0.0/8) && !((dst net 80.0.83.65/32) || (dst net 80.0.87.164/32) || (dst net 80.0.193.174/32) || (dst net 80.0.198.196/32) || (dst net 80.0.202.9/32))),
	((dst port 7549) || (dst port 14601) || (dst port 29709) || (dst port 60992) || (dst port 63138)) && ((dst net 81.0.0.0/8) && !((dst net 81.0.2.96/32) || (dst net 81.0.85.251/32) || (dst net 81.0.94.55/32) || (dst net 81.0.105.4/32) || (dst net 81.0.198.86/32))),
	((dst port 17195) || (dst port 24028) || (dst port 41904) || (dst port 53732) || (dst port 64456)) && ((dst net 82.0.0.0/8) && !((dst net 82.0.131.109/32) || (dst net 82.0.148.21/32) || (dst net 82.0.149.139/32) || (dst net 82.0.227.246/32) || (dst net 82.0.239.4/32))),
	((dst port 19792) || (dst port 22142) || (dst port 41636) || (dst port 43599) || (dst port 58484)) && ((dst net 83.0.0.0/8) && !((dst net 83.0.70.178/32) || (dst net 83.0.71.148/32) || (dst net 83.0.77.172/32) || (dst net 83.0.149.247/32) || (dst net 83.0.157.239/32))),
	((dst port 22764) || (dst port 27076) || (dst port 47908) || (dst port 54546) || (dst port 65473)) && ((dst net 84.0.0.0/8) && !((dst net 84.0.53.82/32) || (dst net 84.0.68.81/32) || (dst net 84.0.72.108/32) || (dst net 84.0.149.42/32) || (dst net 84.0.164.96/32))),
	((dst port 20629) || (dst port 43778) || (dst port 50189) || (dst port 61443) || (dst port 62560)) && ((dst net 85.0.0.0/8) && !((dst net 85.0.21.22/32) || (dst net 85.0.23.112/32) || (dst net 85.0.140.183/32) || (dst net 85.0.192.241/32) || (dst net 85.0.193.230/32))),
	((dst port 825) || (dst port 8093) || (dst port 37337) || (dst port 53122) || (dst port 53622)) && ((dst net 86.0.0.0/8) && !((dst net 86.0.50.118/32) || (dst net 86.0.63.43/32) || (dst net 86.0.108.185/32) || (dst net 86.0.112.91/32) || (dst net 86.0.209.5/32))),
	((dst port 13612) || (dst port 37858) || (dst port 44766) || (dst port 50700) || (dst port 65295)) && ((dst net 87.0.0.0/8) && !((dst net 87.0.104.55/32) || (dst net 87.0.191.188/32) || (dst net 87.0.195.66/32) || (dst net 87.0.220.80/32) || (dst net 87.0.248.68/32))),
	((dst port 9054) || (dst port 42897) || (dst port 43353) || (dst port 59155) || (dst port 63033)) && ((dst net 88.0.0.0/8) && !((dst net 88.0.38.212/32) || (dst net 88.0.45.112/32) || (dst net 88.0.73.183/32) || (dst net 88.0.216.119/32) || (dst net 88.0.239.134/32))),
	((dst port 20013) || (dst port 30149) || (dst port 34310) || (dst port 50358) || (dst port 52114)) && ((dst net 89.0.0.0/8) && !((dst net 89.0.16.250/32) || (dst net 89.0.139.91/32) || (dst net 89.0.205.82/32) || (dst net 89.0.207.129/32) || (dst net 89.0.217.221/32))),
	((dst port 17285) || (dst port 43308) || (dst port 45194) || (dst port 57700) || (dst port 61965)) && ((dst net 90.0.0.0/8) && !((dst net 90.0.33.220/32) || (dst net 90.0.144.172/32) || (dst net 90.0.208.65/32) || (dst net 90.0.243.166/32) || (dst net 90.0.248.69/32))),
	((dst port 6424) || (dst port 27386) || (dst port 34650) || (dst port 51484) || (dst port 59975)) && ((dst net 91.0.0.0/8) && !((dst net 91.0.10.244/32) || (dst net 91.0.11.159/32) || (dst net 91.0.27.79/32) || (dst net 91.0.78.210/32) || (dst net 91.0.240.230/32))),
	((dst port 9359) || (dst port 16954) || (dst port 17328) || (dst port 17408) || (dst port 61662)) && ((dst net 92.0.0.0/8) && !((dst net 92.0.54.98/32) || (dst net 92.0.77.24/32) || (dst net 92.0.107.46/32) || (dst net 92.0.110.18/32) || (dst net 92.0.111.109/32))),
	((dst port 2368) || (dst port 17591) || (dst port 19376) || (dst port 29756) || (dst port 62055)) && ((dst net 93.0.0.0/8) && !((dst net 93.0.2.115/32) || (dst net 93.0.25.158/32) || (dst net 93.0.181.62/32) || (dst net 93.0.208.174/32) || (dst net 93.0.228.254/32))),
	((dst port 6061) || (dst port 8707) || (dst port 14334) || (dst port 22578) || (dst port 64586)) && ((dst net 94.0.0.0/8) && !((dst net 94.0.20.57/32) || (dst net 94.0.121.43/32) || (dst net 94.0.142.252/32) || (dst net 94.0.192.45/32) || (dst net 94.0.208.20/32))),
	((dst port 3730) || (dst port 14997) || (dst port 23619) || (dst port 25990) || (dst port 43733)) && ((dst net 95.0.0.0/8) && !((dst net 95.0.6.63/32) || (dst net 95.0.73.254/32) || (dst net 95.0.105.19/32) || (dst net 95.0.132.181/32) || (dst net 95.0.204.73/32))),
	((dst port 869) || (dst port 11473) || (dst port 15472) || (dst port 21654) || (dst port 56126)) && ((dst net 96.0.0.0/8) && !((dst net 96.0.16.175/32) || (dst net 96.0.35.20/32) || (dst net 96.0.135.184/32) || (dst net 96.0.230.251/32) || (dst net 96.0.242.197/32))),
	((dst port 10722) || (dst port 23014) || (dst port 54811) || (dst port 59326) || (dst port 65245)) && ((dst net 97.0.0.0/8) && !((dst net 97.0.75.249/32) || (dst net 97.0.128.63/32) || (dst net 97.0.153.69/32) || (dst net 97.0.171.72/32) || (dst net 97.0.199.222/32))),
	((dst port 6176) || (dst port 12568) || (dst port 24038) || (dst port 34513) || (dst port 65422)) && ((dst net 98.0.0.0/8) && !((dst net 98.0.88.23/32) || (dst net 98.0.94.63/32) || (dst net 98.0.126.193/32) || (dst net 98.0.163.204/32) || (dst net 98.0.173.186/32))),
	((dst port 10261) || (dst port 13628) || (dst port 16208) || (dst port 37942) || (dst port 41923)) && ((dst net 99.0.0.0/8) && !((dst net 99.0.62.249/32) || (dst net 99.0.67.152/32) || (dst net 99.0.109.13/32) || (dst net 99.0.142.237/32) || (dst net 99.0.230.131/32))),
	((dst port 8297) || (dst port 15127) || (dst port 21649) || (dst port 53680) || (dst port 57411)) && ((dst net 100.0.0.0/8) && !((dst net 100.0.68.88/32) || (dst net 100.0.148.172/32) || (dst net 100.0.155.126/32) || (dst net 100.0.243.222/32) || (dst net 100.0.251.40/32))),
	((dst port 1014) || (dst port 1083) || (dst port 10169) || (dst port 45640) || (dst port 60943)) && ((dst net 101.0.0.0/8) && !((dst net 101.0.17.94/32) || (dst net 101.0.99.13/32) || (dst net 101.0.147.64/32) || (dst net 101.0.194.247/32) || (dst net 101.0.234.224/32))),
	((dst port 15130) || (dst port 16796) || (dst port 18660) || (dst port 24563) || (dst port 27265)) && ((dst net 102.0.0.0/8) && !((dst net 102.0.19.243/32) || (dst net 102.0.91.68/32) || (dst net 102.0.156.124/32) || (dst net 102.0.176.21/32) || (dst net 102.0.231.17/32))),
	((dst port 4688) || (dst port 26375) || (dst port 54244) || (dst port 56222) || (dst port 58080)) && ((dst net 103.0.0.0/8) && !((dst net 103.0.51.138/32) || (dst net 103.0.62.167/32) || (dst net 103.0.66.197/32) || (dst net 103.0.132.144/32) || (dst net 103.0.172.196/32))),
	((dst port 4753) || (dst port 5800) || (dst port 30781) || (dst port 54261) || (dst port 56159)) && ((dst net 104.0.0.0/8) && !((dst net 104.0.59.28/32) || (dst net 104.0.135.78/32) || (dst net 104.0.163.31/32) || (dst net 104.0.202.184/32) || (dst net 104.0.251.191/32))),
	((dst port 3976) || (dst port 20849) || (dst port 43520) || (dst port 46255) || (dst port 51607)) && ((dst net 105.0.0.0/8) && !((dst net 105.0.0.254/32) || (dst net 105.0.17.102/32) || (dst net 105.0.63.210/32) || (dst net 105.0.66.35/32) || (dst net 105.0.95.60/32))),
	((dst port 20802) || (dst port 27426) || (dst port 33421) || (dst port 34179) || (dst port 46116)) && ((dst net 106.0.0.0/8) && !((dst net 106.0.95.22/32) || (dst net 106.0.141.4/32) || (dst net 106.0.154.219/32) || (dst net 106.0.214.242/32) || (dst net 106.0.221.252/32))),
	((dst port 15463) || (dst port 24267) || (dst port 30230) || (dst port 42536) || (dst port 51639)) && ((dst net 107.0.0.0/8) && !((dst net 107.0.8.228/32) || (dst net 107.0.10.24/32) || (dst net 107.0.165.139/32) || (dst net 107.0.214.111/32) || (dst net 107.0.222.220/32))),
	((dst port 1345) || (dst port 28189) || (dst port 54933) || (dst port 59325) || (dst port 61119)) && ((dst net 108.0.0.0/8) && !((dst net 108.0.55.78/32) || (dst net 108.0.98.12/32) || (dst net 108.0.111.152/32) || (dst net 108.0.163.184/32) || (dst net 108.0.232.186/32))),
	((dst port 5706) || (dst port 34930) || (dst port 37893) || (dst port 50520) || (dst port 58573)) && ((dst net 109.0.0.0/8) && !((dst net 109.0.31.169/32) || (dst net 109.0.46.115/32) || (dst net 109.0.61.118/32) || (dst net 109.0.112.110/32) || (dst net 109.0.118.252/32))),
	((dst port 13629) || (dst port 22646) || (dst port 36491) || (dst port 36610) || (dst port 43153)) && ((dst net 110.0.0.0/8) && !((dst net 110.0.39.105/32) || (dst net 110.0.97.249/32) || (dst net 110.0.111.180/32) || (dst net 110.0.137.178/32) || (dst net 110.0.243.196/32))),
	((dst port 25792) || (dst port 34246) || (dst port 34512) || (dst port 41653) || (dst port 42350)) && ((dst net 111.0.0.0/8) && !((dst net 111.0.81.131/32) || (dst net 111.0.126.108/32) || (dst net 111.0.133.91/32) || (dst net 111.0.199.237/32) || (dst net 111.0.253.7/32))),
	((dst port 4363) || (dst port 23828) || (dst port 33640) || (dst port 44112) || (dst port 58862)) && ((dst net 112.0.0.0/8) && !((dst net 112.0.54.127/32) || (dst net 112.0.99.244/32) || (dst net 112.0.137.86/32) || (dst net 112.0.218.154/32) || (dst net 112.0.236.160/32))),
	((dst port 11687) || (dst port 14625) || (dst port 18903) || (dst port 41660) || (dst port 46299)) && ((dst net 113.0.0.0/8) && !((dst net 113.0.48.230/32) || (dst net 113.0.75.177/32) || (dst net 113.0.103.169/32) || (dst net 113.0.105.105/32) || (dst net 113.0.139.120/32))),
	((dst port 20663) || (dst port 27578) || (dst port 28756) || (dst port 40863) || (dst port 63643)) && ((dst net 114.0.0.0/8) && !((dst net 114.0.80.159/32) || (dst net 114.0.82.199/32) || (dst net 114.0.97.219/32) || (dst net 114.0.199.54/32) || (dst net 114.0.243.157/32))),
	((dst port 191) || (dst port 24899) || (dst port 29105) || (dst port 33127) || (dst port 60796)) && ((dst net 115.0.0.0/8) && !((dst net 115.0.12.209/32) || (dst net 115.0.20.109/32) || (dst net 115.0.41.5/32) || (dst net 115.0.51.17/32) || (dst net 115.0.148.162/32))),
	((dst port 16066) || (dst port 19672) || (dst port 22642) || (dst port 24310) || (dst port 43421)) && ((dst net 116.0.0.0/8) && !((dst net 116.0.56.63/32) || (dst net 116.0.80.9/32) || (dst net 116.0.193.176/32) || (dst net 116.0.224.2/32) || (dst net 116.0.228.56/32))),
	((dst port 5978) || (dst port 20156) || (dst port 37845) || (dst port 52310) || (dst port 62873)) && ((dst net 117.0.0.0/8) && !((dst net 117.0.7.231/32) || (dst net 117.0.68.147/32) || (dst net 117.0.149.238/32) || (dst net 117.0.215.126/32) || (dst net 117.0.253.253/32))),
	((dst port 28011) || (dst port 31337) || (dst port 35601) || (dst port 58935) || (dst port 58961)) && ((dst net 118.0.0.0/8) && !((dst net 118.0.45.43/32) || (dst net 118.0.110.44/32) || (dst net 118.0.225.176/32) || (dst net 118.0.245.123/32) || (dst net 118.0.247.172/32))),
	((dst port 1000) || (dst port 31791) || (dst port 34952) || (dst port 38702) || (dst port 60380)) && ((dst net 119.0.0.0/8) && !((dst net 119.0.29.216/32) || (dst net 119.0.56.178/32) || (dst net 119.0.97.59/32) || (dst net 119.0.97.115/32) || (dst net 119.0.202.246/32))),
	((dst port 28657) || (dst port 35242) || (dst port 52421) || (dst port 55387) || (dst port 56272)) && ((dst net 120.0.0.0/8) && !((dst net 120.0.108.71/32) || (dst net 120.0.119.39/32) || (dst net 120.0.154.184/32) || (dst net 120.0.161.164/32) || (dst net 120.0.245.106/32))),
	((dst port 31045) || (dst port 37540) || (dst port 38157) || (dst port 57316) || (dst port 62694)) && ((dst net 121.0.0.0/8) && !((dst net 121.0.59.86/32) || (dst net 121.0.123.174/32) || (dst net 121.0.170.40/32) || (dst net 121.0.185.154/32) || (dst net 121.0.216.246/32))),
	((dst port 7786) || (dst port 29875) || (dst port 33402) || (dst port 58590) || (dst port 59659)) && ((dst net 122.0.0.0/8) && !((dst net 122.0.22.44/32) || (dst net 122.0.52.249/32) || (dst net 122.0.202.73/32) || (dst net 122.0.204.180/32) || (dst net 122.0.253.204/32))),
	((dst port 7872) || (dst port 22901) || (dst port 49208) || (dst port 53488) || (dst port 63755)) && ((dst net 123.0.0.0/8) && !((dst net 123.0.20.231/32) || (dst net 123.0.56.22/32) || (dst net 123.0.99.225/32) || (dst net 123.0.109.22/32) || (dst net 123.0.163.170/32))),
	((dst port 14431) || (dst port 20731) || (dst port 40843) || (dst port 48750) || (dst port 51466)) && ((dst net 124.0.0.0/8) && !((dst net 124.0.15.144/32) || (dst net 124.0.41.155/32) || (dst net 124.0.82.159/32) || (dst net 124.0.157.14/32) || (dst net 124.0.181.10/32))),
	((dst port 4632) || (dst port 18556) || (dst port 22695) || (dst port 46281) || (dst port 59611)) && ((dst net 125.0.0.0/8) && !((dst net 125.0.7.139/32) || (dst net 125.0.21.185/32) || (dst net 125.0.68.233/32) || (dst net 125.0.111.196/32) || (dst net 125.0.128.214/32))),
	((dst port 2030) || (dst port 9078) || (dst port 43746) || (dst port 46275) || (dst port 47088)) && ((dst net 126.0.0.0/8) && !((dst net 126.0.37.88/32) || (dst net 126.0.158.93/32) || (dst net 126.0.162.36/32) || (dst net 126.0.172.67/32) || (dst net 126.0.212.34/32))),
	((dst port 26140) || (dst port 36310) || (dst port 39288) || (dst port 44815) || (dst port 46034)) && ((dst net 127.0.0.0/8) && !((dst net 127.0.21.108/32) || (dst net 127.0.128.5/32) || (dst net 127.0.147.15/32) || (dst net 127.0.166.77/32) || (dst net 127.0.205.53/32))),
	((dst port 8270) || (dst port 14084) || (dst port 20771) || (dst port 43389) || (dst port 62512)) && ((dst net 128.0.0.0/8) && !((dst net 128.0.88.205/32) || (dst net 128.0.94.16/32) || (dst net 128.0.127.35/32) || (dst net 128.0.154.110/32) || (dst net 128.0.228.23/32))),
	((dst port 587) || (dst port 39223) || (dst port 42846) || (dst port 49050) || (dst port 56620)) && ((dst net 129.0.0.0/8) && !((dst net 129.0.6.161/32) || (dst net 129.0.87.118/32) || (dst net 129.0.103.54/32) || (dst net 129.0.218.112/32) || (dst net 129.0.232.91/32))),
	((dst port 41517) || (dst port 42077) || (dst port 47712) || (dst port 63677) || (dst port 64016)) && ((dst net 130.0.0.0/8) && !((dst net 130.0.25.164/32) || (dst net 130.0.67.130/32) || (dst net 130.0.112.168/32) || (dst net 130.0.218.164/32) || (dst net 130.0.240.20/32))),
	((dst port 5185) || (dst port 9509) || (dst port 37473) || (dst port 59100) || (dst port 60607)) && ((dst net 131.0.0.0/8) && !((dst net 131.0.28.33/32) || (dst net 131.0.146.108/32) || (dst net 131.0.214.54/32) || (dst net 131.0.239.117/32) || (dst net 131.0.248.49/32))),
	((dst port 29368) || (dst port 33624) || (dst port 43680) || (dst port 48776) || (dst port 56215)) && ((dst net 132.0.0.0/8) && !((dst net 132.0.5.136/32) || (dst net 132.0.19.103/32) || (dst net 132.0.90.51/32) || (dst net 132.0.168.14/32) || (dst net 132.0.217.249/32))),
	((dst port 11077) || (dst port 11360) || (dst port 18207) || (dst port 25172) || (dst port 55196)) && ((dst net 133.0.0.0/8) && !((dst net 133.0.11.30/32) || (dst net 133.0.45.252/32) || (dst net 133.0.75.99/32) || (dst net 133.0.75.177/32) || (dst net 133.0.216.244/32))),
	((dst port 13950) || (dst port 17218) || (dst port 30843) || (dst port 35155) || (dst port 39720)) && ((dst net 134.0.0.0/8) && !((dst net 134.0.3.254/32) || (dst net 134.0.26.219/32) || (dst net 134.0.56.89/32) || (dst net 134.0.82.186/32) || (dst net 134.0.87.87/32))),
	((dst port 3496) || (dst port 24469) || (dst port 47377) || (dst port 48615) || (dst port 58291)) && ((dst net 135.0.0.0/8) && !((dst net 135.0.118.101/32) || (dst net 135.0.154.208/32) || (dst net 135.0.165.104/32) || (dst net 135.0.193.51/32) || (dst net 135.0.251.243/32))),
	((dst port 10190) || (dst port 29676) || (dst port 34314) || (dst port 48014) || (dst port 48460)) && ((dst net 136.0.0.0/8) && !((dst net 136.0.10.211/32) || (dst net 136.0.49.43/32) || (dst net 136.0.147.64/32) || (dst net 136.0.182.224/32) || (dst net 136.0.210.210/32))),
	((dst port 19790) || (dst port 20108) || (dst port 22602) || (dst port 41267) || (dst port 57030)) && ((dst net 137.0.0.0/8) && !((dst net 137.0.1.244/32) || (dst net 137.0.22.73/32) || (dst net 137.0.61.250/32) || (dst net 137.0.77.116/32) || (dst net 137.0.222.14/32))),
	((dst port 17453) || (dst port 31617) || (dst port 40799) || (dst port 62245) || (dst port 64698)) && ((dst net 138.0.0.0/8) && !((dst net 138.0.68.165/32) || (dst net 138.0.94.121/32) || (dst net 138.0.152.11/32) || (dst net 138.0.173.226/32) || (dst net 138.0.185.105/32))),
	((dst port 2851) || (dst port 12882) || (dst port 12986) || (dst port 14935) || (dst port 52346)) && ((dst net 139.0.0.0/8) && !((dst net 139.0.144.25/32) || (dst net 139.0.153.191/32) || (dst net 139.0.154.190/32) || (dst net 139.0.164.54/32) || (dst net 139.0.252.65/32))),
	((dst port 3321) || (dst port 11734) || (dst port 17975) || (dst port 44138) || (dst port 57587)) && ((dst net 140.0.0.0/8) && !((dst net 140.0.8.237/32) || (dst net 140.0.17.206/32) || (dst net 140.0.52.83/32) || (dst net 140.0.65.170/32) || (dst net 140.0.67.5/32))),
	((dst port 16028) || (dst port 21171) || (dst port 21702) || (dst port 27075) || (dst port 35954)) && ((dst net 141.0.0.0/8) && !((dst net 141.0.31.57/32) || (dst net 141.0.50.161/32) || (dst net 141.0.195.247/32) || (dst net 141.0.238.128/32) || (dst net 141.0.254.159/32))),
	((dst port 2087) || (dst port 4406) || (dst port 26313) || (dst port 30531) || (dst port 37762)) && ((dst net 142.0.0.0/8) && !((dst net 142.0.50.249/32) || (dst net 142.0.85.59/32) || (dst net 142.0.121.196/32) || (dst net 142.0.140.52/32) || (dst net 142.0.168.11/32))),
	((dst port 7902) || (dst port 19735) || (dst port 30972) || (dst port 45999) || (dst port 52133)) && ((dst net 143.0.0.0/8) && !((dst net 143.0.11.86/32) || (dst net 143.0.29.137/32) || (dst net 143.0.55.104/32) || (dst net 143.0.84.245/32) || (dst net 143.0.121.135/32))),
	((dst port 22749) || (dst port 25291) || (dst port 33470) || (dst port 52024) || (dst port 60688)) && ((dst net 144.0.0.0/8) && !((dst net 144.0.38.230/32) || (dst net 144.0.63.181/32) || (dst net 144.0.73.81/32) || (dst net 144.0.123.239/32) || (dst net 144.0.158.180/32))),
	((dst port 19830) || (dst port 26402) || (dst port 36252) || (dst port 50254) || (dst port 62536)) && ((dst net 145.0.0.0/8) && !((dst net 145.0.34.2/32) || (dst net 145.0.74.140/32) || (dst net 145.0.191.90/32) || (dst net 145.0.218.137/32) || (dst net 145.0.236.14/32))),
	((dst port 1271) || (dst port 4644) || (dst port 6644) || (dst port 16658) || (dst port 58941)) && ((dst net 146.0.0.0/8) && !((dst net 146.0.3.93/32) || (dst net 146.0.98.246/32) || (dst net 146.0.127.151/32) || (dst net 146.0.182.80/32) || (dst net 146.0.221.253/32))),
	((dst port 8538) || (dst port 8571) || (dst port 24426) || (dst port 38580) || (dst port 50881)) && ((dst net 147.0.0.0/8) && !((dst net 147.0.1.54/32) || (dst net 147.0.43.28/32) || (dst net 147.0.102.114/32) || (dst net 147.0.183.80/32) || (dst net 147.0.190.80/32))),
	((dst port 2976) || (dst port 6560) || (dst port 25326) || (dst port 28680) || (dst port 64707)) && ((dst net 148.0.0.0/8) && !((dst net 148.0.49.124/32) || (dst net 148.0.96.6/32) || (dst net 148.0.103.235/32) || (dst net 148.0.185.101/32) || (dst net 148.0.193.108/32))),
	((dst port 7094) || (dst port 21403) || (dst port 34728) || (dst port 41515) || (dst port 53554)) && ((dst net 149.0.0.0/8) && !((dst net 149.0.125.95/32) || (dst net 149.0.151.84/32) || (dst net 149.0.152.158/32) || (dst net 149.0.214.196/32) || (dst net 149.0.222.141/32))),
	((dst port 14590) || (dst port 20699) || (dst port 41687) || (dst port 43998) || (dst port 50426)) && ((dst net 150.0.0.0/8) && !((dst net 150.0.32.68/32) || (dst net 150.0.68.239/32) || (dst net 150.0.69.186/32) || (dst net 150.0.198.16/32) || (dst net 150.0.252.149/32))),
	((dst port 262) || (dst port 2734) || (dst port 17977) || (dst port 24042) || (dst port 34771)) && ((dst net 151.0.0.0/8) && !((dst net 151.0.68.45/32) || (dst net 151.0.154.103/32) || (dst net 151.0.170.154/32) || (dst net 151.0.179.78/32) || (dst net 151.0.218.43/32))),
	((dst port 16047) || (dst port 21000) || (dst port 32210) || (dst port 41655) || (dst port 44111)) && ((dst net 152.0.0.0/8) && !((dst net 152.0.58.244/32) || (dst net 152.0.131.162/32) || (dst net 152.0.176.172/32) || (dst net 152.0.196.83/32) || (dst net 152.0.218.15/32))),
	((dst port 16832) || (dst port 20111) || (dst port 34361) || (dst port 38352) || (dst port 62572)) && ((dst net 153.0.0.0/8) && !((dst net 153.0.28.150/32) || (dst net 153.0.79.198/32) || (dst net 153.0.97.35/32) || (dst net 153.0.124.41/32) || (dst net 153.0.198.76/32))),
	((dst port 737) || (dst port 4734) || (dst port 7079) || (dst port 49155) || (dst port 56007)) && ((dst net 154.0.0.0/8) && !((dst net 154.0.67.148/32) || (dst net 154.0.150.218/32) || (dst net 154.0.170.102/32) || (dst net 154.0.228.29/32) || (dst net 154.0.231.97/32))),
	((dst port 12248) || (dst port 28811) || (dst port 35055) || (dst port 35556) || (dst port 56706)) && ((dst net 155.0.0.0/8) && !((dst net 155.0.47.82/32) || (dst net 155.0.138.220/32) || (dst net 155.0.161.50/32) || (dst net 155.0.162.203/32) || (dst net 155.0.186.64/32))),
	((dst port 3173) || (dst port 35792) || (dst port 48275) || (dst port 50486) || (dst port 61419)) && ((dst net 156.0.0.0/8) && !((dst net 156.0.37.223/32) || (dst net 156.0.95.68/32) || (dst net 156.0.110.215/32) || (dst net 156.0.117.32/32) || (dst net 156.0.195.96/32))),
	((dst port 3153) || (dst port 7079) || (dst port 28059) || (dst port 52861) || (dst port 57137)) && ((dst net 157.0.0.0/8) && !((dst net 157.0.46.69/32) || (dst net 157.0.131.204/32) || (dst net 157.0.147.141/32) || (dst net 157.0.216.169/32) || (dst net 157.0.221.201/32))),
	((dst port 4651) || (dst port 5590) || (dst port 36040) || (dst port 50069) || (dst port 61746)) && ((dst net 158.0.0.0/8) && !((dst net 158.0.69.92/32) || (dst net 158.0.107.213/32) || (dst net 158.0.163.234/32) || (dst net 158.0.164.62/32) || (dst net 158.0.195.14/32))),
	((dst port 1019) || (dst port 18348) || (dst port 26832) || (dst port 27655) || (dst port 31765)) && ((dst net 159.0.0.0/8) && !((dst net 159.0.70.217/32) || (dst net 159.0.101.163/32) || (dst net 159.0.159.195/32) || (dst net 159.0.167.142/32) || (dst net 159.0.183.95/32))),
	((dst port 11476) || (dst port 14087) || (dst port 47529) || (dst port 50299) || (dst port 54341)) && ((dst net 160.0.0.0/8) && !((dst net 160.0.33.61/32) || (dst net 160.0.35.189/32) || (dst net 160.0.88.161/32) || (dst net 160.0.153.59/32) || (dst net 160.0.185.71/32))),
	((dst port 41610) || (dst port 49140) || (dst port 55551) || (dst port 60225) || (dst port 65400)) && ((dst net 161.0.0.0/8) && !((dst net 161.0.23.236/32) || (dst net 161.0.83.79/32) || (dst net 161.0.88.190/32) || (dst net 161.0.141.39/32) || (dst net 161.0.155.68/32))),
	((dst port 34470) || (dst port 49147) || (dst port 56276) || (dst port 60916) || (dst port 61862)) && ((dst net 162.0.0.0/8) && !((dst net 162.0.137.80/32) || (dst net 162.0.154.142/32) || (dst net 162.0.183.89/32) || (dst net 162.0.210.234/32) || (dst net 162.0.249.170/32))),
	((dst port 16126) || (dst port 31547) || (dst port 35054) || (dst port 38677) || (dst port 50148)) && ((dst net 163.0.0.0/8) && !((dst net 163.0.31.12/32) || (dst net 163.0.82.88/32) || (dst net 163.0.159.182/32) || (dst net 163.0.229.67/32) || (dst net 163.0.232.226/32))),
	((dst port 8533) || (dst port 16367) || (dst port 21882) || (dst port 22793) || (dst port 50500)) && ((dst net 164.0.0.0/8) && !((dst net 164.0.34.242/32) || (dst net 164.0.49.36/32) || (dst net 164.0.60.141/32) || (dst net 164.0.93.49/32) || (dst net 164.0.96.97/32))),
	((dst port 8511) || (dst port 14000) || (dst port 30447) || (dst port 32621) || (dst port 43924)) && ((dst net 165.0.0.0/8) && !((dst net 165.0.36.238/32) || (dst net 165.0.100.78/32) || (dst net 165.0.148.110/32) || (dst net 165.0.157.219/32) || (dst net 165.0.176.245/32))),
	((dst port 3343) || (dst port 14315) || (dst port 31023) || (dst port 40356) || (dst port 64276)) && ((dst net 166.0.0.0/8) && !((dst net 166.0.42.148/32) || (dst net 166.0.64.87/32) || (dst net 166.0.128.78/32) || (dst net 166.0.179.153/32) || (dst net 166.0.217.126/32))),
	((dst port 7895) || (dst port 20113) || (dst port 22926) || (dst port 54047) || (dst port 55429)) && ((dst net 167.0.0.0/8) && !((dst net 167.0.20.247/32) || (dst net 167.0.98.215/32) || (dst net 167.0.111.207/32) || (dst net 167.0.140.185/32) || (dst net 167.0.169.235/32))),
	((dst port 15899) || (dst port 16928) || (dst port 22478) || (dst port 27600) || (dst port 42610)) && ((dst net 168.0.0.0/8) && !((dst net 168.0.30.173/32) || (dst net 168.0.69.20/32) || (dst net 168.0.86.228/32) || (dst net 168.0.111.116/32) || (dst net 168.0.227.60/32))),
	((dst port 6439) || (dst port 8310) || (dst port 15881) || (dst port 29079) || (dst port 56320)) && ((dst net 169.0.0.0/8) && !((dst net 169.0.18.171/32) || (dst net 169.0.136.40/32) || (dst net 169.0.138.186/32) || (dst net 169.0.159.250/32) || (dst net 169.0.243.175/32))),
	((dst port 11290) || (dst port 35229) || (dst port 45100) || (dst port 48346) || (dst port 63170)) && ((dst net 170.0.0.0/8) && !((dst net 170.0.34.144/32) || (dst net 170.0.48.80/32) || (dst net 170.0.59.139/32) || (dst net 170.0.117.31/32) || (dst net 170.0.210.183/32))),
	((dst port 5204) || (dst port 19503) || (dst port 40322) || (dst port 41935) || (dst port 51202)) && ((dst net 171.0.0.0/8) && !((dst net 171.0.22.215/32) || (dst net 171.0.121.198/32) || (dst net 171.0.141.105/32) || (dst net 171.0.157.237/32) || (dst net 171.0.209.141/32))),
	((dst port 26398) || (dst port 40887) || (dst port 50275) || (dst port 54068) || (dst port 56657)) && ((dst net 172.0.0.0/8) && !((dst net 172.0.30.58/32) || (dst net 172.0.106.57/32) || (dst net 172.0.162.242/32) || (dst net 172.0.164.133/32) || (dst net 172.0.217.66/32))),
	((dst port 13573) || (dst port 33830) || (dst port 43921) || (dst port 58791) || (dst port 63235)) && ((dst net 173.0.0.0/8) && !((dst net 173.0.87.43/32) || (dst net 173.0.99.190/32) || (dst net 173.0.162.70/32) || (dst net 173.0.189.9/32) || (dst net 173.0.190.175/32))),
	((dst port 15930) || (dst port 20489) || (dst port 35263) || (dst port 39538) || (dst port 43711)) && ((dst net 174.0.0.0/8) && !((dst net 174.0.40.9/32) || (dst net 174.0.101.208/32) || (dst net 174.0.104.78/32) || (dst net 174.0.121.82/32) || (dst net 174.0.207.34/32))),
	((dst port 21356) || (dst port 22729) || (dst port 41054) || (dst port 48016) || (dst port 63325)) && ((dst net 175.0.0.0/8) && !((dst net 175.0.65.17/32) || (dst net 175.0.94.123/32) || (dst net 175.0.179.10/32) || (dst net 175.0.218.185/32) || (dst net 175.0.254.191/32))),
	((dst port 9556) || (dst port 13788) || (dst port 41513) || (dst port 53438) || (dst port 61100)) && ((dst net 176.0.0.0/8) && !((dst net 176.0.30.31/32) || (dst net 176.0.112.82/32) || (dst net 176.0.113.3/32) || (dst net 176.0.113.241/32) || (dst net 176.0.232.13/32))),
	((dst port 14399) || (dst port 24296) || (dst port 32066) || (dst port 47219) || (dst port 51045)) && ((dst net 177.0.0.0/8) && !((dst net 177.0.95.190/32) || (dst net 177.0.138.119/32) || (dst net 177.0.141.233/32) || (dst net 177.0.242.41/32) || (dst net 177.0.252.162/32))),
	((dst port 290) || (dst port 4222) || (dst port 61591) || (dst port 63128) || (dst port 63755)) && ((dst net 178.0.0.0/8) && !((dst net 178.0.10.175/32) || (dst net 178.0.114.190/32) || (dst net 178.0.122.21/32) || (dst net 178.0.193.122/32) || (dst net 178.0.255.254/32))),
	((dst port 10594) || (dst port 12855) || (dst port 16378) || (dst port 26380) || (dst port 63367)) && ((dst net 179.0.0.0/8) && !((dst net 179.0.73.93/32) || (dst net 179.0.131.2/32) || (dst net 179.0.158.111/32) || (dst net 179.0.207.173/32) || (dst net 179.0.232.93/32))),
	((dst port 12449) || (dst port 13756) || (dst port 40726) || (dst port 47620) || (dst port 47981)) && ((dst net 180.0.0.0/8) && !((dst net 180.0.126.61/32) || (dst net 180.0.163.143/32) || (dst net 180.0.173.207/32) || (dst net 180.0.194.67/32) || (dst net 180.0.205.122/32))),
	((dst port 6031) || (dst port 16248) || (dst port 24192) || (dst port 50563) || (dst port 55467)) && ((dst net 181.0.0.0/8) && !((dst net 181.0.111.216/32) || (dst net 181.0.132.88/32) || (dst net 181.0.134.250/32) || (dst net 181.0.173.37/32) || (dst net 181.0.239.23/32))),
	((dst port 11514) || (dst port 30774) || (dst port 55280) || (dst port 61526) || (dst port 63677)) && ((dst net 182.0.0.0/8) && !((dst net 182.0.98.183/32) || (dst net 182.0.100.20/32) || (dst net 182.0.106.82/32) || (dst net 182.0.176.198/32) || (dst net 182.0.225.113/32))),
	((dst port 14041) || (dst port 29111) || (dst port 30434) || (dst port 41702) || (dst port 61921)) && ((dst net 183.0.0.0/8) && !((dst net 183.0.28.31/32) || (dst net 183.0.33.42/32) || (dst net 183.0.64.38/32) || (dst net 183.0.97.109/32) || (dst net 183.0.98.196/32))),
	((dst port 21834) || (dst port 30060) || (dst port 50421) || (dst port 52556) || (dst port 52575)) && ((dst net 184.0.0.0/8) && !((dst net 184.0.35.233/32) || (dst net 184.0.42.225/32) || (dst net 184.0.67.119/32) || (dst net 184.0.182.73/32) || (dst net 184.0.186.178/32))),
	((dst port 17235) || (dst port 31057) || (dst port 42048) || (dst port 42444) || (dst port 65312)) && ((dst net 185.0.0.0/8) && !((dst net 185.0.6.238/32) || (dst net 185.0.9.25/32) || (dst net 185.0.21.234/32) || (dst net 185.0.66.246/32) || (dst net 185.0.202.46/32))),
	((dst port 3492) || (dst port 11468) || (dst port 47182) || (dst port 48358) || (dst port 53937)) && ((dst net 186.0.0.0/8) && !((dst net 186.0.37.102/32) || (dst net 186.0.65.158/32) || (dst net 186.0.149.202/32) || (dst net 186.0.191.157/32) || (dst net 186.0.245.234/32))),
	((dst port 17146) || (dst port 18504) || (dst port 18895) || (dst port 41764) || (dst port 57950)) && ((dst net 187.0.0.0/8) && !((dst net 187.0.19.220/32) || (dst net 187.0.63.237/32) || (dst net 187.0.97.60/32) || (dst net 187.0.184.185/32) || (dst net 187.0.206.31/32))),
	((dst port 10339) || (dst port 20574) || (dst port 41492) || (dst port 44746) || (dst port 46287)) && ((dst net 188.0.0.0/8) && !((dst net 188.0.93.67/32) || (dst net 188.0.186.72/32) || (dst net 188.0.208.52/32) || (dst net 188.0.209.116/32) || (dst net 188.0.221.93/32))),
	((dst port 3065) || (dst port 6325) || (dst port 11453) || (dst port 15825) || (dst port 33798)) && ((dst net 189.0.0.0/8) && !((dst net 189.0.98.72/32) || (dst net 189.0.107.94/32) || (dst net 189.0.175.196/32) || (dst net 189.0.193.20/32) || (dst net 189.0.221.179/32))),
	((dst port 993) || (dst port 13644) || (dst port 25121) || (dst port 28030) || (dst port 48027)) && ((dst net 190.0.0.0/8) && !((dst net 190.0.99.239/32) || (dst net 190.0.146.10/32) || (dst net 190.0.149.177/32) || (dst net 190.0.175.22/32) || (dst net 190.0.185.162/32))),
	((dst port 8929) || (dst port 46552) || (dst port 57254) || (dst port 59290) || (dst port 62063)) && ((dst net 191.0.0.0/8) && !((dst net 191.0.15.249/32) || (dst net 191.0.42.118/32) || (dst net 191.0.82.229/32) || (dst net 191.0.179.253/32) || (dst net 191.0.193.193/32))),
	((dst port 19044) || (dst port 27313) || (dst port 28108) || (dst port 46446) || (dst port 63064)) && ((dst net 192.0.0.0/8) && !((dst net 192.0.80.46/32) || (dst net 192.0.182.9/32) || (dst net 192.0.226.188/32) || (dst net 192.0.231.161/32) || (dst net 192.0.244.254/32))),
	((dst port 1598) || (dst port 18183) || (dst port 45016) || (dst port 51814) || (dst port 58589)) && ((dst net 193.0.0.0/8) && !((dst net 193.0.2.255/32) || (dst net 193.0.7.137/32) || (dst net 193.0.207.52/32) || (dst net 193.0.221.83/32) || (dst net 193.0.248.134/32))),
	((dst port 2019) || (dst port 22431) || (dst port 25176) || (dst port 29819) || (dst port 65289)) && ((dst net 194.0.0.0/8) && !((dst net 194.0.32.179/32) || (dst net 194.0.42.64/32) || (dst net 194.0.167.114/32) || (dst net 194.0.212.28/32) || (dst net 194.0.222.90/32))),
	((dst port 4025) || (dst port 36981) || (dst port 38910) || (dst port 47380) || (dst port 51453)) && ((dst net 195.0.0.0/8) && !((dst net 195.0.46.3/32) || (dst net 195.0.110.41/32) || (dst net 195.0.127.207/32) || (dst net 195.0.206.75/32) || (dst net 195.0.243.48/32))),
	((dst port 2475) || (dst port 15111) || (dst port 42087) || (dst port 50075) || (dst port 57918)) && ((dst net 196.0.0.0/8) && !((dst net 196.0.6.175/32) || (dst net 196.0.95.92/32) || (dst net 196.0.133.212/32) || (dst net 196.0.145.56/32) || (dst net 196.0.222.199/32))),
	((dst port 2273) || (dst port 19743) || (dst port 30420) || (dst port 45898) || (dst port 61114)) && ((dst net 197.0.0.0/8) && !((dst net 197.0.53.74/32) || (dst net 197.0.122.84/32) || (dst net 197.0.135.68/32) || (dst net 197.0.208.179/32) || (dst net 197.0.252.140/32))),
	((dst port 14235) || (dst port 14526) || (dst port 14670) || (dst port 15895) || (dst port 41089)) && ((dst net 198.0.0.0/8) && !((dst net 198.0.60.52/32) || (dst net 198.0.106.115/32) || (dst net 198.0.116.24/32) || (dst net 198.0.136.245/32) || (dst net 198.0.172.165/32))),
	((dst port 13944) || (dst port 19194) || (dst port 21886) || (dst port 51031) || (dst port 63066)) && ((dst net 199.0.0.0/8) && !((dst net 199.0.8.253/32) || (dst net 199.0.32.123/32) || (dst net 199.0.36.30/32) || (dst net 199.0.122.226/32) || (dst net 199.0.130.29/32))),
	((dst port 364) || (dst port 26238) || (dst port 32493) || (dst port 47477) || (dst port 55068)) && ((dst net 200.0.0.0/8) && !((dst net 200.0.29.132/32) || (dst net 200.0.72.22/32) || (dst net 200.0.177.174/32) || (dst net 200.0.191.218/32) || (dst net 200.0.228.99/32))),
	((dst port 10947) || (dst port 25280) || (dst port 27485) || (dst port 30636) || (dst port 41277)) && ((dst net 201.0.0.0/8) && !((dst net 201.0.57.189/32) || (dst net 201.0.149.138/32) || (dst net 201.0.165.2/32) || (dst net 201.0.188.24/32) || (dst net 201.0.217.39/32))),
	((dst port 358) || (dst port 4515) || (dst port 13516) || (dst port 16440) || (dst port 65382)) && ((dst net 202.0.0.0/8) && !((dst net 202.0.78.142/32) || (dst net 202.0.88.239/32) || (dst net 202.0.92.13/32) || (dst net 202.0.155.87/32) || (dst net 202.0.155.195/32))),
	((dst port 24595) || (dst port 32768) || (dst port 33497) || (dst port 56927) || (dst port 60579)) && ((dst net 203.0.0.0/8) && !((dst net 203.0.6.26/32) || (dst net 203.0.30.218/32) || (dst net 203.0.110.167/32) || (dst net 203.0.122.48/32) || (dst net 203.0.152.94/32))),
	((dst port 5645) || (dst port 16477) || (dst port 41300) || (dst port 41685) || (dst port 56350)) && ((dst net 204.0.0.0/8) && !((dst net 204.0.78.151/32) || (dst net 204.0.94.25/32) || (dst net 204.0.158.215/32) || (dst net 204.0.163.181/32) || (dst net 204.0.254.176/32))),
	((dst port 4570) || (dst port 7878) || (dst port 30364) || (dst port 54609) || (dst port 59139)) && ((dst net 205.0.0.0/8) && !((dst net 205.0.17.244/32) || (dst net 205.0.28.87/32) || (dst net 205.0.157.151/32) || (dst net 205.0.251.147/32) || (dst net 205.0.254.7/32))),
	((dst port 8408) || (dst port 16925) || (dst port 24804) || (dst port 49503) || (dst port 65061)) && ((dst net 206.0.0.0/8) && !((dst net 206.0.21.224/32) || (dst net 206.0.39.69/32) || (dst net 206.0.115.162/32) || (dst net 206.0.117.174/32) || (dst net 206.0.192.242/32))),
	((dst port 717) || (dst port 3858) || (dst port 31268) || (dst port 36207) || (dst port 53399)) && ((dst net 207.0.0.0/8) && !((dst net 207.0.45.60/32) || (dst net 207.0.64.113/32) || (dst net 207.0.184.131/32) || (dst net 207.0.231.58/32) || (dst net 207.0.241.91/32))),
	((dst port 5452) || (dst port 8799) || (dst port 32930) || (dst port 32967) || (dst port 51706)) && ((dst net 208.0.0.0/8) && !((dst net 208.0.55.114/32) || (dst net 208.0.68.145/32) || (dst net 208.0.73.108/32) || (dst net 208.0.166.198/32) || (dst net 208.0.224.150/32))),
	((dst port 14648) || (dst port 19392) || (dst port 28687) || (dst port 44561) || (dst port 52777)) && ((dst net 209.0.0.0/8) && !((dst net 209.0.46.236/32) || (dst net 209.0.74.205/32) || (dst net 209.0.127.57/32) || (dst net 209.0.150.186/32) || (dst net 209.0.202.129/32))),
	((dst port 14201) || (dst port 22634) || (dst port 25359) || (dst port 31641) || (dst port 55743)) && ((dst net 210.0.0.0/8) && !((dst net 210.0.58.128/32) || (dst net 210.0.94.158/32) || (dst net 210.0.158.208/32) || (dst net 210.0.165.78/32) || (dst net 210.0.217.238/32))),
	((dst port 9895) || (dst port 23949) || (dst port 42287) || (dst port 44280) || (dst port 61393)) && ((dst net 211.0.0.0/8) && !((dst net 211.0.61.123/32) || (dst net 211.0.70.166/32) || (dst net 211.0.73.187/32) || (dst net 211.0.87.14/32) || (dst net 211.0.116.118/32))),
	((dst port 3018) || (dst port 10237) || (dst port 27184) || (dst port 41841) || (dst port 60459)) && ((dst net 212.0.0.0/8) && !((dst net 212.0.10.88/32) || (dst net 212.0.33.103/32) || (dst net 212.0.79.27/32) || (dst net 212.0.106.132/32) || (dst net 212.0.167.248/32))),
	((dst port 29407) || (dst port 30848) || (dst port 36958) || (dst port 54383) || (dst port 58623)) && ((dst net 213.0.0.0/8) && !((dst net 213.0.61.125/32) || (dst net 213.0.63.94/32) || (dst net 213.0.178.240/32) || (dst net 213.0.180.244/32) || (dst net 213.0.230.144/32))),
	((dst port 19921) || (dst port 52754) || (dst port 53020) || (dst port 54445) || (dst port 63476)) && ((dst net 214.0.0.0/8) && !((dst net 214.0.12.141/32) || (dst net 214.0.111.237/32) || (dst net 214.0.144.226/32) || (dst net 214.0.234.28/32) || (dst net 214.0.247.105/32))),
	((dst port 4925) || (dst port 7502) || (dst port 26935) || (dst port 29755) || (dst port 46321)) && ((dst net 215.0.0.0/8) && !((dst net 215.0.11.41/32) || (dst net 215.0.47.53/32) || (dst net 215.0.123.210/32) || (dst net 215.0.133.18/32) || (dst net 215.0.214.200/32))),
	((dst port 9259) || (dst port 10896) || (dst port 16207) || (dst port 17752) || (dst port 33695)) && ((dst net 216.0.0.0/8) && !((dst net 216.0.51.238/32) || (dst net 216.0.61.96/32) || (dst net 216.0.97.52/32) || (dst net 216.0.113.170/32) || (dst net 216.0.147.83/32))),
	((dst port 8871) || (dst port 35263) || (dst port 44215) || (dst port 59924) || (dst port 63883)) && ((dst net 217.0.0.0/8) && !((dst net 217.0.22.184/32) || (dst net 217.0.74.102/32) || (dst net 217.0.96.100/32) || (dst net 217.0.124.107/32) || (dst net 217.0.188.81/32))),
	((dst port 7993) || (dst port 28147) || (dst port 50130) || (dst port 59347) || (dst port 64998)) && ((dst net 218.0.0.0/8) && !((dst net 218.0.22.224/32) || (dst net 218.0.44.64/32) || (dst net 218.0.129.211/32) || (dst net 218.0.134.98/32) || (dst net 218.0.199.105/32))),
	((dst port 4759) || (dst port 17400) || (dst port 19493) || (dst port 28400) || (dst port 39142)) && ((dst net 219.0.0.0/8) && !((dst net 219.0.67.26/32) || (dst net 219.0.103.181/32) || (dst net 219.0.105.31/32) || (dst net 219.0.120.11/32) || (dst net 219.0.234.133/32))),
	((dst port 17819) || (dst port 37772) || (dst port 41684) || (dst port 56817) || (dst port 63300)) && ((dst net 220.0.0.0/8) && !((dst net 220.0.72.156/32) || (dst net 220.0.78.187/32) || (dst net 220.0.219.15/32) || (dst net 220.0.249.48/32) || (dst net 220.0.250.28/32))),
	((dst port 492) || (dst port 21165) || (dst port 22665) || (dst port 26613) || (dst port 39307)) && ((dst net 221.0.0.0/8) && !((dst net 221.0.114.122/32) || (dst net 221.0.129.88/32) || (dst net 221.0.163.60/32) || (dst net 221.0.168.79/32) || (dst net 221.0.194.98/32))),
	((dst port 18627) || (dst port 41219) || (dst port 43938) || (dst port 55452) || (dst port 57261)) && ((dst net 222.0.0.0/8) && !((dst net 222.0.9.17/32) || (dst net 222.0.159.232/32) || (dst net 222.0.187.250/32) || (dst net 222.0.216.144/32) || (dst net 222.0.223.92/32))),
	((dst port 8204) || (dst port 12331) || (dst port 28419) || (dst port 56329) || (dst port 64948)) && ((dst net 223.0.0.0/8) && !((dst net 223.0.17.9/32) || (dst net 223.0.91.125/32) || (dst net 223.0.111.116/32) || (dst net 223.0.130.225/32) || (dst net 223.0.134.167/32))),
	((dst port 10691) || (dst port 15782) || (dst port 21763) || (dst port 53000) || (dst port 56595)) && ((dst net 224.0.0.0/8) && !((dst net 224.0.84.125/32) || (dst net 224.0.100.22/32) || (dst net 224.0.113.136/32) || (dst net 224.0.224.49/32) || (dst net 224.0.227.185/32))),
	((dst port 2435) || (dst port 13794) || (dst port 17832) || (dst port 38548) || (dst port 41159)) && ((dst net 225.0.0.0/8) && !((dst net 225.0.24.227/32) || (dst net 225.0.180.57/32) || (dst net 225.0.183.140/32) || (dst net 225.0.213.234/32) || (dst net 225.0.236.6/32))),
	((dst port 12772) || (dst port 25448) || (dst port 26031) || (dst port 38838) || (dst port 65364)) && ((dst net 226.0.0.0/8) && !((dst net 226.0.43.17/32) || (dst net 226.0.111.107/32) || (dst net 226.0.120.216/32) || (dst net 226.0.175.20/32) || (dst net 226.0.222.50/32))),
	((dst port 22263) || (dst port 30270) || (dst port 43181) || (dst port 44082) || (dst port 45419)) && ((dst net 227.0.0.0/8) && !((dst net 227.0.27.10/32) || (dst net 227.0.112.84/32) || (dst net 227.0.116.169/32) || (dst net 227.0.128.213/32) || (dst net 227.0.255.80/32))),
	((dst port 17374) || (dst port 25521) || (dst port 33968) || (dst port 64532) || (dst port 65116)) && ((dst net 228.0.0.0/8) && !((dst net 228.0.111.217/32) || (dst net 228.0.141.26/32) || (dst net 228.0.147.96/32) || (dst net 228.0.157.102/32) || (dst net 228.0.227.143/32))),
	((dst port 4418) || (dst port 5575) || (dst port 13404) || (dst port 29697) || (dst port 49453)) && ((dst net 229.0.0.0/8) && !((dst net 229.0.5.181/32) || (dst net 229.0.72.13/32) || (dst net 229.0.75.176/32) || (dst net 229.0.144.146/32) || (dst net 229.0.199.215/32))),
	((dst port 15632) || (dst port 20432) || (dst port 52175) || (dst port 54837) || (dst port 55262)) && ((dst net 230.0.0.0/8) && !((dst net 230.0.95.91/32) || (dst net 230.0.118.245/32) || (dst net 230.0.141.84/32) || (dst net 230.0.150.108/32) || (dst net 230.0.233.128/32))),
	((dst port 14765) || (dst port 20581) || (dst port 32764) || (dst port 44669) || (dst port 64688)) && ((dst net 231.0.0.0/8) && !((dst net 231.0.8.20/32) || (dst net 231.0.50.156/32) || (dst net 231.0.139.49/32) || (dst net 231.0.162.39/32) || (dst net 231.0.224.200/32))),
	((dst port 5358) || (dst port 8684) || (dst port 13398) || (dst port 18308) || (dst port 65522)) && ((dst net 232.0.0.0/8) && !((dst net 232.0.30.27/32) || (dst net 232.0.33.18/32) || (dst net 232.0.98.17/32) || (dst net 232.0.147.23/32) || (dst net 232.0.168.167/32))),
	((dst port 6223) || (dst port 14347) || (dst port 17760) || (dst port 48525) || (dst port 63676)) && ((dst net 233.0.0.0/8) && !((dst net 233.0.54.178/32) || (dst net 233.0.55.198/32) || (dst net 233.0.77.19/32) || (dst net 233.0.165.101/32) || (dst net 233.0.245.144/32))),
	((dst port 20764) || (dst port 31989) || (dst port 45952) || (dst port 61203) || (dst port 64793)) && ((dst net 234.0.0.0/8) && !((dst net 234.0.133.250/32) || (dst net 234.0.156.117/32) || (dst net 234.0.165.114/32) || (dst net 234.0.183.143/32) || (dst net 234.0.190.215/32))),
	((dst port 5714) || (dst port 33915) || (dst port 38404) || (dst port 39337) || (dst port 48082)) && ((dst net 235.0.0.0/8) && !((dst net 235.0.37.50/32) || (dst net 235.0.51.29/32) || (dst net 235.0.55.24/32) || (dst net 235.0.176.208/32) || (dst net 235.0.238.83/32))),
	((dst port 6362) || (dst port 7592) || (dst port 8481) || (dst port 42983) || (dst port 63577)) && ((dst net 236.0.0.0/8) && !((dst net 236.0.8.19/32) || (dst net 236.0.20.193/32) || (dst net 236.0.140.127/32) || (dst net 236.0.216.255/32) || (dst net 236.0.245.100/32))),
	((dst port 24603) || (dst port 29848) || (dst port 32951) || (dst port 55443) || (dst port 59961)) && ((dst net 237.0.0.0/8) && !((dst net 237.0.26.123/32) || (dst net 237.0.106.38/32) || (dst net 237.0.154.221/32) || (dst net 237.0.212.230/32) || (dst net 237.0.246.5/32))),
	((dst port 3141) || (dst port 39371) || (dst port 41343) || (dst port 46641) || (dst port 63621)) && ((dst net 238.0.0.0/8) && !((dst net 238.0.4.173/32) || (dst net 238.0.46.78/32) || (dst net 238.0.108.216/32) || (dst net 238.0.214.14/32) || (dst net 238.0.253.116/32))),
	((dst port 40588) || (dst port 50474) || (dst port 53773) || (dst port 61547) || (dst port 65264)) && ((dst net 239.0.0.0/8) && !((dst net 239.0.111.36/32) || (dst net 239.0.126.91/32) || (dst net 239.0.140.112/32) || (dst net 239.0.146.189/32) || (dst net 239.0.209.42/32))),
	((dst port 11435) || (dst port 21376) || (dst port 38005) || (dst port 42854) || (dst port 60995)) && ((dst net 240.0.0.0/8) && !((dst net 240.0.14.54/32) || (dst net 240.0.22.26/32) || (dst net 240.0.26.226/32) || (dst net 240.0.38.105/32) || (dst net 240.0.243.245/32))),
	((dst port 13143) || (dst port 25207) || (dst port 26917) || (dst port 57380) || (dst port 60091)) && ((dst net 241.0.0.0/8) && !((dst net 241.0.36.77/32) || (dst net 241.0.139.230/32) || (dst net 241.0.155.36/32) || (dst net 241.0.155.119/32) || (dst net 241.0.230.27/32))),
	((dst port 2695) || (dst port 4220) || (dst port 22760) || (dst port 25226) || (dst port 59891)) && ((dst net 242.0.0.0/8) && !((dst net 242.0.89.112/32) || (dst net 242.0.105.26/32) || (dst net 242.0.146.247/32) || (dst net 242.0.158.194/32) || (dst net 242.0.183.67/32))),
	((dst port 18186) || (dst port 29948) || (dst port 50469) || (dst port 54057) || (dst port 60447)) && ((dst net 243.0.0.0/8) && !((dst net 243.0.70.106/32) || (dst net 243.0.78.58/32) || (dst net 243.0.181.88/32) || (dst net 243.0.200.76/32) || (dst net 243.0.242.200/32))),
	((dst port 3402) || (dst port 7409) || (dst port 20546) || (dst port 35532) || (dst port 52764)) && ((dst net 244.0.0.0/8) && !((dst net 244.0.7.102/32) || (dst net 244.0.60.117/32) || (dst net 244.0.179.163/32) || (dst net 244.0.208.146/32) || (dst net 244.0.215.202/32))),
	((dst port 6631) || (dst port 12244) || (dst port 27991) || (dst port 40321) || (dst port 44104)) && ((dst net 245.0.0.0/8) && !((dst net 245.0.67.4/32) || (dst net 245.0.119.250/32) || (dst net 245.0.126.22/32) || (dst net 245.0.168.254/32) || (dst net 245.0.188.35/32))),
	((dst port 12584) || (dst port 23977) || (dst port 25735) || (dst port 31774) || (dst port 60844)) && ((dst net 246.0.0.0/8) && !((dst net 246.0.90.145/32) || (dst net 246.0.105.111/32) || (dst net 246.0.166.172/32) || (dst net 246.0.190.85/32) || (dst net 246.0.220.99/32))),
	((dst port 9498) || (dst port 36842) || (dst port 48177) || (dst port 60496) || (dst port 63699)) && ((dst net 247.0.0.0/8) && !((dst net 247.0.60.130/32) || (dst net 247.0.127.172/32) || (dst net 247.0.131.85/32) || (dst net 247.0.151.5/32) || (dst net 247.0.169.10/32))),
	((dst port 987) || (dst port 21202) || (dst port 26967) || (dst port 27481) || (dst port 46984)) && ((dst net 248.0.0.0/8) && !((dst net 248.0.16.132/32) || (dst net 248.0.46.91/32) || (dst net 248.0.91.112/32) || (dst net 248.0.233.247/32) || (dst net 248.0.237.131/32))),
	((dst port 27526) || (dst port 34964) || (dst port 44931) || (dst port 48390) || (dst port 64651)) && ((dst net 249.0.0.0/8) && !((dst net 249.0.20.53/32) || (dst net 249.0.107.15/32) || (dst net 249.0.136.111/32) || (dst net 249.0.196.250/32) || (dst net 249.0.198.179/32))),
	((dst port 2306) || (dst port 8850) || (dst port 15036) || (dst port 32682) || (dst port 47807)) && ((dst net 250.0.0.0/8) && !((dst net 250.0.79.117/32) || (dst net 250.0.122.1/32) || (dst net 250.0.164.16/32) || (dst net 250.0.215.219/32) || (dst net 250.0.241.154/32))),
	((dst port 14085) || (dst port 26232) || (dst port 40752) || (dst port 58579) || (dst port 63348)) && ((dst net 251.0.0.0/8) && !((dst net 251.0.2.83/32) || (dst net 251.0.32.214/32) || (dst net 251.0.193.235/32) || (dst net 251.0.204.176/32) || (dst net 251.0.240.46/32))),
	((dst port 2119) || (dst port 3285) || (dst port 30263) || (dst port 36180) || (dst port 59037)) && ((dst net 252.0.0.0/8) && !((dst net 252.0.29.35/32) || (dst net 252.0.70.197/32) || (dst net 252.0.177.3/32) || (dst net 252.0.230.109/32) || (dst net 252.0.245.130/32))),
	((dst port 7938) || (dst port 14265) || (dst port 19400) || (dst port 22422) || (dst port 57612)) && ((dst net 253.0.0.0/8) && !((dst net 253.0.0.11/32) || (dst net 253.0.62.224/32) || (dst net 253.0.141.219/32) || (dst net 253.0.243.203/32) || (dst net 253.0.255.36/32))),
	((dst port 4278) || (dst port 10186) || (dst port 30435) || (dst port 55114) || (dst port 59160)) && ((dst net 254.0.0.0/8) && !((dst net 254.0.103.197/32) || (dst net 254.0.135.22/32) || (dst net 254.0.146.58/32) || (dst net 254.0.150.50/32) || (dst net 254.0.190.42/32))),
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
