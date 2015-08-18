#include <stack>
#include <string>
#include <iostream>
#include <cstdio>

#include "file.hpp"
#include "logger.hpp"
#include "helpers.hpp"
#include "configuration/parser_properties.hpp"
#include "configuration/parser_configuration.hpp"

short int parseArguments(int cmdArgsNo, char** cmdArgs, string* propertyFile);

int main() {
	short int exitStatus = 0;

	if ( (exitStatus=parseArguments(argc, argv, &propertyFile)) != SUCCESS )
		exit(exitStatus);

	// Initialize logger
	Logger log(__FILE__);
	log << info << "Click Parser" << def << std::endl;

	log << measure<>::execution( [&]()
	{
		log << info << "Loading properties... " << def << std::endl;
		pars_cfg = new GenericConfiguration(propertyFile);
		properties = pars_cfg->readPropertyFile();
	}
	) << " milliseconds" << std::endl;
	return 0;
}

short int parseArguments(int cmdArgsNo, char** cmdArgs, string* propertyFile) {
	// Check number of arguments
	if ( cmdArgsNo != 3 )
	{
		cerr << "Usage: " << cmdArgs[0] << " -p [propertyFile]" << endl;
		return WRONG_INPUT_ARGS;
	}
	// Parse arguments
	while ( *cmdArgs != NULL )
	{
		if ( strcmp(*cmdArgs, "-p") == 0 )
		{
			*cmdArgs++;
			if ( *cmdArgs != NULL )
			{
				*propertyFile = (std::string) *cmdArgs;
				continue;
			}
			else
				break;
		}
		else
			*cmdArgs++;
	}
	return SUCCESS;
}
