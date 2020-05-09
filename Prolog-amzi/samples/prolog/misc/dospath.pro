%-----------------------------------------------------------
% DOSPATH.PRO - DCG rules for DOS paths
%
% Copyright (c) 1995 Amzi! inc.
% All rights reserved
%
% This code checks for a well-formed path specification
% such as:
%
%   a:\foo\bar
%
% It requires that the drive be specified and that the
% path begin with the root, \.
%
% It does not look for file names and extensions, but that
% would be a nice addition to the code.  To test it, use
% the predicate 'test'.
%

%%%%%%%%%%%%%%%%%
% testing code
%

test :-
  repeat,
  write($Enter a full DOS path: $),
  read_string(X),
  process_string(X).
test.

process_string($$) :- !.
process_string(X) :-
  string_list(X,L),
  fullpath(DL, PL, L, []),
  !,
  string_list(DLs, DL),
  write($drive = $), write(DLs),
  string_list(PLs, PL),
  write($  path = $), write(PLs), nl,
  fail.


%%%%%%%%%%%%%%%%%%%%%
% main predicates
%

fullpath(DL, PL) --> drive(DL), path(PL).

drive([X,`:]) --> [X, `:], {letter(X)}, !.
drive(_) -->
  dcgerr($Missing or invalid drive specification$).

path([]) --> [`\].
path(PP) --> [`\], dir(D), !, path(P), {append([`\|D],P,PP)}, !.
path([`\|D]) --> [`\], dir(D), !.
path([]) --> !.
path(_) -->
  dcgerr($Ill-formed path specification$).

dir(D) --> fname(N), [`.], !, ext(E), {append(N,[`.|E],D)}.
dir(D) --> fname(D), !.
dir(D) -->
  dcgerr($Invalid directory$).

fname(D) --> chars(D), !, {listlen(D,N), N < 9}.

ext(E) --> chars(E), !, {listlen(E,N), N < 4}.

chars([X|Y]) --> [X], {char(X)}, chars(Y).
chars([X]) --> [X], {char(X)}.

char(X) :- letter(X).
char(X) :- digit(X).
char(X) :- member(X,[`_,`^,`$,`~,`!,`#,`%,`&,`-,`{,`},`(,`)]).

letter(X) :- X >= `a, X =< `z.
letter(X) :- X >= `A, X =< `Z.

digit(X) :- X >= `0, X =< `9.

dcgerr(Msg,X,_) :-
  write(Msg),
  write($: $),
  (X = [] -> S = X; string_list(S,X)),
  write(S),nl,
  fail.


% utilities

member(X, [X|_]).
member(X, [_|Z]) :- member(X,Z).

listlen(L, N) :- lislen(L, 0, N).

  lislen([], N, N).
  lislen([_|Y], X, N) :-
    XX is X + 1,
    lislen(Y, XX, N).

append([], X, X).
append([A|X], Y, [A|Z]) :- append(X,Y,Z).


