//============================================================================
// Name        : click_parse_configuration.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Header file for Click parse_configuration function
//============================================================================

#ifndef _PARSE_CONFIGURATION_HPP_
#define _PARSE_CONFIGURATION_HPP_

#include <click/config.h>
#include <click/pathvars.h>

#include <stdio.h>
#include <string.h>
#include <signal.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/param.h>
#include <sys/stat.h>
#include <sys/resource.h>
#include <fcntl.h>
#if HAVE_EXECINFO_H
# include <execinfo.h>
#endif

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
//#include "elements/standard/quitwatcher.hh"
#include "elements/userlevel/controlsocket.hh"
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

static int cleanup(Clp_Parser *clp, int exit_value);

static Router* parse_configuration(
	const String &text,
	bool text_is_expr,
	bool hotswap,
	ErrorHandler *errh
);

short input_a_click_configuration(
	int argc,
	char** argv
);

#endif
