/*
*  winutf8.h
*  Conversion functions utf8<->win1252
*
*/


#ifndef WINUTF8_H
#define WINUTF8_H

#ifdef _WIN32   // Windows environments only
#include <ostream>
#include <cstring>
#include <string>
#include <sstream>

using std::string;
using std::ostringstream;

/*
*	utf8win1252(const char* inCstr, string &outString)
*
*	Converts a utf-8 string to a string for codepage win-1252
*	Param inCstr: 		the C-string in utf-8 format
*	Param outString:	the string object containing the win-1252 string:
*	Returns -
*	
*/

inline void utf8win1252(const char* inCstr, string &outString)
{
    unsigned int length = strlen(inCstr);
	ostringstream oss;
    for(size_t i = 0; i < length; i++)
    {
        int c = (i < length - 1 ?
                ((unsigned int)((unsigned char)inCstr[i]) << 8) |
                (unsigned int)((unsigned char)inCstr[i+1]) : (0));

        if(c == 0xc3a5) { //å
			oss << char(229);  //0xc3a5
            i++;
        }
        else if(c == 0xc3a4) { //ä
			oss << char(228);  // 0xc3a4
            i++;
        }
        else if(c == 0xc3b6) { //ö
			oss << char(246); //0xc3b6
            i++;
        }
        else if(c == 0xc385) { //Å
			oss << char(197);  // 0xc385
            i++;
        }
        else if(c == 0xc384) { //Ä
			oss << char(196);   // 0xc384
            i++;
        }
        else if(c == 0xc396) { //Ö
			oss << char(214);    // 0xc396
            i++;
        }
        else {
			oss << inCstr[i];
        }
    }
	outString = oss.str();
}


/*
*	win1252utf8(const string &inWinStr, string &outUtfString)
*
*	Converts a string in codepage win-1252 to a utf-8 string
*	Param inWinStr:		the C-string in win-1252 format
*	Param outUtfString:	the string object containing the utf8-string:
*	Returns: -
*/


inline void win1252utf8(const string &inWinStr, string &outUtfString)
{
	ostringstream oss;
	
	unsigned int length = inWinStr.size();
    for(size_t i = 0; i < length; i++) {
        unsigned char c = inWinStr[i];
		
		if (c == 229) { //å
			oss << unsigned char(195) << unsigned char(165);  //0xc3a5
		}
		else if (c == 228) { //ä
			oss << unsigned char(195) << unsigned char(164);  // 0xc3a4	
		}
		else if (c == 246) { //ö
			oss << unsigned char(195) << unsigned char(182); //0xc3b6
		}
		else if (c == 197) { //Å
			oss << unsigned char(195) << unsigned char(133);  // 0xc385
		}
		else if (c == 196) { //Ä
			oss << unsigned char(195) << unsigned char(132);   // 0xc384
		}
		else if (c == 214) { //Ö
			oss << unsigned char(195) << unsigned char(150);    // 0xc396
		}
		else {
			oss << inWinStr[i];
		}
    }
	outUtfString = oss.str();
}

#endif //  _WIN32
#endif // WINUTF8_H

