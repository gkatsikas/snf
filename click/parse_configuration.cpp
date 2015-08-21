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

#include "parse_configuration.hpp"

static Router* parse_configuration(const String &text, bool text_is_expr,
					bool hotswap, ErrorHandler *errh)
{
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
	}

	// register hotswap router on new router
	if (hotswap && click_router && click_router->initialized())
		router->set_hotswap_router(click_router);

	if (errh->nerrors() == before_errors && router->initialize(errh) >= 0)
		return router;
	else {
		delete router;
		return 0;
	}
}
