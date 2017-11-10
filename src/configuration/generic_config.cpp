// -*- c-basic-offset: 4 -*-
/* generic_config.cpp
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

#include "generic_config.hpp"
#include "../shared/helpers.hpp"

// Character [ is missing because it can begin a new section
static std::string forbidden = "`~!@#$%%^&*()_-+=]{};'\\:\"|,./<>?1234567890";

GenericConfiguration::GenericConfiguration(const std::string &config_file)
{
	this->log.set_logger_file(__FILE__);

	if (! file_exists(config_file)) {
		error_chatter(this->log, "\tProperty file " + config_file + "does not exist");
		exit(FAILURE);
	}

	this->filename = get_absolute_path(config_file);
	def_chatter(this->log, "\tProperty file: " << this->filename);
	this->load_in_memory();
}

GenericConfiguration::~GenericConfiguration()
{
	if (!content.empty()) {
		content.clear();
	}
}

void
GenericConfiguration::load_in_memory(void)
{
	std::ifstream file(this->filename);

	std::string line;
	std::string in_section;

	// Read line-by-line
	while (std::getline(file, line)) {

		// Any non alphabetic characters in the beginning make the parser to ignore the line.
		if (! line.length()) continue;
		if (forbidden.find(line[0]) != std::string::npos) continue;

		// Expect for the character [
		// We start a new section with this
		if (line[0] == '[') {
			in_section = trim( line.substr(1, line.find(']')-1) );
			continue;
		}

		std::string name;
		std::string value;

		std::size_t pos_equal = line.find('=');
		if (pos_equal != std::string::npos) {
			name  = trim(line.substr(0, pos_equal));
			// Get the value of this line until the end of line
			value = trim(line.substr(pos_equal+1));

			if (name.empty() || value.empty()) {
				error_chatter(this->log, "\tLine with [property = value] is not correct");
				exit(CHAIN_PARSING_PROBLEM);
			}
		}
		else {
			continue;
		}

		// However, the user migth have expanded his input across multiple lines.
		// Keep the current position of the file stream.
		int curr_pos = file.tellg();
		unsigned short lines_to_skip = 0;

		// Read more lines, if they do not contain new properties
		this->read_multi_line(file, value, lines_to_skip);

		// Rewind back to the original position if the next line is not the continuation of this one.
		// We want to properly parse that new line.
		if (lines_to_skip == 0) {
			file.seekg(curr_pos);
		}
		// We can skip a few lines as they are concatenated to the current one
		else {
			file.seekg(curr_pos + lines_to_skip - 1);
		}

		content[in_section + '/' + name] = Chameleon(value);
		debug_chatter(this->log, "\tSection: " << in_section + '/' + name << " with value: " << value);
	}

	file.close();
}

/*
 * Continue reading new lines unless these lines contain new properties.
 * Return the value string updated.
 */
void
GenericConfiguration::read_multi_line(std::ifstream &file, std::string &value, unsigned short &lines_to_skip)
{
	std::string line;
	lines_to_skip = 0;

	while (std::getline(file, line)) {

		std::size_t pos_equal = line.find('=');
		if (pos_equal != std::string::npos) return;
		if (line[0] == '[') return;

		//if ( (line[0] == '#') || (line[0] == ';') || (! line.length()) ||
		//	((line[0] == '/') && (line[1] == '/')) ) {
		if (forbidden.find(line[0]) != std::string::npos) {
			lines_to_skip++;
			continue;
		}

		// This line does not contain a new property. It is safe to continue.
		value += line;
		lines_to_skip++;
	}
}

Chameleon const &
GenericConfiguration::get_value(std::string const &section, std::string const &entry) const
{
	std::map<std::string, Chameleon>::const_iterator ci = content.find(section + '/' + entry);

	if (ci == content.end()) {
		throw("\t" + entry + " does not exist in section " + section);
	}

	return ci->second;
}

Chameleon const &
GenericConfiguration::get_value(std::string const &section, std::string const &entry, int value)
{
	try {
		return get_value(section, entry);
	}
	catch(const std::exception &e) {
		return content.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const&
GenericConfiguration::get_value(std::string const &section, std::string const &entry, unsigned short value)
{
	try {
		return get_value(section, entry);
	}
	catch(const std::exception &e) {
		return content.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const &
GenericConfiguration::get_value(std::string const &section, std::string const &entry, bool value)
{
	try {
		return get_value(section, entry);
	}
	catch(const std::exception &e) {
		return content.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const &
GenericConfiguration::get_value(std::string const &section, std::string const &entry, double value)
{
	try {
		return get_value(section, entry);
	}
	catch(const std::exception &e) {
		return content.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

Chameleon const &
GenericConfiguration::get_value(std::string const &section, std::string const &entry, std::string const &value)
{
	try {
		return get_value(section, entry);
	}
	catch(const std::exception &e) {
		return content.insert(make_pair(section+'/'+entry, Chameleon(value))).first->second;
	}
}

unsigned short int
GenericConfiguration::count_section_elements(std::string const &section)
{
	unsigned short int counter = 0;

	for(auto const &entry : content) {
		// Count only the parameters that belong to the given section
		if (entry.first.find(section) == 0)
			counter++;
	}

	return counter;
}
