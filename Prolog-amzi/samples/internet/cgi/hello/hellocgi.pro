%
% hellocgi.pro -- The simplist CGI application that returns a greeting
%
% Copyright (c)2000 Amzi! inc. All Rights Reserved.
%
%
% To use:
%   Compile and link this file with acgi.pro (see hellocgi.ppj)
%   Compile and link amzicgi.c and amzisub.c and rename the executable
%     to 'hellocgi'
%   Copy hellocgi(.exe) and hellocgi.xpl to your CGI-BIN directory
%

:- op(900, fy, [?, bug]).

%
% cgiLoad
%
% This is called by main after the CGI and system variables are set, 
% and is where you load the logic-base or other definitions, if they
% weren't compiled in. You can also specify a log file for debugging.
%
cgiLoad :-
%  asserta(system('Log File', '/usr/dennis/trace.htm')),
%  asserta(system('Log File URL', 'file://usr/dennis/trace.htm')),
  true.

%
% cgiMain
%
% The main CGI script.
%
cgiMain :-
  cgiSend($Content-type: text/html$),
  cgiSend($$),
  cgiSend($<html><body>Hello CGI User!</body></html>$).
cgiMain :-
  throw($cgiMain failed\n$).

cgiErrorNote :-
  true.

%
% Extremely handy debugging tool.  Just put a ? in front of any Prolog predicate
% you want to trace (and enable logging).  See op definition at top of file.
% Modified to expand HTML characters e.g. > becomes &gt;
%

/* bug to a file for debugging bug
bugopen :-
%  fopen(H, 'c:\\hellocgi.log', w),
  fopen(H, '/usr/dennis/hellocgi.log', w),
  assert(buglog(H)).

bugclose :-
  buglog(H),
  fclose(H).

bugwrite(X) :-
  buglog(H),
  write(H,X), nl(H).
*/

bugwrite(X) :-
  string_term(S, X),
  string_list(S, L),
  cgiExpandChars(L, L2),
  string_list(S2, L2),
  cgiLog(S2),
  cgiLog($\n$).

bugcallfail(X) :-
  bugwrite('CALL':X).
bugcallfail(X) :-
  bugwrite('FAIL':X),
  fail.

bugexitredo(X) :-
  bugwrite('EXIT':X).
bugexitredo(X) :-
  bugwrite('REDO':X),
  fail.

? X :- bug(X).

bug(X) :-
  bugcallfail(X),
  call(X),
  bugexitredo(X).
