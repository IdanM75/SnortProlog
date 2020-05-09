% Hebrew General Predicates

:-op(700,xfx,הוא).
:-op(900,fy,[לא]).
:-op(200,yf,[+,-,\]).

X הוא Y :-
   X is Y.

לא X:-
     X, !, fail.
לא X.

פאי(X):-
	X is pi.

אקראי(X):-
	X is random.

עגל(X,Y):-
	round(X,Y).

קטום(X,Y):-
	trunc(X,Y).

לולאה(X,S,F,I):-
	for(X,S,F,I).

שעה(H,M,S):-
	time(H,M,S).

תאריך(D,M,Y):-
	date(D,M,Y).

מערכת(X):-
	system(X).


/*
מתארים המתייחסים לסוג הביטוי או למצבו
*/


אטום(X):-
   atom(X).

שלם(X):-
   integer(X).

מספר(X):-
   number(X).

ממשי(X):-
   float(X).

משתנה(X):-
   var(X).

לא_משתנה(X):-
   nonvar(X).

אטומי(X):-
   atomic(X).

פסוק(Head,Body):-
    clause(Head,Body).

פסוק_פרטי(Head):-
    clause(Head,true).

פסוק_מורכב(Head):-
   clause(Head,Body),
   Body \= true.

מחרוזת(String,ListOfCodes):-
   ascii_codes(String,ListOfCodes).

שרשר_מחרוזות(ListOfStrings,Atom):-
   concat(ListOfStrings,Atom).

/*
טיפול בקבצים
*/


פתח_כ(X):-
   tell(X).

פתח_ק(X):-
   see(X).

פתוח_כ(X):-
   telling(X).  

פתוח_ק(X):-
   seeing(X).

סגור_כ:-
   told.

סגור_ק(X):-
   seen.


/*
קלט/פלט
*/


שים(X):-
   put(X).

קבל(X):-
   get(X).

קבל0(X):-
   get0(X).

דלג_עד(X):-
   skip(X).

/*** לא ברור לי ****/

שורה:-
   nl.

קרא(X):-
   read(X).


כתוב(T):-
   write(T).

רווח(X):-
   tab(X).

/*
התייחסות וטיפול במסד הנתונים
*/



הוסף(Term):-
   assert(Term).

הוסף_בתחילה(Term):-
   asserta(Term).

הוסף_בסוף(Term):-
   assertz(Term).

הסר(Term):-
   retract(Term).

הסר_כל(Term):-
   retractall(Term).

מחק(X,N):- 
   abolish(X,N).

טען(X):- 
   consult(X).

טען_והוסף(X):-
   reconsult(X).

טען_והוסף(L):-
   reconsult_list(L).

קח(X):-
   load(X).

תיאור:-
   listing.

תיאור(G):-
   listing(G).

תיאור(G,N):-
   listing(G/N).

ארגומנט(N,Term,Arg):-
   arg(N,Term,Arg).

פנקטור(Term,Functor,Arity):-
   functor(Term,Functor,Arity).

/*
שליטה על מנגנון ההוכחה
*/


קורא(X):-
   call(X).

הכשל:-
   fail.

אמת:-
   true.

הפל:-
   halt.

חזור:-
   repeat.


