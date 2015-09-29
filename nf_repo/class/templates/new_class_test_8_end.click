ipclassifier :: IPClassifier(
	((dst port 5312) || (dst port 13995) || (dst port 14015) || (dst port 25482) || (dst port 41260)) && ((ip ipd >= 134217728 && ip ipd <= 134223083) || (ip ipd >= 134223085 && ip ipd <= 134223923) || (ip ipd >= 134223925 && ip ipd <= 134264188) || (ip ipd >= 134264190 && ip ipd <= 134267798) || (ip ipd >= 134267800 && ip ipd <= 134272038) || (ip ipd >= 134272040 && ip ipd <= 150994943)),
	((dst port 18491) || (dst port 18615) || (dst port 27687) || (dst port 50914) || (dst port 51372)) && ((ip ipd >= 134217728 && ip ipd <= 134235370) || (ip ipd >= 134235372 && ip ipd <= 134243277) || (ip ipd >= 134243279 && ip ipd <= 134263090) || (ip ipd >= 134263092 && ip ipd <= 134279827) || (ip ipd >= 134279829 && ip ipd <= 134280129) || (ip ipd >= 134280131 && ip ipd <= 150994943)),
	((dst port 8942) || (dst port 11592) || (dst port 26093) || (dst port 39389) || (dst port 53723)) && ((ip ipd >= 134217728 && ip ipd <= 134218468) || (ip ipd >= 134218470 && ip ipd <= 134230298) || (ip ipd >= 134230300 && ip ipd <= 134230439) || (ip ipd >= 134230441 && ip ipd <= 134233721) || (ip ipd >= 134233723 && ip ipd <= 134282166) || (ip ipd >= 134282168 && ip ipd <= 150994943)),
	((dst port 6661) || (dst port 14379) || (dst port 41598) || (dst port 45614) || (dst port 52087)) && ((ip ipd >= 134217728 && ip ipd <= 134228064) || (ip ipd >= 134228066 && ip ipd <= 134233036) || (ip ipd >= 134233038 && ip ipd <= 134234581) || (ip ipd >= 134234583 && ip ipd <= 134272015) || (ip ipd >= 134272017 && ip ipd <= 134282474) || (ip ipd >= 134282476 && ip ipd <= 150994943)),
	((dst port 7696) || (dst port 14877) || (dst port 20892) || (dst port 39205) || (dst port 45865)) && ((ip ipd >= 134217728 && ip ipd <= 134221426) || (ip ipd >= 134221428 && ip ipd <= 134259240) || (ip ipd >= 134259242 && ip ipd <= 134261606) || (ip ipd >= 134261608 && ip ipd <= 134263357) || (ip ipd >= 134263359 && ip ipd <= 134267073) || (ip ipd >= 134267075 && ip ipd <= 150994943)),
	((dst port 9374) || (dst port 10596) || (dst port 31807) || (dst port 46072) || (dst port 56377)) && ((ip ipd >= 134217728 && ip ipd <= 134239332) || (ip ipd >= 134239334 && ip ipd <= 134252208) || (ip ipd >= 134252210 && ip ipd <= 134254029) || (ip ipd >= 134254031 && ip ipd <= 134256262) || (ip ipd >= 134256264 && ip ipd <= 134267704) || (ip ipd >= 134267706 && ip ipd <= 150994943)),
	((dst port 20365) || (dst port 28236) || (dst port 33954) || (dst port 34639) || (dst port 38544)) && ((ip ipd >= 134217728 && ip ipd <= 134226596) || (ip ipd >= 134226598 && ip ipd <= 134238437) || (ip ipd >= 134238439 && ip ipd <= 134254220) || (ip ipd >= 134254222 && ip ipd <= 134266159) || (ip ipd >= 134266161 && ip ipd <= 134271026) || (ip ipd >= 134271028 && ip ipd <= 150994943)),
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
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
