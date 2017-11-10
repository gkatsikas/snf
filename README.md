SNF: Synthesizing high performance NFV service chains
=========

A framework to turn a chain of Click-based network functions (NFs) into a sythesized network function (SNF).
Our PeerJ Computer Science journal article provides more information about SNF: https://peerj.com/articles/cs-98/
Moreover, the licentiate thesis of Georgios P. Katsikas presents an even more thorough performance evaluation of SNF in Chapter 7: http://kth.diva-portal.org/smash/record.jsf?pid=diva2%3A1044355&dswid=-1244

I. Requirements
------
SNF is implemented in C++11 and uses autotools. Install the SNF dependencies as follows:

  * `cd snf/`
  * `./build_deps`

II. Steps
------
To build and run SNF, follow the steps below:

A. Download SNF
----
  * `git clone git@bitbucket.org:nslab/snf.git`
  * `cd snf/`
  * export SNF_HOME=$(pwd)
  * `cd ../`

B. Download and Configure Click
----
Note that currently, the build process assumes that your Click binaries reside in the default location `/usr/local/`.
We plan to get rid of this limitation soon.
In case you want to use the DPDK I/O, compile DPDK 17.08. Earlier versions such as 16.XX and 2.2.0 are also tested and work well.
In case you want to use FastClick input NFs instead of Click input NFs, SNF provides a patch to extend FastClick.
This patch allows SNF to compile against FastClick but it does not run correctly at the moment.
However, SNF allows to generate a FastClick-compatible synthesized chain out of an initial Click chain, hence you can still exploit the accelerations offered by FastClick.

  * `git clone https://github.com/gkatsikas/click.git`
  * `cd ./click`
  * export CLICK_HOME=$(pwd)
  * `git co snf`
    * Normal Click (User-space):

		`./configure    --enable-user-multithread --enable-multithread --enable-ip6
				--enable-nanotimestamp --enable-intel-cpu --enable-analysis
				--enable-ipsec --enable-local --enable-simple
				--enable-etherswitch --enable-all-elements`

    * Click-Netmap (User-space, after building Netmap):

		`./configure    --with-netmap=${NETMAP_DIR}/sys --enable-multithread
				--disable-linuxmodule --enable-intel-cpu
				--enable-user-multithread --verbose --enable-select=poll
				CFLAGS="-O3" CXXFLAGS="-std=gnu++11 -O3"
				--disable-dynamic-linking --enable-poll
				--enable-bound-port-transfer --enable-local
				--enable-nanotimestamp --enable-ipsec --enable-analysis
				--enable-ip6 --enable-simple --enable-etherswitch`

    * Click-DPDK (User-space, after building DPDK):

		`./configure    RTE_SDK=${DPDK_DIR}
				RTE_TARGET=x86_64-native-linuxapp-gcc --enable-multithread
				--disable-linuxmodule --enable-intel-cpu
				--enable-user-multithread --verbose
				CFLAGS="-g -O3" CXXFLAGS="-g -std=gnu++11 -O3"
				--disable-dynamic-linking --enable-poll
				--enable-bound-port-transfer --enable-dpdk --with-netmap=no
				--enable-local --enable-nanotimestamp --enable-ipsec
				--enable-analysis --enable-ip6 --enable-simple
				--enable-etherswitch`

  * `make install` (uses default prefix=/usr/local/)

C. Build SNF
----
  * `cd ${SNF_HOME}`
  * Build SNF according to INSTALL
  * Create an input property of your wished service chain, following the example in: `input/tests/tests.prop`
    * Make sure that the Click configurations you specify in the property file are valid paths.
  * SNF can be instructed (via the property file) to generate either a Click or a FastClick synthesized service chain. This allows to reap the benefits of FastClick's advanced thread scheduling, computational batching, and fast user-space I/O, while maintainig compatibility with Click.

D. Run SNF
----
To synthesize and deploy your service chain do:

  * `./run.sh <snf-exec> <your property file>` will load the property file and generate the synthesized chain in the specified folder.
  * To run a Click-based SNF: `click <path-to-snf.click>`
  * To run a (Fast)Click-based SNF with DPDK: `click --dpdk -c ffff -n 4 -- <path-to-dpdk-snf.click>`

III. Multi-core SNF
------
There are various ways to deploy SNF across multiple cores. We currently support Click-DPDK and FastClick (with DPDK) using Receive-Side Scaling (RSS) as follows:

  * Build SNF with DPDK support following the steps above.
  * Input a set of Click-based NFs, even if they do not use Click-DPDK I/O!
  * In the [GENERIC] section of the input property file set:
    * HARDWARE_CLASSIFICATION = true
    * HARDWARE_CLASSIFICATION_FORMAT = RSS-Hashing
    * CPU_SOCKETS   = <M> (M is the number of the target machine's sockets)
    * CPU_CORES     = <N> (N is the total number of CPU cores on this machine)
    * NIC_HW_QUEUES = <K> (K is the number of hardware queues in your NIC. Indicatively, this number should be adhusted to the number of available cores above)
  * Run SNF and check the folder OUTPUT_FOLDER for a file OUTPUT_FILE.click as specified in the property file.
  * You will see a synthesized SNF chain, replicated across all the requested queues. Each queue has a dedicated thread that is statically assigned to a CPU core,
hence your SNF chain can read packets from all of these queues and execute the chain pipeline in parallel.
  * Underneath this system, the DPDK I/O uses RSS to hash incoming packets to different hardware queues. See the RSS section below.

A. Receive-Side Scaling (RSS)
----
Click-DPDK or FastClick use RSS by default. The default hash function is specified in the lib/dpdkdevice.cc file using struct rte_eth_conf.
This data structure contains a member structure struct rte_eth_rxmode rxmode which in turn contains a field mq_mode (multi-queue mode in the receiver) that is set to ETH_MQ_RX_RSS (RSS in on).
The RSS configuration can be adjusted by modifying rx_adv_conf.rss_conf.rss_key (NULL by default) and rx_adv_conf.rss_conf.rss_hf (ETH_RSS_IP by default).
This configuration means that the IP address field is used in the hash function to split the packets.
To explore other possibilities in DPDK, refer to ${DPDK_DIR}/lib/librte_ether/rte_ethdev.h and search for keyword ETH_RSS_.
An important property we might want to explore is how to run RSS in symmetric mode.

B. Symmetric RSS
----
Many networking applications operate on a per-flow basis, and you don't want this information being shared among different CPUs.
Therefore, it is very important to have the same CPU handling both sides of a connection (bi-directional or symmetrical flows).
A group of researchers found that there is a specific hash key which offers this property.
You can read more details in their paper: http://www.ndsl.kaist.edu/~kyoungsoo/papers/TR-symRSS.pdf
The hash key (in case you don't want to read the document) is:
static uint8_t symmetric_hashkey[40] = {
	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A,
	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A
};

Go to int DPDKDevice::initialize_device in lib/dpdkdevice.cc and replace:
	`dev_conf.rx_adv_conf.rss_conf.rss_key = NULL;`
with:
	`dev_conf.rx_adv_conf.rss_conf.rss_key = symmetric_hashkey;`
