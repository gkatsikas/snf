c0 :: Classifier(
	12/0800,
	-
);

c1 :: Classifier(
	12/0800,
	-
);

c2 :: Classifier(
	12/0800,
	-
);

FromDevice(eth0) -> [0]c0;
FromDevice(eth1) -> [0]c1;
FromDevice(eth2) -> [0]c2;

out0 :: Queue(200) -> ToDevice(eth0);
out1 :: Queue(200) -> ToDevice(eth1);
out2 :: Queue(200) -> ToDevice(eth2);
tol :: Discard;

eth_encap0 :: EtherEncap(0x0800, 00:00:c0:ae:67:ef, 00:00:c0:4f:67:ff);
eth_encap1 :: EtherEncap(0x0800, 00:00:c0:4f:71:ef, 00:00:c0:4f:71:ff);
eth_encap1 :: EtherEncap(0x0800, 00:00:c0:4f:81:ef, 00:00:c0:4f:81:f);

eth_encap0 -> out0;
eth_encap1 -> out1;
eth_encap2 -> out2;

rt :: StaticIPLookup(
	18.26.4.24/32 0,
	18.26.4.255/32 0,
	18.26.4.0/32 0,
	18.26.7.1/32 0,
	18.26.7.255/32 0,
	18.26.7.0/32 0,
	18.26.8.1/32 0,
	18.26.8.255/32 0,
	18.26.8.0/32 0,	
	18.26.4.0/24 1,
	18.26.7.0/24 2,
	0.0.0.0/0 18.26.4.1 1
);

ip :: Strip(14)
	-> CheckIPHeader()
	-> [0]rt;

c0[0] -> Paint(1) -> ip;
c1[0] -> Paint(2) -> ip;
c2[0] -> Paint(3) -> ip;

rt[0] -> EtherEncap(0x0800, 1:1:1:1:1:1, 2:2:2:2:2:2) -> tol;
rt[1]
	-> DropBroadcasts
	-> gio0 :: IPGWOptions(18.26.4.24)
	-> FixIPSrc(18.26.4.24)
	-> dt0 :: DecIPTTL
	-> fr0 :: IPFragmenter(300)
	-> [0]eth_encap0;
rt[2]
	-> DropBroadcasts
	-> gio1 :: IPGWOptions(18.26.7.1)
	-> FixIPSrc(18.26.7.1)
	-> dt1 :: DecIPTTL
	-> fr1 :: IPFragmenter(300)
	-> [0]eth_encap1;
rt[3]
	-> DropBroadcasts
	-> gio2 :: IPGWOptions(18.26.8.1)
	-> FixIPSrc(18.26.8.1)
	-> dt2 :: DecIPTTL
	-> fr2 :: IPFragmenter(300)
	-> [0]eth_encap2;

// Unknown ethernet type numbers.
c0[1] -> Print() -> Discard;
c1[1] -> Print() -> Discard;
c2[1] -> Print() -> Discard;
