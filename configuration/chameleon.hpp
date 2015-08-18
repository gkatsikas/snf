//============================================================================
// Name        : chameleon.hpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class that covers several types of property values
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
		explicit Chameleon(const std::string&);
		explicit Chameleon(double);
		explicit Chameleon(const char*);

		Chameleon(const Chameleon&);
		Chameleon& operator=(Chameleon const&);

		Chameleon& operator=(double);
		Chameleon& operator=(std::string const&);

	public:
		operator std::string() const;
		operator double     () const;
};

#endif
