//============================================================================
// Name        : parser_configuration.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Load parser-specific input parameters
//============================================================================

#include "parser_configuration.hpp"

/*
 * Parser-specific read property method that returns an upcasted object to
 * generic input properties object
 */
InputProperties* ParserConfiguration::readPropertyFile(void)
{
	unsigned short int i = 0;
	unsigned short int chain_length = count_section_elements("NF_CHAIN");

	// A map between NF position (in a chain) and NF implementation file
	std::map<std::string,std::string> nfs;

	for (i=0 ; i<chain_length ; i++) {
		std::stringstream sstr;
		sstr << (i+1);
		std::string nf_pos  = sstr.str();
		std::string nf_path = (std::string&) get_value("NF_CHAIN", "NF_"+nf_pos);
		nfs.insert(std::pair<std::string, std::string>(nf_pos, nf_path));
		log << info << "NF " << nf_pos << " = " << nf_path << def << std::endl;
	}

	ParserProperties* properties = new ParserProperties(
		nfs
	);

	return dynamic_cast<InputProperties*>(properties);
}
