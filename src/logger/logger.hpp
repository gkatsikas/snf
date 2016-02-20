//============================================================================
//        Name: logger.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: A custom, classful, lightweight logger
//============================================================================

#ifndef _LOGGER_HPP_
#define _LOGGER_HPP_

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
		FG_DEFAULT  = 39,
		BG_RED      = 41,
		BG_GREEN    = 42,
		BG_YELLOW   = 43,
		BG_BLUE     = 44,
		BG_DEFAULT  = 49
	};

	class Modifier {
		Code code;
		public:
			Modifier(Code pCode) : code(pCode) {}
			friend std::ostream&
			operator<<(std::ostream& os, const Modifier& mod) {
				return os << "\033[" << mod.code << "m";
			}
	};
}

// Colors for the logger classes
static Color::Modifier def  (Color::FG_DEFAULT);
static Color::Modifier info (Color::FG_GREEN);
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
				std::cout << "[" + get_current_date_time() + "]  [" + logger_source_file() + "] >> " << oss.str() << std::endl;
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
				strftime(time_buffer, sizeof(time_buffer), "%Y-%m-%d.%X", &tstruct);
				return time_buffer;
			}

			/*
			 * Return the current time and file for customizing printouts.
			 */
			inline const std::string logger_source_file() {
				std::string token;
				boost::char_separator<char> sep("./");
				boost::tokenizer< boost::char_separator<char> > tokens(this->filename, sep);
				BOOST_FOREACH (const std::string& t, tokens) {
					if ( !t.empty() ) {
						token = t;
						break;
					}
				}
				std::ostringstream tt;
				tt << std::right << std::setw(25) << token;
				return tt.str();
			}
};

template <typename T> Logger& Logger::operator<<(T a) {
	oss << a;
	return *this;
}

#endif
