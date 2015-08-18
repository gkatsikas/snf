#include <cstring>
#include <sstream>

#include "helpers.hpp"

/*
 * String helpers
 */
std::vector<std::string> &split(const std::string &s, char delim, std::vector<std::string> &elems) {
    std::stringstream ss(s);
    std::string item;
    while (std::getline(ss, item, delim)) {
        elems.push_back(item);
    }
    return elems;
}


std::vector<std::string> split(const std::string &s, char delim) {
    std::vector<std::string> elems;
    split(s, delim, elems);
    return elems;
}

/*
 * IP helpers
 */
bool is_ip4_prefix (const std::string &address, bool full) {
	std::vector<std::string> split_address = split(address,'.');
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
	std::vector<std::string> split_address = split(address,'.');

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
short int allocateMemory(void** memoryBuffer, size_t size)
{
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
short int releaseMemory(void** memoryBuffer)
{
	if ( *memoryBuffer != NULL )
	{
		free(*memoryBuffer);
		*memoryBuffer = NULL;
		return SUCCESS;
	}
	else
		return MEMORY_ALREADY_RELEASED;
}
