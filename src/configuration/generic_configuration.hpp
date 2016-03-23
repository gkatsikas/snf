#ifndef _GENERIC_CONFIG_HPP_
#define _GENERIC_CONFIG_HPP_

/*
 * generic_configuration.hpp
 * 
 * Input Parameters' configuration library
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

#include <map>

#include "chameleon.hpp"
#include "../logger/logger.hpp"

class GenericConfiguration
{
	protected:
		std::string                      filename;
		std::map<std::string, Chameleon> content_;

		/*
		 * Logger instance
		 */
		Logger log;

	public:
		/*
		 * Constructor
		 */
		GenericConfiguration(const std::string &config_file);

		/*
		 * Destructor
		 */
		virtual ~GenericConfiguration();

		/*
		 * Load the property file (Abstract method)
		 */
		virtual bool load_property_file(void) = 0;

		/*
		 * Helper methods to read the property file
		 */
		Chameleon const& get_value(
			std::string const &section, std::string const &entry
		) const;
		Chameleon const& get_value(
			std::string const &section, std::string const &entry, int value
		);
		Chameleon const& get_value(
			std::string const &section, std::string const &entry, unsigned short value
		);
		Chameleon const& get_value(
			std::string const &section, std::string const &entry, bool value
		);
		Chameleon const& get_value(
			std::string const &section, std::string const &entry, double value
		);
		Chameleon const& get_value(
			std::string const &section, std::string const &entry, std::string const &value
		);

		/*
		 * Count the entries of a section
		 */
		unsigned short int count_section_elements(std::string const &section);
};

#endif
