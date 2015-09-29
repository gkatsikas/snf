ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 21511) || (dst port 23943) || (dst port 41461) || (dst port 49573) || (dst port 64950)) && ((ip ipd >= 67108864 && ip ipd <= 67111973) || (ip ipd >= 67111975 && ip ipd <= 67126063) || (ip ipd >= 67126065 && ip ipd <= 67157104) || (ip ipd >= 67157106 && ip ipd <= 67158815) || (ip ipd >= 67158817 && ip ipd <= 67168523) || (ip ipd >= 67168525 && ip ipd <= 83886079)),
	((dst port 4763) || (dst port 17872) || (dst port 28601) || (dst port 41396) || (dst port 57981)) && ((ip ipd >= 67108864 && ip ipd <= 67125053) || (ip ipd >= 67125055 && ip ipd <= 67151562) || (ip ipd >= 67151564 && ip ipd <= 67156224) || (ip ipd >= 67156226 && ip ipd <= 67158236) || (ip ipd >= 67158238 && ip ipd <= 67173257) || (ip ipd >= 67173259 && ip ipd <= 83886079)),
	((dst port 3969) || (dst port 10912) || (dst port 31885) || (dst port 58830) || (dst port 59587)) && ((ip ipd >= 67108864 && ip ipd <= 67124446) || (ip ipd >= 67124448 && ip ipd <= 67126879) || (ip ipd >= 67126881 && ip ipd <= 67132408) || (ip ipd >= 67132410 && ip ipd <= 67140172) || (ip ipd >= 67140174 && ip ipd <= 67159097) || (ip ipd >= 67159099 && ip ipd <= 83886079)),
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
