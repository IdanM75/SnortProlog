/*	pets.c

	A simple example showing multiple engines.  Each engine
	is running a copy of pets.xpl, and each has a different
	sound asserted to its dynamic database.  Each is then
	queried to see what sort of pet it has.

	pets.pro

	pet(dog) :- sound(woof).
	pet(cat) :- sound(meow).
	pet(duck) :- sound(quack).
	*/

#include <stdio.h>
#include <stdlib.h>
#include "amzi.h"

/* One place to process Logic Server Exceptions. */
void error(ENGid);

int main()
{
	ENGid e1, e2;
	TERM t;
	char buf[80];
	TF  tf;

	/*	Initialize two Logic Servers.  A non-zero
		return indicates a failure to open. */
	if ( lsInit(&e1, "") )
	{
		printf("Failure initializing engine one\n");
		exit(0);
	}
	if ( lsInit(&e2, "") )
	{
		printf("Failure initializing engine two\n");
		exit(0);
	}

	/*	Load a copy of pets.xpl in each of the two
		Logic Servers. */
	if ( lsLoad(e1, "pets") )
		error(e1);
	if ( lsLoad(e2, "pets") )
		error(e2);

	/*	Add one sound to the first Logic Server,
		another to the second. */
	if ( lsAssertaStr(e1, "sound(woof)") )
		error(e1);
	if ( lsAssertaStr(e2, "sound(quack)") )
		error(e2);

	/*	Query each Logic Server, to see what type
		of pet might be in each.  If tf is neither
		TRUE or FALSE, then there is an error. */
	if ( TRUE == (tf = lsExecStr(e1, &t, "pet(X)")) )
	{
		lsGetArg(e1, t, 1, cSTR, buf);
		printf("Engine one's pet is a %s\n", buf);
	}
	else if (tf != FALSE)
		error(e1);

	if ( TRUE == (tf = lsExecStr(e2, &t, "pet(X)")) )
	{
		lsGetArg(e2, t, 1, cSTR, buf);
		printf("Engine two's pet is a %s\n", buf);
	}
	else if (tf != FALSE)
		error(e2);

	/*	Close both, freeing resources. */
	lsClose(e1);
	lsClose(e2);

	return(0);
}

void error(ENGid e)
/* Report on errors and quit. */
{
	char buf[120];

	lsGetExceptMsg(e, buf, 120);
	printf("Logic Server error #%d %s", lsGetExceptRC(e), buf);
	exit(0);
}
