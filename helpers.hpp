#ifndef HELPERS_HPP
#define HELPERS_HPP

#include <string>
#include <vector>

//String helpers
std::vector<std::string> split(const std::string &s, char delim);

//IP helpers
bool is_ip4_prefix (const std::string &address, bool full=true);
uint32_t aton (const std::string &address);

#endif
