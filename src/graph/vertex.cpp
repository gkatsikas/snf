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
	debug_chatter(this->log, "\tVertex destroyed");
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
	info_chatter(this->log, "===     NF Name: " << this->name);
	info_chatter(this->log, "=== NF Position: " << this->position);
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
		this->source_code_path = cv.source_code_path;
		this->entry_interfaces = cv.entry_interfaces;
		this->chain_interfaces = cv.chain_interfaces;
	}
	return *this;
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

bool
ChainVertex::has_entry_interface(const std::string &iface) const {
	if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
		return false;
	return true;
}

bool
ChainVertex::has_chain_interface(const std::string &iface) const {
	if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
		return false;
	return true;
}

void
ChainVertex::add_entry_interface_key(const std::string &iface) {
	if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
		this->entry_interfaces.insert({iface, {"", ""}});
	return;
}

void
ChainVertex::add_entry_interface_pair(const std::string &iface, const std::string &mac, const std::string &domain) {
	if ( iface.empty() ) {
		error_chatter(this->log, "Key (Interface) given is empty");
		return;
	}
	this->entry_interfaces[iface] = {mac, domain};
}

void
ChainVertex::add_chain_interface_key(const std::string &iface) {
	if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
		this->chain_interfaces.insert({iface, {"", ""}});
	return;
}

void
ChainVertex::add_chain_interface_pair(const std::string &iface, const std::string &mac, const std::string &nf) {
	if ( iface.empty() ) {
		error_chatter(this->log, "Key (Interface) given is empty");
		return;
	}
	this->chain_interfaces[iface] = {mac, nf};
}

std::string
ChainVertex::get_mac_from_entry_interface(const std::string &iface) const {
	// If it does not exist
	if ( !this->has_entry_interface(iface) )
		return std::string("");
	// Otherwise, return its first value
	// |-> MAC address of this interface
	return this->entry_interfaces.at(iface).first;
}

std::string
ChainVertex::get_domain_from_entry_interface(const std::string &iface) const {
	// If it does not exist
	if ( !this->has_entry_interface(iface) )
		return std::string("");
	// Otherwise, return its second value
	// |-> Domain where this interface is connected to
	return this->entry_interfaces.at(iface).second;
}

std::string
ChainVertex::get_iface_from_entry_domain(const std::string &domain) const {
	for ( auto &kv : this->entry_interfaces )
	// Find the interface of the given Domain
		if ( kv.second.second == domain )
			return kv.first;
	return std::string();
}

std::string
ChainVertex::get_mac_from_chain_interface(const std::string &iface) const {
	// If it does not exist
	if ( !this->has_chain_interface(iface) )
		return std::string("");
	// Otherwise, return its first value
	// |-> MAC address of this interface
	return this->chain_interfaces.at(iface).first;
}

std::string
ChainVertex::get_nf_from_chain_interface(const std::string &iface) const {
	// If it does not exist
	if ( !this->has_chain_interface(iface) )
		return std::string("");
	// Otherwise, return its second value
	// |-> NF where this interface is connected to
	return this->chain_interfaces.at(iface).second;
}

std::string
ChainVertex::get_iface_from_chain_nf(const std::string &nf) const {
	for ( auto &kv : this->chain_interfaces )
		// Find the interface of the given NF
		if ( kv.second.second == nf )
			return kv.first;
	return std::string();
}

std::string
ChainVertex::get_source_code_path(void) const {
	return this->source_code_path;
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
		info_chatter(this->log, "\t" << this->get_name() << "-> [Interface: " << kv.first <<
					", [MAC: " << kv.second.first << ", Domain: " << kv.second.second << "] ]");
	}
	#endif
}

void
ChainVertex::print_chain_interface_map(void) {
	#ifdef VERBOSE_MODE
	for ( auto &kv : this->chain_interfaces ) {
		info_chatter(this->log, "\t" << this->get_name() << "-> [Interface: " << kv.first << 
					", [MAC: " << kv.second.first << ", NF: " << kv.second.second << "] ]");
	}
	#endif
}
