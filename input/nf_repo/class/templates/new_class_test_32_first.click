ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 24944) || (dst port 27017) || (dst port 27796) || (dst port 42684) || (dst port 57916)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.14.199/32) || (dst net 1.0.38.53/32) || (dst net 1.0.40.218/32) || (dst net 1.0.41.134/32) || (dst net 1.0.119.214/32))),
	((dst port 2058) || (dst port 11193) || (dst port 37516) || (dst port 50467) || (dst port 59064)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.15.101/32) || (dst net 2.0.78.239/32) || (dst net 2.0.208.127/32) || (dst net 2.0.229.206/32) || (dst net 2.0.235.101/32))),
	((dst port 25505) || (dst port 34451) || (dst port 38461) || (dst port 53209) || (dst port 61597)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.70.247/32) || (dst net 3.0.133.176/32) || (dst net 3.0.205.164/32) || (dst net 3.0.220.148/32) || (dst net 3.0.222.152/32))),
	((dst port 4775) || (dst port 12422) || (dst port 47116) || (dst port 48702) || (dst port 57618)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.86.141/32) || (dst net 4.0.107.136/32) || (dst net 4.0.148.115/32) || (dst net 4.0.191.201/32) || (dst net 4.0.225.124/32))),
	((dst port 6319) || (dst port 27315) || (dst port 36872) || (dst port 44218) || (dst port 53285)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.23.0/32) || (dst net 5.0.41.57/32) || (dst net 5.0.92.1/32) || (dst net 5.0.181.203/32) || (dst net 5.0.225.11/32))),
	((dst port 7410) || (dst port 24739) || (dst port 25076) || (dst port 31882) || (dst port 45062)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.162.158/32) || (dst net 6.0.196.246/32) || (dst net 6.0.224.210/32) || (dst net 6.0.224.225/32) || (dst net 6.0.229.132/32))),
	((dst port 15599) || (dst port 25623) || (dst port 41208) || (dst port 44644) || (dst port 63957)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.19.170/32) || (dst net 7.0.31.42/32) || (dst net 7.0.36.175/32) || (dst net 7.0.122.71/32) || (dst net 7.0.181.103/32))),
	((dst port 4817) || (dst port 29540) || (dst port 31712) || (dst port 32679) || (dst port 32746)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.92.198/32) || (dst net 8.0.109.203/32) || (dst net 8.0.203.87/32) || (dst net 8.0.219.247/32) || (dst net 8.0.232.161/32))),
	((dst port 5264) || (dst port 15624) || (dst port 26751) || (dst port 63123) || (dst port 63734)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.28.42/32) || (dst net 9.0.37.109/32) || (dst net 9.0.76.213/32) || (dst net 9.0.189.163/32) || (dst net 9.0.238.208/32))),
	((dst port 24131) || (dst port 28369) || (dst port 28854) || (dst port 37728) || (dst port 38383)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.33.37/32) || (dst net 10.0.50.65/32) || (dst net 10.0.50.181/32) || (dst net 10.0.86.209/32) || (dst net 10.0.213.96/32))),
	((dst port 26394) || (dst port 45749) || (dst port 53710) || (dst port 55659) || (dst port 65236)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.38.23/32) || (dst net 11.0.97.224/32) || (dst net 11.0.109.242/32) || (dst net 11.0.153.163/32) || (dst net 11.0.171.147/32))),
	((dst port 23441) || (dst port 24731) || (dst port 42265) || (dst port 42370) || (dst port 52367)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.2.117/32) || (dst net 12.0.95.207/32) || (dst net 12.0.122.211/32) || (dst net 12.0.163.154/32) || (dst net 12.0.203.28/32))),
	((dst port 9446) || (dst port 20624) || (dst port 39470) || (dst port 43704) || (dst port 55993)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.37.24/32) || (dst net 13.0.74.161/32) || (dst net 13.0.85.149/32) || (dst net 13.0.99.183/32) || (dst net 13.0.177.144/32))),
	((dst port 8152) || (dst port 17310) || (dst port 19071) || (dst port 41591) || (dst port 54635)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.1.110/32) || (dst net 14.0.88.46/32) || (dst net 14.0.97.200/32) || (dst net 14.0.132.60/32) || (dst net 14.0.235.189/32))),
	((dst port 755) || (dst port 18917) || (dst port 36761) || (dst port 43646) || (dst port 52094)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.12.119/32) || (dst net 15.0.39.231/32) || (dst net 15.0.96.119/32) || (dst net 15.0.117.67/32) || (dst net 15.0.193.129/32))),
	((dst port 3279) || (dst port 4840) || (dst port 15197) || (dst port 24469) || (dst port 30475)) && ((dst net 16.0.0.0/8) && !((dst net 16.0.82.20/32) || (dst net 16.0.106.98/32) || (dst net 16.0.131.189/32) || (dst net 16.0.184.27/32) || (dst net 16.0.215.145/32))),
	((dst port 11875) || (dst port 19205) || (dst port 23431) || (dst port 38629) || (dst port 61219)) && ((dst net 17.0.0.0/8) && !((dst net 17.0.51.212/32) || (dst net 17.0.108.45/32) || (dst net 17.0.144.242/32) || (dst net 17.0.212.224/32) || (dst net 17.0.214.238/32))),
	((dst port 3308) || (dst port 29154) || (dst port 39055) || (dst port 49042) || (dst port 56636)) && ((dst net 18.0.0.0/8) && !((dst net 18.0.94.122/32) || (dst net 18.0.103.226/32) || (dst net 18.0.118.139/32) || (dst net 18.0.160.186/32) || (dst net 18.0.241.201/32))),
	((dst port 1239) || (dst port 12758) || (dst port 43162) || (dst port 60391) || (dst port 64360)) && ((dst net 19.0.0.0/8) && !((dst net 19.0.26.197/32) || (dst net 19.0.33.138/32) || (dst net 19.0.148.208/32) || (dst net 19.0.170.82/32) || (dst net 19.0.213.89/32))),
	((dst port 42142) || (dst port 43247) || (dst port 47872) || (dst port 54704) || (dst port 54860)) && ((dst net 20.0.0.0/8) && !((dst net 20.0.71.95/32) || (dst net 20.0.133.233/32) || (dst net 20.0.151.41/32) || (dst net 20.0.184.69/32) || (dst net 20.0.247.190/32))),
	((dst port 7683) || (dst port 18132) || (dst port 28992) || (dst port 60161) || (dst port 62376)) && ((dst net 21.0.0.0/8) && !((dst net 21.0.82.204/32) || (dst net 21.0.89.123/32) || (dst net 21.0.136.238/32) || (dst net 21.0.170.6/32) || (dst net 21.0.222.132/32))),
	((dst port 15940) || (dst port 35125) || (dst port 43444) || (dst port 53617) || (dst port 60943)) && ((dst net 22.0.0.0/8) && !((dst net 22.0.85.59/32) || (dst net 22.0.106.128/32) || (dst net 22.0.134.180/32) || (dst net 22.0.214.30/32) || (dst net 22.0.246.106/32))),
	((dst port 10679) || (dst port 12857) || (dst port 39480) || (dst port 40846) || (dst port 54789)) && ((dst net 23.0.0.0/8) && !((dst net 23.0.32.67/32) || (dst net 23.0.63.58/32) || (dst net 23.0.152.196/32) || (dst net 23.0.227.2/32) || (dst net 23.0.241.3/32))),
	((dst port 2) || (dst port 7576) || (dst port 29790) || (dst port 41207) || (dst port 44307)) && ((dst net 24.0.0.0/8) && !((dst net 24.0.100.61/32) || (dst net 24.0.170.216/32) || (dst net 24.0.171.242/32) || (dst net 24.0.214.181/32) || (dst net 24.0.223.14/32))),
	((dst port 3929) || (dst port 18317) || (dst port 37778) || (dst port 43348) || (dst port 48790)) && ((dst net 25.0.0.0/8) && !((dst net 25.0.8.66/32) || (dst net 25.0.89.245/32) || (dst net 25.0.94.239/32) || (dst net 25.0.147.9/32) || (dst net 25.0.218.232/32))),
	((dst port 2162) || (dst port 31930) || (dst port 37313) || (dst port 38940) || (dst port 45282)) && ((dst net 26.0.0.0/8) && !((dst net 26.0.23.128/32) || (dst net 26.0.45.42/32) || (dst net 26.0.113.80/32) || (dst net 26.0.229.179/32) || (dst net 26.0.254.17/32))),
	((dst port 16010) || (dst port 17855) || (dst port 31258) || (dst port 62072) || (dst port 62474)) && ((dst net 27.0.0.0/8) && !((dst net 27.0.52.2/32) || (dst net 27.0.111.60/32) || (dst net 27.0.123.82/32) || (dst net 27.0.176.73/32) || (dst net 27.0.229.79/32))),
	((dst port 3302) || (dst port 37579) || (dst port 42034) || (dst port 51281) || (dst port 62920)) && ((dst net 28.0.0.0/8) && !((dst net 28.0.1.203/32) || (dst net 28.0.32.137/32) || (dst net 28.0.55.168/32) || (dst net 28.0.219.112/32) || (dst net 28.0.246.34/32))),
	((dst port 7759) || (dst port 33100) || (dst port 34502) || (dst port 43838) || (dst port 59184)) && ((dst net 29.0.0.0/8) && !((dst net 29.0.33.9/32) || (dst net 29.0.35.24/32) || (dst net 29.0.128.122/32) || (dst net 29.0.167.233/32) || (dst net 29.0.211.28/32))),
	((dst port 8090) || (dst port 13187) || (dst port 42473) || (dst port 47731) || (dst port 55621)) && ((dst net 30.0.0.0/8) && !((dst net 30.0.62.53/32) || (dst net 30.0.71.16/32) || (dst net 30.0.99.0/32) || (dst net 30.0.100.57/32) || (dst net 30.0.212.196/32))),
	((dst port 10299) || (dst port 23015) || (dst port 38075) || (dst port 43672) || (dst port 47135)) && ((dst net 31.0.0.0/8) && !((dst net 31.0.5.198/32) || (dst net 31.0.27.6/32) || (dst net 31.0.48.31/32) || (dst net 31.0.92.105/32) || (dst net 31.0.199.153/32))),
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
