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

out0 :: Queue(200) -> ToDevice(eth0);
out1 :: Queue(200) -> ToDevice(eth1);

// An "ARP querier" for each interface.
fake_arpq0 :: EtherEncap(0x0800, 00:00:c0:ae:67:ef, 00:00:c0:4f:71:ef); //ARPQuerier(18.26.4.24, 00:00:C0:AE:67:EF);
fake_arpq1 :: EtherEncap(0x0800, 00:00:c0:4f:71:ef, 00:00:c0:4f:71:ef); //ARPQuerier(18.26.7.1, 00:00:C0:4F:71:EF);

// Deliver ARP responses to ARP queriers as well as Linux.
//c0[1] -> fake_arpq0;
//c1[1] -> fake_arpq1;


// Connect ARP outputs to the interface queues.
fake_arpq0 -> out0;
fake_arpq1 -> out1;

// Proxy ARP on eth0 for 18.26.7, as well as cone's IP address.
//ar0 :: ARPResponder(
//	18.26.4.24 00:00:C0:AE:67:EF,
//	18.26.7.0/24 00:00:C0:AE:67:EF
//);

//c0[0] -> ar0 -> out0;

// Ordinary ARP on eth1.
//ar1 :: ARPResponder(18.26.7.1 00:00:C0:4F:71:EF);
//c1[0] -> ar1 -> out1;

// IP routing table. Outputs:
// 0: packets for this machine.
// 1: packets for 18.26.4.
// 2: packets for 18.26.7.
// All other packets are sent to output 1, with 18.26.4.1 as the gateway.
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

// Hand incoming IP packets to the routing table.
// CheckIPHeader checks all the lengths and length fields
// for sanity.
ip ::   Strip(14)
	-> CheckIPHeader(INTERFACES 18.26.4.1/24 18.26.7.1/24)
	-> [0]rt;
c0[0] -> Paint(1) -> ip;
c1[0] -> Paint(2) -> ip;

// IP packets for this machine.
// ToHost expects ethernet packets, so cook up a fake header.
rt[0] -> EtherEncap(0x0800, 1:1:1:1:1:1, 2:2:2:2:2:2) -> Discard;

// These are the main output paths; we've committed to a
// particular output device.
// Check paint to see if a redirect is required.
// Process record route and timestamp IP options.
// Fill in missing ip_src fields.
// Discard packets that arrived over link-level broadcast or multicast.
// Decrement and check the TTL after deciding to forward.
// Fragment.
// Send outgoing packets through ARP to the interfaces.
rt[1]	-> DropBroadcasts
	-> cp1 :: PaintTee(1)
	-> gio1 :: IPGWOptions(18.26.4.24)
	-> FixIPSrc(18.26.4.24)
	-> dt1 :: DecIPTTL
	-> fr1 :: IPFragmenter(300)
	-> [0]fake_arpq0;
rt[2]	-> DropBroadcasts
	-> cp2 :: PaintTee(2)
	-> gio2 :: IPGWOptions(18.26.7.1)
	-> FixIPSrc(18.26.7.1)
	-> dt2 :: DecIPTTL
	-> fr2 :: IPFragmenter(300)
	-> [0]fake_arpq1;

cp1[1] -> Discard;
cp2[1] -> Discard;

// Unknown ethernet type numbers.
c0[1] -> Print(c3) -> Discard;
c1[1] -> Print(c3) -> Discard;
