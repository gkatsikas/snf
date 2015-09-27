/** NAT going to: NF_1,netmap:nf1veth0, BURST 32, METHOD NETMAP **/
iprw3::IPRewriter(pattern 11.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL false, CALC_CHECKSUM true);
iprw3[1] -> EtherEncap(0x0800, $macAddr0, $gwMACAddr0) -> Queue ($queueSize) -> ToDevice ($iface0, BURST 32, METHOD NETMAP);
iprw3[0] -> Discard ();

/** NAT going to: NF_2,netmap:nf2veth0, BURST 32, METHOD NETMAP **/
iprw2::IPRewriter(pattern 12.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL false, CALC_CHECKSUM true);
iprw2[1] -> Discard ();
iprw2[0] -> Discard ();

/** NAT going to: NF_3,netmap:nf3veth0, BURST 32, METHOD NETMAP **/
iprw1::IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL false, CALC_CHECKSUM true);
iprw1[1] -> Discard ();
iprw1[0] -> Discard ();

/** NAT going to: NF_3,netmap:nf3veth1, BURST 32, METHOD NETMAP **/
iprw0::IPRewriter(pattern 200.0.0.1 1024-65535 - - 1 0, pattern 200.0.0.1 1024-65535 - - 1 0, DEC_IP_TTL false, CALC_CHECKSUM true);
iprw0[1] -> EtherEncap(0x0800, $macAddr1, $gwMACAddr1) -> Queue ($queueSize) -> ToDevice ($iface1, BURST 32, METHOD NETMAP);
iprw0[0] -> Discard ();

ipc0 :: IPClassifier (
	((dst net 0.0.0.0/5) || (dst net 8.0.0.0/7) || (dst net 10.0.1.0/24) || (dst net 10.0.2.0/23) || (dst net 10.0.4.0/22) || (dst net 10.0.8.0/21) || (dst net 10.0.16.0/20) || (dst net 10.0.32.0/19) || (dst net 10.0.64.0/18) || (dst net 10.0.128.0/17) || (dst net 10.1.0.0/16) || (dst net 10.2.0.0/15) || (dst net 10.4.0.0/14) || (dst net 10.8.0.0/13) || (dst net 10.16.0.0/12) || (dst net 10.32.0.0/11) || (dst net 10.64.0.0/10) || (dst net 10.128.0.0/9) || (dst net 11.0.1.0/24) || (dst net 11.0.2.0/23) || (dst net 11.0.4.0/22) || (dst net 11.0.8.0/21) || (dst net 11.0.16.0/20) || (dst net 11.0.32.0/19) || (dst net 11.0.64.0/18) || (dst net 11.0.128.0/17) || (dst net 11.1.0.0/16) || (dst net 11.2.0.0/15) || (dst net 11.4.0.0/14) || (dst net 11.8.0.0/13) || (dst net 11.16.0.0/12) || (dst net 11.32.0.0/11) || (dst net 11.64.0.0/10) || (dst net 11.128.0.0/9) || (dst net 12.0.1.0/24) || (dst net 12.0.2.0/23) || (dst net 12.0.4.0/22) || (dst net 12.0.8.0/21) || (dst net 12.0.16.0/20) || (dst net 12.0.32.0/19) || (dst net 12.0.64.0/18) || (dst net 12.0.128.0/17) || (dst net 12.1.0.0/16) || (dst net 12.2.0.0/15) || (dst net 12.4.0.0/14) || (dst net 12.8.0.0/13) || (dst net 12.16.0.0/12) || (dst net 12.32.0.0/11) || (dst net 12.64.0.0/10) || (dst net 12.128.0.0/9) || (dst net 13.0.0.0/8) || (dst net 14.0.0.0/7) || (dst net 16.0.0.0/4) || (dst net 32.0.0.0/3) || (dst net 64.0.0.0/2) || (dst net 128.0.0.0/2) || (dst net 192.0.0.0/5) || (dst net 200.0.1.0/24) || (dst net 200.0.2.0/23) || (dst net 200.0.4.0/22) || (dst net 200.0.8.0/21) || (dst net 200.0.16.0/20) || (dst net 200.0.32.0/19) || (dst net 200.0.64.0/18) || (dst net 200.0.128.0/17) || (dst net 200.1.0.0/16) || (dst net 200.2.0.0/15) || (dst net 200.4.0.0/14) || (dst net 200.8.0.0/13) || (dst net 200.16.0.0/12) || (dst net 200.32.0.0/11) || (dst net 200.64.0.0/10) || (dst net 200.128.0.0/9) || (dst net 201.0.0.0/8) || (dst net 202.0.0.0/7) || (dst net 204.0.0.0/6) || (dst net 208.0.0.0/4) || (dst net 224.0.0.0/3)),
	((dst net 200.0.0.0/32) || (dst net 200.0.0.2/31) || (dst net 200.0.0.4/30) || (dst net 200.0.0.8/29) || (dst net 200.0.0.16/28) || (dst net 200.0.0.32/27) || (dst net 200.0.0.64/26) || (dst net 200.0.0.128/25)),
	((dst net 12.0.0.0/32) || (dst net 12.0.0.3/32) || (dst net 12.0.0.4/30) || (dst net 12.0.0.8/29) || (dst net 12.0.0.16/28) || (dst net 12.0.0.32/27) || (dst net 12.0.0.64/26) || (dst net 12.0.0.128/25)),
	((dst net 11.0.0.0/32) || (dst net 11.0.0.3/32) || (dst net 11.0.0.4/30) || (dst net 11.0.0.8/29) || (dst net 11.0.0.16/28) || (dst net 11.0.0.32/27) || (dst net 11.0.0.64/26) || (dst net 11.0.0.128/25)),
	((dst net 10.0.0.0/32) || (dst net 10.0.0.2/31) || (dst net 10.0.0.4/30) || (dst net 10.0.0.8/29) || (dst net 10.0.0.16/28) || (dst net 10.0.0.32/27) || (dst net 10.0.0.64/26) || (dst net 10.0.0.128/25)),
);
ipc0[0] -> DropBroadcasts() -> IPGWOptions($ipAddr0) -> [0]iprw0;
ipc0[1] -> DropBroadcasts() -> IPGWOptions($ipAddr0) -> [1]iprw0;
ipc0[2] -> DropBroadcasts() -> IPGWOptions($ipAddr0) -> [0]iprw1;
ipc0[3] -> DropBroadcasts() -> IPGWOptions($ipAddr0) -> [0]iprw2;
ipc0[4] -> DropBroadcasts() -> IPGWOptions($ipAddr0) -> [0]iprw3;
FromDevice ($iface0) -> Strip(14) -> MarkIPHeader() -> ipc0;
