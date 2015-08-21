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
FileT<T>::FileT() {
	this->log.set_logger_file(__FILE__);
	this->handler = NULL;
	log << info << "\tFile handler for " << this->filename << " constructed" << def << std::endl;
}

template <typename T>
FileT<T>::FileT (std::string& f) : filename(f) {
	this->log.set_logger_file(__FILE__);

	if ( !this->exists() )
		exit(FILE_DOES_NOT_EXIST);

	if ( !this->has_valid_extension("click") ) {
		log << error << "File " << this->filename << " has invalid extension" << def << std::endl;
		exit(INVALID_FILE_TYPE);
	}

	this->handler = NULL;
	log << info << "\tFile handler for " << this->filename << " constructed" << def << std::endl;
}

/*
 * Assignment operator
 */
template<typename T>
template<typename U>
FileT<T>& FileT<T>::operator =( const FileT<U>& ft ) {
	// Avoid self assignment
	if ( *this != ft) {
		this->filename = static_cast<T>(ft.filename);
		this->handler  = static_cast<T>(ft.handler);
	}

	return *this;
}

/*
 * Destructor
 */
template <typename T>
FileT<T>::~FileT() {
	if ( this->handler != NULL )
		delete this->handler;
	this->handler = NULL;
	log << info << "\tFile handler for " << this->filename << " destroyed" << def << std::endl;
}

template <typename T>
bool FileT<T>::exists(void) {
	struct stat buffer;

	// Check if files exist
	if( stat (this->filename.c_str(), &buffer) != 0 ) {
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
short int FileT<T>::create_file(void) {
	short int fdIn = 0;
	if ( (fdIn=open(this->filename.c_str(), O_WRONLY|O_CREAT, 0755)) < 0 ) {
		log << error << "\tCannot create file: " + this->filename << def << std::endl;
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
short FileT<T>::open_file(void) {
	short fdIn = 0;
	if ( (fdIn=open(this->filename.c_str(), O_RDONLY, 0755)) < 0 ) {
		log << error << "\t Couldn't open file: " + this->filename << def << std::endl;
		return CANNOT_OPEN_FILE;
	}

	log << warn << "\tFile " << this->filename << " is open" << def << std::endl;

	return fdIn;
}

/*
 * Open a text file to read (C++ way using streams)
 */
template <> template <> inline
std::ifstream* FileT<std::ifstream>::open_file(void) {
	this->handler = new std::ifstream();
	this->handler->open(this->filename.c_str());
	log << warn << "\tFile " << this->filename << " is open" << def << std::endl;
	return this->handler;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// CLOSE ////////////////////////////////
/*
 * Close text file
 */
template <> inline
void FileT<std::ifstream>::close_file(void) {
	this->handler->close();
	log << warn << "\tFile " << this->filename << " is closed" << def << std::endl;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// READ /////////////////////////////////
/*
 * Read data from file
 */
template <> inline
std::string& FileT<std::ifstream>::read_file(std::string* data) {
	return *data;
}

////////////////////////////////////////////////////////////////////////

///////////////////////////////// WRITE ////////////////////////////////
/*
 * Dump data into a text file
 */
template <> inline
void FileT<std::ofstream>::dump_to_file(std::string data) {
	*this->handler << data;
}
////////////////////////////////////////////////////////////////////////

///////////////////////////////// REMOVE ///////////////////////////////
template <typename T>
bool FileT<T>::is_empty(void) {
	FILE* pFile = fopen(this->filename.c_str(), "r");
	if (pFile == NULL ) {
		log << error << "\tError while reading file " << this->filename << def << std::endl;
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
void FileT<T>::delete_file(void) {
	remove( this->filename.c_str() );
}
////////////////////////////////////////////////////////////////////////

/*
 * Test the suffix of a filename
 */
template <typename T>
bool FileT<T>::has_valid_extension(std::string suffix) {
	std::string::size_type index;
	index = this->filename.std::string::rfind('.');

	// Has extension
	if ( index != std::string::npos ) {
		std::string extension = this->filename.std::string::substr(index+1);
		if ( extension == suffix )
			return true;
		else
			return false;
	}
	return false;
}
