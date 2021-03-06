/*
 * Test the C version of libpq, the PostgreSQL frontend library.
 */
#include <iostream>
#include <libpq-fe.h>

void exit_nicely(PGconn *pConn);

int main() {

    const std::string server = "studentpsql.miun.se";
    const std::string port = "5432";
    const std::string dbname = "maro1904";
    const std::string user = "maro1904";
    const std::string pass = "JJtfxZxk0";
    const std::string conninfo = "host=" + server + " port=" + port + " dbname=" + dbname + " user=" + user + " password=" + pass;

    std::string validation[2], tempPass, passQuery;

    PGconn     *conn;
    PGresult   *res;
    PGresult   *pep;
    PGresult   *tmpPass;

    std::cout << "Test of PostgreSQL C library" << std::endl;

    /* Make a conn to the database */
    conn = PQconnectdb(conninfo.c_str());

    /* Check to see that the backend conn was successfully made */
    if (PQstatus(conn) != CONNECTION_OK)
    {
        fprintf(stderr, "Connection to database failed: %s",
                PQerrorMessage(conn));
        exit_nicely(conn);
    }

    std::cout << std::endl << "Connected to PostgreSQL on " << server.c_str() << std::endl;

    /* Set always-secure search path, so malicious users can't take control. */
    res = PQexec(conn,
                 "SELECT pg_catalog.set_config('search_path', 'sportsclub8', false)");
    if (PQresultStatus(res) != PGRES_TUPLES_OK)
    {
        fprintf(stderr, "SET failed: %s", PQerrorMessage(conn));
        PQclear(res);
        exit_nicely(conn);
    }

    /*
     * Should PQclear PGresult whenever it is no longer needed to avoid memory
     * leaks
     */
    PQclear(res);

    /*
     * Our test case here involves using a cursor, for which we must be inside
     * a transaction block.  We could do the whole thing with a single
     * PQexec() of "select * from person", but that's too trivial to make
     * a good example.
     */

    /*** TRANSITION BLOCK - VALIDATE
     * Fetch details regarding Donald Duck to later
     * be used to validate user input, which will
     * in turn let the user print the database.***/

    pep = PQexec(conn, "BEGIN");
    if (PQresultStatus(pep) != PGRES_COMMAND_OK)
    {
        fprintf(stderr, "BEGIN command failed: %s", PQerrorMessage(conn));
        PQclear(pep);
        exit_nicely(conn);
    }
    PQclear(pep);

    /* User Input to later be used to print table*/
    std::string inmail, inpass;
    std::cout << "Enter email: ";
    std::cin >> inmail;
    std::cout << "Enter password: ";
    std::cin >> inpass;

    passQuery =     "SELECT MD5('" + inpass + "')";

    tmpPass = PQexec(conn, passQuery.c_str());

    int nFields = PQnfields(tmpPass) ;
    int i;

    for (i = 0; i < PQntuples(tmpPass); i++) {
        int j;
        for (j = 0; j < nFields; j++) {
            tempPass = PQgetvalue(tmpPass, i, j);
        }
    }

    /** I chose to let anyone login and see the table as long as their
     email and password match up, comment out this section and remove comments
     from function below to only allow donald duck to look up tables.
     I did not see any limitations on who should be able to print the
     tables in the description of this lab. **/
    passQuery = "DECLARE validate CURSOR FOR "
                "select epost, l??senord "
                "from person "
                "where epost "
                "LIKE '" + inmail + "'";


    /** REMOVE COMMENTS TO ONLY ALLOW DONALD DUCK TO PRINT TABLES

     passQuery = "DECLARE validate CURSOR FOR "
                "select epost, l??senord "
                "from person "
                "where epost "
                "LIKE 'd.duck@quacksville.net'";
   **/


    pep = PQexec(conn, passQuery.c_str());

    if (PQresultStatus(pep) != PGRES_COMMAND_OK)
    {
        fprintf(stderr, "DECLARE CURSOR failed: %s", PQerrorMessage(conn));
        PQclear(pep);
        exit_nicely(conn);
    }
    PQclear(pep);

    pep = PQexec(conn, "FETCH ALL in validate");
    if (PQresultStatus(pep) != PGRES_TUPLES_OK)
    {
        fprintf(stderr, "FETCH ALL failed: %s", PQerrorMessage(conn));
        PQclear(pep);
        exit_nicely(conn);
    }

    /* first, print out the attribute names */
    nFields = PQnfields(pep);

    for (i = 0; i < PQntuples(pep); i++) {
        int j;
        for (j = 0; j < nFields; j++) {
            validation[j] = PQgetvalue(pep, i, j);
        }
    }

    PQclear(pep);

    /* close the cursor ... we don't bother to check for errors ... */
    pep = PQexec(conn, "CLOSE validate");
    PQclear(pep);

    /* end the transaction */
    pep = PQexec(conn, "END");
    PQclear(pep);

    /*** TRANSITION BLOCK - PRINT
     Fetch all persons in the database, will print if the
     authentication details from previous match up.***/

if (inmail == validation[0] && tempPass == validation[1]) {
    res = PQexec(conn, "BEGIN");
    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "BEGIN command failed: %s", PQerrorMessage(conn));
        PQclear(res);
        exit_nicely(conn);
    }
    PQclear(res);

    /*
     * Fetch all persons
     */
    res = PQexec(conn, "DECLARE allPersons CURSOR FOR "
                       "select f??rnamn, gatuadress, person.postnr, postort, epost "
                       "from person, postort "
                       "where person.postnr = postort.postnr");

    if (PQresultStatus(res) != PGRES_COMMAND_OK) {
        fprintf(stderr, "DECLARE CURSOR failed: %s", PQerrorMessage(conn));
        PQclear(res);
        exit_nicely(conn);
    }
    PQclear(res);

    res = PQexec(conn, "FETCH ALL in allPersons");
    if (PQresultStatus(res) != PGRES_TUPLES_OK) {
        fprintf(stderr, "FETCH ALL failed: %s", PQerrorMessage(conn));
        PQclear(res);
        exit_nicely(conn);
    }

    std::cout << std::endl << "All persons in Sportsclub8" << std::endl;
    std::cout << "--------------------------" << std::endl;

    /* first, print out the attribute names */
    nFields = PQnfields(res);
    for (i = 0; i < nFields; i++)
        printf("%-17s", PQfname(res, i));
    printf("\n");

    /* next, print out the rows */
    for (i = 0; i < PQntuples(res); i++) {
        int j;
        for (j = 0; j < nFields; j++)
            printf("%-17s", PQgetvalue(res, i, j));
        printf("\n");
    }


    PQclear(res);

    /* close the cursor ... we don't bother to check for errors ... */
    res = PQexec(conn, "CLOSE allPersons");
    PQclear(res);

    /* end the transaction */
    res = PQexec(conn, "END");
    PQclear(res);
}
else{
    std::cout << "\n Incorrect login, exiting...\n";
}
    /* close the conn to the database and cleanup */
    PQfinish(conn);

    return 0;
}


void exit_nicely(PGconn *conn)
{
    PQfinish(conn);
    exit(1);
}
