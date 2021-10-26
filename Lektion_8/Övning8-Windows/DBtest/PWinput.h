/*
 * Autor       : Mikael Nilsson, Örjan Sterner
 * Filename    : input.h
 * Description : Password input using direct access to keyboard
 * Source      : Unix src from http://stackoverflow.com/questions/7469139/what-is-equivalent-to-getch-getche-in-linux
*/

#ifndef PWINPUT_H
#define PWINPUT_H
#include <string>

// Read a string from keyboard where every input char is echoed as a *
std::string getPassword();



#endif // PWINPUT_H
