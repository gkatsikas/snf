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

#include "../helpers.hpp"
#include "../logger/logger.hpp"
#include "click_parse_configuration.hpp"

CLICK_USING_DECLS

#define HELP_OPT                300
#define VERSION_OPT             301
#define CLICKPATH_OPT           302
#define ROUTER_OPT              303
#define EXPRESSION_OPT          304
#define QUIT_OPT                305
#define OUTPUT_OPT              306
#define HANDLER_OPT             307
#define TIME_OPT                308
#define PORT_OPT                310
#define UNIX_SOCKET_OPT         311
#define NO_WARNINGS_OPT         312
#define WARNINGS_OPT            313
#define ALLOW_RECONFIG_OPT      314
#define EXIT_HANDLER_OPT        315
#define THREADS_OPT             316
#define SIMTIME_OPT             317
#define SOCKET_OPT              318
#define THREADS_AFF_OPT         319

static const Clp_Option options[] = {
	{ "allow-reconfigure", 'R', ALLOW_RECONFIG_OPT, 0, Clp_Negate },
	{ "clickpath", 'C', CLICKPATH_OPT, Clp_ValString, 0 },
	{ "expression", 'e', EXPRESSION_OPT, Clp_ValString, 0 },
	{ "file", 'f', ROUTER_OPT, Clp_ValString, 0 },
	{ "handler", 'h', HANDLER_OPT, Clp_ValString, 0 },
	{ "help", 0, HELP_OPT, 0, 0 },
	{ "output", 'o', OUTPUT_OPT, Clp_ValString, 0 },
	{ "socket", 0, SOCKET_OPT, Clp_ValInt, 0 },
	{ "port", 'p', PORT_OPT, Clp_ValString, 0 },
	{ "quit", 'q', QUIT_OPT, 0, 0 },
	{ "simtime", 0, SIMTIME_OPT, Clp_ValDouble, Clp_Optional },
	{ "simulation-time", 0, SIMTIME_OPT, Clp_ValDouble, Clp_Optional },
	{ "threads", 'j', THREADS_OPT, Clp_ValInt, 0 },
	{ "affinity", 'a', THREADS_AFF_OPT, 0, 0 },
	{ "time", 't', TIME_OPT, 0, 0 },
	{ "unix-socket", 'u', UNIX_SOCKET_OPT, Clp_ValString, 0 },
	{ "version", 'v', VERSION_OPT, 0, 0 },
	{ "warnings", 0, WARNINGS_OPT, 0, Clp_Negate },
	{ "exit-handler", 'x', EXIT_HANDLER_OPT, Clp_ValString, 0 },
	{ 0, 'w', NO_WARNINGS_OPT, 0, Clp_Negate },
};

static bool warnings  = true;
int    click_nthreads = 1;
static ErrorHandler* errh;
static Master* click_master;
static Router* click_router;
static const char *program_name;

static Vector<String> cs_unix_sockets;
static Vector<String> cs_ports;
static Vector<String> cs_sockets;

void short_usage(void) {
	fprintf(stderr, "Usage: %s [OPTION]... [ROUTERFILE]\n\
			Try '%s --help' for more information.\n",
			program_name, program_name);
}

