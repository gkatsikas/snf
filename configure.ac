#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([Hyper-NF], [0.9.0], [katsikas@kth.se])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_AUX_DIR([build-aux])
AC_CONFIG_MACRO_DIR([m4])

# Automake initialization (mandatory) including a check for automake API version >= 1.9
AM_INIT_AUTOMAKE([1.9 foreign -Wall])
AM_PROG_AR

# Checks for programs.
AC_PROG_CXXCPP
AC_PROG_CXX
#AX_CXX_COMPILE_STDCXX_11 # provided in directory m4

LT_INIT

# use the C++ compiler for the following checks
AC_LANG(C++)
AC_PROG_AWK
AC_PROG_CC
AC_PROG_CPP
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET

################################################################################
##  Check for headers, defs needed at compile time                            ##
################################################################################
# Consistency check: is source code present?
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_SRCDIR([src/parser/chain_parser.hpp.hpp])
AC_CONFIG_SRCDIR([src/synthesizer/synthesizer.hpp])
AC_CONFIG_SRCDIR([src/traffic_class_builder/filter.hpp])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_INLINE
AC_TYPE_MODE_T
AC_TYPE_SIZE_T
AC_TYPE_INT16_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T

# Checks for system functions\libraries.
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC

AC_CHECK_HEADERS(
	[sys/types.h sys/stat.h sys/time.h sys/wait.h],
	[], [], [$accheck_includes]
)

