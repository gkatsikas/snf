ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 3083) || (dst port 14350) || (dst port 44491) || (dst port 44519) || (dst port 61257)) && ((ip dst >= 33554433 && ip dst <= 33563051) || (ip dst >= 33563053 && ip dst <= 33584490) || (ip dst >= 33584492 && ip dst <= 33589347) || (ip dst >= 33589349 && ip dst <= 33603951) || (ip dst >= 33603953 && ip dst <= 50331647)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
