dnl
dnl HYPERNF_CHECK_CXX
dnl Verifies that C++11 is installed
dnl

AC_COMPILE_IFELSE([AC_LANG_SOURCE(
  [[template <typename T>
	struct check
	{
	  static_assert(sizeof(int) <= sizeof(T), "not big enough");
	};

	typedef check<check<bool>> right_angle_brackets;

	int a;
	decltype(a) b;

	typedef check<int> check_type;
	check_type c;
	check_type&& cr = static_cast<check_type&&>(c);]])],,
  AC_MSG_FAILURE(['$CXX $CXXFLAGS' does not accept ISO C++11]))


dnl
dnl HYPERNF_CHECK_LIBPCAP
dnl Finds header files and libraries for libpcap.
dnl

AC_DEFUN([HYPERNF_CHECK_LIBPCAP], [

	dnl header files

	HAVE_PCAP=yes
	if test "${PCAP_INCLUDES-NO}" = NO; then
		AC_CACHE_CHECK(for pcap.h, ac_cv_pcap_header_path, [
			AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <pcap.h>]])],
			ac_cv_pcap_header_path="found",
			[ac_cv_pcap_header_path='not found'
			test -r /usr/local/include/pcap/pcap.h && \
				ac_cv_pcap_header_path='-I/usr/local/include/pcap'
			test -r /usr/include/pcap/pcap.h && \
				ac_cv_pcap_header_path='-I/usr/include/pcap'])])
		if test "$ac_cv_pcap_header_path" = 'not found'; then
			HAVE_PCAP=
		elif test "$ac_cv_pcap_header_path" != 'found'; then
			PCAP_INCLUDES="$ac_cv_pcap_header_path"
		fi
	fi

	if test "$HAVE_PCAP" = yes; then
		AC_CACHE_CHECK(whether pcap.h works, ac_cv_working_pcap_h, [
			saveflags="$CPPFLAGS"
			CPPFLAGS="$saveflags $PCAP_INCLUDES"
			AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <pcap.h>]])], ac_cv_working_pcap_h=yes, ac_cv_working_pcap_h=no)
			CPPFLAGS="$saveflags"])
		test "$ac_cv_working_pcap_h" != yes && HAVE_PCAP=
	fi

	if test "$HAVE_PCAP" = yes; then
		saveflags="$CPPFLAGS"
		CPPFLAGS="$saveflags $PCAP_INCLUDES"
		AC_CACHE_CHECK(for bpf_timeval in pcap.h, ac_cv_bpf_timeval,
			AC_EGREP_HEADER(bpf_timeval, pcap.h, ac_cv_bpf_timeval=yes, ac_cv_bpf_timeval=no))
		if test "$ac_cv_bpf_timeval" = yes; then
			AC_DEFINE([HAVE_BPF_TIMEVAL], [1], [Define if <pcap.h> uses bpf_timeval.])
		fi
		AC_CHECK_DECLS([pcap_setnonblock], [], [], [#include <pcap.h>])
		CPPFLAGS="$saveflags"
	fi

	test "$HAVE_PCAP" != yes && PCAP_INCLUDES=
	AC_SUBST(PCAP_INCLUDES)


	dnl libraries

	if test "$HAVE_PCAP" = yes; then
		if test "${PCAP_LIBS-NO}" = NO; then
			AC_CACHE_CHECK([for -lpcap], [ac_cv_pcap_library_path], [
				saveflags="$LDFLAGS"
				savelibs="$LIBS"
				LIBS="$savelibs -lpcap $SOCKET_LIBS"
				AC_LANG_C
				AC_LINK_IFELSE([AC_LANG_CALL([[]], [[pcap_open_live]])], [ac_cv_pcap_library_path="found"],
								[LDFLAGS="$saveflags -L/usr/local/lib"
								AC_LINK_IFELSE([AC_LANG_CALL([[]], [[pcap_open_live]])], [ac_cv_pcap_library_path="-L/usr/local/lib"], [ac_cv_pcap_library_path="not found"])])
				LDFLAGS="$saveflags"
				LIBS="$savelibs"])
		else
			AC_CACHE_CHECK([for -lpcap in "$PCAP_LIBS"], [ac_cv_pcap_library_path], [
				saveflags="$LDFLAGS"
				LDFLAGS="$saveflags $PCAP_LIBS"
				savelibs="$LIBS"
				LIBS="$savelibs -lpcap $SOCKET_LIBS"
				AC_LANG_C
				AC_LINK_IFELSE([AC_LANG_CALL([[]], [[pcap_open_live]])], [ac_cv_pcap_library_path="$PCAP_LIBS"], [ac_cv_pcap_library_path="not found"])
				LDFLAGS="$saveflags"
				LIBS="$savelibs"])
		fi
		if test "$ac_cv_pcap_library_path" = "found"; then
			PCAP_LIBS='-lpcap'
		elif test "$ac_cv_pcap_library_path" != "not found"; then
			PCAP_LIBS="$ac_cv_pcap_library_path -lpcap"
		else
			HAVE_PCAP=
		fi
	fi

	test "$HAVE_PCAP" != yes && PCAP_LIBS=
	AC_SUBST(PCAP_LIBS)

	if test "$HAVE_PCAP" = yes; then
		AC_DEFINE([HAVE_PCAP], [1], [Define if you have -lpcap and pcap.h.])

		savelibs="$LIBS"
		LIBS="$savelibs $PCAP_LIBS"
		AC_CHECK_FUNCS([pcap_inject pcap_sendpacket pcap_setdirection pcap_setnonblock pcap_set_immediate_mode])
		LIBS="$savelibs"
	fi
])

