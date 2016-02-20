ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 11855) || (dst port 15723) || (dst port 20810) || (dst port 46520) || (dst port 61467)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.0.196/32) || (dst net 1.0.6.225/32) || (dst net 1.0.23.75/32) || (dst net 1.0.70.75/32) || (dst net 1.0.106.15/32))),
	((dst port 9669) || (dst port 25410) || (dst port 32752) || (dst port 38483) || (dst port 55417)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.38.124/32) || (dst net 2.0.98.197/32) || (dst net 2.0.166.238/32) || (dst net 2.0.174.110/32) || (dst net 2.0.227.19/32))),
	((dst port 9294) || (dst port 16523) || (dst port 26789) || (dst port 32016) || (dst port 37022)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.37.237/32) || (dst net 3.0.142.96/32) || (dst net 3.0.151.18/32) || (dst net 3.0.244.151/32) || (dst net 3.0.251.187/32))),
	((dst port 8304) || (dst port 40740) || (dst port 41241) || (dst port 42681) || (dst port 52631)) && ((dst net 4.0.0.0/8) && !((dst net 4.0.32.67/32) || (dst net 4.0.51.35/32) || (dst net 4.0.81.186/32) || (dst net 4.0.118.203/32) || (dst net 4.0.246.12/32))),
	((dst port 9307) || (dst port 26891) || (dst port 27951) || (dst port 59093) || (dst port 62096)) && ((dst net 5.0.0.0/8) && !((dst net 5.0.7.67/32) || (dst net 5.0.52.8/32) || (dst net 5.0.63.115/32) || (dst net 5.0.99.170/32) || (dst net 5.0.121.248/32))),
	((dst port 8854) || (dst port 16584) || (dst port 23943) || (dst port 29839) || (dst port 51326)) && ((dst net 6.0.0.0/8) && !((dst net 6.0.18.49/32) || (dst net 6.0.23.152/32) || (dst net 6.0.33.149/32) || (dst net 6.0.41.134/32) || (dst net 6.0.226.187/32))),
	((dst port 14106) || (dst port 16392) || (dst port 44539) || (dst port 56419) || (dst port 59568)) && ((dst net 7.0.0.0/8) && !((dst net 7.0.89.123/32) || (dst net 7.0.115.202/32) || (dst net 7.0.166.211/32) || (dst net 7.0.207.24/32) || (dst net 7.0.238.132/32))),
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

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
