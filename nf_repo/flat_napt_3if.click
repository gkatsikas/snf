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
eth_encap2 :: EtherEncap(0x0800, 00:00:c0:4f:81:ef, 00:00:c0:4f:81:ff);

eth_encap0 -> out0;
eth_encap1 -> out1;
eth_encap2 -> out2;

// Implements NAPT
ipRewriter :: IPRewriter(
	pattern 195.135.65.1 1024-65535 - - 0 0,  /* Packets from 10.0.0/24 change src IP and port */
	pattern - - 10.0.0.1 - 0 0,  /* Packets from 192.168.0/24 change dst IP and port */
	pattern - - 10.0.0.1 - 0 0   /* Packets from 195.135.65/24 change dst IP and port */
);

rt :: StaticIPLookup(
	10.0.0.1/32 0,
	10.0.0.255/32 0,
	10.0.0.0/32 0,
	192.168.0.1/32 0,
	192.168.0.255/32 0,
	192.168.0.0/32 0,
	195.135.65.1/32 0,
	195.135.65.255/32 0,
	195.135.65.0/32 0,	
	10.0.0.0/24 1,
	192.168.0.0/24 2,
	195.135.65.0/24 3,
	0.0.0.0/0 10.0.0.1 1
);

ip0 :: Strip(14)
	-> CheckIPHeader()
	-> [0]ipRewriter;

// From 18.26.7
ip1 :: Strip(14)
	-> CheckIPHeader()
	-> [1]ipRewriter;

// From 18.26.7
ip2 :: Strip(14)
	-> CheckIPHeader()
	-> [2]ipRewriter;

c0[0] -> Paint(1) -> ip0;
c1[0] -> Paint(2) -> ip1;
c2[0] -> Paint(3) -> ip2;

// Rewrite IP address for routing
ipRewriter
	-> GetIPAddress(16)
	-> [0]rt;

rt[0] -> EtherEncap(0x0800, 1:1:1:1:1:1, 2:2:2:2:2:2) -> tol;
rt[1]
	-> DropBroadcasts
	-> gio0 :: IPGWOptions(10.0.0.1)
	-> FixIPSrc(10.0.0.1)
	-> dt0 :: DecIPTTL
	-> fr0 :: IPFragmenter(300)
	-> [0]eth_encap0;
rt[2]
	-> DropBroadcasts
	-> gio1 :: IPGWOptions(192.168.0.1)
	-> FixIPSrc(192.168.0.1)
	-> dt1 :: DecIPTTL
	-> fr1 :: IPFragmenter(300)
	-> [0]eth_encap1;
rt[3]
	-> DropBroadcasts
	-> gio2 :: IPGWOptions(195.135.65.1)
	-> FixIPSrc(195.135.65.1)
	-> dt2 :: DecIPTTL
	-> fr2 :: IPFragmenter(300)
	-> [0]eth_encap2;

// Unknown ethernet type numbers.
c0[1] -> Print() -> Discard;
c1[1] -> Print() -> Discard;
c2[1] -> Print() -> Discard;
