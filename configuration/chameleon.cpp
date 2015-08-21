//============================================================================
// Name        : chameleon.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Class that covers several types of property values
//============================================================================

#include "chameleon.hpp"

Chameleon::Chameleon(std::string const& value) : value_(value) {}

Chameleon::Chameleon(const char* c) : value_(c){}

Chameleon::Chameleon(double d) : value_(std::to_string(d)) {}

Chameleon::Chameleon(Chameleon const& other) : value_(other.value_) {}

Chameleon& Chameleon::operator=(Chameleon const& other) {
	value_ = other.value_;
	return *this;
}

Chameleon& Chameleon::operator=(double i) {
	value_ = std::to_string(i);
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
