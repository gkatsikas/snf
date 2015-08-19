#ifndef ELEMENT_TYPE_HPP
#define ELEMENT_TYPE_HPP

#include <string>

//List of allowed click elements
static const uint32_t elem_start = __LINE__;
#define Element(FOO) \
	FOO(DecIPTTL) \
	FOO(FixIPSrc) \
	FOO(IPFilter) \
	FOO(IPClassifier) \
	FOO(RadixIPLookup) \
	FOO(DirectIPLookup) \
	FOO(LinearIPLookup) \
	FOO(IPRewriter) \
	FOO(Discard) \
	FOO(MarkIPHeader) \
	FOO(CheckIPHeader) \
	FOO(CheckICMPHeader) \
	FOO(GetIPAddress) \
	FOO(CheckUDPHeader) \
	FOO(CheckTCPHeader) \
	FOO(RoundRobinIPMapper) \
	FOO(Discard_def) 
static const uint32_t elem_end = __LINE__;

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

const std::string elementNames[elem_end-elem_start-2] = {
Element(DO_DESCRIPTION)
};

enum ElementType {
Element(DO_ENUM)
};

#endif
