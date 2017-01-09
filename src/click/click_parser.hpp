#ifndef _CLICK_PARSER_HPP_
#define _CLICK_PARSER_HPP_

/*
 * click_parser.hpp
 *
 * Header file to declare parse_configuration function and its custom wrapper.
 *
 * Copyright (c) 1999-2000 Massachusetts Institute of Technology
 * Copyright (c) 2000 Mazu Networks, Inc.
 * Copyright (c) 2001-2003 International Computer Science Institute
 * Copyright (c) 2004-2006 Regents of the University of California
 * Copyright (c) 2008-2009 Meraki, Inc.
 * Copyright (c) 1999-2015 Eddie Kohler
 * Copyright (c) 2015-2016 Georgios Katsikas
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

#ifdef HAVE_CLICK
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
#else
BUG("Click is not installed. Autoconf script needs to be fixed");
#endif

/*
 * A little bit of house keeping after loading and parsing a Click configuration
 */
namespace ClickCleaner {
	void cleanup(Clp_Parser *clp, const bool &clean_all);
}

/*
 * Generate an equivalent Click configuration with flattened statements
 */
bool
generate_flat_configuration(
	const char **output_file,
	const short position = -1
);

/*
 * Modified parse_configuration function of original click/userlevel/click.cc
 * We focus on the actual parsing thus the code that is relevant to the router
 * instantiation is commented
 */
Router*
parse_configuration(
	const String &text,
	const bool   &text_is_expr,
	ErrorHandler *errh
);

/*
 * Original click/userlevel/click.cc is a main file that calls the parse_configuration
 * function. We wrote this funciton to integrate the parser into our framework.
 */
Router*
input_a_click_configuration(
	const char *click_source_configuration
);

#endif
