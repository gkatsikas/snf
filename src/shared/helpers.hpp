#ifndef _HELPERS_HPP_
#define _HELPERS_HPP_

/*
 * helpers.hpp
 * 
 * Global helper functions' and variables declarations.
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

/* 
 * The auto-generated header contains useful flags that
 * guide the bindings of Hyper-NF.
 */
#ifdef HAVE_CONFIG_H
#include "../../config.h"
#endif

#include <set>
#include <vector>
#include <string>
#include <chrono>
#include <cstring>
#include <sstream>
#include <fstream>
#include <sstream>
#include <iterator>
#include <iostream>
#include <sys/stat.h>

#include "boost/format.hpp"

/*
 * Shared variables
 */
// Ethernet constants (in bytes)
#define ETHERNET_INTER_FRAME_GAP_LEN 12
#define ETHERNET_MAC_PREAMBLE_LEN     8 
#define ETHERNET_HEADER_LEN          14
#define ETHERNET_CRC_LEN              4

// IP header is 20-60 bytes
#define MIN_IP4_HEADER_LEN  20
#define MAX_IP4_HEADER_LEN  60

// UDP header size is 8 bytes
#define UDP_HEADER_LEN      8

// ICMP header size
#define ICMP_HEADER_LEN     8

// TCP header size is 20-60 bytes
#define MIN_TCP_HEADER_LEN  20
#define MAX_TCP_HEADER_LEN  60

// Standard Maximum Transfer Unit (IP Packet size)
#define MTU                 1500

// ICMP TTL expired value
#define EXPIRED_TTL         11

// Maximum length of filenames to be created
#define MAX_FILENAME_SIZE   100

// Ethernet type identifiers
#define ETHER_TYPE_IP       (0x0800)
#define ETHER_TYPE_ARP      (0x0806)
#define ETHER_TYPE_IPV6     (0x86DD)
#define ETHER_TYPE_8021Q    (0x8100)
#define ETHER_TYPE_8021QINQ (0x8100)
#define ETHER_TYPE_LOOPBACK (0x9000)

// Comparisons
const short LESS                     = -1;
const short EQUAL                    =  0;
const short GREATER                  =  1;
const short NOT_EQUAL                = -2;
const short EXISTS                   =  1;

// Generic Success
const short SUCCESS                  =  0;
const bool  DONE                     = true;

// Generic Error
const short FAILURE                  = -1;
const bool  ERROR                    = false;
const short WRONG_INPUT_ARGS         = -3;

// File Management
const short FILE_EXISTS              = -5;
const short CANNOT_OPEN_FILE         = -6;
const short FILE_DOES_NOT_EXIST      = -7;
const short CANNOT_CREATE_FILE       = -8;
const short INVALID_FILE_TYPE        = -9;

// Memory Management
const short NO_MEM_AVAILABLE         = -10;
const short MEMORY_ALREADY_RELEASED  = -11;
const short INVALID_GRAPH_OPERATION  = -12;

// Packet Management
const short VALID_PACKET             =   0;
const short INVALID_PACKET           = -20;
const short NON_IPV4_PACKET          = -21;
const short MTU_EXCEEDED             = -22;
const short INVALID_IPV4_HDR         = -23;
const short INVALID_UDP_HDR          = -24;
const short INVALID_TCP_HDR          = -25;

// Input Correctness
const short INVALID_NF_TYPE          = -30;
const short INVALID_TOPOLOGY         = -31;

// Parsing
const short INVALID_NF_CHAIN_LENGTH  = -35;
const short CHAIN_PARSING_PROBLEM    = -36;
const short NF_CHAIN_NOT_ACYCLIC     = -37;
const short CLICK_PARSING_PROBLEM    = -38;
const short CHAIN_SYNTHESIS_PROBLEM  = -39;
const short CODE_GENERATION_PROBLEM  = -40;

// Protocol Management
const short INVALID_PROTOCOL         = -41;

// Convert the above error types to bool
//#define TO_BOOL(x) (!!(x))
#define TO_BOOL(x) ( x == 0 )

// List of IPMapper elements
const std::set<std::string> MAPPER_ELEMENTS = {
	"SourceIPHashMapper", "RoundRobinIPMapper", "FTPPortMapper"
};
const std::set<std::string> SUPPORTED_MAPPER_ELEMENTS = {
	"RoundRobinIPMapper"
};

/*
 * Verbosity and Debugging macros
 */
// If --enable-verbose=yes, you have additional three logging levels
#ifdef  VERBOSE_MODE
	#define   def_chatter(LOG, MSG) LOG 	<< boost::format("[%4d] >> ") % __LINE__ \
											<< def   << MSG << def << std::endl
	#define  info_chatter(LOG, MSG) LOG 	<< boost::format("[%4d] >> ") % __LINE__ \
											<< info  << MSG << def << std::endl
	#define  warn_chatter(LOG, MSG) LOG 	<< boost::format("[%4d] >> ") % __LINE__ \
											<< warn  << MSG << def << std::endl
