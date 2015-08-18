//============================================================================
// Name        : file.cpp
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Template implementation to handle different file types
//============================================================================

#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <sys/types.h>

#include "file.hpp"

/*
 * Constructors
 */
template <typename T>
FileT<T>::FileT()
{
	this->log.set_logger_file(__FILE__);
	this->handler = NULL;
	log << "\t File constructed" << std::endl;
}

template <typename T>
FileT<T>::FileT (std::string& f) : filename(f)
{
	this->log.set_logger_file(__FILE__);
	this->handler = NULL;
	log << "\t File constructed" << std::endl;
}

/*
 * Assignment operator
 */
template<typename T>
template<typename U>
FileT<T>& FileT<T>::operator =( const FileT<U>& ft )
{
	// Avoid self assignment
	if ( *this != ft)
	{
		this->filename = static_cast<T>(ft.filename);
		this->handler  = static_cast<T>(ft.handler);
	}

	return *this;
}

/*
 * Destructor
 */
template <typename T>
FileT<T>::~FileT()
{
	this->filename.clear();
	this->handler = NULL;

	log << "\t File destructed" << std::endl;
}

template <typename T>
bool FileT<T>::exists(void)
{
	struct stat buffer;

	// Check if files exist
	if( stat (this->filename.c_str(), &buffer) != 0 )
	{
		log << "\t\t File: " + this->filename +  " does not exist" << std::endl;
		return false;
	}

	return true;
}

//////////////////////////////// CREATE ////////////////////////////////
/*
 * Generic create method
 */
template <typename T>
short int FileT<T>::create_file(void)
{
	short int fdIn = 0;
	if ( (fdIn=open(this->filename.c_str(), O_WRONLY|O_CREAT, 0755)) < 0 )
	{
		log << "\t\t Cannot create file: " + this->filename << std::endl;
		return -1; //CANNOT_CREATE_FILE;
	}
	close(fdIn);

	return 0;//SUCCESS;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// OPEN /////////////////////////////////
/*
 * Open a .pcap file with read permissions
 */
//template <> template <> inline
template <typename T>
short int FileT<T>::open_file(void)
{
	short int fdIn = 0;
	if ( (fdIn=open(this->filename.c_str(), O_WRONLY, 0755)) < 0 )
	{
		log << "\t\t Couldn't open file: " + this->filename << std::endl;
		return -1;
	}

	return fdIn;
}

/*
 * Open a .pcap file with read permissions
 */
/*template <> template <> inline
pcap_t* FileT<pcap_dumper_t>::open_file(void)
{
	char errbuf[PCAP_ERRBUF_SIZE];
	pcap_t* handle = pcap_open_offline(this->filename.c_str(), errbuf);

	if ( handle == NULL)
	{
		log << "\t\t Couldn't open: " + this->filename << std::endl;
		return NULL;
	}

	return handle;
}*/

/*
 * Open a text file to write
 */
/*template <> template <> inline
std::ofstream* FileT<std::ofstream>::open_file(void)
{
	this->handler = new std::ofstream();
	this->handler->open(this->filename.c_str());
	return this->handler;
}*/
////////////////////////////////////////////////////////////////////////

///////////////////////////////// CLOSE ////////////////////////////////
/*
 * Close text file
 */
template <> inline
void FileT<std::ofstream>::close_file(void)
{
	this->handler->close();
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// READ /////////////////////////////////
/*
 * Read a packet from .pcap file
 */
/*template <> inline
u_char* FileT<pcap_t>::read_file(struct pcap_pkthdr* header)
{
	u_char* packet = (u_char*) pcap_next(this->handler, header);
	return packet;
}*/

////////////////////////////////////////////////////////////////////////

///////////////////////////////// WRITE ////////////////////////////////
/*
 * Dump data into a text file
 */
template <> inline
void FileT<std::ofstream>::dump_to_file(std::string& data)
{
	*this->handler << data;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// REMOVE ///////////////////////////////
template <typename T>
bool FileT<T>::is_empty(void)
{
	FILE* pFile = fopen(this->filename.c_str(), "r");
	if (pFile == NULL )
	{
		log << error << "Error while reading file " << this->filename << def << std::endl;
		exit(-1);
	}

	fseek (pFile, 0, SEEK_END);
	unsigned int size=ftell(pFile);
	fclose(pFile);

	if (size > 0)
		return false;
	return true;
}

template <typename T>
void FileT<T>::delete_file(void)
{
	remove( this->filename.c_str() );
}
////////////////////////////////////////////////////////////////////////

/*
 * Test the suffix of a filename
 */
template <typename T>
short int FileT<T>::is_valid(const char* suffix)
{
	if ( this->filename.empty() || !suffix)
		return 0;
	size_t lenstr    = this->filename.length();
	size_t lensuffix = strlen(suffix);
	if (lensuffix >  lenstr)
		return 0;
	return strncmp(this->filename.c_str() + lenstr - lensuffix, suffix, lensuffix) == 0;
}

template <typename T>
short int FileT<T>::is_valid(const char* filename, const char* suffix)
{
	if ( !filename || !suffix )
		return 0;
	size_t lenstr    = strlen(filename);
	size_t lensuffix = strlen(suffix);
	if (lensuffix >  lenstr)
		return 0;
	return strncmp(filename + lenstr - lensuffix, suffix, lensuffix) == 0;
}
