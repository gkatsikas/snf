#ifndef _HELPERS_HPP_
#define _HELPERS_HPP_

#include <iostream>
#include <iomanip>
#include <fstream>
#include <sstream>

//#include <map>
#include <list>
#include <tuple>
#include <vector>
#include <string>
#include <chrono>
#include <cstdarg>
#include <utility>
#include <algorithm>

#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

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
const short int          LESS                     = -1;
const short int          EQUAL                    =  0;
const short int          GREATER                  =  1;
const short int          NOT_EQUAL                = -2;
const short int          EXISTS                   =  1;

// Generic Success
const short int          SUCCESS                  =  0;

// Generic Error
const short int          FAILURE                  = -1;
const short int          WRONG_INPUT_ARGS         = -3;

// File Management
const short int          FILE_EXISTS              = -5;
const short int          CANNOT_OPEN_FILE         = -6;
const short int          FILE_DOES_NOT_EXIST      = -7;
const short int          CANNOT_CREATE_FILE       = -8;
const short int          INVALID_FILE_TYPE        = -9;

// Memory Management
const short int          NO_MEM_AVAILABLE         = -10;
const short int          MEMORY_ALREADY_RELEASED  = -11;
const short int          INVALID_GRAPH_OPERATION  = -12;

// Packet Management
const short int          VALID_PACKET             =   0;
const short int          INVALID_PACKET           = -20;
const short int          NON_IPV4_PACKET          = -21;
const short int          MTU_EXCEEDED             = -22;
const short int          INVALID_IPV4_HDR         = -23;
const short int          INVALID_UDP_HDR          = -24;
const short int          INVALID_TCP_HDR          = -25;

// Input Correctness
const short int          INVALID_NF_TYPE          = -30;
const short int          INVALID_TOPOLOGY         = -31;

// Protocol Management
const short int          INVALID_PROTOCOL         = -40;

/*
 * String helpers
 */
std::vector<std::string> split(const std::string &s, char delim);

/*
 * IP helpers
 */
bool is_ip4_prefix (const std::string &address, bool full=true);
uint32_t aton (const std::string &address);
std::string ntoa (uint32_t address);

/*
 * Memory helpers
 */
short int allocateMemory(void** memoryBuffer, size_t size);
short int releaseMemory (void** memoryBuffer);

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
