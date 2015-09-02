//============================================================================
//        Name: main.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Bootstraps the NF Synthesizer
//============================================================================

#include "logger/logger.hpp"
#include "synthesizer/synthesizer.hpp"

short int parseArguments (int cmd_args_no, char** cmd_args, std::string* property_file);

int main(int argc, char** argv) {
	setvbuf(stdout, NULL, _IONBF, 0);
	std::string property_file;
	short exit_status = 0;

	// Initialize logger
	Logger log(__FILE__);
	log << info << "Network Functions' Chain Synthesis" << def << std::endl;

	// Check input arguments validity
	if ( (exit_status=parseArguments(argc, argv, &property_file)) != SUCCESS )
		exit(exit_status);

	//////////////////////////////////// Load property file ///////////////////////////////////
	ParserConfiguration* pcf = NULL;

	std::cout << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	log << info << measure<>::execution
	( [&]()
	{
		log << info << "Loading property file... " << def << std::endl;
		pcf = new ParserConfiguration(property_file);
		log << "\tProperty file: " << property_file << def << std::endl;
		if ( (exit_status=pcf->load_property_file()) != SUCCESS ) {
			delete pcf;
			exit(exit_status);
		}
		pcf->get_chain()->print_vertex_order();
	}
	) << "  microseconds" << def << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	////////////////////////////////////// Parse Input NFs ////////////////////////////////////
	ChainParser* parser = NULL;

	std::cout << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	log << info << measure<>::execution
	( [&]()
	{
		log << "Parsing the chain of Network Functions... " << def << std::endl;
		try {
			parser = new ChainParser(std::move(pcf));
		}
		catch (const std::exception& e) {
			log << error << "|--> " << e.what() << def << std::endl;
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
	}
	) << "  microseconds" << def << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	/////////////////////////// Build Traffic Classes and Synthesize //////////////////////////
	Synthesizer* synthesizer = NULL;

	std::cout << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	log << info << measure<>::execution
	( [&]()
	{
		log << info << "NF Synthesizer... " << def << std::endl;
		try {
			synthesizer = new Synthesizer(std::move(parser));
		}
		catch (const std::exception& e) {
			log << error << "|--> " << e.what() << def << std::endl;
			delete parser;
			exit(CHAIN_SYNTHESIS_PROBLEM);
		}

		if ( (exit_status=synthesizer->build_traffic_classes()) != SUCCESS ) {
			delete synthesizer;
			exit(exit_status);
		}

		//synthesizer->test_traffic_class_builder();
	}
	) << "  microseconds" << def << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	///////////////////////////////////// Test a Click Tree ///////////////////////////////////
	/*std::cout << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	log << info << measure<>::execution
	( [&]()
	{
		log << info << "Testing Click Tree... " << def << std::endl;
		test_click_tree();
	}
	) << "  microseconds" << def << std::endl;
	log << info << "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+" << def << std::endl;
	std::cout << std::endl;*/
	///////////////////////////////////////////////////////////////////////////////////////////

	///////////////////////////////////////// Clean-Up ////////////////////////////////////////
	// Domino destruction starts from Synthesizer's destructor destroying the nested objects
	// first.
	// Synthesizer:
	// |---> ChainParser
	// |-----|-----> ParserConfiguration   <-- Destoy first and climb
	//
	delete synthesizer;
	///////////////////////////////////////////////////////////////////////////////////////////
}

short int parseArguments(int cmd_args_no, char** cmd_args, std::string* property_file) {
	// Check number of arguments
	if ( cmd_args_no != 3 )
	{
		std::cerr << "Usage: " << cmd_args[0] << " -p [propertyFile]" << std::endl;
		return WRONG_INPUT_ARGS;
	}

	// Parse arguments
	while ( *cmd_args != NULL )
	{
		if ( strcmp(*cmd_args, "-p") == 0 )
		{
			//*(cmd_args++);
			cmd_args = cmd_args + 1;
			if ( *cmd_args != NULL )
			{
				*property_file = (std::string) *cmd_args;
				continue;
			}
			else
				break;
		}
		else
			//*(cmd_args++);
			cmd_args = cmd_args + 1;
	}

	*cmd_args = NULL;

	return SUCCESS;
}
