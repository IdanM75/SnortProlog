% Duck World - a demonstrative Amzi! Prolog application
%
% Copyright (c) 1994-2000 Amzi! inc.
% All rights reserved
%
% duck1.pro has commands used to manipulate the Duck World environment.
% The environment consists of the dynamic predicate, loc/2, which is
% first established when the file duckenv.pro is consulted by main/0, 
% defined in the file duck2.pro.

% import declaration for loc/2, defined in the dynamic database.

:- import loc/2.

% export declarations for the predicates that will be called from the
% main control loop defined in duck2.pro.

:- export do/1.
:- export done/0.
:- export demons/0.


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

