//============================================================================
// Name        : parse_configuration.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Header file for Click parse_configuration function
//============================================================================

#ifndef _PARSE_CONFIGURATION_HPP_
#define _PARSE_CONFIGURATION_HPP_

static Router* parse_configuration(
	const String &text,
	bool text_is_expr,
	bool hotswap,
	ErrorHandler *errh
);

#endif
