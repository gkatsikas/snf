
/** NAT going to: nf1veth0 **/
iprw0::IPRewriter(pattern - - - - 1 0, pattern - - - - 1 0);
iprw0[1] -> EtherEncap(0x0800, $etherEncapConf) -> Queue ($queueSize) -> ToDevice ($iface1);
iprw0[0] -> Discard ();

ipc0 :: IPClassifier (
	,
	((ip proto 6)),
);
ipc0[0] -> [0]iprw0;
ipc0[1] -> [1]iprw0;
FromDevice ($iface0) -> Strip(14) -> MarkIPHeader() -> ipc0;
