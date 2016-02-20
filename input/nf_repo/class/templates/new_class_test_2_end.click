ipclassifier :: IPClassifier(
	((dst port 6027) || (dst port 27263) || (dst port 34533) || (dst port 42856) || (dst port 45954)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.106.225/32) || (dst net 0.0.150.200/32) || (dst net 0.0.175.209/32) || (dst net 0.0.216.160/32) || (dst net 0.0.238.50/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
