ipclassifier :: IPClassifier(
	((dst port 4833) || (dst port 5946) || (dst port 17442) || (dst port 32374) || (dst port 62114)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.81.172/32) || (dst net 0.0.129.41/32) || (dst net 0.0.132.44/32) || (dst net 0.0.231.153/32) || (dst net 0.0.252.150/32))),
	((dst port 3282) || (dst port 30438) || (dst port 49908) || (dst port 50477) || (dst port 61669)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.70.239/32) || (dst net 1.0.98.87/32) || (dst net 1.0.128.47/32) || (dst net 1.0.135.158/32) || (dst net 1.0.233.241/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
	((dst port 41259) || (dst port 47542) || (dst port 48250) || (dst port 58235) || (dst port 65502)) && ((dst net 3.0.0.0/8) && !((dst net 3.0.4.15/32) || (dst net 3.0.32.24/32) || (dst net 3.0.176.63/32) || (dst net 3.0.211.237/32) || (dst net 3.0.222.71/32))),
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