AC_TRY_CPP([#include<cstdio>],   , AC_MSG_ERROR([Cannot find cstdio.]))
AC_TRY_CPP([#include<cstdlib>],  , AC_MSG_ERROR([Cannot find cstdlib.]))
AC_TRY_CPP([#include<climits>],  , AC_MSG_ERROR([Cannot find climits.]))
AC_TRY_CPP([#include<iostream>], , AC_MSG_ERROR([Cannot find iostream.]))

AC_TRY_CPP([#include<set>],      , AC_MSG_ERROR([Cannot find set.]))
AC_TRY_CPP([#include<map>],      , AC_MSG_ERROR([Cannot find map.]))
AC_TRY_CPP([#include<stack>],    , AC_MSG_ERROR([Cannot find stack.]))
AC_TRY_CPP([#include<memory>],   , AC_MSG_ERROR([Cannot find memory.]))
AC_TRY_CPP([#include<string>],   , AC_MSG_ERROR([Cannot find string.]))
AC_TRY_CPP([#include<vector>],   , AC_MSG_ERROR([Cannot find vector.]))
AC_TRY_CPP([#include<utility>],  , AC_MSG_ERROR([Cannot find utility.]))
AC_TRY_CPP([#include<iterator>], , AC_MSG_ERROR([Cannot find iterator.]))

AC_TRY_CPP([#include<boost/foreach.hpp>],   , AC_MSG_ERROR([Cannot find boost/foreach.hpp.]))
AC_TRY_CPP([#include<boost/tokenizer.hpp>], , AC_MSG_ERROR([Cannot find boost/tokenizer.hpp.]))

# Checks for external tools' libraries.
AC_CHECK_LIB([dl],      [dlopen])
AC_CHECK_LIB([pcap],    [pcap_open_live])
AC_CHECK_LIB([pthread], [pthread_create])

# Click is key part of Hyper-NF
AC_CHECK_LIB([click],   [main])
AC_TRY_CPP([#include<click/routervisitor.hh>], , AC_MSG_ERROR([Cannot find click/routervisitor.hh.]))
################################################################################


################################################################################
## Debugging and verbosity features                                           ##
################################################################################

#### DEBUG_MODE
AC_MSG_CHECKING([whether to build with debug information])

# Use --enable-debug=yes to allow debug-level messages, more verbosity in g++, and gdb
AC_ARG_ENABLE(
	[debug],
	AS_HELP_STRING([--enable-debug], [enable debugging (def=no)]),
	[case "${enableval}" in
		yes) debug=true ;;
		no)  debug=false ;;
		*)   AC_MSG_ERROR([bad value ${enableval} for --enable-debug]) ;;
	esac],
	[debug=false]
)
AC_MSG_RESULT([$enableval])

if test x"$debug" = x"true"; then
	AC_DEFINE([DEBUG_MODE],[1],[Debug Mode])
	AM_CXXFLAGS="-g -O3 -std=c++11 -pedantic -Wall -Wno-uninitialized -Wextra"
else
	AM_CXXFLAGS="   -O3 -std=c++11 -pedantic -Wall -Wextra"
fi

#### VERBOSE_MODE
AC_MSG_CHECKING([verbosity])

# Use --enable-verbose=yes to allow verbosity in stdout, stderr
AC_ARG_ENABLE(
	[verbose],
	AS_HELP_STRING([--enable-verbose], [enable verbosity (def=yes)]),
	[case "${enableval}" in
		yes) verbose=true ;;
		no)  verbose=false ;;
		*)   AC_MSG_ERROR([bad value ${enableval} for --enable-verbose]) ;;
	esac],
	[verbose=true]
)
AC_MSG_RESULT([$enableval])

if test x"$verbose" = x"true"; then
	AC_DEFINE([VERBOSE_MODE],[1],[Verbosity Mode])
fi
################################################################################


################################################################################
## Click Packet Processing Architecture support                               ##
################################################################################
# Allow user to use his preferred Click path
AC_ARG_WITH(
	[click],
	AS_HELP_STRING([--with-click=DIR], [Click path [/opt/click/]]),
	[click_path=$withval],    # User defined
	[click_path=/opt/click/]  # Default
)

AC_MSG_CHECKING([for Click])

if test -d "$click_path"; then
	:
else
	AC_MSG_ERROR([
===============================================
Cannot find $click_path for Click.
Define a valid path using --with-click=<path>
===============================================])
fi

if test -f "$click_path/include/click/element.hh"; then
	CLICK_INCLUDES="-I$click_path"
else
	AC_MSG_ERROR([
===========================================================
Cannot find $click_path/include/click/element.hh for Click.
Define a valid path using --with-click=<path>
===========================================================])
fi

[CLICK_PATH=$click_path]
AC_MSG_RESULT([$CLICK_PATH])

saveflags="$CPPFLAGS"
CPPFLAGS="$saveflags $CLICK_INCLUDES"

[have_click="no"]
AC_MSG_CHECKING([for click/element.hh])
AC_PREPROC_IFELSE(
	[AC_LANG_SOURCE([[#include <click/element.hh>]])],
	[ac_cv_click_element_header_path="found"],
	[ac_cv_click_element_header_path="not found"]
)
AC_MSG_RESULT($ac_cv_click_element_header_path)

if test "$ac_cv_click_element_header_path" = "found"; then
	[have_click="yes"]
fi

if test x"$have_click" = x"yes"; then
	AC_CACHE_CHECK([whether click/element.hh works],
		[ac_cv_working_click_element_h], [
		AC_PREPROC_IFELSE([AC_LANG_SOURCE(
			[[#include <click/element.hh>]])],
			[ac_cv_working_click_element_h=yes],
			[ac_cv_working_click_element_h=no])]
		)
	test "$ac_cv_working_click_element_h" != yes && "$have_click" = yes
fi

CPPFLAGS="$saveflags"
if test x"$have_click" = x"yes"; then
	AC_DEFINE([HAVE_CLICK], [1], [Define if you have the <click/element.hh> header file.])
else
	AC_MSG_ERROR([
===============================================
Can't find Click and/or <click/element.hh>
===============================================])
fi

AC_SUBST(CLICK_PATH)
AC_DEFINE_UNQUOTED([CLICK_PATH],["${CLICK_PATH}/bin/click"],[Click path])
AC_SUBST(CLICK_INCLUDES)
################################################################################


################################################################################
# DPDK Support
################################################################################

AC_MSG_CHECKING([whether to enable DPDK])

# Use --enable-dpdk=yes to build Hyper-NF with DPDK support
AC_ARG_ENABLE(
	[dpdk],
	[AS_HELP_STRING([--enable-dpdk], [use DPDK (def=no)])],
	[enable_dpdk="$enableval"],
	[enable_dpdk=no]
)

# User selected this option, let's check if she gave the correct DPDK paths
if test x"$enable_dpdk" = x"yes"; then

	# We expect two variables:
	# RTE_SDK --> DPDK Home directory
	# RTE_TARGET --> the DPDK build path (e.g., x86_64-native-linuxapp-gcc)

	if test ! -f "$RTE_SDK/$RTE_TARGET/include/rte_eal.h"; then
		AC_MSG_ERROR([
=================================================================
Cannot find \$RTE_SDK/\$RTE_TARGET/include/rte_eal.h for DPDK.
Define \$RTE_SDK and \$RTE_TARGET as per DPDK documentation.
=================================================================])
	fi

	if test ! -f "$RTE_SDK/$RTE_TARGET/lib/librte_eal.a"; then
		AC_MSG_ERROR([
=================================================================
Cannot find \$RTE_SDK/\$RTE_TARGET/lib/librte_eal.a for DPDK.
Define \$RTE_SDK and \$RTE_TARGET as per DPDK documentation.
=================================================================])
	fi

	rte_ver_major=`grep "#define RTE_VER_MAJOR" "$RTE_SDK/$RTE_TARGET/include/rte_version.h" | head -n 1 | awk '{print $3}'`
	rte_ver_minor=`grep "#define RTE_VER_MINOR" "$RTE_SDK/$RTE_TARGET/include/rte_version.h" | head -n 1 | awk '{print $3}'`

	AC_MSG_RESULT([$enable_dpdk])

	[FULL_DPDK_PATH=${RTE_SDK}/${RTE_TARGET}]

	AC_SUBST(RTE_SDK)
	AC_SUBST(RTE_TARGET)
	AC_SUBST(RTE_VER_MAJOR, $rte_ver_major)
	AC_SUBST(RTE_VER_MINOR, $rte_ver_minor)
	AC_SUBST(FULL_DPDK_PATH)
	AC_DEFINE([HAVE_DPDK], [1], [DPDK is installed])
	AC_DEFINE_UNQUOTED([DPDK_HOME_PATH],["$RTE_SDK"],[DPDK Home Path])
	AC_DEFINE_UNQUOTED([DPDK_SDK_PATH],["$FULL_DPDK_PATH"],[DPDK SDK Path])
	AC_SUBST(USE_DPDK, yes)
else
	AC_MSG_RESULT([no])
fi
AM_CONDITIONAL([DPDK], [test x"$enable_dpdk" = x"yes"])
################################################################################

LIBS="-ldl -lpthread -lpcap -lclick $LIBS"
AM_LDFLAGS="-L/usr/local/lib/ -lclick -ldl -lpthread -lpcap"

#LDFLAGS="$LDFLAGS -L/usr/local/lib/ -lclick -ldl -lpthread -lpcap"
#CXXFLAGS="$CXXFLAGS -O3 -Wall -std=c++11 -pedantic -Wextra -g"

# Fix warnings because of $ symbols appearing in Makefile.am
AC_SUBST([DOLLAR_SIGN],[$])

AC_SUBST([LIBS])
AC_SUBST([AM_CXXFLAGS])
AC_SUBST([AM_LDFLAGS])

AC_CONFIG_FILES(
	[Makefile
	doc/Makefile
	src/Makefile
	src/click/Makefile
	src/configuration/Makefile
	src/generator/Makefile
	src/graph/Makefile
	src/parser/Makefile
	src/shared/Makefile
	src/synthesizer/Makefile
	src/traffic_class_builder/Makefile]
)

AC_OUTPUT
