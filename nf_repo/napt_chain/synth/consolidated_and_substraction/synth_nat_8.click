/** NAT going to: NF_8,netmap:nf8veth1, BURST 8, METHOD NETMAP **/
iprw8 :: IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw8[1] -> EtherEncap(0x0800, $macAddr1, $gwMACAddr1) -> Queue ($queueSize) -> ToDevice ($iface1, BURST 8, METHOD NETMAP);
iprw8[0] -> Discard ();

/** NAT going to: NF_4,netmap:nf4veth0, BURST 8, METHOD NETMAP **/
iprw7 :: IPRewriter(pattern 14.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw7[1] -> Discard ();
iprw7[0] -> Discard ();

/** NAT going to: NF_8,netmap:nf8veth0, BURST 8, METHOD NETMAP **/
iprw6 :: IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw6[1] -> Discard ();
iprw6[0] -> Discard ();

/** NAT going to: NF_2,netmap:nf2veth0, BURST 8, METHOD NETMAP **/
iprw4 :: IPRewriter(pattern 12.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw4[1] -> Discard ();
iprw4[0] -> Discard ();

/** NAT going to: NF_6,netmap:nf6veth0, BURST 8, METHOD NETMAP **/
iprw3 :: IPRewriter(pattern 16.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw3[1] -> Discard ();
iprw3[0] -> Discard ();

/** NAT going to: NF_7,netmap:nf7veth0, BURST 8, METHOD NETMAP **/
iprw5 :: IPRewriter(pattern 17.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw5[1] -> Discard ();
iprw5[0] -> Discard ();

/** NAT going to: NF_5,netmap:nf5veth0, BURST 8, METHOD NETMAP **/
iprw2 :: IPRewriter(pattern 15.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw2[1] -> Discard ();
iprw2[0] -> Discard ();

/** NAT going to: NF_3,netmap:nf3veth0, BURST 8, METHOD NETMAP **/
iprw1 :: IPRewriter(pattern 13.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw1[1] -> Discard ();
iprw1[0] -> Discard ();

/** NAT going to: NF_1,netmap:nf1veth0, BURST 8, METHOD NETMAP **/
iprw0 :: IPRewriter(pattern 11.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL true, CALC_CHECKSUM true);
iprw0[1] -> EtherEncap(0x0800, $macAddr0, $gwMACAddr0) -> Queue ($queueSize) -> ToDevice ($iface0, BURST 8, METHOD NETMAP);
iprw0[0] -> Discard ();

ipc0 :: IPClassifier (
	(((dst net 10.0.0.0/24) && !((dst net 10.0.0.1/32) || (dst net 11.0.0.1/32)))),
	(((dst net 12.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.1/32) || (dst net 12.0.0.2/32) || (dst net 13.0.0.1/32)))),
	(((dst net 14.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.1/32) || (dst net 14.0.0.2/32) || (dst net 15.0.0.1/32)))),
	(((dst net 15.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.0/24) || (dst net 15.0.0.1/32) || (dst net 15.0.0.2/32) || (dst net 16.0.0.1/32)))),
	(((dst net 11.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.1/32) || (dst net 11.0.0.2/32) || (dst net 12.0.0.1/32)))),
	(((dst net 16.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.0/24) || (dst net 15.0.0.0/24) || (dst net 16.0.0.1/32) || (dst net 16.0.0.2/32) || (dst net 17.0.0.1/32)))),
	(((dst net 17.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.0/24) || (dst net 15.0.0.0/24) || (dst net 16.0.0.0/24) || (dst net 17.0.0.1/32) || (dst net 17.0.0.2/32) || (dst net 200.0.0.1/32)))),
	(((dst net 13.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.1/32) || (dst net 13.0.0.2/32) || (dst net 14.0.0.1/32)))),
	(((dst net 0.0.0.0/0) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.0/24) || (dst net 15.0.0.0/24) || (dst net 16.0.0.0/24) || (dst net 17.0.0.0/24) || (dst net 200.0.0.0/24)))) || (((dst net 200.0.0.0/24) && !((dst net 10.0.0.0/24) || (dst net 11.0.0.0/24) || (dst net 12.0.0.0/24) || (dst net 13.0.0.0/24) || (dst net 14.0.0.0/24) || (dst net 15.0.0.0/24) || (dst net 16.0.0.0/24) || (dst net 17.0.0.0/24) || (dst net 200.0.0.1/32)))),
);
ipc0[0] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw0;
ipc0[1] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw1;
ipc0[2] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw2;
ipc0[3] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw3;
ipc0[4] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw4;
ipc0[5] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw5;
ipc0[6] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw6;
ipc0[7] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw7;
ipc0[8] -> DropBroadcasts() -> IPGWOptions($ipAddr) -> [0]iprw8;
FromDevice ($iface0) -> Strip(14) -> MarkIPHeader() -> ipc0;
