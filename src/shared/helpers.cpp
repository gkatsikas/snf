// -*- c-basic-offset: 4 -*-
/* helpers.cpp
 *
 * Implements global helper functions.
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

#include <cstring>
#include <sstream>

#include "helpers.hpp"

//////////////////////////////////////////////////////////////////////////
// String manipulation functions
//////////////////////////////////////////////////////////////////////////
/*
 * String helpers
 */
std::vector<std::string> &
split(const std::string &s, char delim, std::vector<std::string> &elems)
{
	std::stringstream ss(s);
	std::string item;
	while (std::getline(ss, item, delim))
		elems.push_back(item);
	return elems;
}


std::vector<std::string>
split(const std::string &s, const std::string& delim)
{
	std::vector<std::string> elems;
	size_t start=s.find_first_not_of(delim);

	while (start != std::string::npos) {
		size_t end = s.find_first_of(delim, start);
		std::string temp = s.substr(start, end-start);
		elems.push_back(temp);
		start = s.find_first_not_of(delim, end);
	}
	return elems;
}

std::string
vector_to_str(const std::vector<std::string> &vec, const std::string &delim)
{
	std::string res;
	unsigned short i = 0;
	for (const auto &piece : vec) {
		res += piece;
		if (i < vec.size()-1) {
			res += delim;
		}
		i++;
	}
	return res;
}

std::vector<std::string>
separate_args(const std::string &s)
{
	std::vector<std::string> args;
	std::string current_arg;
	size_t size = s.size();
	size_t position=0;
	std::string spaces = " \t\n";

	while ((position < size) && (position != std::string::npos)) {
		switch (s[position]) {
			case ' ':
			case '\t':
			case '\n':
				current_arg.push_back(' ');
				position = s.find_first_not_of(spaces,position);
				break;
			case ',':
				args.push_back(current_arg);
				current_arg.clear();
				position = s.find_first_not_of(spaces,position+1);
				break;
			case '/':
				if (position < size-1 && s[position+1] =='*') {
					position++;
					do {
						position = s.find('*',position);
					} while (position<size-1 && s[++position] != '/');
					position++;
					break;
				}
				else if (position < size-1 && s[position+1] =='/') {
					position = s.find('\n',position)+1;
					break;
				}
			default:
				current_arg.push_back(s[position]);
				position++;
		}
	}

	if (!current_arg.empty()) {
		args.push_back(current_arg);
	}

	return args;
}

/*
 * Get the substring before a pattern
 */
const std::string
get_substr_before(const std::string &str, const std::string &pattern)
{
	std::size_t found = str.find(pattern);
	if (found != std::string::npos)
		return str.substr(0, found);
	return str;
}

/*
 * Get the substring after the first occurance of a pattern
 */
const std::string
get_substr_after(const std::string &str, const std::string &pattern)
{
	std::size_t found = str.find(pattern);
	if (found != std::string::npos)
		return str.substr(found+1, str.size()-1);
	return str;
}

/*
 * Get string extension
 */
const std::string
get_string_extension(const std::string &str, const char delim)
{
	if (str.find_last_of(delim) != std::string::npos)
		return str.substr(str.find_last_of(delim) + 1);
	return std::string("");
}

// Trim string from left
std::string
ltrim(std::string &s, const char *to_trim)
{
	std::string out_str = s.erase(0, s.find_first_not_of(to_trim));
	return out_str;
}

// Trim string from right
std::string
rtrim(std::string &s, const char *to_trim)
{
	std::string out_str = s.erase(s.find_last_not_of(to_trim) + 1);
	return out_str;
}

// Trim string from left & right
std::string
trim(std::string &s, const char *to_trim)
{
	std::string out_str = rtrim(s, to_trim);
	return ltrim(out_str, to_trim);
}

std::string
trim(std::string const &s, char const *to_trim)
{
	std::string result(s);
	std::string::size_type index = result.find_last_not_of(to_trim);
	if (index != std::string::npos)
		result.erase(++index);

	index = result.find_first_not_of(to_trim);
	if (index != std::string::npos)
		result.erase(0, index);
	else
		result.erase();

	return result;
}

/*
 * IP helpers
 */
bool
is_ip4_prefix(const std::string &address, bool full)
{
	std::vector<std::string> split_address = split(address, ".");
	if (address.find_first_not_of(".0123456789") != std::string::npos
		|| split_address.size() > 4) {
		return false;
	}
	if (full && split_address.size() != 4) { return false; }
	for (int i=0; i<4; i++) {
		int temp = atoi (split_address[i].c_str());
		if (temp > 255) {
			return false;
		}
	}
	return true;
}

