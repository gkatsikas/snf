ipclassifier :: IPClassifier(
	((dst port 4833) || (dst port 5946) || (dst port 17442) || (dst port 32374) || (dst port 62114)) && ((ip ipd >= 67108864 && ip ipd <= 67129771) || (ip ipd >= 67129773 && ip ipd <= 67141928) || (ip ipd >= 67141930 && ip ipd <= 67142699) || (ip ipd >= 67142701 && ip ipd <= 67168152) || (ip ipd >= 67168154 && ip ipd <= 67173525) || (ip ipd >= 67173527 && ip ipd <= 83886079)),
	((dst port 3282) || (dst port 30438) || (dst port 49908) || (dst port 50477) || (dst port 61669)) && ((ip ipd >= 67108864 && ip ipd <= 67127022) || (ip ipd >= 67127024 && ip ipd <= 67134038) || (ip ipd >= 67134040 && ip ipd <= 67141678) || (ip ipd >= 67141680 && ip ipd <= 67143581) || (ip ipd >= 67143583 && ip ipd <= 67168752) || (ip ipd >= 67168754 && ip ipd <= 83886079)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 41259) || (dst port 47542) || (dst port 48250) || (dst port 58235) || (dst port 65502)) && ((ip ipd >= 67108864 && ip ipd <= 67109902) || (ip ipd >= 67109904 && ip ipd <= 67117079) || (ip ipd >= 67117081 && ip ipd <= 67153982) || (ip ipd >= 67153984 && ip ipd <= 67163116) || (ip ipd >= 67163118 && ip ipd <= 67165766) || (ip ipd >= 67165768 && ip ipd <= 83886079)),
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
