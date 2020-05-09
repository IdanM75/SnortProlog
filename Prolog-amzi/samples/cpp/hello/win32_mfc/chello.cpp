/*

CHELLO.CPP - A Class for Hello

This class, which is derived from the Logic Server class,
CLogicServer, calls the compiled Prolog file, HELLO.XPL and
queries its only predicate, hello/2.  The arguments are:

	1- A string with the callers name, and
	2- A returned string with a greeting.

To use it you need HELLO.XPL which is the compiled
version of HELLO.PRO.  It is already in the \AMZI directory,
so, assuming \AMZI is on your path, the program will find
it without problem.

If you do have load errors on HELLO.XPL, check the path and
make sure HELLO.XPL is somewhere on it.

*/

#include "stdafx.h"
#include <stdio.h>
#include "amzi.h"
#include "chello.h"

void CHello::init()
{
	try
	{
		// Initialize the Logic Server engine
		Init("");
		msg_out("Logic Server initialized");

		// Load the compiled Prolog program, hello.xpl
		Load("hello");
		msg_out("HELLO.XPL loaded");
	}
	catch(CLSException &E)
	{
		error(E);
	}
}

CHello::~CHello()
{
	// Close the Logic Server engine

	try { Close(); }
	catch(CLSException &E) { error(E); }

	msg_out("Logic Server successfully closed");
}

void CHello::run()
{
	TERM   t;
	TF     tf;
	char   buf[MAXMSG];

	try
	{
		// Build a query term and call it
		tf = ExecStr(&t, "hello($Windows C++ Programmer$, X)");

		// If the query succeeded print up the results
		if (tf == TRUE)
		{
			GetArg(t, 2, cSTR, buf);
			msg_out(buf);
		}
		else
			msg_out("Hello failed");
	}
	catch(CLSException &E) { error(E); }
}

void CHello::error(CLSException &E)
{
	char buf[MAXMSG];
	char msg[MAXMSG];

	// Get Logic Server error message
	E.GetMsg(msg, MAXMSG);
	sprintf(buf,"Logic Server Exception: %d\n%s", E.GetRC(), msg);
	msg_out(buf);
}

void CHello::msg_out(char* msg)
{
#ifdef _CONSOLE
	cout << msg << '\n';
#else
	MessageBox(NULL, msg, "Hello Message", MB_OK);
#endif
}
