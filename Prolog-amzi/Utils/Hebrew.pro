% Hebrew General Predicates

:-op(700,xfx,���).
:-op(900,fy,[��]).
:-op(200,yf,[+,-,\]).

X ��� Y :-
   X is Y.

�� X:-
     X, !, fail.
�� X.

���(X):-
	X is pi.

�����(X):-
	X is random.

���(X,Y):-
	round(X,Y).

����(X,Y):-
	trunc(X,Y).

�����(X,S,F,I):-
	for(X,S,F,I).

���(H,M,S):-
	time(H,M,S).

�����(D,M,Y):-
	date(D,M,Y).

�����(X):-
	system(X).


/*
������ ��������� ���� ������ �� �����
*/


����(X):-
   atom(X).

���(X):-
   integer(X).

����(X):-
   number(X).

����(X):-
   float(X).

�����(X):-
   var(X).

��_�����(X):-
   nonvar(X).

�����(X):-
   atomic(X).

����(Head,Body):-
    clause(Head,Body).

����_����(Head):-
    clause(Head,true).

����_�����(Head):-
   clause(Head,Body),
   Body \= true.

������(String,ListOfCodes):-
   ascii_codes(String,ListOfCodes).

����_�������(ListOfStrings,Atom):-
   concat(ListOfStrings,Atom).

/*
����� ������
*/


���_�(X):-
   tell(X).

���_�(X):-
   see(X).

����_�(X):-
   telling(X).  

����_�(X):-
   seeing(X).

����_�:-
   told.

����_�(X):-
   seen.


/*
���/���
*/


���(X):-
   put(X).

���(X):-
   get(X).

���0(X):-
   get0(X).

���_��(X):-
   skip(X).

/*** �� ���� �� ****/

����:-
   nl.

���(X):-
   read(X).


����(T):-
   write(T).

����(X):-
   tab(X).

/*
�������� ������ ���� �������
*/



����(Term):-
   assert(Term).

����_������(Term):-
   asserta(Term).

����_����(Term):-
   assertz(Term).

���(Term):-
   retract(Term).

���_��(Term):-
   retractall(Term).

���(X,N):- 
   abolish(X,N).

���(X):- 
   consult(X).

���_�����(X):-
   reconsult(X).

���_�����(L):-
   reconsult_list(L).

��(X):-
   load(X).

�����:-
   listing.

�����(G):-
   listing(G).

�����(G,N):-
   listing(G/N).

�������(N,Term,Arg):-
   arg(N,Term,Arg).

������(Term,Functor,Arity):-
   functor(Term,Functor,Arity).

/*
����� �� ������ ������
*/


����(X):-
   call(X).

����:-
   fail.

���:-
   true.

���:-
   halt.

����:-
   repeat.


