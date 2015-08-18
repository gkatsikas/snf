//============================================================================
// Name        : parser_configuration.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Parser-specific input parameters
//============================================================================

#ifndef _PARSER_CONFIG_HPP_
#define _PARSER_CONFIG_HPP_

#include "generic_configuration.hpp"
#include "parser_properties.hpp"

class ParserConfiguration : public GenericConfiguration
{
	public:
		/*
		 * Constructor
		 */
		ParserConfiguration(const std::string& config_file) : GenericConfiguration(config_file) {};

		virtual ~ParserConfiguration() {};

		/*
		 * Implements readPropertFile for the Parser
		 */
		virtual InputProperties* readPropertyFile(void);
};

#endif
