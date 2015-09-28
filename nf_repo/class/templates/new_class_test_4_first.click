ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((ip dst >= 67108864 && ip dst <= 67111973) || (ip dst >= 67111975 && ip dst <= 67126063) || (ip dst >= 67126065 && ip dst <= 67157104) || (ip dst >= 67157106 && ip dst <= 67158815) || (ip dst >= 67158817 && ip dst <= 67168523) || (ip dst >= 67168525 && ip dst <= 83886079)),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((ip dst >= 67108864 && ip dst <= 67125053) || (ip dst >= 67125055 && ip dst <= 67151562) || (ip dst >= 67151564 && ip dst <= 67156224) || (ip dst >= 67156226 && ip dst <= 67158236) || (ip dst >= 67158238 && ip dst <= 67173257) || (ip dst >= 67173259 && ip dst <= 83886079)),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((ip dst >= 67108864 && ip dst <= 67124446) || (ip dst >= 67124448 && ip dst <= 67126879) || (ip dst >= 67126881 && ip dst <= 67132408) || (ip dst >= 67132410 && ip dst <= 67140172) || (ip dst >= 67140174 && ip dst <= 67159097) || (ip dst >= 67159099 && ip dst <= 83886079)),
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
