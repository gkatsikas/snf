
//============================================================================
//        Name: file.hpp
//   Copyright: KTH ICT CoS Network Systems Lab
// Description: A template File API for handling different file types
//============================================================================

#ifndef _FILE_T_H_
#define _FILE_T_H_

#include <iomanip>
#include <fstream>
#include <iostream>
#include <cstring>

#include "logger.hpp"

template <class T>
class FileT
{
	private:
			/*
			 * Name of the file
			 */
			std::string filename;

			/*
			 * File Handler
			 */
			T* handler;

			/*
			 * Logger instance
			 */
			Logger log;

	public:
			FileT();
			FileT(std::string& f);
			template <typename U> FileT<T>& operator= (const FileT<U>& ft);
			~FileT();

			/*
			 * Accessors for file names
			 */
			inline std::string& get_file_name    (void) { return this->filename; };
			inline T*           get_file_handler (void) { return this->handler;  };

			 /*
			 * Mutators for file names
			 */
			inline void set_file_name(const std::string& f){ this->filename = f; };
			inline void set_file_handler(T* h){ this->handler  = h; };


			/* High level interface with specialized methods */
			short int               create_file(void);
			//template<typename F> F* open_file  (void);
			short int               open_file  (void);
			void                    close_file (void);

			bool      exists      (void);
			//u_char*   read_file   (struct pcap_pkthdr* header);
			void      dump_to_file(std::string& data);
			short int is_valid    (const char* suffix);
			short int is_valid    (const char* filename, const char* suffix);
			bool      is_empty    (void);
			void      delete_file (void);
};

#endif
