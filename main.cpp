#include <stack>
#include <string>
#include <iostream>
#include <cstdlib>

#include "logger.hpp"
#include "helpers.hpp"
#include "click_tree.hpp"
#include "click_element.hpp"
#include "output_class.hpp"
#include "configuration/parser_configuration.hpp"

void test_click_tree(void);
short int parseArguments(int cmd_args_no, char** cmd_args, std::string* property_file);

int main(int argc, char** argv) {
	std::string property_file;
	short int exit_status = 0;

	// Initialize logger
	Logger log(__FILE__);
	log << info << "NF Chain Synthesis" << def << std::endl;

	// Check input arguments validity
	if ( (exit_status=parseArguments(argc, argv, &property_file)) != SUCCESS )
		exit(exit_status);

	//////////////////////////////////// Load property file ///////////////////////////////////
	ParserConfiguration* pcf = NULL;
	InputProperties*     properties = NULL;

	std::cout << std::endl;
	log << measure<>::execution
	( [&]()
	{
		log << "Loading properties... " << std::endl;
		pcf = new ParserConfiguration(property_file);
		log << info << "Property: " << property_file << def << std::endl;
		properties = pcf->readPropertyFile();
	}
	) << "  microseconds" << std::endl;
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////

	///////////////////////////////////// Test a Click Tree ///////////////////////////////////
	std::cout << std::endl;
	log << measure<>::execution
	( [&]()
	{
		log << "Testing Click Tree... " << std::endl;
		test_click_tree();
	}
	) << "  microseconds" << std::endl;
	std::cout << std::endl;
	///////////////////////////////////////////////////////////////////////////////////////////
}

void test_click_tree(void) {
	setvbuf(stdout, NULL, _IONBF, 0);

	std::string routing_table = "10/8 0,192.168.5/24 1,0/0 2";
	std::shared_ptr<ClickElement> lookup (new ClickElement(RadixIPLookup,routing_table));

	std::string empty;
	std::shared_ptr<ClickElement> discard (new ClickElement(Discard, empty));

	std::shared_ptr<ClickElement> ttl (new ClickElement(DecIPTTL, empty));

	std::string address = "192.10.0.1";
	std::shared_ptr<ClickElement> fixip (new ClickElement(FixIPSrc, address ));

	std::string rewrite = "- - 192.168.0.1 20000-30000# 0 1";
	std::shared_ptr<ClickElement> iprewriter(new ClickElement(IPRewriter, rewrite));
	/*for (auto &it : lookup->get_outputClasses()) {
		std::cout<<it.to_str()<<std::endl;
	}
	*/

	fixip->set_child(iprewriter,0);
	iprewriter->set_child(lookup,0);
	lookup->set_child(ttl,2);
	ttl->set_child(discard,0);
	ClickTree tree(fixip);

	for (auto &it : tree.get_trafficClasses()) {
		std::cout<<it.to_str();
	}
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
