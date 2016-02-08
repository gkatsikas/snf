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
		explicit Chameleon(int);
		explicit Chameleon(unsigned short);
		explicit Chameleon(bool);
		explicit Chameleon(double);
		explicit Chameleon(const std::string&);
		explicit Chameleon(const char*);

		Chameleon(const Chameleon&);
		Chameleon& operator=(Chameleon const&);

		Chameleon& operator=(int);
		Chameleon& operator=(unsigned short);
		Chameleon& operator=(bool);
		Chameleon& operator=(double);
		Chameleon& operator=(std::string const&);

	public:
		operator int           () const;
		operator unsigned short() const;
		operator bool          () const;
		operator double        () const;
		operator std::string   () const;
};

#endif
