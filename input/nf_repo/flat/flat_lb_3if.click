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

// Classifies packets. Port 80 goes to LB
ipClassifier :: IPClassifier(
	tcp port 80,  /* UDP packets */
	-             /* Unclassified packets are for me */
);

// Implements Round Robin Load Balancing across 3 servers
lb :: RoundRobinIPMapper(
	pattern - - 18.26.7.1 - 0 0,
	pattern - - 18.26.8.1 - 0 0
);

// Implements NAPT
ipRewriter :: IPRewriter(
	lb,                                     /* Inbound UDP Packets go to Load Balancer */
	drop,                                   /* Inbound rest --> drop */
	pattern 18.26.4.24 1024-65535 - - 0 0,  /* Outbound packets change src IP and port  */
	pattern 18.26.4.24 1024-65535 - - 0 0,  /* Outbound packets change src IP and port  */
);

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
	18.26.8.0/24 3,
	0.0.0.0/0 18.26.4.1 1
);

// Packets to be load balanced
strip0 :: Strip(14)
	-> CheckIPHeader
	-> ipClassifier;

// Packets from the 1st LB
strip1 :: Strip(14)
	-> CheckIPHeader
	-> [2]ipRewriter;

// Packets from the 2nd LB
strip2 :: Strip(14)
	-> CheckIPHeader
	-> [3]ipRewriter;

// UDP packets go to port 0 of Rewriter
ipClassifier[0]
	-> [0]ipRewriter;

// The rest packets are dropped
ipClassifier[1]
	-> [1]ipRewriter;

// Rewrite IP address for routing
ipRewriter
	-> GetIPAddress(16)
	-> [0]rt;

c0[0] -> Paint(1) -> strip0;
c1[0] -> Paint(2) -> strip1;
c2[0] -> Paint(3) -> strip2;

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
c0[1] -> Discard;
c1[1] -> Discard;
c2[1] -> Discard;
