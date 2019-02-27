SNF: Synthesizing high performance NFV service chains
=========

A framework to turn a chain of Click-based network functions (NFs) into a synthesized network function (SNF).
Our [PeerJ Computer Science journal article][snf-paper] provides more information about SNF.

If you use SNF in your work, please cite our [article][snf-paper]:
```
@inproceedings{katsikas-snf.peerjcs16,
	author       = {Katsikas, Georgios P. and Enguehard, Marcel and Ku\'{z}niar, Maciej and Maguire Jr., Gerald Q. and Kosti\'{c}, Dejan},
	title        = {{SNF: Synthesizing high performance NFV service chains}},
	journal      = {PeerJ Computer Science},
	volume       = {2},
	pages        = {e98},
	numpages     = {30},
	month        = nov,
	year         = {2016},
	doi          = {10.7717/peerj-cs.98},
	issn         = {2376-5992},
	url          = {http://dx.doi.org/10.7717/peerj-cs.98},
	publisher    = {PeerJ Inc.},
	keywords     = {NFV, service chains, synthesis, single-read-single-write, line-rate, 40 Gbps},
}
```

Moreover, the [doctoral thesis][katsikas-phd-thesis] of Georgios P. Katsikas presents an even more thorough performance evaluation of SNF in Chapter 7.

I. Basic Installation
------
SNF is implemented in C++11 and uses autotools. To build and run SNF, follow the steps below:

A. Checkout SNF and Build Dependencies
----
  * `git clone git@bitbucket.org:nslab/snf.git`
  * `cd snf/`
  * `export SNF_HOME=$(pwd)`
  * `./build_deps`

B. Download and Configure Click
----
Note that currently, the build process assumes that your Click binaries reside in the default location `/usr/local/`.
In case you want to use the DPDK I/O, compile DPDK 17.08. Earlier versions such as 16.XX and 2.2.0 are also tested and work well.
Moreover, SNF can be configured to generate synthesized service chains based on [FastClick][fastclick]; a faster variant of the [Click modular router][click].
More information about SNF's configuration is provided in [Section II](#multi-core-snf).

  * `git clone https://github.com/gkatsikas/click.git`
  * `cd ./click`
  * `export CLICK_HOME=$(pwd)`
  * `git checkout snf`
    * Normal Click (User-space):

		`./configure    --enable-user-multithread --enable-multithread \
				--enable-intel-cpu --enable-nanotimestamp \
				--enable-all-elements`

    * Click-Netmap (User-space, after building Netmap):

		`./configure    --with-netmap=${NETMAP_DIR}/sys --enable-multithread \
				--disable-linuxmodule --enable-intel-cpu \
				--enable-user-multithread --verbose --enable-select=poll \
				CFLAGS="-O3" CXXFLAGS="-std=gnu++11 -O3" \
				--disable-dynamic-linking --enable-poll \
				--enable-bound-port-transfer --enable-nanotimestamp \
				--enable-all-elements`

    * Click-DPDK (User-space, after building DPDK):

		`./configure    RTE_SDK=${DPDK_DIR} RTE_TARGET=x86_64-native-linuxapp-gcc \
				--verbose CFLAGS="-std=gnu11 -g -O3" \
				CXXFLAGS="-g -std=gnu++14 -O3" \
				--disable-linuxmodule \
				--enable-intel-cpu --enable-multithread \
				--enable-user-multithread --disable-dynamic-linking \
				--enable-poll --enable-bound-port-transfer \
				--enable-dpdk --with-netmap=no \
				--enable-nanotimestamp --enable-json --enable-all-elements`

  * `make -j 8`

  * `sudo make install` (uses default prefix=/usr/local/)

C. Build SNF
----
  * `cd ${SNF_HOME}`
  * Build SNF according to INSTALL
  * Create an input property file of your wished service chain, following the example in: `input/tests/tests.prop`
    * Make sure that the Click configurations you specify in the property file are valid paths.
  * SNF can be instructed (via the property file) to generate either a Click or a FastClick synthesized service chain. This allows to reap the benefits of FastClick's advanced thread scheduling, computational batching, and fast user-space I/O, while maintaining compatibility with Click.

