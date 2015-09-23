ipclassifier :: IPClassifier(
	((dst port 6027) || (dst port 27263) || (dst port 34533) || (dst port 42856) || (dst port 45954)) && ((dst net 2.0.0.0/18) || (dst net 2.0.64.0/19) || (dst net 2.0.96.0/21) || (dst net 2.0.104.0/23) || (dst net 2.0.106.0/25) || (dst net 2.0.106.128/26) || (dst net 2.0.106.192/27) || (dst net 2.0.106.224/32) || (dst net 2.0.106.226/31) || (dst net 2.0.106.228/30) || (dst net 2.0.106.232/29) || (dst net 2.0.106.240/28) || (dst net 2.0.107.0/24) || (dst net 2.0.108.0/22) || (dst net 2.0.112.0/20) || (dst net 2.0.128.0/20) || (dst net 2.0.144.0/22) || (dst net 2.0.148.0/23) || (dst net 2.0.150.0/25) || (dst net 2.0.150.128/26) || (dst net 2.0.150.192/29) || (dst net 2.0.150.201/32) || (dst net 2.0.150.202/31) || (dst net 2.0.150.204/30) || (dst net 2.0.150.208/28) || (dst net 2.0.150.224/27) || (dst net 2.0.151.0/24) || (dst net 2.0.152.0/21) || (dst net 2.0.160.0/21) || (dst net 2.0.168.0/22) || (dst net 2.0.172.0/23) || (dst net 2.0.174.0/24) || (dst net 2.0.175.0/25) || (dst net 2.0.175.128/26) || (dst net 2.0.175.192/28) || (dst net 2.0.175.208/32) || (dst net 2.0.175.210/31) || (dst net 2.0.175.212/30) || (dst net 2.0.175.216/29) || (dst net 2.0.175.224/27) || (dst net 2.0.176.0/20) || (dst net 2.0.192.0/20) || (dst net 2.0.208.0/21) || (dst net 2.0.216.0/25) || (dst net 2.0.216.128/27) || (dst net 2.0.216.161/32) || (dst net 2.0.216.162/31) || (dst net 2.0.216.164/30) || (dst net 2.0.216.168/29) || (dst net 2.0.216.176/28) || (dst net 2.0.216.192/26) || (dst net 2.0.217.0/24) || (dst net 2.0.218.0/23) || (dst net 2.0.220.0/22) || (dst net 2.0.224.0/21) || (dst net 2.0.232.0/22) || (dst net 2.0.236.0/23) || (dst net 2.0.238.0/27) || (dst net 2.0.238.32/28) || (dst net 2.0.238.48/31) || (dst net 2.0.238.51/32) || (dst net 2.0.238.52/30) || (dst net 2.0.238.56/29) || (dst net 2.0.238.64/26) || (dst net 2.0.238.128/25) || (dst net 2.0.239.0/24) || (dst net 2.0.240.0/20) || (dst net 2.1.0.0/16) || (dst net 2.2.0.0/15) || (dst net 2.4.0.0/14) || (dst net 2.8.0.0/13) || (dst net 2.16.0.0/12) || (dst net 2.32.0.0/11) || (dst net 2.64.0.0/10) || (dst net 2.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