void usage(void) {
	printf("\
	'Click' runs a Click router configuration at user level. It installs the\n\
	configuration, reporting any errors to standard error, and then generally runs\n\
	until interrupted.\n\
	\n\
	Usage: %s [OPTION]... [ROUTERFILE]\n\
	\n\
	Options:\n\
	  -f, --file FILE               Read router configuration from FILE.\n\
	  -e, --expression EXPR         Use EXPR as router configuration.\n\
	  -j, --threads N               Start N threads (default 1).\n", program_name);
	#if HAVE_DECL_PTHREAD_SETAFFINITY_NP
		printf("\
	  -a, --affinity                Pin threads to CPUs (default no).\n");
	#endif
		printf("\
	  -p, --port PORT               Listen for control connections on TCP port.\n\
	  -u, --unix-socket FILE        Listen for control connections on Unix socket.\n\
		  --socket FD               Add a file descriptor control connection.\n\
	  -R, --allow-reconfigure       Provide a writable 'hotconfig' handler.\n\
	  -h, --handler ELEMENT.H       Call ELEMENT's read handler H after running\n\
									driver and print result to standard output.\n\
	  -x, --exit-handler ELEMENT.H  Use handler ELEMENT.H value for exit status.\n\
	  -o, --output FILE             Write flat configuration to FILE.\n\
	  -q, --quit                    Do not run driver.\n\
	  -t, --time                    Print information on how long driver took.\n\
	  -w, --no-warnings             Do not print warnings.\n\
		  --simtime                 Run in simulation time.\n\
	  -C, --clickpath PATH          Use PATH for CLICKPATH.\n\
		  --help                    Print this message and exit.\n\
	  -v, --version                 Print version number and exit.\n\
	\n\
	Report bugs to <click@librelist.com>.\n");
}

Router* parse_configuration(const String &text, bool text_is_expr, ErrorHandler *errh) {
	int before_errors = errh->nerrors();
	Router *router = click_read_router(text, text_is_expr, errh, false, click_master);

	// Check the object first
	if ( !router ) {
		errh->error("Network Function object is NULL");
		return NULL;
	}

	// Check for newly produced errors and whether the parsed configuration can be initialized
	// (or in other words whether it is a valid Click configuration)
	if ( (errh->nerrors() == before_errors) && (router->initialize(errh) >= 0) ) {
		//errh->message("NF parsed successfully");
		return router;
	}
	else {
		//errh->error("NF is problematic");
		delete router;
		return NULL;
	}
}

short cleanup(Clp_Parser *clp, short exit_value) {
	Clp_DeleteParser(clp);
	delete click_master;
	return exit_value;
}

#if HAVE_DECL_PTHREAD_SETAFFINITY_NP
static bool set_affinity = false;
void do_set_affinity(pthread_t p, int cpu) {
	cpu_set_t set;
	CPU_ZERO(&set);
	CPU_SET(cpu, &set);
	pthread_setaffinity_np(p, sizeof(cpu_set_t), &set);
}
#else
# define do_set_affinity(p, cpu) // nothing
#endif

