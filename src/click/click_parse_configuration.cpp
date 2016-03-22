// -*- c-basic-offset: 4 -*-
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
// Description: Modified implementation of click_path/userlevel/click.cc
//              to load and parse a Click configurations. The code used to
//              instantiate the router is intentionally removed.
//============================================================================

#include "../shared/helpers.hpp"
#include "../logger/logger.hpp"
#include "click_parse_configuration.hpp"

CLICK_USING_DECLS

#define CLICKPATH_OPT  302
#define ROUTER_OPT     303
#define EXPRESSION_OPT 304

static const Clp_Option options[] = {
	{ "clickpath",  'C', CLICKPATH_OPT,  Clp_ValString, 0 },
	{ "expression", 'e', EXPRESSION_OPT, Clp_ValString, 0 },
	{ "file",       'f', ROUTER_OPT,     Clp_ValString, 0 },
};

// Global variables useful to Click
Logger logger(__FILE__);
int    click_nthreads = 1;
static ErrorHandler* errh;
static Router *click_router = NULL;
static Master *click_master = NULL;

void
ClickCleaner::cleanup(Clp_Parser *clp, const bool &clean_all) {
	if ( clp != NULL )
		Clp_DeleteParser(clp);

	if ( clean_all ) {
		note_chatter(logger, "\tCleaning up Click...");
		click_static_cleanup();
		note_chatter(logger, "\t|-> Static clean up");
		if ( (click_router != NULL) && (click_master != NULL) )
			delete click_master;
		note_chatter(logger, "\t|-> Click Master is deleted");
		errh = NULL;
		note_chatter(logger, "\t|-> Click Error Handler is deleted");
	}
}

Router*
parse_configuration(const String &text, const bool &text_is_expr, ErrorHandler *errh) {
	int before_errors = errh->nerrors();
	Router *router = click_read_router(text, text_is_expr, errh, false, click_master);

	// Check the object first
	if ( !router ) {
		error_chatter(logger, "\tNetwork Function object is NULL");
		return NULL;
	}

	// Check for newly produced errors and whether the parsed configuration can be initialized
	// (or in other words whether it is a valid Click configuration)
	bool initialize_only_dag = true;
	if ( (errh->nerrors() == before_errors) && (router->initialize(errh, initialize_only_dag) >= 0) ) {
		def_chatter(logger, "\tNF parsed successfully");
		return router;
	}
	else {
		error_chatter(logger, "\tNF is problematic");
		delete router;
		return NULL;
	}
}

short
generate_flat_configuration(char **output_file, const short &position) {

	if ( !click_router )
		return FAILURE;

	if ( *output_file == NULL ) {
		*output_file = new char[strlen("nf_repo/temp.click")+3];
		sprintf(*output_file, "nf_repo/temp_%d.click",position);
	}
	else {
		delete *output_file;
		*output_file = new char[strlen("nf_repo/temp.click")+1];
		sprintf(*output_file, "nf_repo/temp.click");
	}

	FILE *f = 0;
	f = fopen(*output_file, "w");
	if (!f) {
		error_chatter(logger, std::string(*output_file) + ": " + strerror(errno));
		return FAILURE;
	}

	if (f) {
		Element *root = click_router->root_element();
		String s = Router::handler(root, "flatconfig")->call_read(root);
		ignore_result(fwrite(s.data(), 1, s.length(), f));
		fclose(f);
	}

	return SUCCESS;
}

Router*
input_a_click_configuration (const char *click_source_configuration) {
	// Important function that exports the Click elements
	click_static_initialize();

	// Error handling within Click
	errh = ErrorHandler::default_handler();

	// We currently support only simple deployments without extra options
	// e.g. path_to_click_dir/click my_nf.click
	int argc = 2;
	const char *argv[2] = {NULL, NULL};
	#ifdef  CLICK_PATH
		if ( !file_exists(std::string(CLICK_PATH)) ) {
			error_chatter(logger, "Click executable's path " + std::string(CLICK_PATH) + " does not exist. Using default");
			const std::string default_click_exec("/usr/local/bin/click");
			argv[0] = default_click_exec.c_str();
		}
		else {
			argv[0] = CLICK_PATH;
		}
		argv[1] = click_source_configuration;
	#else
		error_chatter(logger, "A non-existent CLICK_PATH variable implies problem in autoconf");
		exit(FAILURE);
	#endif

	// Command line arguments' parser
	Clp_Parser *clp = Clp_NewParser(argc, argv, sizeof(options) / sizeof(options[0]), options);

	const char *router_file = NULL;
	bool       file_is_expr = false;

	// Iterate the parser to obtain all the commands
	while (true) {
		int opt = Clp_Next(clp);
		switch (opt) {
			case ROUTER_OPT:
			case EXPRESSION_OPT:
				router_file:
					if (router_file) {
						error_chatter(logger, "Network Function's configuration specified twice");
						goto bad_option;
					}
					router_file = clp->vstr;
					debug_chatter(logger, "Network Function's source code: " + std::string(router_file));

					file_is_expr = (opt == EXPRESSION_OPT);
					break;

			case Clp_NotOption:
				for (const char *s = clp->vstr; *s; s++)
					if (*s == '=' && s > clp->vstr) {
						if (!click_lexer()->global_scope().define(String(clp->vstr, s), s + 1, false))
							errh->error("parameter %<%.*s%> multiply defined", s - clp->vstr, clp->vstr);
						goto next_argument;
					}
					else if (!isalnum((unsigned char) *s) && *s != '_')
					break;
				goto router_file;

			case CLICKPATH_OPT:
				set_clickpath(clp->vstr);
				break;

		bad_option:
			case Clp_BadOption:
				ClickCleaner::cleanup(clp, true);
				return NULL;

			case Clp_Done:
				goto done;

		}
		next_argument: ;
	}

	// Everything went smoothly within the cmd parser's while loop above
	done:
		// Get current error status
		int before_errors = errh->nerrors();

		// Parse configuration
		click_master = new Master(click_nthreads);
		click_router = parse_configuration(router_file, file_is_expr, errh);

		// Error while parsing the router
		if ( !click_router ) {
			error_chatter(logger, "Error while parsing the Network Function in " + std::string(router_file));
			// Do not clean now, the caller will do so
			return NULL;
		}

		// Done! Do not clean the Master (2nd arg = false)
		ClickCleaner::cleanup(clp, false);

		// If the new error status is the same as before parsing the router,
		// then everything OK
		if ( errh->nerrors() != before_errors )
			return NULL;

		return click_router;
}

void
potentially_useful_code_in_the_near_future(void) {
	// Generate the flat configuration of this NF
	/*char* flat_router = NULL;
	if ( generate_flat_configuration(&flat_router, position) != SUCCESS ) {
		debug_chatter(logger, "Failed to generate flat configuration for " >> router_file);
		cleanup(clp, FAILURE);
		return NULL;
	}
	click_router = parse_configuration(flat_router, file_is_expr, errh);
	if ( remove(flat_router) != 0 )
		errh->error("Error deleting temporary Click configuration file %s", *output_file);
	delete flat_router;*/
}