D. Run SNF
----
To synthesize and deploy your service chain do:

  * `./run.sh <snf-exec> <your property file>` will load the property file and generate the synthesized chain in the specified folder.
  * To run a Click-based SNF: `click <path-to-snf.click>`
  * To run a (Fast)Click-based SNF with DPDK: `click --dpdk -c 0xffff -v -- <path-to-dpdk-snf.click>`

II. Multi-core SNF
------
There are various ways to deploy SNF across multiple cores. We currently support Click-DPDK and FastClick with DPDK, both using Receive-Side Scaling (RSS) as follows:

  * Build SNF with DPDK support following the steps above.
  * Input a set of Click-based NFs, even if they do not use DPDK-based I/O. SNF will output DPDK-based I/O instructions if configured with DPDK.
  * In the [GENERIC] section of the input property file set:
    * HARDWARE_CLASSIFICATION = true
    * HARDWARE_CLASSIFICATION_FORMAT = RSS-Hashing
    * NUMA = true/false
    * CPU_SOCKETS   = <M> (M is the number of the target machine's sockets)
    * CPU_CORES     = <N> (N is the total number of CPU cores on this machine)
    * NIC_HW_QUEUES = <K> (K is the number of hardware queues in your NIC. Indicatively, this number should be adjusted to the number of available CPU cores above)
  * Run SNF and check the folder OUTPUT_FOLDER for a file OUTPUT_FILE.click as specified in the property file.
  * You will see a synthesized service chain, replicated across all the requested queues. Each queue has a dedicated thread that is statically assigned to a CPU core,
hence your SNF service chain can read packets from all of these queues and execute the service chain's pipeline in parallel.
  * Underneath this system, the DPDK I/O uses RSS to hash incoming packets to different hardware queues. See the RSS sections below.

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
Many networking applications operate on a per-flow basis and you don't want this information being shared among different CPUs.
Therefore, it is very important to have the same CPU handling both sides of a connection (bi-directional or symmetrical flows).
A group of researchers found that there is a specific hash key which offers this property for TCP flows.
You can read more details in their [paper][symrss-kaist].
The hash key (in case you don't want to read the paper) is:

static uint8_t symmetric_hashkey[40] = {

	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A,

	0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A, 0x6D, 0x5A

};

Go to int DPDKDevice::initialize_device in lib/dpdkdevice.cc and replace:

	dev_conf.rx_adv_conf.rss_conf.rss_key = NULL;

with:

	dev_conf.rx_adv_conf.rss_conf.rss_key = symmetric_hashkey;

Our snf branch in Click takes care of this.


III. SNF as part of Metron (USENIX NSDI 2018)
------

SNF is used by [Metron][metron-agent] to realize NFV service chains at the true speed of the underlying hardware.
For more information read our [USENIX NSDI 2018 paper][metron-paper] and watch my [talk at NSDI][metron-nsdi-page].

```
@inproceedings{katsikas-metron.nsdi18,
	author       = {Katsikas, Georgios P. and Barbette, Tom and Kosti\'{c}, Dejan and Steinert, Rebecca and Maguire Jr., Gerald Q.},
	title        = {{Metron: NFV Service Chains at the True Speed of the Underlying Hardware}},
	booktitle    = {15th USENIX Conference on Networked Systems Design and Implementation (NSDI 18)},
	series       = {NSDI'18},
	year         = {2018},
	isbn         = {978-1-931971-43-0},
	pages        = {171--186},
	numpages     = {16},
	url          = {https://www.usenix.org/system/files/conference/nsdi18/nsdi18-katsikas.pdf},
	address      = {Renton, WA},
	publisher    = {{USENIX} Association}
}
```

Additional information about Metron can be found in my [doctoral thesis][katsikas-phd-thesis].

[snf-paper]: https://peerj.com/articles/cs-98/
[metron-paper]: https://www.usenix.org/system/files/conference/nsdi18/nsdi18-katsikas.pdf
[metron-agent]: https://github.com/tbarbette/fastclick/tree/metron
[metron-nsdi-page]: https://www.usenix.org/conference/nsdi18/presentation/katsikas
[katsikas-phd-thesis]: http://urn.kb.se/resolve?urn=urn:nbn:se:kth:diva-233629
[fastclick]: https://github.com/tbarbette/fastclick
[click]: https://github.com/kohler/click
[symrss-kaist]: http://www.ndsl.kaist.edu/~kyoungsoo/papers/TR-symRSS.pdf
