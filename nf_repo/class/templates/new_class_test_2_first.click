ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 3083) || (dst port 14350) || (dst port 44491) || (dst port 44519) || (dst port 61257)) && ((ip ipd >= 33554433 && ip ipd <= 33563051) || (ip ipd >= 33563053 && ip ipd <= 33584490) || (ip ipd >= 33584492 && ip ipd <= 33589347) || (ip ipd >= 33589349 && ip ipd <= 33603951) || (ip ipd >= 33603953 && ip ipd <= 50331647)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
