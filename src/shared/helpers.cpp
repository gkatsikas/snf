//============================================================================
//        Name: helpers.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Global helper functions' definition
//============================================================================

#include <cstring>
#include <sstream>

#include "helpers.hpp"

/*
 * String helpers
 */
std::vector<std::string> &
split(const std::string &s, char delim, std::vector<std::string> &elems) {
	std::stringstream ss(s);
	std::string item;
	while (std::getline(ss, item, delim))
		elems.push_back(item);
	return elems;
}


std::vector<std::string>
split(const std::string &s, const std::string& delim) {
	std::vector<std::string> elems;
	size_t start=s.find_first_not_of(delim);

	while(start != std::string::npos) {
		size_t end = s.find_first_of(delim,start);
		std::string temp = s.substr(start,end-start);
		elems.push_back(temp);
		start = s.find_first_not_of(delim,end);
	}
	return elems;
	
}

std::string
vector_to_str(const std::vector<std::string>& vec, const std::string& delim) {
	std::string res;
	unsigned short i = 0;
	for (const auto &piece : vec) {
		res += piece;
		if ( i < vec.size()-1 ) {
			res += delim;
		}
		i++;
	}
    return res;
}

std::vector<std::string>
separate_args(const std::string &s) {
	std::vector<std::string> args;
	std::string current_arg;
	size_t size = s.size();
	size_t position=0;
	std::string spaces = " \t\n";

	
	while(position < size && position != std::string::npos) {
		switch(s[position]) {
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
				if(position < size-1 && s[position+1] =='*') {
					position++;
					do {
						position = s.find('*',position);
					} while (position<size-1 && s[++position] != '/');
					position++;
					break;
				}
				else if(position < size-1 && s[position+1] =='/') {
					position = s.find('\n',position)+1;
					break;
				}
			default:
				current_arg.push_back(s[position]);
				position++;
		}
	}
	
	if(!current_arg.empty()) {
		args.push_back(current_arg);
	}
	
	return args;
}

/*
 * IP helpers
 */
bool
is_ip4_prefix (const std::string &address, bool full) {
	std::vector<std::string> split_address = split(address,".");
	if (address.find_first_not_of(".0123456789") != std::string::npos
		|| split_address.size() > 4) {
		return false;
	}
	if (full && split_address.size() != 4) { return false; }
	for(int i=0; i<4; i++) {
		int temp = atoi (split_address[i].c_str());
		if ( temp > 255 ) {
			return false;
		}
	}
	return true;
}

uint32_t
aton (const std::string &address) {

	uint32_t result = 0;
	std::vector<std::string> split_address = split(address,".");

	for (uint32_t i=0; i<split_address.size(); i++) {
		result <<= 8;
		result += atoi (split_address[i].c_str());
	}
	result <<= (8*(4-split_address.size())); //If it's a prefix like 10.0 we have to fill up the rest
	return result;
}

std::string
ntoa (uint32_t address) {
	return std::to_string(address>>24)+"."+std::to_string((address>>16) % 256)+"."+
		std::to_string((address>>8) % 256)+"."+std::to_string(address % 256);
}

/*
 * Allocate a buffer with size defined by the second argument.
 * Initialize and return(by ref) the allocated buffer or return NULL.
 */
short int
allocateMemory(void** memoryBuffer, size_t size) {
	if ( *memoryBuffer != NULL )
		free(*memoryBuffer);

	*memoryBuffer = (void*) malloc(size);
	if ( *memoryBuffer == NULL )
		return NO_MEM_AVAILABLE;
	else
	{
		memset(*memoryBuffer, 0, size);
		return SUCCESS;
	}
}

/*
 * Free the space of a buffer if not already done
 */
short int
releaseMemory(void** memoryBuffer) {
	if ( *memoryBuffer != NULL )
	{
		free(*memoryBuffer);
		*memoryBuffer = NULL;
		return SUCCESS;
	}
	else
		return MEMORY_ALREADY_RELEASED;
}

/*
 * Extract numbers from strings
 */
const std::string
get_number_from_string(std::string const& str) {
	std::size_t const n = str.find_first_of("0123456789");
	if ( n != std::string::npos ) {
		std::size_t const m = str.find_first_not_of("0123456789", n);
		return str.substr(n, m != std::string::npos ? m-n : m);
	}
	return std::string();
}

/*
 * Convert a boolean to string
 */
const std::string
bool_to_str(const bool b) {
	std::ostringstream ss;
    ss << std::boolalpha << b;
    return ss.str();
}

/*
 * Convert a string to boolean
 */
bool
str_to_bool(const std::string& s) {
	bool b;
	std::istringstream(s) >> std::boolalpha >> b;
	return b;
}

/*
 * Check if directory exists
 */
bool
directory_exists(const std::string& dir_path) {
	struct stat info;
	return ( (stat(dir_path.c_str(), &info) == 0) && (info.st_mode & S_IFDIR) );
}

/*
 * Create a directory
 */
bool
create_directory(const std::string& dir_path) {
	mode_t mode = 0700;
	return ( mkdir(dir_path.c_str(), mode) == 0 );
}

/*
 * Check if file exists
 */
bool
file_exists(const std::string& file_path) {
	struct stat buffer;
	return ( stat(file_path.c_str(), &buffer) == 0 ); 
}

/*
 * Get file extension
 */
const std::string
get_string_extension(const std::string& str, const char delim) {
	if( str.find_last_of(delim) != std::string::npos )
		return str.substr(str.find_last_of(delim) + 1);
	return std::string("");
}

/*
 * Get the substring before a pattern
 */
const std::string
get_substr_before(const std::string& str, const std::string& pattern) {
	std::size_t found = str.find(pattern);
	if ( found != std::string::npos ) {
		return str.substr(0, found);
	}
	return str;
}