#ifndef _PROPERTIES_HPP_
#define _PROPERTIES_HPP_

/*
 * properties.hpp
 *
 * Defines generic properties that drive the synthesis.
 * Among them, the output folder and filename where SNF
 * will generate the results, whether SNF will produce a
 * pure software or a hardware-assisted synthesis. If the latter
 * is selected, the number of CPU sockets, cores, NIC hardware
 * queues the type of CPU architecture are requested.
 *
 * Copyright (c) 2015-2016 KTH Royal Institute of Technology
 * Copyright (c) 2015-2016 Georgios Katsikas, Marcel Enguehard
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

#include <unordered_map>

// Default folder to save the synthesized Click configuration
#define DEFAULT_SNF_OUT_FOLDER static_cast<std::string> ("./results/")

// Default filename to save the synthesized Click (and RSS) configuration(s)
#define DEFAULT_SNF_CONF_NAME  static_cast<std::string> ("synth-nf")

// Indicative defaults
#define DEFAULT_CPU_CORES_NO     16
#define DEFAULT_CPU_SOCKETS_NO   2
#define DEFAULT_NUMBER_OF_NICS   2
#define DEFAULT_NIC_HW_QUEUES_NO 128

// Indicative upper-bounds
#define MAX_CPU_CORES_NO         512
#define MAX_CPU_SOCKETS_NO       128
#define MAX_NIC_HW_QUEUES_NO     128

/*
 * Possible Click types:
 * |--> Standard Click (Click)
 * |--> Fast user-space Click (FastClick)
 */
enum ClickType {
	Click,
	FastClick
};

/*
 * Convert the Click type given by the user (string) to one of the
 * above types.
 */
const std::unordered_map<std::string, ClickType> ClickLabelToType = {
	{"Click",     Click     },
	{"FastClick", FastClick }
};

#define DEFAULT_CLICK_TYPE Click

/*
 * Possible formats of Traffic Classes:
 * |--> To IPClassifier only                          (ClickIPClassifier)
 * |--> To replicated IPClassifiers using RSS-Hashing (NIC+Click)
 * |--> To Flow Director rules in the NIC             (NIC+Click)
 * |--> To OpenFlow software/hardware switch          (Switch+Click)
 */
enum TrafficClassFormat {
	ClickIPClassifier,
	RSSHashing,
	FlowDirector,
	OpenFlow
};

/*
 * Convert the traffic class format given by the user (string) to one of the
 * above types.
 */
const std::unordered_map<std::string, TrafficClassFormat> TCLabelToFormat = {
	{"ClickIPClassifier", ClickIPClassifier },
	{"RSSHashing",        RSSHashing        },
	{"FlowDirector",      FlowDirector      },
	{"OpenFlow",          OpenFlow          }
};

// Default method to classify the traffic.
#define DEFAULT_TC_FORMAT ClickIPClassifier

/*
 * Possible traffic processing layers
 * |--> L2: Ethernet headers are not stripped.
            A pointer (OFFSET 14 bytes) moves processing to IP layer.
 * |--> L3: Ethernet headers are stripped, IP packets are processed,
            and EtherEncap turns them back to frames.
 */
enum ProcessingLayer {
	L2,
	L3
};

/*
 * Convert the processing layer given by the user (string) to one of the
 * above types.
 */
const std::unordered_map<std::string, ProcessingLayer> ProcLayerToNumber = {
	{"L2", L2 },
	{"L3", L3 }
};

// Default processing layer for SNF.
#define DEFAULT_PROC_LAYER L3

/*
 * Possible traffic processing layers
 * |--> SingleCore:   One core does only I/O across all queues of a NIC;
 *                    other cores (in the same socket) do only processing.
 *                    Involves inter-core communication (via the shared cache).
 * |--> ShareNothing: One core/queue does both I/O and processing for this queue.
 */
enum IOMode {
	SingleCore,
	ShareNothing
};

/*
 * Convert the I/O mode given by the user (string) to one of the
 * above types.
 */
const std::unordered_map<std::string, IOMode> IOModeToNumber = {
	{"SingleCore",   SingleCore   },
	{"ShareNothing", ShareNothing }
};

// Default processing layer for SNF.
#define DEFAULT_IO_MODE SingleCore

/*
 * Class that groups useful system properties for SNF.
 */
class Properties {

	private:
		/*
		 * Boolean that indicates whether the target system supports
		 * Non-Uniform Memory Access (NUMA).
		 * This helps to do core allocation.
		 */
		bool               numa;

		/*
		 * Boolean that indicates whether the final output will target Intel-RSS + Click DPDK
		 * or simply Click.
		 */
		bool               hardware_classification;

		/*
		 * The variance of Click we base SNF upon.
		 * We support Click and FastClick.
		 */
		ClickType          click_type;

