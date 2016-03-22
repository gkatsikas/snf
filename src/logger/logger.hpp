//============================================================================
//        Name: logger.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: A custom, classful, lightweight logger
//============================================================================

#ifndef _LOGGER_HPP_
#define _LOGGER_HPP_

#ifdef HAVE_CONFIG_H
#include "../../config.h"
#endif

#include <sstream>
#include <iomanip>
#include <iostream>
#include <boost/foreach.hpp>
#include <boost/tokenizer.hpp>

// Colors for the logger classes
namespace Color {
	enum Code {
		FG_RED      = 31,
		FG_GREEN    = 32,
		FG_YELLOW   = 33,
		FG_BLUE     = 34,
		FG_PURPLE   = 35,
		FG_CYAN     = 36,
		FG_WHITE    = 38,
		FG_DEFAULT  = 39,
		BG_RED      = 41,
		BG_GREEN    = 42,
		BG_YELLOW   = 43,
		BG_BLUE     = 44,
		BG_PURPLE   = 45,
		BG_CYAN     = 49,
		BG_WHITE    = 49,
		BG_DEFAULT  = 49
	};

	class Modifier {
		Code code;

		class NullBuffer : public std::streambuf {
			public:
				/*
				 * overflow is the function called when the buffer has to output data 
				 * to the actual destination of the stream.
				 * The NullBuffer class above does nothing when overflow is called so 
				 * any stream using it will not produce any output.
				 */
				int overflow(int c) { return c; }
		};

		/*
		 * Overlay class to shorty create a NullBuffer.
		 * Usen in DEBUG_MODE to disable the logger.
		 */
		class NullStream : public std::ostream {
			private:
				NullBuffer m_sb;
			public: 
				NullStream() : std::ostream(&m_sb) {}
		};

		public:
			Modifier(Code pCode) : code(pCode) {}
			friend std::ostream&
			operator<<(std::ostream& os, const Modifier& mod) {
				// Print all levels in debug mode
				#ifdef DEBUG_MODE
					return os << "\033[" << mod.code << "m";
				// Omit the DEBUG level
				#else
					if ( mod.code != Color::FG_BLUE )
						return os << "\033[" << mod.code << "m";
					NullStream null_stream;
					return null_stream << os;
				#endif
			}
	};
}

// Colors for the logger classes
static Color::Modifier def  (Color::FG_DEFAULT);
static Color::Modifier info (Color::FG_GREEN);
static Color::Modifier note (Color::FG_CYAN);
static Color::Modifier debug(Color::FG_BLUE);
static Color::Modifier warn (Color::FG_YELLOW);
static Color::Modifier error(Color::FG_RED);

class Logger {
	private:
			std::string filename;
			std::ostringstream oss;

	public:
			Logger() {};
			Logger(std::string f) : filename(f) {};
			template <typename T>
			Logger& operator<< (T a);

			/*
			 * Overload this operator to act as cout
			 */
			Logger& operator<<( std::ostream&(*f)(std::ostream&) ) {
				(void)*f;
				std::cout << "[" + get_current_date_time() + "] [" + logger_source_file() + "] " << oss.str() << std::endl;
				oss.str("");
				return *this;
			}

			/*
			 * Set the source filename to be logged
			 */
			inline void set_logger_file(std::string f) {
				this->filename = f;
			}

			/*
			 * Get current date/time, format is YYYY-MM-DD.HH:mm:ss
			 */
			inline const std::string get_current_date_time() {
				char time_buffer[80];
				struct tm tstruct;
				memset(time_buffer, 0, 80*sizeof(char));
				time_t now = time(0);
				tstruct = *localtime(&now);
				strftime(time_buffer, sizeof(time_buffer), "%y-%m-%d.%X", &tstruct);
				return time_buffer;
			}

			/*
			 * Return the current time and file for customizing printouts.
			 */
			inline const std::string logger_source_file() {
				std::string token;
				boost::char_separator<char> sep("/");
				boost::tokenizer< boost::char_separator<char> > tokens(this->filename, sep);
				BOOST_FOREACH (const std::string& t, tokens) {
					if ( !t.empty() ) {
						token = t;
						break;
					}
				}
				std::ostringstream tt;
				tt << std::right << std::setw(30) << token;
				return tt.str();
			}
};

template <typename T> Logger& Logger::operator<<(T a) {
	oss << a;
	return *this;
}

#endif
