#ifndef _ELEMENT_TYPE_HPP_
#define _ELEMENT_TYPE_HPP_

#include <string>

//List of allowed Click elements
static const uint32_t elem_start = __LINE__;
#define _Element(FOO) \
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
	FOO(VLANEncap) \
	FOO(VLANDecap) \
	FOO(SetVLANAnno) \
	FOO(EtherEncap) \
	FOO(FromDevice) \
	FOO(ToDevice) \
	FOO(Strip) \
	FOO(IPGWOptions) \
	FOO(DropBroadcasts) \
	FOO(IPFragmenter) \
	FOO(Classifier) \
	FOO(Discard_def)
static const uint32_t elem_end = __LINE__;

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

const std::string elementNames[elem_end - elem_start - 2] = {
	_Element(DO_DESCRIPTION)
};

enum ElementType {
	_Element(DO_ENUM)
};

#endif
