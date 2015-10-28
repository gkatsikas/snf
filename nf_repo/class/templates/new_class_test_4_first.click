ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.12.38/32) || (dst net 1.0.67.48/32) || (dst net 1.0.188.113/32) || (dst net 1.0.195.32/32) || (dst net 1.0.233.12/32))),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.63.62/32) || (dst net 2.0.166.203/32) || (dst net 2.0.185.1/32) || (dst net 2.0.192.221/32) || (dst net 2.0.251.138/32))),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.60.223/32) || (dst net 3.0.70.96/32) || (dst net 3.0.91.249/32) || (dst net 3.0.122.77/32) || (dst net 3.0.196.58/32))),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
