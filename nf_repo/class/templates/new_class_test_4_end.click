ipclassifier :: IPClassifier(
	((dst port 17650) || (dst port 27006) || (dst port 27224) || (dst port 55150) || (dst port 55443)) && ((dst net 0.0.0.0/8) && !((dst net 0.0.59.179/32) || (dst net 0.0.78.107/32) || (dst net 0.0.89.220/32) || (dst net 0.0.131.102/32) || (dst net 0.0.151.84/32))),
	((dst port 2166) || (dst port 32669) || (dst port 35026) || (dst port 37465) || (dst port 52588)) && ((dst net 1.0.0.0/8) && !((dst net 1.0.39.90/32) || (dst net 1.0.45.167/32) || (dst net 1.0.73.135/32) || (dst net 1.0.119.202/32) || (dst net 1.0.137.141/32))),
	((dst port 8547) || (dst port 10470) || (dst port 13943) || (dst port 46840) || (dst port 55185)) && ((dst net 2.0.0.0/8) && !((dst net 2.0.141.250/32) || (dst net 2.0.159.247/32) || (dst net 2.0.191.145/32) || (dst net 2.0.228.9/32) || (dst net 2.0.244.148/32))),
	((ip proto 17)) && ((dst port 1234)) && ((dst net 200.0.0.2/32)),
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
