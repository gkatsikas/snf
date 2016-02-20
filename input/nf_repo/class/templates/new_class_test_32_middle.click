ipclassifier :: IPClassifier(
	((dst port 22404) || (dst port 28655) || (dst port 37970) || (dst port 45852) || (dst port 58100)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.43.75/32) || (dst net 0.0.57.68/32) || (dst net 0.0.74.199/32) || (dst net 0.0.103.159/32) || (dst net 0.0.171.223/32))),
	((dst port 4796) || (dst port 11138) || (dst port 34966) || (dst port 49164) || (dst port 65455)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.67.193/32) || (dst net 1.0.72.64/32) || (dst net 1.0.202.192/32) || (dst net 1.0.213.149/32) || (dst net 1.0.217.94/32))),
	((dst port 2167) || (dst port 6949) || (dst port 17451) || (dst port 28438) || (dst port 60905)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.31.74/32) || (dst net 2.0.42.35/32) || (dst net 2.0.54.172/32) || (dst net 2.0.108.212/32) || (dst net 2.0.197.242/32))),
	((dst port 13639) || (dst port 24945) || (dst port 40408) || (dst port 50075) || (dst port 60853)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.54.195/32) || (dst net 3.0.65.237/32) || (dst net 3.0.72.80/32) || (dst net 3.0.123.104/32) || (dst net 3.0.202.245/32))),
	((dst port 1196) || (dst port 7506) || (dst port 45756) || (dst port 49020) || (dst port 51849)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.29.54/32) || (dst net 4.0.50.170/32) || (dst net 4.0.91.57/32) || (dst net 4.0.147.108/32) || (dst net 4.0.232.106/32))),
	((dst port 1165) || (dst port 21712) || (dst port 25785) || (dst port 51478) || (dst port 59925)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.55.13/32) || (dst net 5.0.88.140/32) || (dst net 5.0.97.230/32) || (dst net 5.0.167.151/32) || (dst net 5.0.229.30/32))),
	((dst port 5285) || (dst port 23073) || (dst port 23737) || (dst port 37480) || (dst port 61741)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.33.46/32) || (dst net 6.0.87.235/32) || (dst net 6.0.186.225/32) || (dst net 6.0.212.226/32) || (dst net 6.0.224.185/32))),
	((dst port 18451) || (dst port 22883) || (dst port 23089) || (dst port 28533) || (dst port 60237)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.126.73/32) || (dst net 7.0.164.139/32) || (dst net 7.0.198.195/32) || (dst net 7.0.209.61/32) || (dst net 7.0.216.31/32))),
	((dst port 8252) || (dst port 20618) || (dst port 39876) || (dst port 40113) || (dst port 56008)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.40.84/32) || (dst net 8.0.64.128/32) || (dst net 8.0.160.76/32) || (dst net 8.0.190.158/32) || (dst net 8.0.198.196/32))),
	((dst port 4649) || (dst port 15380) || (dst port 30076) || (dst port 49187) || (dst port 63129)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.32.67/32) || (dst net 9.0.34.31/32) || (dst net 9.0.51.236/32) || (dst net 9.0.67.9/32) || (dst net 9.0.95.169/32))),
	((dst port 2983) || (dst port 3949) || (dst port 7876) || (dst port 53028) || (dst port 61880)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.20.209/32) || (dst net 10.0.39.14/32) || (dst net 10.0.50.144/32) || (dst net 10.0.175.24/32) || (dst net 10.0.218.176/32))),
	((dst port 3521) || (dst port 39269) || (dst port 42940) || (dst port 53236) || (dst port 64644)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.36.36/32) || (dst net 11.0.58.61/32) || (dst net 11.0.102.51/32) || (dst net 11.0.205.26/32) || (dst net 11.0.212.106/32))),
	((dst port 15612) || (dst port 38648) || (dst port 43981) || (dst port 46986) || (dst port 54682)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.8.38/32) || (dst net 12.0.27.169/32) || (dst net 12.0.105.225/32) || (dst net 12.0.221.253/32) || (dst net 12.0.249.120/32))),
	((dst port 1472) || (dst port 24675) || (dst port 33653) || (dst port 56330) || (dst port 61147)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.0.103/32) || (dst net 13.0.56.248/32) || (dst net 13.0.58.79/32) || (dst net 13.0.104.231/32) || (dst net 13.0.114.164/32))),
	((dst port 1704) || (dst port 13615) || (dst port 16982) || (dst port 42232) || (dst port 64688)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.84.241/32) || (dst net 14.0.156.7/32) || (dst net 14.0.159.192/32) || (dst net 14.0.167.101/32) || (dst net 14.0.203.60/32))),
	((dst port 9025) || (dst port 31694) || (dst port 35560) || (dst port 38392) || (dst port 58105)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.30.229/32) || (dst net 15.0.96.127/32) || (dst net 15.0.114.249/32) || (dst net 15.0.143.114/32) || (dst net 15.0.164.112/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 52290) || (dst port 53300) || (dst port 54260) || (dst port 59836) || (dst port 63591)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.20.227/32) || (dst net 17.0.25.206/32) || (dst net 17.0.76.153/32) || (dst net 17.0.92.211/32) || (dst net 17.0.215.121/32))),
	((dst port 12690) || (dst port 26317) || (dst port 30619) || (dst port 30685) || (dst port 60993)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.114.224/32) || (dst net 18.0.164.97/32) || (dst net 18.0.177.166/32) || (dst net 18.0.208.215/32) || (dst net 18.0.214.254/32))),
	((dst port 8978) || (dst port 18286) || (dst port 26823) || (dst port 30047) || (dst port 45164)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.58.78/32) || (dst net 19.0.96.226/32) || (dst net 19.0.132.130/32) || (dst net 19.0.230.56/32) || (dst net 19.0.252.98/32))),
	((dst port 18014) || (dst port 26780) || (dst port 47040) || (dst port 47337) || (dst port 51452)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.8.0/32) || (dst net 20.0.49.81/32) || (dst net 20.0.77.207/32) || (dst net 20.0.189.109/32) || (dst net 20.0.208.46/32))),
	((dst port 20877) || (dst port 22704) || (dst port 30924) || (dst port 32258) || (dst port 34710)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.0.18/32) || (dst net 21.0.147.187/32) || (dst net 21.0.160.184/32) || (dst net 21.0.162.9/32) || (dst net 21.0.204.114/32))),
	((dst port 3678) || (dst port 19169) || (dst port 29942) || (dst port 50171) || (dst port 63042)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.35.84/32) || (dst net 22.0.99.13/32) || (dst net 22.0.102.46/32) || (dst net 22.0.216.177/32) || (dst net 22.0.219.162/32))),
	((dst port 13213) || (dst port 16495) || (dst port 35575) || (dst port 37725) || (dst port 39370)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.50.242/32) || (dst net 23.0.89.140/32) || (dst net 23.0.189.220/32) || (dst net 23.0.203.238/32) || (dst net 23.0.255.198/32))),
	((dst port 7013) || (dst port 9612) || (dst port 16142) || (dst port 34327) || (dst port 36359)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.131.134/32) || (dst net 24.0.155.168/32) || (dst net 24.0.191.106/32) || (dst net 24.0.204.104/32) || (dst net 24.0.253.90/32))),
	((dst port 9529) || (dst port 21763) || (dst port 43379) || (dst port 48765) || (dst port 57428)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.17.194/32) || (dst net 25.0.85.153/32) || (dst net 25.0.146.87/32) || (dst net 25.0.173.193/32) || (dst net 25.0.216.60/32))),
	((dst port 2599) || (dst port 16802) || (dst port 40235) || (dst port 40680) || (dst port 60611)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.103.29/32) || (dst net 26.0.126.127/32) || (dst net 26.0.142.51/32) || (dst net 26.0.149.197/32) || (dst net 26.0.157.81/32))),
	((dst port 23963) || (dst port 24509) || (dst port 24660) || (dst port 37254) || (dst port 47867)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.6.47/32) || (dst net 27.0.43.224/32) || (dst net 27.0.87.239/32) || (dst net 27.0.108.129/32) || (dst net 27.0.156.89/32))),
	((dst port 34857) || (dst port 36962) || (dst port 44904) || (dst port 57140) || (dst port 63869)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.22.43/32) || (dst net 28.0.28.94/32) || (dst net 28.0.83.69/32) || (dst net 28.0.107.13/32) || (dst net 28.0.149.72/32))),
	((dst port 3889) || (dst port 8338) || (dst port 29171) || (dst port 31129) || (dst port 45791)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.15.108/32) || (dst net 29.0.28.49/32) || (dst net 29.0.121.177/32) || (dst net 29.0.140.174/32) || (dst net 29.0.254.1/32))),
	((dst port 8145) || (dst port 12469) || (dst port 43010) || (dst port 43539) || (dst port 55466)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.112.132/32) || (dst net 30.0.140.160/32) || (dst net 30.0.219.201/32) || (dst net 30.0.235.2/32) || (dst net 30.0.255.72/32))),
	((dst port 4121) || (dst port 39188) || (dst port 55852) || (dst port 60663) || (dst port 63766)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.35.161/32) || (dst net 31.0.40.203/32) || (dst net 31.0.72.137/32) || (dst net 31.0.117.39/32) || (dst net 31.0.249.37/32))),
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
