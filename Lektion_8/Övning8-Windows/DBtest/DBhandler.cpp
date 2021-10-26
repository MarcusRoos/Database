#include <iostream>
#include "DBhandler.h"
using std::cerr;
using std::endl;

DBhandler::DBhandler(string connectInfo)
	:connInfoStr(connectInfo)
{ }


DBhandler::~DBhandler() {
	if (dbConnection && PQstatus(dbConnection) == CONNECTION_OK) 
		PQfinish(dbConnection);
}

bool DBhandler::connectDB() {
	// Try to make a connection to the database
	dbConnection = PQconnectdb(connInfoStr.c_str());

	// Check to see that the backend connection was successfully made
	if (PQstatus(dbConnection) != CONNECTION_OK) {
		cerr << "Connection to database failed: "
		<< PQerrorMessage(dbConnection) << endl;
		return false;  // Failure
	}
	return true;
}

/* Close connection to database */
void DBhandler::closeDBconn() {
	PQfinish(dbConnection);
	dbConnection = nullptr;
}


bool DBhandler::beginTransaction() {  // Start a transaction block
	PGresult *res = PQexec(dbConnection, "BEGIN");
	bool status = (PQresultStatus(res) == PGRES_COMMAND_OK);
	PQclear(res);  // Deallocate dynamic memory
	return status;
		
	//cerr << "BEGIN command failed: " << PQerrorMessage(conn) << endl;
		
}

bool DBhandler::endTransaction() { // End a transaction block
	PGresult *res = PQexec(dbConnection, "END");
	bool status = (PQresultStatus(res) == PGRES_COMMAND_OK);
	PQclear(res);  // Deallocate dynamic memory
	return status;
}

PGresult* DBhandler::makeQuery(const char* query) {
	PGresult *res = PQexec(dbConnection, query);
	bool status = (PQresultStatus(res) == PGRES_TUPLES_OK);
	if(!status) {	// No data is returned
		cerr << "Query failed: " << PQerrorMessage(dbConnection) << endl;
		PQclear(res);  // Deallocate memeory
		return nullptr;
	}
	// OK, return the pointer to the result struct
	return res;
}