uint32_t
aton(const std::string &address)
{

	uint32_t result = 0;
	std::vector<std::string> split_address = split(address,".");

	for (uint32_t i=0; i<split_address.size(); i++) {
		result <<= 8;
		result += atoi (split_address[i].c_str());
	}
	// If it's a prefix like 10.0 we have to fill up the rest
	result <<= (8*(4-split_address.size()));

	return result;
}

std::string
ntoa(uint32_t address)
{
	return 	std::to_string(address>>24) + "." + std::to_string((address>>16) % 256) + "." +
		std::to_string((address>>8) % 256) + "." + std::to_string(address % 256);
}

/*
 * Extract numbers from strings
 */
const std::string
get_number_from_string(std::string const &str)
{
	std::size_t const n = str.find_first_of("0123456789");
	if (n != std::string::npos) {
		std::size_t const m = str.find_first_not_of("0123456789", n);
		return str.substr(n, m != std::string::npos ? m-n : m);
	}
	return std::string();
}

/*
 * Convert a boolean to string
 */
const std::string
bool_to_str(const bool b)
{
	std::ostringstream ss;
	ss << std::boolalpha << b;
	return ss.str();
}

/*
 * Convert a string to boolean
 */
bool
str_to_bool(const std::string &s)
{
	bool b;
	std::istringstream(s) >> std::boolalpha >> b;
	return b;
}

/*
 * Convert a string to integer
 */
int
str_to_int(const std::string &s)
{
	return atoi(s.c_str());
}

//////////////////////////////////////////////////////////////////////////
// Memory-related functions
//////////////////////////////////////////////////////////////////////////
/*
 * Allocate a buffer with size defined by the second argument.
 * Initialize and return(by ref) the allocated buffer or return NULL.
 */
bool
allocate_memory(void **memory_buffer, size_t size)
{
	if (*memory_buffer)
		free(*memory_buffer);

	*memory_buffer = (void *) malloc(size);
	if (!(*memory_buffer)) {
		return TO_BOOL(NO_MEM_AVAILABLE);
	}
	memset(*memory_buffer, 0, size);
	return DONE;
}

/*
 * Free the space of a buffer if not already done
 */
bool
release_memory(void **memory_buffer)
{
	if (*memory_buffer) {
		free(*memory_buffer);
		*memory_buffer = NULL;
		return DONE;
	}
	return TO_BOOL(MEMORY_ALREADY_RELEASED);
}

//////////////////////////////////////////////////////////////////////////
// Filesystem-related functions
//////////////////////////////////////////////////////////////////////////
/*
 * Check if directory exists
 */
bool
directory_exists(const std::string &dir_path)
{
	struct stat info;
	return (
		(stat(dir_path.c_str(), &info) == 0) &&
		(info.st_mode & S_IFDIR)
	);
}

/*
 * Create a directory
 */
bool
create_directory(const std::string &dir)
{
	mode_t mode = 0700;
	return (
		(mkdir(dir.c_str(), mode) == 0) ||
		(errno == EEXIST)
	);
}

bool
create_directory_path(const std::string &dir_path)
{
	bool status = false;
	mode_t mode = 0700;
	std::string sub_path;

	int result = mkdir( dir_path.c_str(), mode );
	if (result < 0) {
		switch( errno )	{
			case ENOENT:
				// Try to create the parent folder
				sub_path = dir_path.substr(0, dir_path.find_last_of('/'));

				if (! create_directory_path(sub_path)) {
					status = false;
				}
				else {
					// Try again... you might be lucky this time
					status = (
						(mkdir( dir_path.c_str(), mode ) == 0) ||
						(errno == EEXIST)
					);
				}
				break;
			case EEXIST:
				// Done!
				status = true;
				break;
			default:
				status = false;
				break;
		}
	}
	else {
		status = true;
	}

	return status;
}

/*
 * Check if file exists
 */
bool
file_exists(const std::string &file_path)
{
	struct stat buffer;
	return (stat(file_path.c_str(), &buffer) == 0);
}

/*
 * Convert relative to absolute path.
 * Assumes that the path exists.
 */
std::string
get_absolute_path(const std::string &path)
{
	std::string abs_path( realpath((const char *)path.c_str(), NULL) );
	return abs_path;
}