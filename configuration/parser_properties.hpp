//============================================================================
// Name        : parser_properties.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class that extends InputProperties for the Parser
//============================================================================

#ifndef _PARSER_PROPERTIES_HPP_
#define _PARSER_PROPERTIES_HPP_

#include <map>
//#include "../helpers.hpp"
#include "input_properties.hpp"

class ParserProperties : public InputProperties
{
	public:
		std::map<std::string,std::string> nf_chain;
		ParserProperties(std::map<std::string,std::string> nfs) : nf_chain(nfs) {};
};

#endif
