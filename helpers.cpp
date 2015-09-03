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
std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems) {
	std::stringstream ss(s);
	std::string item;
	while (std::getline(ss, item, delim))
		elems.push_back(item);
	return elems;
}


std::vector<std::string> split(const std::string &s, const std::string& delim) {
	std::vector<std::string> elems;
	size_t start=s.find_first_not_of(delim);
	size_t end=0;
	while(start != std::string::npos) {
		end = s.find_first_of(delim,start);
		std::string temp = s.substr(start,end-start);
		elems.push_back(temp);
		start = s.find_first_not_of(delim,end);
	}
	return elems;
	
}

std::vector<std::string> separate_args(const std::string &s) {
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
bool is_ip4_prefix (const std::string &address, bool full) {
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

uint32_t aton (const std::string &address) {

	uint32_t result = 0;
	std::vector<std::string> split_address = split(address,".");

	for (uint32_t i=0; i<split_address.size(); i++) {
		result <<= 8;
		result += atoi (split_address[i].c_str());
	}
	result <<= (8*(4-split_address.size())); //If it's a prefix like 10.0 we have to fill up the rest
	return result;
}

std::string ntoa (uint32_t address) {
	return std::to_string(address>>24)+"."+std::to_string((address>>16) % 256)+"."+
		std::to_string((address>>8) % 256)+"."+std::to_string(address % 256);
}

/*
 * Allocate a buffer with size defined by the second argument.
 * Initialize and return(by ref) the allocated buffer or return NULL.
 */
short int allocateMemory(void** memoryBuffer, size_t size) {
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
short int releaseMemory(void** memoryBuffer) {
	if ( *memoryBuffer != NULL )
	{
		free(*memoryBuffer);
		*memoryBuffer = NULL;
		return SUCCESS;
	}
	else
		return MEMORY_ALREADY_RELEASED;
}
