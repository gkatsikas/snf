ipclassifier :: IPClassifier(
	((dst port 504) || (dst port 4380) || (dst port 25128) || (dst port 34715) || (dst port 43985)) && ((ip dst >= 33554432 && ip dst <= 33556696) || (ip dst >= 33556698 && ip dst <= 33557934) || (ip dst >= 33557936 && ip dst <= 33579564) || (ip dst >= 33579566 && ip dst <= 33588472) || (ip dst >= 33588474 && ip dst <= 33608890) || (ip dst >= 33608892 && ip dst <= 50331647)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
