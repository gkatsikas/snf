//============================================================================
//        Name: chameleon.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Class that covers several types of primitives
//============================================================================

#ifndef _CHAMELEON_HPP_
#define _CHAMELEON_HPP_

#include <string>

class Chameleon
{
	private:
		std::string value_;

	public:
		Chameleon() {};
		explicit Chameleon(const int            &i);
		explicit Chameleon(const unsigned short &u);
		explicit Chameleon(const bool           &b);
		explicit Chameleon(const double         &d);
		explicit Chameleon(const std::string    &s);
		explicit Chameleon(const char*           c);

		Chameleon(const Chameleon &other);
		Chameleon& operator=(Chameleon const  &other);
		Chameleon& operator=(const int            &i);
		Chameleon& operator=(const unsigned short &u);
		Chameleon& operator=(const bool           &b);
		Chameleon& operator=(const double         &d);
		Chameleon& operator=(const std::string    &s);

	public:
		operator int           () const;
		operator unsigned short() const;
		operator bool          () const;
		operator double        () const;
		operator std::string   () const;
};

#endif
