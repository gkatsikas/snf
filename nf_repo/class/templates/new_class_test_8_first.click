ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip dst 3355443202)),
	((dst port 11855) || (dst port 15723) || (dst port 20810) || (dst port 46520) || (dst port 61467)) && ((ip dst >= 134217728 && ip dst <= 134217923) || (ip dst >= 134217925 && ip dst <= 134219488) || (ip dst >= 134219490 && ip dst <= 134223690) || (ip dst >= 134223692 && ip dst <= 134235722) || (ip dst >= 134235724 && ip dst <= 134244878) || (ip dst >= 134244880 && ip dst <= 150994943)),
	((dst port 9669) || (dst port 25410) || (dst port 32752) || (dst port 38483) || (dst port 55417)) && ((ip dst >= 134217728 && ip dst <= 134227579) || (ip dst >= 134227581 && ip dst <= 134243012) || (ip dst >= 134243014 && ip dst <= 134260461) || (ip dst >= 134260463 && ip dst <= 134262381) || (ip dst >= 134262383 && ip dst <= 134275858) || (ip dst >= 134275860 && ip dst <= 150994943)),
	((dst port 9294) || (dst port 16523) || (dst port 26789) || (dst port 32016) || (dst port 37022)) && ((ip dst >= 134217728 && ip dst <= 134227436) || (ip dst >= 134227438 && ip dst <= 134254175) || (ip dst >= 134254177 && ip dst <= 134256401) || (ip dst >= 134256403 && ip dst <= 134280342) || (ip dst >= 134280344 && ip dst <= 134282170) || (ip dst >= 134282172 && ip dst <= 150994943)),
	((dst port 8304) || (dst port 40740) || (dst port 41241) || (dst port 42681) || (dst port 52631)) && ((ip dst >= 134217728 && ip dst <= 134225986) || (ip dst >= 134225988 && ip dst <= 134230818) || (ip dst >= 134230820 && ip dst <= 134238649) || (ip dst >= 134238651 && ip dst <= 134248138) || (ip dst >= 134248140 && ip dst <= 134280715) || (ip dst >= 134280717 && ip dst <= 150994943)),
	((dst port 9307) || (dst port 26891) || (dst port 27951) || (dst port 59093) || (dst port 62096)) && ((ip dst >= 134217728 && ip dst <= 134219586) || (ip dst >= 134219588 && ip dst <= 134231047) || (ip dst >= 134231049 && ip dst <= 134233970) || (ip dst >= 134233972 && ip dst <= 134243241) || (ip dst >= 134243243 && ip dst <= 134248951) || (ip dst >= 134248953 && ip dst <= 150994943)),
	((dst port 8854) || (dst port 16584) || (dst port 23943) || (dst port 29839) || (dst port 51326)) && ((ip dst >= 134217728 && ip dst <= 134222384) || (ip dst >= 134222386 && ip dst <= 134223767) || (ip dst >= 134223769 && ip dst <= 134226324) || (ip dst >= 134226326 && ip dst <= 134228357) || (ip dst >= 134228359 && ip dst <= 134275770) || (ip dst >= 134275772 && ip dst <= 150994943)),
	((dst port 14106) || (dst port 16392) || (dst port 44539) || (dst port 56419) || (dst port 59568)) && ((ip dst >= 134217728 && ip dst <= 134240634) || (ip dst >= 134240636 && ip dst <= 134247369) || (ip dst >= 134247371 && ip dst <= 134260434) || (ip dst >= 134260436 && ip dst <= 134270743) || (ip dst >= 134270745 && ip dst <= 134278787) || (ip dst >= 134278789 && ip dst <= 150994943)),
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
