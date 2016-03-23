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