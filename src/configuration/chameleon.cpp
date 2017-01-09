// -*- c-basic-offset: 4 -*-
/* chameleon.cpp
 *
 * Implementation of methods that read input properties of various types.
 *
 * Copyright (c) 2015-2016  KTH Royal Institute of Technology
 * Copyright (c) 2015-today Georgios Katsikas, Marcel Enguehard
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>
 */

#include "chameleon.hpp"
#include "../shared/helpers.hpp"

Chameleon::Chameleon(const int &i)             : value_(std::to_string(i)) {}

Chameleon::Chameleon(const unsigned short &u)  : value_(std::to_string(u)) {}

Chameleon::Chameleon(const bool &b)            : value_(std::to_string(b)) {}

Chameleon::Chameleon(const double &d)          : value_(std::to_string(d)) {}

Chameleon::Chameleon(const char *c)            : value_(c){}

Chameleon::Chameleon(std::string const &value) : value_(value) {}

Chameleon::Chameleon(Chameleon const &other)   : value_(other.value_) {}

Chameleon&
Chameleon::operator=(const int &i)
{
	value_ = std::to_string(i);
	return *this;
}

Chameleon&
Chameleon::operator=(const unsigned short &u)
{
	value_ = std::to_string(u);
	return *this;
}

Chameleon&
Chameleon::operator=(const bool &b)
{
	value_ = std::to_string(b);
	return *this;
}

Chameleon&
Chameleon::operator=(const double &d)
{
	value_ = std::to_string(d);
	return *this;
}

Chameleon&
Chameleon::operator=(const std::string &s)
{
	value_ = s;
	return *this;
}

Chameleon&
Chameleon::operator=(Chameleon const &other)
{
	value_ = other.value_;
	return *this;
}

Chameleon::operator int() const
{
	return atoi(value_.c_str());
}

Chameleon::operator unsigned short() const
{
	return static_cast<unsigned short> ( atoi(value_.c_str()) );
}

Chameleon::operator bool() const
{
	return str_to_bool(value_);
}

Chameleon::operator double() const
{
	return atof(value_.c_str());
}

Chameleon::operator std::string() const
{
	return value_;
}
