ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 3083) || (dst port 14350) || (dst port 44491) || (dst port 44519) || (dst port 61257)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.0.0/32) || (dst net 1.0.33.172/32) || (dst net 1.0.117.107/32) || (dst net 1.0.136.100/32) || (dst net 1.0.193.112/32))),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
