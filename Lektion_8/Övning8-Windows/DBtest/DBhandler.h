/*
	File: DBhandler.cpp
	Definition of class DBhandler

	Purpose: The class act as a very simple wrapper of C/C++ functions 
	used to access a Postgresql database.

	Date: Örjan Sterner April 2016
*/



#ifndef DBHANDLER_H
#define DBHANDLER_H
#include <string>
#include "libpq-fe.h"  // Postgresql C/C++ interface
using std::string;

class DBhandler {
public:
	DBhandler(string connectInfo);  // 
	~DBhandler();
	
	
	/*
	*  bool connectDB()
	*  Establishes a connection to the database
	*  Param connInfoStr: string with data for connection and login
	*  Returns: true upon success, otherwise false
	*/
	bool connectDB();

	/*
	*  void closeDBconn()
	*  Closes the connection to the database
	*  Returns: -
	*/
	void closeDBconn();  // Close connection


	/*
	 *  bool beginTransaction()
	 *  Starts a transaction block
	 *  Returns: true upon success, otherwise false
	 */
	bool beginTransaction();  // Start a transaction block



	/*
	 *  bool endTransaction()
	 *  Ends a transaction block
	 *  Returns: true upon success, otherwise false
	 */
	bool endTransaction();


	/*
	*  PGresult* makeQuery(const char* query);
	*  Makes a sql query
	*  Param:  the query as a null-terminated C-string 
	*  Returns: upon success a pointer to a PGresult struct is returned,
	*			otherwise a nullptr is returned.
	*/
	PGresult* makeQuery(const char* query);

private:
	string connInfoStr;  // Connection info provided to the constructor
	PGconn *dbConnection{ nullptr }; // the connection pointer
};

#endif