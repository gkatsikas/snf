Hyper-NF: Synthesizing High-Performance NFV Chains
======

A framework to turn a chain of Click-based network functions (NFs) into a sythesized Hyper-NF.

## Requirements
  * C++11 (e.g. apt-get install build-essential)
  * apt-get install libpcap-dev
  * apt-get install libboost-all-dev (or libboost-dev)

## Profile
  * apt-get install valgrind

## Steps
#### Hyper-NF
  * git clone git@bitbucket.org:nslab/hyper-nf.git
  * cd hyper-nf/
  * export HYPER_NF_HOME=`pwd`
  * cd ../

#### Click
  * git clone https://github.com/kohler/click.git
  * cd ./click
  * export CLICK_HOME=`pwd`
  * patch -p0 < ${HYPER_NF_HOME}/click.patch
    * Normal Click (User + Kernel-space):
		./configure 	--enable-user-multithread --enable-multithread --enable-ip6 --enable-nanotimestamp
				--enable-intel-cpu --enable-analysis --enable-ipsec --enable-local --enable-simple
				--enable-etherswitch --enable-all-elements
    * Click-Netmap (User-space only, after building Netmap):
		./configure     --with-netmap=${NETMAP_DIR}/sys --enable-multithread \
				--disable-linuxmodule --enable-intel-cpu --enable-user-multithread \
				--verbose --enable-select=poll CFLAGS="-O3" CXXFLAGS="-std=gnu++11 -O3" \
				--disable-dynamic-linking --enable-poll --enable-bound-port-transfer \
				--enable-local --enable-nanotimestamp --enable-ipsec --enable-analysis \
				--enable-ip6 --enable-simple --enable-etherswitch
    * Click-DPDK (User-space only, after building DPDK 2.1.0 or 2.2.0):
		./configure     RTE_SDK=${DPDK_DIR} RTE_TARGET=x86_64-native-linuxapp-gcc --enable-multithread \
				--disable-linuxmodule --enable-intel-cpu --enable-user-multithread \
				--verbose CFLAGS="-g -O3" CXXFLAGS="-g -std=gnu++11 -O3" \
				--disable-dynamic-linking --enable-poll --enable-bound-port-transfer \
				--enable-dpdk --with-netmap=no --enable-local --enable-nanotimestamp \
				--enable-ipsec --enable-analysis --enable-ip6 --enable-simple --enable-etherswitch
  * make elemlist
  * make install (uses default prefix=/usr/local/)

#### Hyper-NF
  * cd ${HYPER_NF_HOME}
  * Build Hyper-NF:
    * make (Normal Click or Click-Netmap)
    * make dpdk (Click-DPDK)
        * It uses the click libraries built under /usr/local/lib/ (-lclick) and the object files
         of the Click elements generated under /opt/click/<driver> (userlevel, linuxmodule, etc.)
        * NF Synthesizer currently supports only the userlevel driver.
        * You have to modify the Makefile accordingly if you do not follow the steps above.
  * Modify ./input/property_file accordingly to create the chains you wish
  * Write your own Click configurations and put them into ./nf_repo
    * Make sure that nf_repo/ contains the Click configurations you specify in the property_file
    * You can use our test Click implementations
  * ./run.sh <your property file> will load the property file and generate the synthesized chain in the specified folder ().

#### Multi-core Hyper-NF
There are various ways to deploy Hyper-NF across multiple cores. We currently support Click-DPDK using RSS as follows:
  * Build Hyper-NF with DPDK support following the steps above.
  * Input a set of Click-based NFs, even if they do not use Click-DPDK I/O.
  * In the [GENERIC] section of the input property file set:
    * HARDWARE_CLASSIFICATION = true
    * HARDWARE_CLASSIFICATION_FORMAT = RSS-Hashing
    * CPU_SOCKETS   = <M> (M is the number of the target machine's sockets)
    * CPU_CORES     = <N> (N is the total number of CPU cores on this machine)
    * NIC_HW_QUEUES = <K> (K is the number of hardware queues in your NIC. Indicatively, this number should be adhusted to the number of available cores above)
  * Run Hyper-NF and check the folder OUTPUT_FOLDER for a file OUTPUT_FILE.click as specified in the property file.
  * You will see a synthesized Hyper-NF chain, replicated across all the requested queues. Each queue has a dedicated thread that is statically assigned to a CPU core,
hence your Hyper-NF chain can read packets form all these queues and execute the chain pipeline in parallel.
  * Underneath this system, Click-DPDK I/O uses Receiver Side Scaling (RSS) to hash incoming packets to all the queues. See the RSS section below.

##### Receiver Side Scaling (RSS)
Click-DPDK uses RSS by default. The default hash function is specified in the lib/dpdkdevice.cc file using struct rte_eth_conf.
This data structure contains a member structure struct rte_eth_rxmode rxmode which in turn contains a field mq_mode (multi-queue mode in the receiver) that is set to ETH_MQ_RX_RSS (RSS in on).
The RSS configuration can be adjusted by modifying rx_adv_conf.rss_conf.rss_key (NULL by default) and rx_adv_conf.rss_conf.rss_hf (ETH_RSS_IP by default).
This configuration means that the IP address field is used in the hash function to split the packets.
To explore other possibilities in DPDK, refer to ${DPDK_DIR}/lib/librte_ether/rte_ethdev.h and search for keyword ETH_RSS_.
An important property we might want to explore is how to run RSS in symmetric mode.

##### Symmetric RSS (Source is http://galsagie.github.io/dpdk%20design%20tips/dpdk/nfv/2015/02/26/dpdk-tips-1/)
It is very important in networking applications to have the same CPU handle two sides of the connection, what is called symmetrical flow.
Many networking applications need to save information about the connection, and you dont want this information shared between two CPU’s.
This introduces locking which is bad performance wise.
RSS algorithm is usually using the Toeplitz hash function. This function takes two inputs: the static hash key and the tuples which are extracted from the packet.
The problem is that the default hash key that is used in DPDK (and is the recommended key from Microsoft) does not distribute symmetrical flows to the same CPU.
For example if we have the following packet {src ip=1.1.1.1, dst ip=2.2.2.2, src port=123, dst port=88} then the symmetrical packet {src ip=2.2.2.2, dst ip=1.1.1.1,
src port=88, dst port=123} might not have the same hash result.
One can achieve symmetric RSS by changing the hash key (which as i showed earlier can be changed in DPDK configuration) such that the first 32 bits of the key need
to be identical to the second 32 bits, and the 16 bits afterwards should be identical to the next 16 bits.
Using that key achieve symmetrical RSS, the problem is that changing this leads to bad distribution of the traffic between the different cores.

But fear not! as there is a solution to this problem.
A group of smart people found that there is a specific hash key which gives you both symmetrical flow distribution and a uniform one which is same with the default key)
You can read about it in their published paper (http://www.ndsl.kaist.edu/~kyoungsoo/papers/TR-symRSS.pdf).
Some tests have been done to check the uniform distribution of this key with random IP traffic and found it to be good (and symmetrical).
The hash key (in case you dont want to read the document) is:
static uint8_t symmetric_hashkey[40] = {
	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A,
	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A
};

Go to int DPDKDevice::initialize_device in lib/dpdkdevice.cc and replace:
	`dev_conf.rx_adv_conf.rss_conf.rss_key = NULL;`
with:
	`dev_conf.rx_adv_conf.rss_conf.rss_key = symmetric_hashkey;`
