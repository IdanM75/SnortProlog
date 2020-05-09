% Duck World - a demonstrative Amzi! Prolog application
%
% Copyright (c) 1994-2000, Amzi! inc.
% All rights reserved
%
% ducky.pro - the Duck World program all in a single file, designed for
% simple interpretive use.


main :-
	init_state,
	write($ Welcome to Duck World $),nl,
	instructions,
	write($ Go get an egg $),nl,
	go.

% Initialize the dynamic database.  This is unnecessary for interpreted use
% but is needed to make the program work compiled.  For interpreted use
% the simple statements
%
% loc(egg,pen).
% loc(ducks,pen).
% loc(you,house).
%
% are all that are required.  This is because all of the clauses of a
% program are in the dynamic database when interpreted.

init_state :-
	assert(loc(egg,pen)),
	assert(loc(ducks,pen)),
	assert(loc(you,house)).

% control loop

go :- done.
go :-
	write($>> $),
	read(X),
	X \= quit,
	do(X),
	demons,
	!, go.
go :- write($ Quitter $), nl.

% utilities functions and static predicates, seeing as these will not
% change they are OK to be compiled.

nextto(pen, yard).
nextto(yard, house).

connect(X,Y) :- nextto(X,Y).
connect(X,Y) :- nextto(Y,X).

move(Item, Place) :-
	retract( loc(Item, _) ),
	assert( loc(Item,Place) ).


% the commands that the user will type to manipulate the game.

do(goto(X)) :- !, goto(X).
do(chase(X)) :- !, chase(X).
do(take(X)) :- !, take(X).
do(look) :- !, look.
do(help) :- !, instructions.
do(quit) :- !.
do(_) :- write($unknown command$), nl, instructions.

goto(X) :-
	loc(you, L),
	connect(L, X),
	move(you, X),
	write($ You are in the $), write(X), nl.
goto(X) :-
	write($ You can't get there from here. $), nl.

chase(ducks) :-
	loc(ducks, L),
	loc(you, L),
	move(ducks, pen),
	write($ The ducks are back in their pen. $), nl.
chase(ducks) :-
	write($ No ducks here. $), nl.

take(X) :-
	loc(you, L),
	loc(X, L),
	move(X, you),
	write($ You now have the $), write(X), nl.
take(X) :-
	write($ There is no $), write(X), write($ here.$), nl.

look :-
	write($You are in the $),
	loc(you, L), write(L), nl,
	look_connect(L),
	look_here(L),
	look_have(you).

look_connect(L) :-
	write($You can go to: $), nl,
	connect(L, CONNECT),
	tab(2), write(CONNECT), nl,
	fail.
look_connect(_).

look_have(X) :-
	write($You have: $), nl,
	loc(THING, X),
	tab(2), write(THING), nl,
	fail.
look_have(_).

look_here(L) :-
	write($You can see: $), nl,
	loc(THING, L),
	THING \= you,
	tab(2), write(THING), nl,
	fail.
look_here(_).
	

instructions :-
	nl,
	write($You start in the house, the ducks and an egg$), nl,
	write($are in the pen.  You have to get the egg$), nl,
	write($without losing any ducks.$), nl,
	nl,
	write($Enter commands at the prompt as Prolog terms$), nl,
	write($ending in period:$), nl,
	write($  goto(X). - where X is a place to go to.$), nl,
	write($  take(X). - where X is a thing to take.$), nl,
	write($  chase(X). - chasing ducks sends them to the pen.$), nl,
	write($  look. - the state of the game.$), nl,
	write($  help. - this information.$), nl,
	write($  quit. - exit the game.$), nl,
	nl.


% The demon predicates, waiting for certain situations to occur.

demons :-
	ducks,
	fox.

ducks :-
	loc(ducks, pen),
	loc(you, pen),
	move(ducks, yard),
	write($ The ducks have run into the yard. $), nl.
ducks.

fox :-
	loc(ducks, yard),
	loc(you, house),
	write($ The fox has taken a duck. $), nl.
fox.


% end condition

done :-
	loc(you, house),
	loc(egg, you),
	write($ Thanks for getting the egg. $), nl.


		   /*
 ** 
 *
 *  FILENAME: x:\prosamp\ducks\ducky.pro
 *
 *  PARAMETERS:
 *
 *  DESCRIPTION:
 *
 *  RETURNS:
 *
 */
