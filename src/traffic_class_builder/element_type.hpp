//============================================================================
//        Name: element_type.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: List of Click processing elements.
//============================================================================

#ifndef _ELEMENT_TYPE_HPP_
#define _ELEMENT_TYPE_HPP_

#include <string>

//List of allowed Click elements
static const uint32_t elem_start = __LINE__;
#define _Element(FOO) \
	FOO(DecIPTTL) \
	FOO(AverageCounter) \
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
	FOO(PollDevice) \
	FOO(FromDevice) \
	FOO(FromNetFront) \
	FOO(FromDPDKDevice) \
	FOO(ToDevice) \
	FOO(ToNetFront) \
	FOO(ToDPDKDevice) \
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

const std::string
element_names[NB_ELEMENT_TYPES] = {
	_Element(DO_DESCRIPTION)
};

enum ElementType {
	_Element(DO_ENUM)
};

#endif