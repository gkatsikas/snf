ipclassifier :: IPClassifier(
	((dst port 504) || (dst port 4380) || (dst port 25128) || (dst port 34715) || (dst port 43985)) && ((dst net 2.0.0.0/21) || (dst net 2.0.8.0/25) || (dst net 2.0.8.128/26) || (dst net 2.0.8.192/28) || (dst net 2.0.8.208/29) || (dst net 2.0.8.216/32) || (dst net 2.0.8.218/31) || (dst net 2.0.8.220/30) || (dst net 2.0.8.224/27) || (dst net 2.0.9.0/24) || (dst net 2.0.10.0/23) || (dst net 2.0.12.0/24) || (dst net 2.0.13.0/25) || (dst net 2.0.13.128/27) || (dst net 2.0.13.160/29) || (dst net 2.0.13.168/30) || (dst net 2.0.13.172/31) || (dst net 2.0.13.174/32) || (dst net 2.0.13.176/28) || (dst net 2.0.13.192/26) || (dst net 2.0.14.0/23) || (dst net 2.0.16.0/20) || (dst net 2.0.32.0/19) || (dst net 2.0.64.0/19) || (dst net 2.0.96.0/23) || (dst net 2.0.98.0/27) || (dst net 2.0.98.32/29) || (dst net 2.0.98.40/30) || (dst net 2.0.98.44/32) || (dst net 2.0.98.46/31) || (dst net 2.0.98.48/28) || (dst net 2.0.98.64/26) || (dst net 2.0.98.128/25) || (dst net 2.0.99.0/24) || (dst net 2.0.100.0/22) || (dst net 2.0.104.0/21) || (dst net 2.0.112.0/20) || (dst net 2.0.128.0/22) || (dst net 2.0.132.0/25) || (dst net 2.0.132.128/26) || (dst net 2.0.132.192/27) || (dst net 2.0.132.224/28) || (dst net 2.0.132.240/29) || (dst net 2.0.132.248/32) || (dst net 2.0.132.250/31) || (dst net 2.0.132.252/30) || (dst net 2.0.133.0/24) || (dst net 2.0.134.0/23) || (dst net 2.0.136.0/21) || (dst net 2.0.144.0/20) || (dst net 2.0.160.0/19) || (dst net 2.0.192.0/20) || (dst net 2.0.208.0/22) || (dst net 2.0.212.0/25) || (dst net 2.0.212.128/27) || (dst net 2.0.212.160/28) || (dst net 2.0.212.176/29) || (dst net 2.0.212.184/31) || (dst net 2.0.212.186/32) || (dst net 2.0.212.188/30) || (dst net 2.0.212.192/26) || (dst net 2.0.213.0/24) || (dst net 2.0.214.0/23) || (dst net 2.0.216.0/21) || (dst net 2.0.224.0/19) || (dst net 2.1.0.0/16) || (dst net 2.2.0.0/15) || (dst net 2.4.0.0/14) || (dst net 2.8.0.0/13) || (dst net 2.16.0.0/12) || (dst net 2.32.0.0/11) || (dst net 2.64.0.0/10) || (dst net 2.128.0.0/9)),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
