/*
<HTML>
<HEAD>
<TITLE>Amzi! Debugging Predicate Library</TITLE>
</HEAD>
<BODY>
<A NAME="contents"></A>
For debugging compiled programs, these predicates allow
you to capture execution ports, and display the values
of goals.  They are just a little more elaborate than
adding write statements to a program.
<MENU>
<LI><A HREF="#buginit">buginit/0,1</A> - optionally specify a debug output file
<LI><A HREF="#bug">bug/1</A> - capture port information
<LI><A HREF="#bug">?/2</A> - operator version of bug/1
<LI><A HREF="#bugclose">bugclose/0</A> - close debug output file
<LI><A HREF="#flow">flow/1,3</A> - note flow of control
</MENU>
<PRE>
*/

% buginit/1 - optionally opens a file to which debugging
%    output is directed.  The argument is the file name.
% buginit/0 - optionally opens file 'bug.log' for debugging
%    output.
% user_bugwrite/1 - The user can define an output predicate
%    that outputs a term, and most likely follows it with
%    a newline.
% bug/1 - brackets a call to a predicate with debugging
%    information
% ?/1 - an operator synonym for bug/1.
% bugclose/0 - closes the debugging file, if one was open
%
% flow/1,3 - can be used to note the flow of control at a
%    point in the program, for both normal code and DCG.
%

:- export
     buginit/1,
     buginit/0,
     bug/1,
     ? /1,
     bugclose/0,
     flow/1,
     flow/3.

:- import
     user_bugwrite/1,
     bug$file/1.

:- op(900, fy, [?, bug]).

/*
</PRE>
<H2><A NAME="buginit">buginit(FileName)</A></H2>
buginit/1 opens FileName for debugging output,
buginit/0 opens the file 'bug.log' for debugging output.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

buginit(FileName) :-
  fopen(B, FileName, w),
  assert(bug$file(B)).

buginit :-
  buginit('bug.log').

/*
</PRE>
<H2><A NAME="bugclose">bugclose</A></H2>
bugclose/0 closes the output debugging file.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

bugclose :-
  retract(bug$file(B)),
  !, fclose(B).
bugclose.

/*
</PRE>
<H2><A NAME="bug">bug(Goal), ? Goal</A></H2>
bug/1, ?/1 bracket a call to Goal with classic
four-port Prolog debugging information.  By default
the output is written to the current output stream,
but it can be redirected to a file, using buginit/1.
<p>
You can also define your own output predicate,
user_bugwrite/1, which will be used for all output if
it is defined.
<p>
<p>
For example, bug/1, ?/1 can be used to debug the append/3
predicate as follows:
<PRE>
  append([A|X], Y, [A|Z]) :-
    ? append(X,Y,Z).
</PRE>
In this case the call, exit, redo, and fail ports around
the recursive call to append/3 will all be written to
either the standard output stream, the bugfile, or whereever
user_bugwrite/1 sends the output.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

bug(X) :-
  bug$callfail(X),
  call(X),
  bug$exitredo(X).

? X :- bug(X).

% Try user's bugwrite first, if not see if there's a bugfile
% if not, just writeq.

bug$write(X) :-
  user_bugwrite(X), !.
bug$write(X) :-
  bug$file(B), !, 
  writeq(B, X),
  nl(B).
bug$write(X) :-
  writeq(X),
  nl.

% bug$callfail/1 - writes a quoted term with the message
%    CALL when called, and FAIL when backtracked through
% bug$exitredo/1 - writes a quoted term with the message
%    EXIT when called, and REDO when backtracked through

bug$callfail(X) :-
  bug$write('CALL':X).
bug$callfail(X) :-
  bug$write('FAIL':X),
  fail.

bug$exitredo(X) :-
  bug$write('EXIT':X).
bug$exitredo(X) :-
  bug$write('REDO':X),
  fail.

/*
</PRE>
<H2><A NAME="flow">flow(X), flow(X,Y,Y)</A></H2>
flow/1,3 uses the < and > symbols to indicate flow
of control through the point in the program where
the flow goal is placed.  flow/3 can be used directly
in DCG, as the last two arguments simple pass the
difference lists through.

<p><A HREF="#contents">Contents</A>
<PRE>
*/

flow(X):- bug$write('>':X).
flow(X):- bug$write('<':X),fail.

flow(X, Y, Y):- flow(X).            % threaded for dcg rules

