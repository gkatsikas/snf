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
	FOO(StaticIPLookup) \
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
	FOO(ARPResponder) \
	FOO(ARPQuerier) \
	FOO(FromDevice) \
	FOO(ToDevice) \
	FOO(Strip) \
	FOO(IPGWOptions) \
	FOO(DropBroadcasts) \
	FOO(IPFragmenter) \
	FOO(Classifier) \
	FOO(Queue) \
	FOO(Paint) \
	FOO(PaintTee) \
	FOO(Print) \
	FOO(Discard_def) \
	FOO(No_elem)
static const uint32_t elem_end = __LINE__;

const uint32_t NB_ELEMENT_TYPES = elem_end - elem_start - 2;

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

const std::string elementNames[NB_ELEMENT_TYPES] = {
	_Element(DO_DESCRIPTION)
};

enum ElementType {
	_Element(DO_ENUM)
};

#endif
