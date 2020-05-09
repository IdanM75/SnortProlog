% Duck World - a demonstrative Amzi! Prolog application
%
% Copyright (c) 1994-2000 Amzi! inc.
% All rights reserved
%
% duck2.pro - the main control loop for Duck World

% main/0 is exported so that the Prolog runtime can find it and begin
% running the program.

:- export main/0.

% import definitions for the commands and conditions that will be used
% from duck2.pro.  The other predicates of duck1.pro are not accessible
% from the predicates of duck2.pro.

:- import done/0.
:- import demons/0.
:- import do/1.

% The state of the system is maintained in the dynamic predicate loc/2.
% loc/2 could either be initialized with asserts from here, or the 
% asserts could be kept in a separate file which is consulted when the
% program begins.  That is the approach taken here, and the file
% duckenv.pro contains the initialization code for the dynamic database.

main :-
	consult(duckenv),
	write($ Welcome to Duck World $),nl,
	do(help),
	write($ Go get an egg $),nl,
	go.

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