		/*
		 * If hardware_classification is set, one of the following formats are supported:
		 * |--> RSS-Hashing: Splits traffic based on hash functions on specified fields.
		 *      Then, each core will execute the same (entire) SNF chain.
		 *      Benefits come form parallel processing.
		 * |--> FlowDirector: Assigns traffic to cores based on concrete Flow Director rules.
		 * |--> OpenFlow: Trasform a traffic class into OpenFlow rules that can be injected
		 *      into a software switch (e.g., OVS). Then the switch will send each traffic
		 *      class to a different virtual interfaces
		 * Otherwise, ClickIPClassifier is the standard, all-in-software way.
		 */
		TrafficClassFormat traffic_classification_format;

		/*
		 * The network stack layer where SNF will process input traffic.
		 * Possible values are L2, L3
		 */
		ProcessingLayer    proc_layer;

		/*
		 * The way that the multi-core SNF performs packet I/O.
		 * |--> In SingleCore mode one core per NIC is dedicated to do only this task.
		 *      In NUMA architectures, the reamining cores in the same socket exchange
		 *      packets via the LLC to do the processing.
		 * |--> In ShareNothing mode, one core reads, processes, and writes packets in
		 *      one queue. This does not involve inter-core communication if we use
		 *      symmetric RSS to assign both directions of a flow to the same core.
		 */
		IOMode             io_mode;

		/*
		 * How many CPU sockets the target system has.
		 * This helps to do core allocation.
		 */
		unsigned short     cpu_sockets_no;

		/*
		 * How many CPU cores (in total) the target system has.
		 * This helps to do core allocation.
		 */
		unsigned short     cpu_cores_no;

		/*
		 * The NICs to be (potentially) used by multi-core SNF.
		 * In fact, SNF can use up to this number, depending on the input chain.
		 */
		unsigned short     number_of_nics;

		/*
		 * How many hardware queues the target system's NIC has.
		 * This helps to do core allocation per queue.
		 */
		unsigned short     nic_hw_queues_no;

		/*
		 * Instead of simply attaching FromDPDKDevice elements to different NIC queues (and cores)
		 * Follow the paths of each FromDPDKDevice descriptor and pin elements along these paths.
		 * This might not always increase the throughput of SNF as inter-core communication
		 * might be increased without any reason.
		 */
		bool               rss_aggressive_pinning;

		/*
		 * Output folder. This is where SNF Generator places the output files.
		 */
		std::string        output_folder;

		/*
		 * Output filename. This is the file generated by SNF (in the output_folder).
		 * Note that based on the property file choices, this can be either one .click file
		 * (i.e., output_filename.click) or a set of files (e.g., output_filename.click and
		 * output_filename.rss)
		 */
		std::string        output_filename;

	public:

		/*
		 * Default contructor with indicative properties
		 */
		Properties() {
			this->numa                          = true;
			this->hardware_classification       = false;
			this->click_type                    = DEFAULT_CLICK_TYPE;
			this->traffic_classification_format = DEFAULT_TC_FORMAT;
			this->proc_layer                    = DEFAULT_PROC_LAYER;
			this->io_mode                       = DEFAULT_IO_MODE;
			this->cpu_sockets_no                = DEFAULT_CPU_SOCKETS_NO;
			this->cpu_cores_no                  = DEFAULT_CPU_CORES_NO;
			this->number_of_nics                = DEFAULT_NUMBER_OF_NICS;
			this->nic_hw_queues_no              = DEFAULT_NIC_HW_QUEUES_NO;
			this->rss_aggressive_pinning        = false;
			this->output_folder                 = DEFAULT_SNF_OUT_FOLDER;
			this->output_filename               = DEFAULT_SNF_CONF_NAME;
		};

		/*
		 * Contructor with dynamic properties
		 */
		Properties(
			const bool &nm, const bool &hw_class, const ClickType cl_t,
			const TrafficClassFormat &tc_format, const ProcessingLayer &p_layer,
			const IOMode &io_md, const unsigned short &sockets_no,
			const unsigned short &cores_no, const unsigned short &nics_no,
			const unsigned short &nic_queues, const bool &rss_aggr_pin,
			const std::string &out_fold, const std::string &out_file):
			numa(nm), hardware_classification(hw_class), click_type(cl_t),
			traffic_classification_format(tc_format), proc_layer(p_layer),
			io_mode(io_md), cpu_sockets_no(sockets_no), cpu_cores_no(cores_no),
			number_of_nics(nics_no), nic_hw_queues_no(nic_queues),
			rss_aggressive_pinning(rss_aggr_pin), output_folder(out_fold),
			output_filename(out_file)
			{};

		/*
		 * Getters
		 */
		inline bool               has_numa                         (void) const { return this->numa; };
		inline bool               has_hardware_classification      (void) const { return this->hardware_classification; };

