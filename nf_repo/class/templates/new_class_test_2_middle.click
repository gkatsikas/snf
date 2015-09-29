ipclassifier :: IPClassifier(
	((dst port 504) || (dst port 4380) || (dst port 25128) || (dst port 34715) || (dst port 43985)) && ((ip ipd >= 33554432 && ip ipd <= 33556696) || (ip ipd >= 33556698 && ip ipd <= 33557934) || (ip ipd >= 33557936 && ip ipd <= 33579564) || (ip ipd >= 33579566 && ip ipd <= 33588472) || (ip ipd >= 33588474 && ip ipd <= 33608890) || (ip ipd >= 33608892 && ip ipd <= 50331647)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
