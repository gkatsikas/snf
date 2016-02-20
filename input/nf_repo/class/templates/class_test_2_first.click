ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 3083) || (dst port 14350) || (dst port 44491) || (dst port 44519) || (dst port 61257)) && ((dst net 2.0.0.1/32) || (dst net 2.0.0.2/31) || (dst net 2.0.0.4/30) || (dst net 2.0.0.8/29) || (dst net 2.0.0.16/28) || (dst net 2.0.0.32/27) || (dst net 2.0.0.64/26) || (dst net 2.0.0.128/25) || (dst net 2.0.1.0/24) || (dst net 2.0.2.0/23) || (dst net 2.0.4.0/22) || (dst net 2.0.8.0/21) || (dst net 2.0.16.0/20) || (dst net 2.0.32.0/24) || (dst net 2.0.33.0/25) || (dst net 2.0.33.128/27) || (dst net 2.0.33.160/29) || (dst net 2.0.33.168/30) || (dst net 2.0.33.173/32) || (dst net 2.0.33.174/31) || (dst net 2.0.33.176/28) || (dst net 2.0.33.192/26) || (dst net 2.0.34.0/23) || (dst net 2.0.36.0/22) || (dst net 2.0.40.0/21) || (dst net 2.0.48.0/20) || (dst net 2.0.64.0/19) || (dst net 2.0.96.0/20) || (dst net 2.0.112.0/22) || (dst net 2.0.116.0/24) || (dst net 2.0.117.0/26) || (dst net 2.0.117.64/27) || (dst net 2.0.117.96/29) || (dst net 2.0.117.104/31) || (dst net 2.0.117.106/32) || (dst net 2.0.117.108/30) || (dst net 2.0.117.112/28) || (dst net 2.0.117.128/25) || (dst net 2.0.118.0/23) || (dst net 2.0.120.0/21) || (dst net 2.0.128.0/21) || (dst net 2.0.136.0/26) || (dst net 2.0.136.64/27) || (dst net 2.0.136.96/30) || (dst net 2.0.136.101/32) || (dst net 2.0.136.102/31) || (dst net 2.0.136.104/29) || (dst net 2.0.136.112/28) || (dst net 2.0.136.128/25) || (dst net 2.0.137.0/24) || (dst net 2.0.138.0/23) || (dst net 2.0.140.0/22) || (dst net 2.0.144.0/20) || (dst net 2.0.160.0/19) || (dst net 2.0.192.0/24) || (dst net 2.0.193.0/26) || (dst net 2.0.193.64/27) || (dst net 2.0.193.96/28) || (dst net 2.0.193.113/32) || (dst net 2.0.193.114/31) || (dst net 2.0.193.116/30) || (dst net 2.0.193.120/29) || (dst net 2.0.193.128/25) || (dst net 2.0.194.0/23) || (dst net 2.0.196.0/22) || (dst net 2.0.200.0/21) || (dst net 2.0.208.0/20) || (dst net 2.0.224.0/19) || (dst net 2.1.0.0/16) || (dst net 2.2.0.0/15) || (dst net 2.4.0.0/14) || (dst net 2.8.0.0/13) || (dst net 2.16.0.0/12) || (dst net 2.32.0.0/11) || (dst net 2.64.0.0/10) || (dst net 2.128.0.0/9)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
