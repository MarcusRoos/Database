/*
 * Autor       : Mikael Nilsson
 * Filename    : input.cpp
 * Description : Direct access to keyboard input.
 * Source      : Unix src from http://stackoverflow.com/questions/7469139/what-is-equivalent-to-getch-getche-in-linux
 * TODO        : Add windows code and merge with terminal.
 */

#include <iostream>
#include <string>
#include "PWinput.h"

using std::string;
using std::cout;

#ifdef _WIN32   //  Windows environments
#include <conio.h>
#define NEWLINE '\r'

#else  // UNIX Liunx MaC
#include <unistd.h>
#include <termios.h>
#include <stdio.h>
#define NEWLINE '\n'

char _getch()
{
    char buf=0;
    struct termios old = {0};
    fflush(stdout);
    if(tcgetattr(0, &old)<0)
        perror("tcsetattr()");
    old.c_lflag&=~ICANON;
    old.c_lflag&=~ECHO;
    old.c_cc[VMIN]=1;
    old.c_cc[VTIME]=0;
    if(tcsetattr(0, TCSANOW, &old)<0)
        perror("tcsetattr ICANON");
    if(read(0,&buf,1)<0)
        perror("read()");
    old.c_lflag|=ICANON;
    old.c_lflag|=ECHO;
    if(tcsetattr(0, TCSADRAIN, &old)<0)
        perror ("tcsetattr ~ICANON");
   // printf("%c\n",buf);
    return buf;
 }
#endif  // __WIN32

string getPassword() {
	string pwString;
	char c;
	while ((c = _getch()) != NEWLINE) {
		cout << '*';
		pwString += c;
	}
	return pwString;
}