		inline ClickType          get_click_type                   (void) const { return this->click_type; };
		inline TrafficClassFormat get_traffic_classification_format(void) const
		{
			return this->traffic_classification_format;
		};
		inline ProcessingLayer    get_processing_layer      (void) const { return this->proc_layer;             };
		inline IOMode             get_io_mode               (void) const { return this->io_mode;                };

		inline unsigned short     get_cpu_cores_no          (void) const { return this->cpu_cores_no;           };
		inline unsigned short     get_cpu_sockets_no        (void) const { return this->cpu_sockets_no;         };
		inline unsigned short     get_number_of_nics        (void) const { return this->number_of_nics;         };
		inline unsigned short     get_nic_hw_queues_no      (void) const { return this->nic_hw_queues_no;       };
		inline bool               get_rss_aggressive_pinning(void) const { return this->rss_aggressive_pinning; };

		inline std::string        get_output_folder         (void) const { return this->output_folder;          };
		inline std::string        get_output_filename       (void) const { return this->output_filename;        };

		/*
		 * Setters (Basic sanity check)
		 */
		inline void set_numa                         (const bool &nm)
		{
			this->numa = nm;
		}
		inline void set_hardware_classification      (const bool &hw_class)
		{
			this->hardware_classification = hw_class;
		}
		inline void set_click_type                   (const ClickType &cl_t)
		{
			this->click_type = cl_t;
		}
		inline void set_traffic_classification_format(const TrafficClassFormat &tc_format)
		{
			this->traffic_classification_format = tc_format;
		}
		inline void set_processing_layer             (const ProcessingLayer &p_layer)
		{
			assert ((p_layer == L2) || (p_layer == L3));
			this->proc_layer = p_layer;
		}
		inline void set_io_mode                      (const IOMode &io_md)
		{
			assert ((io_md == SingleCore) || (io_md == ShareNothing));
			this->io_mode = io_md;
		}
		inline void set_cpu_cores_no                 (const unsigned short &cores_no)
		{
			assert ((cores_no > 0) && (cores_no < MAX_CPU_CORES_NO));
			this->cpu_cores_no = cores_no;
		}
		inline void set_cpu_sockets_no               (const unsigned short &sockets_no)
		{
			assert ((sockets_no > 0) && (sockets_no < MAX_CPU_SOCKETS_NO));
			this->cpu_sockets_no = sockets_no;
		}
		inline void set_number_of_nics               (const unsigned short &nics_no)
		{
			assert ((nics_no > 0));
			this->number_of_nics = nics_no;
		}
		inline void set_nic_hw_queues_no             (const unsigned short &nic_queues)
		{
			assert ((nic_queues > 0) && (nic_queues < MAX_NIC_HW_QUEUES_NO));
			if (nic_queues == 0) return;
			this->nic_hw_queues_no = nic_queues;
		}
		inline void set_rss_aggressive_pinning       (const bool &rss_aggr_pin)
		{
			this->rss_aggressive_pinning = rss_aggr_pin;
		}
		inline void set_output_folder                (const std::string &out_fold)
		{
			this->output_folder   = out_fold;
		}
		inline void set_output_filename              (const std::string &out_file)
		{
			this->output_filename = out_file;
		}
};

/*
 * Translate Click enum type to text.
 */
inline const std::string click_type_to_label(const ClickType &cl_t)
{
	switch (cl_t) {
		case Click:
			return std::string("Click");
		case FastClick:
			return std::string("FastClick");
		default:
			throw std::runtime_error("Unknown Click type");
	}
}

/*
 * Translate the traffic classification enum type to text.
 */
inline const std::string tc_to_label(const TrafficClassFormat &tc_format)
{
	switch (tc_format) {
		case ClickIPClassifier:
			return std::string("ClickIPClassifier");
		case RSSHashing:
			return std::string("RSSHashing");
		case FlowDirector:
			return std::string("FlowDirector");
		case OpenFlow:
			return std::string("OpenFlow");
		default:
			throw std::runtime_error("Unknown traffic class format");
	}
}

/*
 * Translate the processing layer enum type to text.
 */
inline const std::string proc_layer_to_label(const ProcessingLayer &p_layer)
{
	switch (p_layer) {
		case L2:
			return std::string("L2");
		case L3:
			return std::string("L3");
		default:
			throw std::runtime_error("Unknown traffic processing layer");
	}
}

/*
 * Translate the I/O mode enum type to text.
 */
inline const std::string io_mode_to_label(const IOMode &io_md)
{
	switch (io_md) {
		case SingleCore:
			return std::string("SingleCore");
		case ShareNothing:
			return std::string("ShareNothing");
		default:
			throw std::runtime_error("Unknown I/O mode");
	}
}

#endif
