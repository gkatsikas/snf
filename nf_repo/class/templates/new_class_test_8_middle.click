ipclassifier :: IPClassifier(
	((dst port 28792) || (dst port 30294) || (dst port 41468) || (dst port 54049) || (dst port 62350)) && ((ip ipd >= 134217728 && ip ipd <= 134248612) || (ip ipd >= 134248614 && ip ipd <= 134250886) || (ip ipd >= 134250888 && ip ipd <= 134257075) || (ip ipd >= 134257077 && ip ipd <= 134267263) || (ip ipd >= 134267265 && ip ipd <= 134271308) || (ip ipd >= 134271310 && ip ipd <= 150994943)),
	((dst port 6778) || (dst port 18961) || (dst port 27134) || (dst port 33715) || (dst port 35221)) && ((ip ipd >= 134217728 && ip ipd <= 134262881) || (ip ipd >= 134262883 && ip ipd <= 134263748) || (ip ipd >= 134263750 && ip ipd <= 134273517) || (ip ipd >= 134273519 && ip ipd <= 134280277) || (ip ipd >= 134280279 && ip ipd <= 134282422) || (ip ipd >= 134282424 && ip ipd <= 150994943)),
	((dst port 1251) || (dst port 46304) || (dst port 46901) || (dst port 48610) || (dst port 52477)) && ((ip ipd >= 134217728 && ip ipd <= 134246566) || (ip ipd >= 134246568 && ip ipd <= 134255523) || (ip ipd >= 134255525 && ip ipd <= 134265553) || (ip ipd >= 134265555 && ip ipd <= 134274696) || (ip ipd >= 134274698 && ip ipd <= 134275175) || (ip ipd >= 134275177 && ip ipd <= 150994943)),
	((dst port 13078) || (dst port 32044) || (dst port 43758) || (dst port 44700) || (dst port 60074)) && ((ip ipd >= 134217728 && ip ipd <= 134221999) || (ip ipd >= 134222001 && ip ipd <= 134248092) || (ip ipd >= 134248094 && ip ipd <= 134252133) || (ip ipd >= 134252135 && ip ipd <= 134264483) || (ip ipd >= 134264485 && ip ipd <= 134275795) || (ip ipd >= 134275797 && ip ipd <= 150994943)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 14125) || (dst port 20692) || (dst port 29231) || (dst port 33729) || (dst port 64840)) && ((ip ipd >= 134217728 && ip ipd <= 134226849) || (ip ipd >= 134226851 && ip ipd <= 134247241) || (ip ipd >= 134247243 && ip ipd <= 134253376) || (ip ipd >= 134253378 && ip ipd <= 134274475) || (ip ipd >= 134274477 && ip ipd <= 134276057) || (ip ipd >= 134276059 && ip ipd <= 150994943)),
	((dst port 10066) || (dst port 13862) || (dst port 40394) || (dst port 41320) || (dst port 65480)) && ((ip ipd >= 134217728 && ip ipd <= 134241658) || (ip ipd >= 134241660 && ip ipd <= 134246545) || (ip ipd >= 134246547 && ip ipd <= 134248368) || (ip ipd >= 134248370 && ip ipd <= 134270593) || (ip ipd >= 134270595 && ip ipd <= 134275499) || (ip ipd >= 134275501 && ip ipd <= 150994943)),
	((dst port 13452) || (dst port 27376) || (dst port 44602) || (dst port 44729) || (dst port 54817)) && ((ip ipd >= 134217728 && ip ipd <= 134217765) || (ip ipd >= 134217767 && ip ipd <= 134217784) || (ip ipd >= 134217786 && ip ipd <= 134238645) || (ip ipd >= 134238647 && ip ipd <= 134265395) || (ip ipd >= 134265397 && ip ipd <= 134268410) || (ip ipd >= 134268412 && ip ipd <= 150994943)),
);

// Performance Testers
setIPClas :: SetCycleCount;
getIPClas0 :: CycleCountAccum;
getIPClas1 :: CycleCountAccum;
getIPClas2 :: CycleCountAccum;
getIPClas3 :: CycleCountAccum;
getIPClas4 :: CycleCountAccum;
getIPClas5 :: CycleCountAccum;
getIPClas6 :: CycleCountAccum;
getIPClas7 :: CycleCountAccum;

strip -> markIPHeader -> setIPClas -> [0]ipclassifier;

ipclassifier[0] -> getIPClas0 -> Discard ();
ipclassifier[1] -> getIPClas1 -> Discard ();
ipclassifier[2] -> getIPClas2 -> Discard ();
ipclassifier[3] -> getIPClas3 -> Discard ();
ipclassifier[4] -> getIPClas4 -> Discard ();
ipclassifier[5] -> getIPClas5 -> Discard ();
ipclassifier[6] -> getIPClas6 -> Discard ();
ipclassifier[7] -> getIPClas7 -> Discard ();
