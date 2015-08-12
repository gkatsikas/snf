#ifndef ELEMENT_TYPE_HPP
#define ELEMENT_TYPE_HPP

#include <string>

//List of allowed click elements
#define Element(FOO) \
	FOO(DecIPTTL) \
	FOO(FixIPSrc) \
	FOO(IPFilter) \
	FOO(RadixIPLookup) \
	FOO(DirectIPLookup) \
	FOO(LinearIPLookup) \
	FOO(IPRewriter) \
	FOO(Discard) \
	FOO(Discard_def) 

#define DO_DESCRIPTION(e) #e,
#define DO_ENUM(e) e,

const std::string elementNames[9] = {
Element(DO_DESCRIPTION)
};

enum ElementType {
Element(DO_ENUM)
};

#endif
