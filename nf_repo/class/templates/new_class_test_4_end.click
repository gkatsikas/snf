ipclassifier :: IPClassifier(
	((dst port 17650) || (dst port 27006) || (dst port 27224) || (dst port 55150) || (dst port 55443)) && ((ip dst >= 67108864 && ip dst <= 67124146) || (ip dst >= 67124148 && ip dst <= 67128938) || (ip dst >= 67128940 && ip dst <= 67131867) || (ip dst >= 67131869 && ip dst <= 67142501) || (ip dst >= 67142503 && ip dst <= 67147603) || (ip dst >= 67147605 && ip dst <= 83886079)),
	((dst port 2166) || (dst port 32669) || (dst port 35026) || (dst port 37465) || (dst port 52588)) && ((ip dst >= 67108864 && ip dst <= 67118937) || (ip dst >= 67118939 && ip dst <= 67120550) || (ip dst >= 67120552 && ip dst <= 67127686) || (ip dst >= 67127688 && ip dst <= 67139529) || (ip dst >= 67139531 && ip dst <= 67144076) || (ip dst >= 67144078 && ip dst <= 83886079)),
	((dst port 8547) || (dst port 10470) || (dst port 13943) || (dst port 46840) || (dst port 55185)) && ((ip dst >= 67108864 && ip dst <= 67145209) || (ip dst >= 67145211 && ip dst <= 67149814) || (ip dst >= 67149816 && ip dst <= 67157904) || (ip dst >= 67157906 && ip dst <= 67167240) || (ip dst >= 67167242 && ip dst <= 67171475) || (ip dst >= 67171477 && ip dst <= 83886079)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
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
