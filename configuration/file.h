//============================================================================
// Name        : file.h
// Copyright   : KTH ICT CoS Network Systems Lab
// Description : Template implementation to handle different file types
//============================================================================

#include <sys/stat.h>
#include "../helpers.hpp"

/*
 * Constructors
 */
template <typename T>
FileT<T>::FileT()
{
	this->log.set_logger_file(__FILE__);
	this->handler = NULL;
	log << info << "\tFile constructed" << def << std::endl;
}

template <typename T>
FileT<T>::FileT (std::string& f) : filename(f)
{
	this->log.set_logger_file(__FILE__);

	if ( !this->exists() )
		exit(FILE_DOES_NOT_EXIST);

	this->handler = NULL;
	log << info << "\tFile constructed" << def << std::endl;
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

	log << info << "\tFile destructed" << def << std::endl;
}

template <typename T>
bool FileT<T>::exists(void)
{
	struct stat buffer;

	// Check if files exist
	if( stat (this->filename.c_str(), &buffer) != 0 )
	{
		log << error << "\tFile: " + this->filename +  " does not exist" << def << std::endl;
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
		log << error << "\t\tCannot create file: " + this->filename << def << std::endl;
		return CANNOT_CREATE_FILE;
	}
	close(fdIn);

	return SUCCESS;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// OPEN /////////////////////////////////
/*
 * Open a file to read (Classic C way using file descriptors)
 */
template <typename T>
short int FileT<T>::open_file(void)
{
	short int fdIn = 0;
	if ( (fdIn=open(this->filename.c_str(), O_RDONLY, 0755)) < 0 )
	{
		log << error << "\t\t Couldn't open file: " + this->filename << def << std::endl;
		return CANNOT_OPEN_FILE;
	}

	return fdIn;
}

/*
 * Open a text file to read (C++ way using streams)
 */
template <> template <> inline
std::ifstream* FileT<std::ifstream>::open_file(void)
{
	this->handler = new std::ifstream();
	this->handler->open(this->filename.c_str());
	return this->handler;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// CLOSE ////////////////////////////////
/*
 * Close text file
 */
template <> inline
void FileT<std::ifstream>::close_file(void)
{
	this->handler->close();
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// READ /////////////////////////////////
/*
 * Read a packet from .pcap file
 */
/*template <> inline
u_char* FileT<std::ifstream>::read_file(struct pcap_pkthdr* header)
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

/*template <typename T>
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
*/
