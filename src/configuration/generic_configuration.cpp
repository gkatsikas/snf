// -*- c-basic-offset: 4 -*-
/* generic_configuration.cpp
 * 
 * Implementation of methods that read input parameters.
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

#include <sys/stat.h>

#include "../shared/helpers.hpp"
#include "generic_configuration.hpp"

std::string
trim(std::string const &source, char const *delims = " \t\r\n") {
	std::string result(source);
	std::string::size_type index = result.find_last_not_of(delims);
	if(index != std::string::npos)
		result.erase(++index);

	index = result.find_first_not_of(delims);
	if(index != std::string::npos)
		result.erase(0, index);
	else
		result.erase();

	return result;
}

GenericConfiguration::GenericConfiguration(const std::string &config_file) {
	this->log.set_logger_file(__FILE__);

	struct stat buffer;
	if ( stat (config_file.c_str(), &buffer) == 0 )
		this->filename = config_file;
	else {
		error_chatter(this->log, "\t Property file " + config_file + "does not exist");
		exit(FAILURE);
	}

	std::ifstream file(config_file.c_str());

	std::string line;
	std::string name;
	std::string value;
	std::string in_section;
	int pos_equal = 0;

	while ( getline(file, line) )
	{
		if (! line.length()) continue;

		if (line[0] == '#') continue;
		if (line[0] == ';') continue;

		if (line[0] == '[')
		{
			in_section=trim(line.substr(1,line.find(']')-1));
			continue;
		}

		pos_equal=line.find('=');
		name  = trim(line.substr(0, pos_equal));
		value = trim(line.substr(pos_equal+1));

		content_[in_section+'/'+name]=Chameleon(value);
	}

	file.close();
}

GenericConfiguration::~GenericConfiguration() {
	if ( !content_.empty() )
		content_.clear();
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry) const {

	std::map<std::string,Chameleon>::const_iterator ci = content_.find(section + '/' + entry);

	if (ci == content_.end())
		throw(entry + " does not exist in section " + section);

	return ci->second;
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry, int value) {

	try {
		return get_value(section, entry);
	}
	catch(const std::exception& e) {
		return content_.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry, unsigned short value) {

	try {
		return get_value(section, entry);
	}
	catch(const std::exception& e) {
		return content_.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry, bool value) {

	try {
		return get_value(section, entry);
	}
	catch(const std::exception& e) {
		return content_.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry, double value) {

	try {
		return get_value(section, entry);
	}
	catch(const std::exception& e) {
		return content_.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const&
GenericConfiguration::get_value(
	std::string const &section, std::string const &entry, std::string const& value) {

	try {
		return get_value(section, entry);
	}
	catch(const std::exception& e) {
		return content_.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

unsigned short int
GenericConfiguration::count_section_elements(std::string const &section) {
	unsigned short int counter = 0;

	for(auto const &entry : content_) {
		// Count only the parameters that belong to the given section
		if ( entry.first.find(section) == 0 )
			counter++;
	}

	return counter;
}