PTHREAD_LIBS=""
AC_SUBST(PTHREAD_LIBS)

AC_CHECK_DECLS(
	[pthread_setaffinity_np], [], [], [#define _GNU_SOURCE #include <pthread.h>])
	if echo "$LIBS" | grep -e -lpthread >/dev/null 2>&1; then
		PTHREAD_LIBS="-lpthread"
	fi
	else
		AC_MSG_ERROR([
=========================================
Can't find -lpthread and/or <pthread.h>.
=========================================]
)

dnl
dnl HYPERNF_CHECK_CLICK
dnl Finds header files for netmap.
dnl

AC_DEFUN([HYPERNF_CHECK_CLICK], [
	AC_ARG_WITH([click],
		[AS_HELP_STRING([--path-to-click], [Click path [/opt/click/]])],
		[click_path=$withval], [click_path=/opt/click/])

	if test -f "$click_path/include/click/element.hh"; then
		CLICK_INCLUDES="-I$click_path"
	fi
	
	saveflags="$CPPFLAGS"
	CPPFLAGS="$saveflags $CLICK_INCLUDES"

	HAVE_CLICK=no
	AC_MSG_CHECKING([for click/element.hh])
	AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <click/element.hh>]])],
		[ac_cv_click_element_header_path="found"],
		[ac_cv_click_element_header_path="not found"])
	AC_MSG_RESULT($ac_cv_click_element_header_path)

	if test "$ac_cv_click_element_header_path" = "found"; then
		HAVE_CLICK=yes
	fi

	if test "$HAVE_CLICK" = yes; then
		AC_CACHE_CHECK([whether click/element.hh works],
			[ac_cv_working_click_element_h], [
			AC_PREPROC_IFELSE([AC_LANG_SOURCE([[#include <click/element.hh>]])],
				[ac_cv_working_click_element_h=yes],
				[ac_cv_working_click_element_h=no])])
		test "$ac_cv_working_click_element_h" != yes && HAVE_CLICK=
	fi

	CPPFLAGS="$saveflags"
	if test "$HAVE_CLICK" = yes; then
		AC_DEFINE([HAVE_CLICK], [1], [Define if you have the <click/element.hh> header file.])
	else
		AC_MSG_ERROR([
=========================================
Can't find Click and/or <click/element.hh>
=========================================]
)
	fi
	AC_SUBST(CLICK_INCLUDES)
])