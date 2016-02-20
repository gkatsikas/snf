ipclassifier :: IPClassifier(
	((dst port 504) || (dst port 4380) || (dst port 25128) || (dst port 34715) || (dst port 43985)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.8.217/32) || (dst net 0.0.13.175/32) || (dst net 0.0.98.45/32) || (dst net 0.0.132.249/32) || (dst net 0.0.212.187/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
