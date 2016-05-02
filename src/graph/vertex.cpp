// -*- c-basic-offset: 4 -*-
/* vertex.cpp
 * 
 * Implements a digraph's vertex.
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

#include "vertex.hpp"

////////////////////////////////////////////////////////////////////////
// Vertex
////////////////////////////////////////////////////////////////////////
Vertex::Vertex(const std::string &name, const unsigned short &pos, const VertexType &t) :
				name(std::move(name)), position(pos), type(t) {
	this->log.set_logger_file(__FILE__);
	assert (this->position <= MAX_POSITION_IN_DAG);
	debug_chatter(this->log, "\tVertex constructed");
}

Vertex::~Vertex() {
	debug_chatter(this->log, "\tVertex deleted");
}

Vertex::Vertex(const Vertex &v) : 
	name(v.get_name()), position(v.get_position()), type(v.get_type()) {
}

Vertex& Vertex::operator=(Vertex &v) {
	if ( this != &v ) {
		this->name     = v.name;
		this->position = v.position;
		this->type     = v.type;
	}
	return *this;
}

void
Vertex::print_info(void) {
	info_chatter(this->log, "===       NF Name: " << this->name);
	info_chatter(this->log, "===   NF Position: " << this->position);
}

////////////////////////////////////////////////////////////////////////
// ChainVertex
////////////////////////////////////////////////////////////////////////
ChainVertex::ChainVertex(const ChainVertex &cv) : 
	Vertex(cv), source_code_path(cv.source_code_path),
	entry_interfaces(cv.entry_interfaces), chain_interfaces(cv.chain_interfaces) {
}

ChainVertex& ChainVertex::operator=(ChainVertex &cv) {
	if ( this != &cv ) {
		Vertex::operator=(cv);
		this->source_code_path  = cv.source_code_path;
		this->entry_interfaces  = cv.entry_interfaces;
		this->chain_interfaces  = cv.chain_interfaces;
	}
	return *this;
}

bool
ChainVertex::has_entry_interface(const std::string &iface) const {
	for (auto &it : this->entry_interfaces) {
		if ( it.first.first == iface ) {
			return true;
		}
	}
	return false;
}

bool
ChainVertex::has_chain_interface(const std::string &iface) const {
	for (auto &it : this->chain_interfaces) {
		if ( it.first.first == iface ) {
			return true;
		}
	}
	return false;
}

void
ChainVertex::add_entry_interface_key(const std::string &iface, std::string mac) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot add empty entry interface");
		return;
	}
	std::pair<std::string, std::string> key = std::make_pair(iface, mac);

	if ( this->entry_interfaces.find(key) == this->entry_interfaces.end() )
		this->entry_interfaces.insert({key, ""});
	return;
}

void
ChainVertex::add_entry_interface_pair(const std::string &iface, const std::string &mac, const std::string &domain) {
	if ( (iface.empty()) || (domain.empty()) ) {
		error_chatter(this->log, "\tMissing field(s) while adding entry interface");
		return;
	}
	this->entry_interfaces.insert({{iface, mac}, domain});
}

void
ChainVertex::add_chain_interface_key(const std::string &iface, std::string mac) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot add empty chain interface");
		return;
	}
	std::pair<std::string, std::string> key = std::make_pair(iface, mac);

	if ( this->chain_interfaces.find(key) == this->chain_interfaces.end() )
		this->chain_interfaces.insert({key, {"", ""}});
	return;
}

void
ChainVertex::add_chain_interface_pair(
		const std::string &iface,   const std::string &mac,
		const std::string &next_nf, const std::string &next_iface) {

	if ( (iface.empty()) || (next_nf.empty()) || (next_iface.empty()) ) {
		error_chatter(this->log, "\tMissing field(s) while adding chain interface");
		return;
	}
	std::pair<std::string, std::string> key = std::make_pair(iface, mac);

	this->chain_interfaces[key] = {next_nf, next_iface};
}

std::string
ChainVertex::get_mac_from_entry_interface(const std::string &iface) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot retrieve MAC address from empty entry interface");
		return "";
	}

	for (auto &it : this->entry_interfaces) {
		if ( it.first.first == iface ) {
			return it.first.second;
		}
	}
	return "";
}

std::string
ChainVertex::get_domain_from_entry_interface(const std::string &iface) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot retrieve entry domain from empty entry interface");
		return "";
	}

	for (auto &it : this->entry_interfaces) {
		if ( it.first.first == iface ) {
			return it.second;
		}
	}
	return "";
}

std::string
ChainVertex::get_iface_from_entry_domain(const std::string &domain) {
	if ( domain.empty() ) {
		error_chatter(this->log, "\tCannot retrieve entry interface from empty entry domain");
		return "";
	}

	for (auto &it : this->entry_interfaces) {
		if ( it.second == domain ) {
			return it.first.first;
		}
	}
	return "";
}

std::string
ChainVertex::get_mac_from_chain_interface(const std::string &iface) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot retrieve MAC address from empty chain interface");
		return "";
	}

	for (auto &it : this->chain_interfaces) {
		if ( it.first.first == iface ) {
			return it.first.second;
		}
	}
	return "";
}

std::string
ChainVertex::get_next_nf_from_chain_interface(const std::string &iface) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot retrieve next NF from empty chain interface");
		return "";
	}

	for (auto &it : this->chain_interfaces) {
		if ( it.first.first == iface ) {
			return it.second.first;
		}
	}
	return "";
}

std::string
ChainVertex::get_next_iface_from_chain_interface(const std::string &iface) {
	if ( iface.empty() ) {
		error_chatter(this->log, "\tCannot retrieve next NF's interface from empty chain interface");
		return "";
	}

	for (auto &it : this->chain_interfaces) {
		if ( it.first.first == iface ) {
			return it.second.second;
		}
	}
	return "";
}

std::string
ChainVertex::get_chain_iface_from_nf(const std::string &nf) {
	if ( nf.empty() ) {
		error_chatter(this->log, "\tCannot retrieve chain interface from empty NF");
		return "";
	}

	for (auto &it : this->chain_interfaces) {
		if ( it.second.first == nf ) {
			return it.first.first;
		}
	}
	return "";
}

std::string
ChainVertex::get_source_code_path(void) const {
	return this->source_code_path;
}

unsigned short
ChainVertex::get_interfaces_no(void) const {
	return ( this->entry_interfaces.size() + this->chain_interfaces.size() );
}

unsigned short
ChainVertex::get_entry_interfaces_no(void) const {
	return this->entry_interfaces.size();
}

unsigned short
ChainVertex::get_chain_interfaces_no(void) const {
	return this->chain_interfaces.size();
}

/*
 * Debugging
 */
