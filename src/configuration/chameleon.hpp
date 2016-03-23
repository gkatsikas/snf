#ifndef _CHAMELEON_HPP_
#define _CHAMELEON_HPP_

/*
 * chameleon.hpp
 * 
 * Class that covers several types of input properties' primitives
 *
 * Copyright (c) 2015-2016 KTH Royal Institute of Technology
 * Copyright (c) 2015-2016 Georgios Katsikas, Marcel Enguehard
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