#else
	#define   def_chatter(LOG, MSG) 
	#define  info_chatter(LOG, MSG) 
	#define  warn_chatter(LOG, MSG) 
#endif

// If --enable-debug=yes, the ultimate verbosity is offered!
// A lot of meesages...I warn you
// When logger is not available we also offer macros for printing without the logger.
#ifdef  DEBUG_MODE
	#define debug_chatter(LOG, MSG)	LOG 	<< boost::format("[%4d] >> ") % __LINE__ \
											<< debug << MSG << def << std::endl
	#define         DEBUG(MSG) std::cout 	<< boost::format("[%30s][%4d] >> ") %  __FILE__ % __LINE__ << " DEBUG: " \
											<< MSG   << std::endl
#else
	#define debug_chatter(LOG, MSG) 
	#define         DEBUG(MSG) 
#endif

// Notes always appear (Used to print final messages about execution time and output folder)
#define    note_chatter(LOG, MSG) LOG 		<< boost::format("[%4d] >> ") % __LINE__ \
											<< note  << MSG << def << std::endl

// Error handling macros (always active)
#define   error_chatter(LOG, MSG) LOG 		<< boost::format("[%4d] >> ") % __LINE__ \
											<< error << MSG << def << std::endl											
#define                  BUG(MSG) std::cerr << boost::format("[%30s][%4d] >> ") %  __FILE__ % __LINE__ << " ERROR: " \
											<< MSG   << std::endl; exit(FAILURE)
#define MISSING_FEATURE(LOG, MSG) LOG		<< boost::format("[%4d] >> ") % __LINE__ \
											<< warn  << MSG << def << std::endl; exit(FAILURE)
#define       FANCY_BUG(LOG, MSG) LOG		<< boost::format("[%4d] >> ") % __LINE__ \
											<< error << MSG << def << std::endl; exit(FAILURE)

/*
 * String helpers
 */
std::vector<std::string>  split(const std::string &s, const std::string& delim);
std::vector<std::string>& split(const std::string &s, char delim, std::vector<std::string> &elems);
std::string               vector_to_str(const std::vector<std::string> &vec, const std::string &delim);
std::vector<std::string>  separate_args(const std::string &s);
const std::string         get_substr_before   (const std::string &str, const std::string &pattern);
const std::string         get_string_extension(const std::string &str, const char delim='.');

/*
 * Networking helpers
 */
bool        is_ip4_prefix (const std::string &address, bool full=true);
uint32_t    aton (const std::string &address);
std::string ntoa (uint32_t address);

/*
 * Memory helpers
 */
bool allocateMemory(void **memoryBuffer, size_t size);
bool releaseMemory (void **memoryBuffer);

/*
 * Extract numbers from strings
 */
const std::string get_number_from_string(std::string const &str);

/*
 * Convert a boolean to string
 */
const std::string bool_to_str(const bool b);

/*
 * Convert a string to boolean
 */
bool str_to_bool(const std::string &s);

/*
 * Check if directory exists
 */
bool directory_exists(const std::string &dir_path);

/*
 * Create a directory
 */
bool create_directory(const std::string &dir_path);
/*
 * Check if file exists
 */
bool file_exists(const std::string &file_path);

/*
 * A C++11 template that is able to receive any function with any arguments
 * and measure the time it gets to be executed.
 * Time scale can change in compile time (default: nanoseconds)
 */
template<typename TimeT = std::chrono::microseconds>
struct measure {
	template<typename F, typename ...Args>
	static typename TimeT::rep execution(F func, Args&&... args)
	{
		auto start = std::chrono::system_clock::now();

		// Now call the function with all the parameters you need
		func(std::forward<Args>(args)...);

		auto duration = std::chrono::duration_cast< TimeT>(std::chrono::system_clock::now() - start);

		return (double) duration.count();
	}
};

/*
 * Vector manipulation functions.
 * Concatenate vectors v1 and v2.
 */ 
template<typename T>
std::vector<T> concatenate_two_vectors(std::vector<T> &v1, const std::vector<T> &v2) {
	std::vector<T> outcome(v1);

	for (auto& e : v2)
		outcome.push_back(e);
}

/*
 * Generic method to delete a pointer of any type (T) from a data structure.
 * Usage: std::for_each (data_str.begin (), data_str.end (), deleter<T>());
 */
/*template<typename T>
struct deleter : std::unary_function<const T*, void>
{
	void operator() (const T *ptr) const
	{
		delete ptr;
		std::cout << "Pointer deleted" << std::endl;
	}
};
*/

#endif
