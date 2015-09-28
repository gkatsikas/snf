ipclassifier :: IPClassifier(
	((dst port 4833) || (dst port 5946) || (dst port 17442) || (dst port 32374) || (dst port 62114)) && ((ip dst >= 67108864 && ip dst <= 67129771) || (ip dst >= 67129773 && ip dst <= 67141928) || (ip dst >= 67141930 && ip dst <= 67142699) || (ip dst >= 67142701 && ip dst <= 67168152) || (ip dst >= 67168154 && ip dst <= 67173525) || (ip dst >= 67173527 && ip dst <= 83886079)),
	((dst port 3282) || (dst port 30438) || (dst port 49908) || (dst port 50477) || (dst port 61669)) && ((ip dst >= 67108864 && ip dst <= 67127022) || (ip dst >= 67127024 && ip dst <= 67134038) || (ip dst >= 67134040 && ip dst <= 67141678) || (ip dst >= 67141680 && ip dst <= 67143581) || (ip dst >= 67143583 && ip dst <= 67168752) || (ip dst >= 67168754 && ip dst <= 83886079)),
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 41259) || (dst port 47542) || (dst port 48250) || (dst port 58235) || (dst port 65502)) && ((ip dst >= 67108864 && ip dst <= 67109902) || (ip dst >= 67109904 && ip dst <= 67117079) || (ip dst >= 67117081 && ip dst <= 67153982) || (ip dst >= 67153984 && ip dst <= 67163116) || (ip dst >= 67163118 && ip dst <= 67165766) || (ip dst >= 67165768 && ip dst <= 83886079)),
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