void
ChainVertex::print_info(void) {
	info_chatter(this->log, "===============================================");
	Vertex::print_info();
	info_chatter(this->log, "=== Source Code: " << this->source_code_path);
	info_chatter(this->log, "===============================================");
}

void
ChainVertex::print_entry_interface_map(void) {
	#ifdef VERBOSE_MODE

	for ( auto &kv : this->entry_interfaces ) {
		std::string  iface = kv.first.first;
		std::string    mac = (kv.first.second.empty()) ? "-" : kv.first.second;
		std::string domain = kv.second;
		info_chatter(this->log, "\t" 	<< this->get_name() 
										<< "-> [Interface: " << iface << ", MAC: " << mac 
										<< "] [Domain: " << domain << "]");
	}
	if ( this->entry_interfaces.size() == 0 ) {
		debug_chatter(this->log, "\tEmpty");
	}

	#endif
}

void
ChainVertex::print_chain_interface_map(void) {
	#ifdef VERBOSE_MODE

	for ( auto &kv : this->chain_interfaces ) {
		std::string iface      = kv.first.first;
		std::string mac        = (kv.first.second.empty()) ? "-" : kv.first.second;
		std::string next_nf    = kv.second.first;
		std::string next_iface = kv.second.second;

		info_chatter(this->log, "\t" 	<< this->get_name() 
										<< "-> [Interface: " << iface << ", MAC: " << mac 
										<< "] [Next: " << next_nf << ", Interface: " << next_iface
										<< "]");
	}
	if ( this->chain_interfaces.size() == 0 ) {
		debug_chatter(this->log, "\tEmpty");
	}

	#endif
}