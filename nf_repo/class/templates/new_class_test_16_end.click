ipclassifier :: IPClassifier(
	((dst port 9725) || (dst port 20421) || (dst port 55742) || (dst port 56855) || (dst port 63369)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.59.105/32) || (dst net 0.0.103.81/32) || (dst net 0.0.110.61/32) || (dst net 0.0.137.90/32) || (dst net 0.0.252.195/32))),
	((dst port 10434) || (dst port 35491) || (dst port 37540) || (dst port 53440) || (dst port 61949)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.119.212/32) || (dst net 1.0.163.185/32) || (dst net 1.0.176.215/32) || (dst net 1.0.238.147/32) || (dst net 1.0.255.100/32))),
	((dst port 1468) || (dst port 6326) || (dst port 33999) || (dst port 36798) || (dst port 56157)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.10.131/32) || (dst net 2.0.28.42/32) || (dst net 2.0.39.201/32) || (dst net 2.0.87.247/32) || (dst net 2.0.210.68/32))),
	((dst port 4344) || (dst port 9221) || (dst port 12582) || (dst port 22667) || (dst port 43975)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.5.214/32) || (dst net 3.0.132.85/32) || (dst net 3.0.172.175/32) || (dst net 3.0.178.207/32) || (dst net 3.0.188.184/32))),
	((dst port 1726) || (dst port 5067) || (dst port 45295) || (dst port 46774) || (dst port 49962)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.42.213/32) || (dst net 4.0.56.190/32) || (dst net 4.0.97.79/32) || (dst net 4.0.150.6/32) || (dst net 4.0.235.208/32))),
	((dst port 34036) || (dst port 39430) || (dst port 47438) || (dst port 54478) || (dst port 60244)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.110.50/32) || (dst net 5.0.129.136/32) || (dst net 5.0.150.254/32) || (dst net 5.0.236.239/32) || (dst net 5.0.238.2/32))),
	((dst port 6385) || (dst port 34828) || (dst port 35963) || (dst port 43717) || (dst port 45782)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.41.83/32) || (dst net 6.0.69.244/32) || (dst net 6.0.125.167/32) || (dst net 6.0.147.10/32) || (dst net 6.0.249.228/32))),
	((dst port 2074) || (dst port 9910) || (dst port 28922) || (dst port 32918) || (dst port 47932)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.126.193/32) || (dst net 7.0.146.84/32) || (dst net 7.0.150.194/32) || (dst net 7.0.156.90/32) || (dst net 7.0.171.1/32))),
	((dst port 7024) || (dst port 25098) || (dst port 36165) || (dst port 39137) || (dst port 40050)) && ((dst net 8.0.0.0/8) && !((dst net 8.0.8.249/32) || (dst net 8.0.13.54/32) || (dst net 8.0.62.194/32) || (dst net 8.0.82.22/32) || (dst net 8.0.133.166/32))),
	((dst port 26709) || (dst port 31444) || (dst port 31907) || (dst port 45679) || (dst port 46561)) && ((dst net 9.0.0.0/8) && !((dst net 9.0.124.152/32) || (dst net 9.0.131.94/32) || (dst net 9.0.166.112/32) || (dst net 9.0.197.165/32) || (dst net 9.0.239.110/32))),
	((dst port 15427) || (dst port 27099) || (dst port 34767) || (dst port 39157) || (dst port 61491)) && ((dst net 10.0.0.0/8) && !((dst net 10.0.70.210/32) || (dst net 10.0.71.181/32) || (dst net 10.0.136.194/32) || (dst net 10.0.155.5/32) || (dst net 10.0.180.17/32))),
	((dst port 9416) || (dst port 15091) || (dst port 16477) || (dst port 42698) || (dst port 58952)) && ((dst net 11.0.0.0/8) && !((dst net 11.0.135.5/32) || (dst net 11.0.174.119/32) || (dst net 11.0.200.116/32) || (dst net 11.0.210.58/32) || (dst net 11.0.235.151/32))),
	((dst port 8057) || (dst port 27294) || (dst port 33215) || (dst port 46038) || (dst port 62420)) && ((dst net 12.0.0.0/8) && !((dst net 12.0.1.59/32) || (dst net 12.0.70.126/32) || (dst net 12.0.71.104/32) || (dst net 12.0.219.217/32) || (dst net 12.0.239.155/32))),
	((dst port 19468) || (dst port 21677) || (dst port 22185) || (dst port 22582) || (dst port 49652)) && ((dst net 13.0.0.0/8) && !((dst net 13.0.25.144/32) || (dst net 13.0.27.148/32) || (dst net 13.0.111.190/32) || (dst net 13.0.112.247/32) || (dst net 13.0.196.37/32))),
	((dst port 24078) || (dst port 32234) || (dst port 52752) || (dst port 56664) || (dst port 63856)) && ((dst net 14.0.0.0/8) && !((dst net 14.0.14.60/32) || (dst net 14.0.29.78/32) || (dst net 14.0.51.214/32) || (dst net 14.0.124.60/32) || (dst net 14.0.146.189/32))),
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
