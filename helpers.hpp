//============================================================================
//        Name: helpers.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Global helper functions' declaration and variables
//============================================================================

#ifndef _HELPERS_HPP_
#define _HELPERS_HPP_

#include <set>
#include <vector>
#include <string>
#include <chrono>
#include <sstream>
#include <fstream>
#include <iostream>
//#include <algorithm>

/*
 * Shared variables
 */
// Ethernet header is 14 bytes
#define ETHERNET_SIZE        14

// IP header is 20-60 bytes
#define MIN_IP4_HEADER_SIZE  20
#define MAX_IP4_HEADER_SIZE  60

// UDP header size is 8 bytes
#define UDP_HEADER_SIZE     8

// ICMP header size
#define ICMP_HEADER_SIZE    8

// TCP header size is 20-60 bytes
#define MIN_TCP_HEADER_SIZE 20
#define MAX_TCP_HEADER_SIZE 60

// Maximum Transfer Unit (IP Packet size)
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

// Generic Error
const short FAILURE                  = -1;
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

// Protocol Management
const short INVALID_PROTOCOL         = -40;

// List of IPMapper elements
const std::set<std::string> MAPPER_ELEMENTS = {"SourceIPHashMapper", "RoundRobinIPMapper", "FTPPortMapper"};
const std::set<std::string> SUPPORTED_MAPPER_ELEMENTS = {"RoundRobinIPMapper"};

/*
 * String helpers
 */
std::vector<std::string> split(const std::string &s, const std::string& delim);
std::vector<std::string> separate_args(const std::string &s);

/*
 * IP helpers
 */
bool is_ip4_prefix (const std::string &address, bool full=true);
uint32_t aton (const std::string &address);
std::string ntoa (uint32_t address);

/*
 * Memory helpers
 */
short allocateMemory(void** memoryBuffer, size_t size);
short releaseMemory (void** memoryBuffer);

/*
 * A C++11 template that is able to receive any function with any arguments
 * and measure the time it gets to be executed.
 * Time scale can change in compile time (default: nanoseconds)
 */
template<typename TimeT = std::chrono::microseconds>
struct measure
{
    template<typename F, typename ...Args>
    static typename TimeT::rep execution(F func, Args&&... args)
    {
        auto start = std::chrono::system_clock::now();

        // Now call the function with all the parameters you need
        func(std::forward<Args>(args)...);

        auto duration = std::chrono::duration_cast< TimeT>(std::chrono::system_clock::now() - start);

        return  (double) duration.count();
    }
};

/*
 * Vector manipulation functions.
 * Concatenate vectors v1 and v2.
 */ 
template<typename T>
std::vector<T> concatenate_two_vectors(std::vector<T>& v1, const std::vector<T>& v2) {
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
