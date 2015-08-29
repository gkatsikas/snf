//============================================================================
//        Name: vertex.cpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: Implements a digraph's vertex.
//============================================================================

#include "vertex.hpp"

////////////////////////////////////////////////////////////////////////
// Vertex
////////////////////////////////////////////////////////////////////////
Vertex::Vertex(std::string name, unsigned short pos, VertexType t) :
	name(std::move(name)), position(pos), type(t) {
	this->log.set_logger_file(__FILE__);
	//log << info << "\tVertex constructed" << def << std::endl;
}

Vertex::~Vertex() {
	//log << info << "\tVertex destroyed" << def << std::endl;
}

Vertex::Vertex(const Vertex& v) {
	this->name     = v.get_name();
	this->position = v.get_position();
	this->type     = v.get_type();
}

Vertex& Vertex::operator=(Vertex& v) {
	if ( this != &v ) {
		this->name     = v.name;
		this->position = v.position;
		this->type     = v.type;
	}
	return *this;
}

void Vertex::print_info(void) {
	log << info << "===     NF Name: " << this->name     << def << std::endl;
	log << info << "=== NF Position: " << this->position << def << std::endl;
}

////////////////////////////////////////////////////////////////////////
// ChainVertex
////////////////////////////////////////////////////////////////////////
ChainVertex::ChainVertex(const ChainVertex& cv) : Vertex(cv) {
	this->source_code_path = cv.source_code_path;
	this->entry_interfaces = cv.entry_interfaces;
	this->chain_interfaces = cv.chain_interfaces;
}

ChainVertex& ChainVertex::operator=(ChainVertex& cv) {
	if ( this != &cv ) {
		Vertex::operator=(cv);
		this->source_code_path = cv.source_code_path;
		this->entry_interfaces = cv.entry_interfaces;
		this->chain_interfaces = cv.chain_interfaces;
	}
	return *this;
}

unsigned short ChainVertex::get_interfaces_no() {
	return ( this->entry_interfaces.size() + this->chain_interfaces.size() );
}

unsigned short ChainVertex::get_entry_interfaces_no() {
	return this->entry_interfaces.size();
}

unsigned short ChainVertex::get_chain_interfaces_no() {
	return this->chain_interfaces.size();
}

bool ChainVertex::has_entry_interface(std::string iface) {
	if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
		return false;
	return true;
}

bool ChainVertex::has_chain_interface(std::string iface) {
	if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
		return false;
	return true;
}

void ChainVertex::add_entry_interface_key(std::string iface) {
	if ( this->entry_interfaces.find(iface) == this->entry_interfaces.end() )
		this->entry_interfaces.insert({iface, {"", ""}});
	return;
}

void ChainVertex::add_entry_interface_pair(std::string iface, std::string mac, std::string domain) {
	if ( iface.empty() ) {
		log << error << "Key (Interface) given is empty" << def << std::endl;
		return;
	}
	this->entry_interfaces[iface] = {mac, domain};
}

void ChainVertex::add_chain_interface_key(std::string iface) {
	if ( this->chain_interfaces.find(iface) == this->chain_interfaces.end() )
		this->chain_interfaces.insert({iface, {"", ""}});
	return;
}

void ChainVertex::add_chain_interface_pair(std::string iface, std::string mac, std::string nf) {
	if ( iface.empty() ) {
		log << error << "Key (Interface) given is empty" << def << std::endl;
		return;
	}
	this->chain_interfaces[iface] = {mac, nf};
}

std::string ChainVertex::get_mac_from_entry_interface(std::string iface) {
	// If it does not exist
	if ( !this->has_entry_interface(iface) )
		return std::string("");
	// Otherwise, return its first value
	// |-> MAC address of this interface
	return this->entry_interfaces.at(iface).first;
}

std::string ChainVertex::get_domain_from_entry_interface(std::string iface) {
	// If it does not exist
	if ( !this->has_entry_interface(iface) )
		return std::string("");
	// Otherwise, return its second value
	// |-> Domain where this interface is connected to
	return this->entry_interfaces.at(iface).second;
}

std::string ChainVertex::get_iface_from_entry_domain(std::string domain) {
	for ( auto& kv : this->entry_interfaces )
	// Find the interface of the given Domain
		if ( kv.second.second == domain )
			return kv.first;
	return std::string();
}

std::string ChainVertex::get_mac_from_chain_interface(std::string iface) {
	// If it does not exist
	if ( !this->has_chain_interface(iface) )
		return std::string("");
	// Otherwise, return its first value
	// |-> MAC address of this interface
	return this->chain_interfaces.at(iface).first;
}

std::string ChainVertex::get_nf_from_chain_interface(std::string iface) {
	// If it does not exist
	if ( !this->has_chain_interface(iface) )
		return std::string("");
	// Otherwise, return its second value
	// |-> NF where this interface is connected to
	return this->chain_interfaces.at(iface).second;
}

std::string ChainVertex::get_iface_from_chain_nf(std::string nf) {
	for ( auto& kv : this->chain_interfaces )
		// Find the interface of the given NF
		if ( kv.second.second == nf )
			return kv.first;
	return std::string();
}

std::string ChainVertex::get_source_code_path(void) const {
	return this->source_code_path;
}

/*
 * Debugging
 */
void ChainVertex::print_info(void) {
	log << info << "===============================================" << def << std::endl;
	Vertex::print_info();
	log << info << "=== Source Code: " << this->source_code_path     << def << std::endl;
	log << info << "===============================================" << def << std::endl;
}

void ChainVertex::print_entry_interface_map(void) {
	for ( auto& kv : this->entry_interfaces )
		log << info << "\t" << this->get_name() << "-> [Interface: " << kv.first << ", [MAC: " << kv.second.first << ", Domain: " << kv.second.second << "] ]" << def << std::endl;
}

void ChainVertex::print_chain_interface_map(void) {
	for ( auto& kv : this->chain_interfaces )
		log << info << "\t" << this->get_name() << "-> [Interface: " << kv.first << ", [MAC: " << kv.second.first << ", NF: " << kv.second.second << "] ]" << def << std::endl;
}
