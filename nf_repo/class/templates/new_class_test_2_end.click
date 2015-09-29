ipclassifier :: IPClassifier(
	((dst port 6027) || (dst port 27263) || (dst port 34533) || (dst port 42856) || (dst port 45954)) && ((ip ipd >= 33554432 && ip ipd <= 33581792) || (ip ipd >= 33581794 && ip ipd <= 33593031) || (ip ipd >= 33593033 && ip ipd <= 33599440) || (ip ipd >= 33599442 && ip ipd <= 33609887) || (ip ipd >= 33609889 && ip ipd <= 33615409) || (ip ipd >= 33615411 && ip ipd <= 50331647)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
