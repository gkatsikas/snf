//============================================================================
//        Name: synthesizer.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class declaration for synthesizing Click configurations.
//============================================================================

#ifndef _SYNTHESIZER_HPP_
#define _SYNTHESIZER_HPP_

#include "synth_nat.hpp"

#include "../parser/chain_parser.hpp"
#include "../traffic_class_builder/filter.hpp"
#include "../traffic_class_builder/click_element.hpp"

struct ConsolidatedTc {

	std::string    m_nf_of_out_iface;
	std::string    m_out_iface;
	std::string    m_out_iface_conf;
	std::string    m_operation;
	std::string    m_pattern;
	std::string    m_chain;
	unsigned short m_inputPort;
	std::string    m_nat;
	
	ConsolidatedTc();
	ConsolidatedTc(const std::string& nf_of_out_iface, const std::string& out_iface,
					const std::string& out_iface_conf, const std::string& op,
					const std::string& chain);

	void        add_tc (const TrafficClass& tc, const TrafficClassFormat& tc_format);
	void        set_nat(std::shared_ptr<SynthesizedNat> nat, unsigned short input_port);
	std::string get_chain ();
};

class Synthesizer {
	private:
		/*
		 * The object that provides the individual NF data structures
		 */
		ChainParser* parser;

		/*
		 * Logger instance
		 */
		Logger log;
		
		/*
		 * Generated synthesized paths.
		 * A traffic class specification associated with an input interface.
		 * |--> {FromDevice --> IPClassifier --> IPRewriter} paths.
		 */
		std::unordered_map< std::string, std::unordered_map<std::string, ConsolidatedTc> > tc_per_input_iface;

		/*
		 * A map of output interfaces associated with stateful rewrite operations.
		 * |--> {IPRewriter --> ToDevice} paths.
		 */
		std::unordered_map< std::string, std::shared_ptr<SynthesizedNat> > nat_per_output_iface;
		/*
		 * The configuration of these interfaces
		 */
		std::unordered_map< std::string, std::string > nat_per_output_iface_conf;

		/*
		 * A vector with the discrete interfaces of the final chain.
		 */
		std::set < std::pair<std::string, std::string> > hyper_nf_ifaces;

		/*
		 * Generate the synthesis as a combination of Intel-RSS rules for the NIC
		 * and Click code that runs per hardware queue.
		 */
		bool hw_classification;

		/*
		 * If hardware_classification is set, one of the following formats are valid:
		 * |--> RSS-Hashing
		 * |--> FlowDirector
		 * |--> OpenFlow
		 * Otherwise, Click is the standard way.
		 */
		TrafficClassFormat traffic_classification_format;

		/*
		 * The filename that becomes the base for either software or hardware configuration files.
		 */
		std::string basic_configuration_filename;

		/*
		 * The filename where the generated Click code will be written
		 */
		std::string soft_configuration_filename;

		/*
		 * The filenames where the generated Intel-RSS code will be written.
		 * One file per NIC
		 */
		 std::map< std::pair<std::string, std::string>, std::string > hrdw_configuration_per_nic;

	public:
		/*
		 * Public API for the Parser
		 */
		Synthesizer (ChainParser* cp);
		~Synthesizer();

		inline ChainParser* get_chain_parser(void) { return this->parser; };

		/*
		 * Traverse the NF DAGs, jump from NF to NF until you reach an
		 * endpoint. Along the way build the traffic classes required for
		 * the synthesis.
		 */
		short build_traffic_classes(void);

		/*
		 * Builds a path of elements per input-output interface pair
		 */
		short synthesize_nat(void);

		/*
		 * Generate a new configuration that depends on the user input.
		 * |--> Hardware-assisted, multi-core Hyper-NF
		 * If hardware classification is requested, generate two files: (a) an implementation of 
		 * the traffic classification in the NIC's language (Intel-RSS), and (b) a Click-DPDK configuration
		 * that schedules a multitude of threads (one per core) that handle different pieces of the header space.
		 * |--> All-in-Software Hyper-NF
		 * If hardware classification is not requested, generate a Click equivalent of the entire chain.
		 */
		short generate_equivalent_configuration(bool to_file=true);

		/*
		 * Generate a new Click configuration that implements the chain in one Click module.
		 * The configuration must achieve equivalent functionality with the initial one.
		 */
		short generate_all_in_soft_configuration(bool to_file=true);

		/*
		 * Hardware-assisted, multi-core Hyper-NF has 3 versions:
		 * (A) RSS-Hashing in the NIC splits traffic at will (based on fields that we specify).
		 *     Then, a Click-DPDK configuration is reading packets from different queues, schedules threads
		 *     from multiple cores on these queues, and clones the chain across all of them.
		 * (B) Flow Director commands are generated to split the traffic based on specific field values.
		 *     This provides a very limited classification but still can share traffic among cores.
		 *     Each Click-DPDK configuration implements a subset of the chain.
		 * (C) OpenFlow rules are generated to spit the traffic classes to the TCAM.
		 *     OpenVSwitch is used to implement these rules and then assign the traffic classes to 
		 *     different Click-DPDK processes. This is a split model again, the pipeline is not cloned.
		 */
		short generate_rss_cloned_pipelines         (bool to_file=true);
		short generate_flow_director_split_pipelines(bool to_file=true);
		short generate_openflow_split_pipelines     (bool to_file=true);

		/*
		 * Test the traffic classes's construction
		 */
		void test_traffic_class_builder(void);

	private:

		/*
		 * When hardware classification is on, we need to schedule multiple
		 * threads (one per core) to the various NIC queues and attach one 
		 * Click-DPDK Input element (FromDPDKDevice) to each queue.
		 */
		bool allocate_queues_to_cores(
			std::map <std::string, unsigned short>& nic_desc_to_core,
			std::map < std::string, std::vector<std::string> >& nic_desc_to_ip_class,
			std::string& code_buffer,
			const std::string& nf_and_iface_name,
			const unsigned short nic_no,
			const std::string& ipcl_name
		);

		/*
		 * Compose the arguments of Click's StaticThreadSched element.
		 * These arguments are maps of nic descriptors to CPU cores.
		 */
		bool schedule_core_threads_on_queues(
			std::map <std::string, unsigned short>& nic_desc_to_core,
			std::string& code_buffer
		);

		/*
		 * Dump ethtool configuration for the NICs involved in a Hyper-NF.
		 */
		bool generate_rss_configuration(
			std::ofstream **hw_out_file,
			unsigned short nics_no,
			std::streambuf* def_cout
		);

		/*
		 * Interface-specific methods of the final Hyper-NF chain.
		 */
		short get_hyper_nf_ifaces_no(void);
		void  print_hyper_nf_ifaces (void);
};

/*
 * Recursive DFS function to visit all vertices from 'vertex'.
 * The vertices can also belong to different graph, so in reality,
 * this is a recursive graph composition function.
 */
namespace TrafficBuilder {
	void traffic_class_builder_dfs(
		Graph* graph,
		NF_Map<NFGraph*> nf_chain,
		unsigned short nf_position,
		std::shared_ptr<ClickElement>,
		std::string nf_conf
	);
}

#endif
