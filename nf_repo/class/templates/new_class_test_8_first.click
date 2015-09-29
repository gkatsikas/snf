ipclassifier :: IPClassifier(
	((ip proto 17)) && ((dst port 1234)) && ((ip ipd 3355443202)),
	((dst port 11855) || (dst port 15723) || (dst port 20810) || (dst port 46520) || (dst port 61467)) && ((ip ipd >= 134217728 && ip ipd <= 134217923) || (ip ipd >= 134217925 && ip ipd <= 134219488) || (ip ipd >= 134219490 && ip ipd <= 134223690) || (ip ipd >= 134223692 && ip ipd <= 134235722) || (ip ipd >= 134235724 && ip ipd <= 134244878) || (ip ipd >= 134244880 && ip ipd <= 150994943)),
	((dst port 9669) || (dst port 25410) || (dst port 32752) || (dst port 38483) || (dst port 55417)) && ((ip ipd >= 134217728 && ip ipd <= 134227579) || (ip ipd >= 134227581 && ip ipd <= 134243012) || (ip ipd >= 134243014 && ip ipd <= 134260461) || (ip ipd >= 134260463 && ip ipd <= 134262381) || (ip ipd >= 134262383 && ip ipd <= 134275858) || (ip ipd >= 134275860 && ip ipd <= 150994943)),
	((dst port 9294) || (dst port 16523) || (dst port 26789) || (dst port 32016) || (dst port 37022)) && ((ip ipd >= 134217728 && ip ipd <= 134227436) || (ip ipd >= 134227438 && ip ipd <= 134254175) || (ip ipd >= 134254177 && ip ipd <= 134256401) || (ip ipd >= 134256403 && ip ipd <= 134280342) || (ip ipd >= 134280344 && ip ipd <= 134282170) || (ip ipd >= 134282172 && ip ipd <= 150994943)),
	((dst port 8304) || (dst port 40740) || (dst port 41241) || (dst port 42681) || (dst port 52631)) && ((ip ipd >= 134217728 && ip ipd <= 134225986) || (ip ipd >= 134225988 && ip ipd <= 134230818) || (ip ipd >= 134230820 && ip ipd <= 134238649) || (ip ipd >= 134238651 && ip ipd <= 134248138) || (ip ipd >= 134248140 && ip ipd <= 134280715) || (ip ipd >= 134280717 && ip ipd <= 150994943)),
	((dst port 9307) || (dst port 26891) || (dst port 27951) || (dst port 59093) || (dst port 62096)) && ((ip ipd >= 134217728 && ip ipd <= 134219586) || (ip ipd >= 134219588 && ip ipd <= 134231047) || (ip ipd >= 134231049 && ip ipd <= 134233970) || (ip ipd >= 134233972 && ip ipd <= 134243241) || (ip ipd >= 134243243 && ip ipd <= 134248951) || (ip ipd >= 134248953 && ip ipd <= 150994943)),
	((dst port 8854) || (dst port 16584) || (dst port 23943) || (dst port 29839) || (dst port 51326)) && ((ip ipd >= 134217728 && ip ipd <= 134222384) || (ip ipd >= 134222386 && ip ipd <= 134223767) || (ip ipd >= 134223769 && ip ipd <= 134226324) || (ip ipd >= 134226326 && ip ipd <= 134228357) || (ip ipd >= 134228359 && ip ipd <= 134275770) || (ip ipd >= 134275772 && ip ipd <= 150994943)),
	((dst port 14106) || (dst port 16392) || (dst port 44539) || (dst port 56419) || (dst port 59568)) && ((ip ipd >= 134217728 && ip ipd <= 134240634) || (ip ipd >= 134240636 && ip ipd <= 134247369) || (ip ipd >= 134247371 && ip ipd <= 134260434) || (ip ipd >= 134260436 && ip ipd <= 134270743) || (ip ipd >= 134270745 && ip ipd <= 134278787) || (ip ipd >= 134278789 && ip ipd <= 150994943)),
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