Router* input_a_click_configuration (const char* click_source_configuration) {
	// Important function that exports the Click elements
	click_static_initialize();

	// Error handling within Click
	errh = ErrorHandler::default_handler();

	// We currently support only simple deployments without extra options
	// e.g. path_to_click_dir/click my_nf.click
	int argc = 2;
	const char* argv[2] = { "/usr/local/bin/click", click_source_configuration };

	// Command line arguments' parser
	Clp_Parser *clp = Clp_NewParser(argc, argv, sizeof(options) / sizeof(options[0]), options);

	// Get the program name (click or click-install)
	program_name = Clp_ProgramName(clp);
	errh->message("     Program name: %s", program_name);

	const char *router_file = 0;
	bool file_is_expr       = false;
	const char *output_file = 0;
	bool quit_immediately   = false;
	bool report_time        = false;
	bool allow_reconfigure  = false;
	Vector<String> handlers;
	String exit_handler;

	// Iterate the parser to obtain all the commands
	while (1) {
		int opt = Clp_Next(clp);
		switch (opt) {
			case ROUTER_OPT:
				break;

			case EXPRESSION_OPT:
				router_file:
				if (router_file) {
					errh->error("Network Function configuration specified twice");
					goto bad_option;
				}
				router_file = clp->vstr;
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

			case OUTPUT_OPT:
				if (output_file) {
					errh->error("output file specified twice");
					goto bad_option;
				}
				output_file = clp->vstr;
				break;

			case HANDLER_OPT:
				handlers.push_back(clp->vstr);
				break;

			case EXIT_HANDLER_OPT:
				if (exit_handler) {
					errh->error("--exit-handler specified twice");
					goto bad_option;
				}
				exit_handler = clp->vstr;
				break;

			case PORT_OPT: {
				uint16_t portno;
				int portno_int = -1;
				String vstr(clp->vstr);
				if (IPPortArg(IP_PROTO_TCP).parse(vstr, portno))
					cs_ports.push_back(String(portno));
				else if (vstr && vstr.back() == '+'
					&& IntArg().parse(vstr.substring(0, -1), portno_int)
					&& portno_int > 0 && portno_int < 65536)
					cs_ports.push_back(String(portno_int) + "+");
				else {
					Clp_OptionError(clp, "%<%O%> expects a TCP port number, not %<%s%>", clp->vstr);
					goto bad_option;
				}
				break;
			}

			case UNIX_SOCKET_OPT:
				cs_unix_sockets.push_back(clp->vstr);
				break;

			case SOCKET_OPT:
				cs_sockets.push_back(clp->vstr);
				break;

			case ALLOW_RECONFIG_OPT:
				allow_reconfigure = !clp->negated;
				break;

			case QUIT_OPT:
				quit_immediately = true;
				break;

			case TIME_OPT:
				report_time = true;
				break;

			case WARNINGS_OPT:
				warnings = !clp->negated;
				break;

			case NO_WARNINGS_OPT:
				warnings = clp->negated;
				break;

			case THREADS_OPT:
				click_nthreads = clp->val.i;
				if (click_nthreads <= 1)
					click_nthreads = 1;
				#if !HAVE_MULTITHREAD
				if (click_nthreads > 1) {
					errh->error("Click was built without multithread support, running single threaded");
					click_nthreads = 1;
				}
				#endif
				break;

			case THREADS_AFF_OPT:
				#if HAVE_DECL_PTHREAD_SETAFFINITY_NP
					set_affinity = true;
				#else
					errh->error("CPU affinity is not supported on this platform");
				#endif
				break;

			case SIMTIME_OPT: {
				Timestamp::warp_set_class(Timestamp::warp_simulation);
				Timestamp simbegin(clp->have_val ? clp->val.d : 1000000000);
				Timestamp::warp_set_now(simbegin, simbegin);
				break;
			}

			case CLICKPATH_OPT:
				set_clickpath(clp->vstr);
				break;

			case HELP_OPT:
				usage();
				cleanup(clp, SUCCESS);
				return NULL;

			case VERSION_OPT:
				printf("click (Click) %s\n", CLICK_VERSION);
				printf("Copyright (C) 1999-2001 Massachusetts Institute of Technology\n\
				Copyright (C) 2001-2003 International Computer Science Institute\n\
				Copyright (C) 2008-2009 Meraki, Inc.\n\
				Copyright (C) 2004-2011 Regents of the University of California\n\
				Copyright (C) 1999-2012 Eddie Kohler\n\
				This is free software; see the source for copying conditions.\n\
				There is NO warranty, not even for merchantability or fitness for a\n\
				particular purpose.\n");
				cleanup(clp, SUCCESS);
				return NULL;

		bad_option:
			case Clp_BadOption:
				short_usage();
				cleanup(clp, FAILURE);
				return NULL;

			case Clp_Done:
				goto done;
		}
		next_argument: ;
	}

	// Everything went smoothly within the cmd parser's while loop above
	done:
		// Print some of the important parameters
		errh->message("      Router file: %s", router_file);
		errh->message("    Is expression: %s", file_is_expr?"true":"false");
		errh->message(" Quit immediately: %s", quit_immediately?"true":"false");
		errh->message("Allow Reconfigure: %s", allow_reconfigure?"true":"false");
		errh->message("      Report Time: %d", report_time);

		// Parse configuration
		click_master = new Master(click_nthreads);
		click_router = parse_configuration(router_file, file_is_expr, errh);

		// Error while parsing the router
		if ( !click_router ) {
			errh->error("Error while parsing the Network Function in %s", router_file);

			// Clean the mess and return a NULL object
			cleanup(clp, FAILURE);
			return NULL;
		}

		// Done!
		cleanup(clp, SUCCESS);
		errh->message("Network Function parsed successfully");

		return click_router;
}
