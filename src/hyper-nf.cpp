//============================================================================
//        Name: hyper-nf.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Bootstraps Hyper-NF, a Click-based NFV Chain Synthesizer
//============================================================================

#include "logger/logger.hpp"
#include "synthesizer/synthesizer.hpp"

short int
parseArguments (int cmd_args_no, char **cmd_args, std::string *property_file);

int
main(int argc, char** argv) {
	setvbuf(stdout, NULL, _IONBF, 0);
	std::string property_file;
	short exit_status   = 0;
	int task_exec_time  = 0;
	int total_exec_time = 0;

	// Initialize logger
	Logger main_log(__FILE__);
	info_chatter(main_log, "Hyper-NF: Network Functions' Chain Synthesizer");

	// Check input arguments validity
	if ( (exit_status=parseArguments(argc, argv, &property_file)) != SUCCESS ) {
		exit(exit_status);
	}

	//////////////////////////////////// Load property file ///////////////////////////////////
	ParserConfiguration* pcf = NULL;

	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]() {
		info_chatter(main_log, "Hyper-NF Chain Loader... ");
		pcf = new ParserConfiguration(property_file);
		def_chatter(main_log, "\tProperty file: " << property_file);
		if ( (exit_status=pcf->load_property_file()) != SUCCESS ) {
			delete pcf;
			exit(exit_status);
		}
		pcf->get_chain()->print_vertex_order();
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	total_exec_time += task_exec_time;

	////////////////////////////////////// Parse Input NFs ////////////////////////////////////
	ChainParser* parser = NULL;

	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]() {
		info_chatter(main_log, "Hyper-NF Chain Parser... ");
		try {
			parser = new ChainParser(std::move(pcf));
		}
		catch (const std::exception& e) {
			error_chatter(main_log, "|--> " << e.what());
			delete pcf;
			exit(CHAIN_PARSING_PROBLEM);
		}

		// 1. Load and verify all the Click configuration of the chain
		if ( (exit_status=parser->load_nf_configurations()) != SUCCESS ) {
			delete parser;
			exit(exit_status);
		}

		// 2. Link the edges of all NF DAGs so as to prepare the Traffic Class Builder
		if ( (exit_status=parser->chain_nf_configurations()) != SUCCESS ) {
			delete parser;
			exit(exit_status);
		}
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	total_exec_time += task_exec_time;

	/////////////////////////////////// Build Traffic Classes /////////////////////////////////
	Synthesizer* synthesizer = NULL;

	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]() {
		info_chatter(main_log, "Hyper-NF Traffic Class Builder... ");
		try {
			synthesizer = new Synthesizer(std::move(parser));
		}
		catch (const std::exception& e) {
			error_chatter(main_log, "|--> " << e.what());
			delete parser;
			exit(CHAIN_SYNTHESIS_PROBLEM);
		}

		if ( (exit_status=synthesizer->build_traffic_classes()) != SUCCESS ) {
			delete synthesizer;
			exit(exit_status);
		}
		//synthesizer->test_traffic_class_builder();
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	total_exec_time += task_exec_time;

	///////////////////////////////////////// Synthesize //////////////////////////////////////
	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]() {
		info_chatter(main_log, "Hyper-NF Synthesizer... ");
		synthesizer->synthesize_nat();
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////	

	total_exec_time += task_exec_time;

	////////////////////////////// Generate Hyper-NF Configuration ////////////////////////////
	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]() {
		info_chatter(main_log, "Hyper-NF Generator... ");
		synthesizer->generate_equivalent_configuration();
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	total_exec_time += task_exec_time;

	///////////////////////////////////////// Clean-Up ////////////////////////////////////////
	// Domino destruction starts from Synthesizer's destructor destroying the nested objects
	// first.
	// Synthesizer:
	// |---> ChainParser
	// |-----|-----> ParserConfiguration   <-- Destoy first and climb
	//
	std::cout << std::endl;
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	task_exec_time = measure<>::execution( [&]()	{
		info_chatter(main_log, "Hyper-NF Harvester... ");
		delete synthesizer;
	});
	info_chatter(main_log, task_exec_time << "  microseconds");
	info_chatter(main_log, "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+");
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	total_exec_time += task_exec_time;

	std::cout << std::endl;
	note_chatter(main_log, "=================================================================================");
	note_chatter(main_log, "=== Total Execution Time: " + std::to_string(float(total_exec_time)/1000) + " milliseconds");
	note_chatter(main_log, "=================================================================================");
}

short int
parseArguments(int cmd_args_no, char **cmd_args, std::string *property_file) {
	// Check number of arguments
	if ( cmd_args_no != 3 ) {
		std::cerr << "Usage: " << cmd_args[0] << " -p [propertyFile]" << std::endl;
		return WRONG_INPUT_ARGS;
	}

	// Parse arguments
	while ( *cmd_args != NULL )	{
		if ( strcmp(*cmd_args, "-p") == 0 )	{
			cmd_args++;
			if ( *cmd_args != NULL ) {
				*property_file = (std::string) *cmd_args;
				continue;
			}
			else {
				break;
			}
		}
		else {
			cmd_args++;
		}
	}

	*cmd_args = NULL;

	return SUCCESS;
}
