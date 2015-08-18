//============================================================================
// Name        : chameleon.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class that covers several types of property values
//============================================================================

#include <string>
#include <sstream>
#include <cstdlib>

#include "chameleon.hpp"

Chameleon::Chameleon(std::string const& value) {
	value_ = value;
}

Chameleon::Chameleon(const char* c) {
	value_ = c;
}

Chameleon::Chameleon(double d) {
	std::stringstream s;
	s << d;
	value_ = s.str();
}

Chameleon::Chameleon(Chameleon const& other) {
	value_ = other.value_;
}

Chameleon& Chameleon::operator=(Chameleon const& other) {
	value_ = other.value_;
	return *this;
}

Chameleon& Chameleon::operator=(double i) {
	std::stringstream s;
	s << i;
	value_ = s.str();
	return *this;
}

Chameleon& Chameleon::operator=(std::string const& s) {
	value_ = s;
	return *this;
}

Chameleon::operator std::string() const {
	return value_;
}

Chameleon::operator double() const {
	return atof(value_.c_str());
}
