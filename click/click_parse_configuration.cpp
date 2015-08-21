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

#include "click_parse_configuration.hpp"

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

static const char *program_name;

void short_usage() {
	fprintf(stderr, "Usage: %s [OPTION]... [ROUTERFILE]\n\
					Try '%s --help' for more information.\n",
					program_name, program_name);
}

void usage() {
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

static Master* click_master;
static Router* click_router;
static ErrorHandler* errh;

// switching configurations

static Vector<String> cs_unix_sockets;
static Vector<String> cs_ports;
static Vector<String> cs_sockets;
//static bool warnings = true;
int click_nthreads = 1;

static String click_driver_control_socket_name(int number) {
	if (!number)
		return "click_driver@@ControlSocket";
	else
		return "click_driver@@ControlSocket@" + String(number);
}

static Router* parse_configuration(const String &text, bool text_is_expr,
					bool hotswap, ErrorHandler *errh) {
	int before_errors = errh->nerrors();
	Router *router = click_read_router(text, text_is_expr, errh, false, click_master);

	if (!router)
		return 0;

	// add new ControlSockets
	String retries = (hotswap ? ", RETRIES 1, RETRY_WARNINGS false" : "");
	int ncs = 0;
	for (String *it = cs_ports.begin(); it != cs_ports.end(); ++it, ++ncs)
		router->add_element(new ControlSocket, click_driver_control_socket_name(ncs), "TCP, " + *it + retries, "click", 0);
	for (String *it = cs_unix_sockets.begin(); it != cs_unix_sockets.end(); ++it, ++ncs)
		router->add_element(new ControlSocket, click_driver_control_socket_name(ncs), "UNIX, " + *it + retries, "click", 0);
	for (String *it = cs_sockets.begin(); it != cs_sockets.end(); ++it, ++ncs)
		router->add_element(new ControlSocket, click_driver_control_socket_name(ncs), "SOCKET, " + *it + retries, "click", 0);

	/*
	// catch signals (only need to do the first time)
	if (!hotswap) {
		// catch control-C and SIGTERM
		click_signal(SIGINT, stop_signal_handler, true);
		click_signal(SIGTERM, stop_signal_handler, true);
		// ignore SIGPIPE
		click_signal(SIGPIPE, SIG_IGN, false);

		#if HAVE_EXECINFO_H
		const char *click_backtrace = getenv("CLICK_BACKTRACE");
		bool do_click_backtrace;
		if (click_backtrace && (!BoolArg().parse(click_backtrace, do_click_backtrace) || do_click_backtrace)) {
			click_signal(SIGSEGV, catch_dump_signal, false);
			click_signal(SIGBUS, catch_dump_signal, false);
			click_signal(SIGILL, catch_dump_signal, false);
			click_signal(SIGABRT, catch_dump_signal, false);
			click_signal(SIGFPE, catch_dump_signal, false);
		}
		#endif
	}*/

	// register hotswap router on new router
	//if (hotswap && click_router && click_router->initialized())
	//	router->set_hotswap_router(click_router);

	if (errh->nerrors() == before_errors && router->initialize(errh) >= 0)
		return router;
	else {
		delete router;
		return 0;
	}
}

static int cleanup(Clp_Parser *clp, int exit_value) {
	Clp_DeleteParser(clp);
	delete click_master;
	return exit_value;
}

short input_a_click_configuration (int argc, char** argv) {
	errh = ErrorHandler::default_handler();

	// Read command line arguments
	Clp_Parser *clp = Clp_NewParser(argc, argv, sizeof(options) / sizeof(options[0]), options);
	program_name = Clp_ProgramName(clp);

	const char *router_file = 0;
	bool file_is_expr = false;
	
	// The file that contains the Click configuration
	router_file = clp->vstr;
	
	// parse configuration
	click_master = new Master(click_nthreads);
	click_router = parse_configuration(router_file, file_is_expr, false, errh);
	if (!click_router)
		return cleanup(clp, 1);

	return cleanup(clp, 0);
}
