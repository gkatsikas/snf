c0 :: Classifier(
	12/0800,
	-
);
c1 :: Classifier(
	12/0800,
	-
);

FromDevice(eth0) -> [0]c0;
FromDevice(eth1) -> [0]c1;

out0 :: Queue(200) -> Discard;
out1 :: Queue(200) -> Discard;
tol :: Discard;

eth_encap0 :: EtherEncap(0x0800, 00:00:c0:ae:67:ef, 00:00:c0:4f:71:ef);
eth_encap1 :: EtherEncap(0x0800, 00:00:c0:4f:71:ef, 00:00:c0:4f:71:ef);

eth_encap0 -> out0;
eth_encap1 -> out1;

// Implements NAPT
ipRewriter :: IPRewriter(
	pattern 18.26.7.1 1024-65535 - - 0 1,  /* Packets from 18.26.4/24 change src IP and port */
	pattern - - 18.26.4.24 1024-65535 1 0  /* Packets from 18.26.7/24 change dst IP and port */
);

rt :: StaticIPLookup(
	18.26.4.24/32 0,
	18.26.4.255/32 0,
	18.26.4.0/32 0,
	18.26.7.1/32 0,
	18.26.7.255/32 0,
	18.26.7.0/32 0,
	18.26.4.0/24 1,
	18.26.7.0/24 2,
	0.0.0.0/0 18.26.4.1 1
);

// From 18.26.4
ip0 :: Strip(14)
	-> CheckIPHeader()
	-> [0]ipRewriter;

// From 18.26.7
ip1 :: Strip(14)
	-> CheckIPHeader()
	-> [1]ipRewriter;

// Rewrite IP address for routing
ipRewriter
	-> GetIPAddress(16)
	-> [0]rt;

c0[0] -> Paint(1) -> ip;
c1[0] -> Paint(2) -> ip;

// IP packets for this machine.
rt[0] -> EtherEncap(0x0800, 1:1:1:1:1:1, 2:2:2:2:2:2) -> tol;

rt[1] -> DropBroadcasts
      -> gio1 :: IPGWOptions(18.26.4.24)
      -> FixIPSrc(18.26.4.24)
      -> dt1 :: DecIPTTL
      -> fr1 :: IPFragmenter(300)
      -> [0]eth_encap0;
rt[2] -> DropBroadcasts
      -> gio2 :: IPGWOptions(18.26.7.1)
      -> FixIPSrc(18.26.7.1)
      -> dt2 :: DecIPTTL
      -> fr2 :: IPFragmenter(300)
      -> [0]eth_encap1;

// Unknown ethernet type numbers.
c0[1] -> Print() -> Discard;
c1[1] -> Print() -> Discard;
