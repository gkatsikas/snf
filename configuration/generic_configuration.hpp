//============================================================================
//        Name: generic_configuration.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Input Parameters' configuration library
//============================================================================

#ifndef _GENERIC_CONFIG_HPP_
#define _GENERIC_CONFIG_HPP_

#include <map>

#include "chameleon.hpp"
#include "../logger/logger.hpp"

class GenericConfiguration
{
	protected:
		std::string filename;
		std::map<std::string,Chameleon> content_;

		/*
		 * Logger instance
		 */
		Logger log;

	public:
		/*
		 * Constructor
		 */
		GenericConfiguration(const std::string& config_file);

		/*
		 * Destructor
		 */
		virtual ~GenericConfiguration();

		/*
		 * Load the property file (Abstract method)
		 */
		virtual short load_property_file(void) = 0;

		/*
		 * Helper methods to read the property file
		 */
		Chameleon const& get_value(std::string const& section, std::string const& entry) const;
		Chameleon const& get_value(std::string const& section, std::string const& entry, int    value);
		Chameleon const& get_value(std::string const& section, std::string const& entry, double value);
		Chameleon const& get_value(std::string const& section, std::string const& entry, std::string const& value);

		/*
		 * Count the entries of a section
		 */
		unsigned short int count_section_elements(std::string const& section);

		/*
		 * Convert string to boolean
		 */
		bool to_bool(std::string const& s);
};

#endif
