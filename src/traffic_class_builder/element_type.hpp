#ifndef _ELEMENT_TYPE_HPP_
#define _ELEMENT_TYPE_HPP_

/*
 * element_type.hpp
 * 
 * List of supported Click processing elements.
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

#include <string>

// List of allowed Click elements
// Input, Output, Processing, Drop, and Monitoring
static const uint32_t elem_start = __LINE__;
#define _Element(EL) \
	EL(PollDevice) \
	EL(FromDevice) \
	EL(FromNetFront) \
	EL(FromDPDKDevice) \
	EL(Queue) \
	EL(ToDevice) \
	EL(ToNetFront) \
	EL(ToDPDKDevice) \
	EL(IPFilter) \
	EL(Classifier) \
	EL(IPClassifier) \
	EL(RadixIPLookup) \
	EL(DirectIPLookup) \
	EL(LinearIPLookup) \
	EL(StaticIPLookup) \
	EL(LookupIPRouteMP) \
	EL(Strip) \
	EL(MarkIPHeader) \
	EL(CheckIPHeader) \
	EL(CheckICMPHeader) \
	EL(CheckUDPHeader) \
	EL(CheckTCPHeader) \
	EL(GetIPAddress) \
	EL(IPRewriter) \
	EL(DecIPTTL) \
	EL(FixIPSrc) \
	EL(IPGWOptions) \
	EL(DropBroadcasts) \
	EL(IPFragmenter) \
	EL(IPOutputCombo) \
	EL(RoundRobinIPMapper) \
	EL(VLANEncap) \
	EL(VLANDecap) \
	EL(SetVLANAnno) \
	EL(EtherEncap) \
	EL(StoreEtherAddress) \
	EL(ARPResponder) \
	EL(ARPQuerier) \
	EL(Paint) \
	EL(PaintTee) \
	EL(Print) \
	EL(Counter) \
	EL(AverageCounter) \
	EL(Discard) \
	EL(Discard_def) \
	EL(No_elem)
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