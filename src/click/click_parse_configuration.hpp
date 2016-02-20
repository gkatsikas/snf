/* Part of file:
 * click.cc -- user-level Click main program
 * Eddie Kohler
 *
 * Copyright (c) 1999-2000 Massachusetts Institute of Technology
 * Copyright (c) 2000 Mazu Networks, Inc.
 * Copyright (c) 2001-2003 International Computer Science Institute
 * Copyright (c) 2004-2006 Regents of the University of California
 * Copyright (c) 2008-2009 Meraki, Inc.
 * Copyright (c) 1999-2015 Eddie Kohler
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, subject to the conditions
 * listed in the Click LICENSE file. These conditions include: you must
 * preserve this copyright notice, and you cannot mention the copyright
 * holders in advertising related to the Software without their permission.
 * The Software is provided WITHOUT ANY WARRANTY, EXPRESS OR IMPLIED. This
 * notice is a summary of the Click LICENSE file; the license in that file is
 * legally binding.
 */

//============================================================================
//        Name: click_parse_configuration.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
//  Co-authors: Georgios Katsikas(katsikas)-Marcel Enguehard(marcele) @kth.se
// Description: Header file to declare parse_configuration function and its
//              custom wrapper.
//============================================================================

#ifndef _CLICK_PARSE_CONFIGURATION_HPP_
#define _CLICK_PARSE_CONFIGURATION_HPP_

#include <click/config.h>
#include <click/pathvars.h>
#include <click/lexer.hh>
#include <click/routerthread.hh>
#include <click/router.hh>
#include <click/master.hh>
#include <click/error.hh>
#include <click/timer.hh>
#include <click/straccum.hh>
#include <click/clp.h>
#include <click/archive.hh>
#include <click/glue.hh>
#include <click/driver.hh>
#include <click/userutils.hh>
#include <click/args.hh>
#include <click/handlercall.hh>

/*
 * A little bit of house keeping after loading and parsing a Click configuration
 */
namespace ClickCleaner {
	void cleanup(Clp_Parser *clp, bool clean_all);
}

/*
 * Generate an equivalent Click configuration with flattened statements
 */
short generate_flat_configuration(
	const char** output_file,
	short position = -1
);

/*
 * Modified parse_configuration function of original click/userlevel/click.cc
 * We focus on the actual parsing thus the code that is relevant to the router
 * instantiation is commented
 */
Router* parse_configuration(
	const String &text,
	bool text_is_expr,
	ErrorHandler *errh
);

/*
 * Original click/userlevel/click.cc is a main file that calls the parse_configuration
 * function. We wrote this funciton to integrate the parser into our framework.
 */
Router* input_a_click_configuration(
	const char* click_source_configuration
);

#endif
