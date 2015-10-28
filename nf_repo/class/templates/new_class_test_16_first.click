ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 5129) || (dst port 16641) || (dst port 18304) || (dst port 24232) || (dst port 25417)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.66.68/32) || (dst net 1.0.94.199/32) || (dst net 1.0.100.157/32) || (dst net 1.0.114.102/32) || (dst net 1.0.121.213/32))),
	((dst port 21074) || (dst port 30175) || (dst port 30193) || (dst port 61616) || (dst port 61917)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.131.146/32) || (dst net 2.0.171.251/32) || (dst net 2.0.173.31/32) || (dst net 2.0.184.133/32) || (dst net 2.0.186.135/32))),
	((dst port 9856) || (dst port 22533) || (dst port 34263) || (dst port 35502) || (dst port 43916)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.102.223/32) || (dst net 3.0.132.100/32) || (dst net 3.0.155.12/32) || (dst net 3.0.169.79/32) || (dst net 3.0.252.141/32))),
	((dst port 16170) || (dst port 17473) || (dst port 55312) || (dst port 60153) || (dst port 63577)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.3.211/32) || (dst net 4.0.70.51/32) || (dst net 4.0.139.208/32) || (dst net 4.0.164.155/32) || (dst net 4.0.212.74/32))),
	((dst port 28616) || (dst port 38170) || (dst port 46332) || (dst port 46389) || (dst port 49265)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.5.167/32) || (dst net 5.0.41.39/32) || (dst net 5.0.116.173/32) || (dst net 5.0.177.172/32) || (dst net 5.0.209.47/32))),
	((dst port 278) || (dst port 5237) || (dst port 10688) || (dst port 32486) || (dst port 59200)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.43.210/32) || (dst net 6.0.71.142/32) || (dst net 6.0.178.25/32) || (dst net 6.0.192.254/32) || (dst net 6.0.253.215/32))),
	((dst port 4381) || (dst port 14144) || (dst port 25542) || (dst port 33980) || (dst port 35654)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.1.159/32) || (dst net 7.0.111.186/32) || (dst net 7.0.149.181/32) || (dst net 7.0.191.39/32) || (dst net 7.0.200.115/32))),
	((dst port 18369) || (dst port 20327) || (dst port 24374) || (dst port 44965) || (dst port 53474)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.98.194/32) || (dst net 8.0.137.230/32) || (dst net 8.0.160.123/32) || (dst net 8.0.168.185/32) || (dst net 8.0.181.151/32))),
	((dst port 3622) || (dst port 4629) || (dst port 10504) || (dst port 19466) || (dst port 47434)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.2.100/32) || (dst net 9.0.26.146/32) || (dst net 9.0.56.127/32) || (dst net 9.0.133.94/32) || (dst net 9.0.198.161/32))),
	((dst port 9851) || (dst port 18740) || (dst port 37866) || (dst port 45590) || (dst port 54637)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.12.244/32) || (dst net 10.0.114.78/32) || (dst net 10.0.117.9/32) || (dst net 10.0.122.82/32) || (dst net 10.0.133.31/32))),
	((dst port 108) || (dst port 1923) || (dst port 24743) || (dst port 32090) || (dst port 56113)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.14.182/32) || (dst net 11.0.84.200/32) || (dst net 11.0.138.219/32) || (dst net 11.0.174.98/32) || (dst net 11.0.252.166/32))),
	((dst port 8028) || (dst port 12339) || (dst port 23024) || (dst port 40248) || (dst port 63791)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.9.28/32) || (dst net 12.0.137.73/32) || (dst net 12.0.147.129/32) || (dst net 12.0.173.234/32) || (dst net 12.0.189.45/32))),
	((dst port 16484) || (dst port 16975) || (dst port 27810) || (dst port 54927) || (dst port 63850)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.32.61/32) || (dst net 13.0.91.96/32) || (dst net 13.0.141.137/32) || (dst net 13.0.155.141/32) || (dst net 13.0.244.61/32))),
	((dst port 7639) || (dst port 13734) || (dst port 17277) || (dst port 29613) || (dst port 43615)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.62.157/32) || (dst net 14.0.177.227/32) || (dst net 14.0.194.185/32) || (dst net 14.0.208.37/32) || (dst net 14.0.229.223/32))),
	((dst port 5407) || (dst port 24597) || (dst port 28306) || (dst port 45051) || (dst port 54803)) && ((dst net 15.0.0.0/8) && !((dst net 15.0.1.142/32) || (dst net 15.0.29.26/32) || (dst net 15.0.45.13/32) || (dst net 15.0.140.7/32) || (dst net 15.0.153.112/32))),
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
