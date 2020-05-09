% Hebrew General Predicates

ôàé(X):-
	X is pi.

à÷øàé(X):-
	X is random.

òâì(X,Y):-
	round(X,Y).

÷èåí(X,Y):-
	trunc(X,Y).

ìåìàä(X,S,F,I):-
	for(X,S,F,I).

/*
îúàøéí äîúééçñéí ìñåâ äáéèåé àå ìîöáå
*/


àèåí(X):-
   atom(X).

ùìí(X):-
   integer(X).

îñôø(X):-
   number(X).

îîùé(X):-
   float(X).

îùúğä(X):-
   var(X).

ìà_îùúğä(X):-
   nonvar(X).

àèåîé(X):-
   atomic(X).

ôñå÷(Head,Body):-
    clause(Head,Body).

ôñå÷_ôøèé(Head):-
    clause(Head,true).

ôñå÷_îåøëá(Head):-
   clause(Head,Body),
   Body \= true.

îçøåæú(String,ListOfCodes):-
   ascii_codes(String,ListOfCodes).

/*
èéôåì á÷áöéí
*/


ôúç_ë(X):-
   tell(X).

ôúç_÷(X):-
   see(X).

ôúåç_ë(X):-
   telling(X).  

ôúåç_÷(X):-
   seeing(X).

ñâåø_ë:-
   told.

ñâåø_÷(X):-
   seen.


/*
÷ìè/ôìè
*/


ùé1(X):-
   put(X).

÷áì(X):-
   get(X).

÷áì0(X):-
   get0(X).

ãìâ_òã(X):-
   skip(X).

/*** ìà áøåø ìé ****/

ùåøä:-
   nl.

÷øà(X):-
   read(X).


ëúåá(T):-
   write(T).

øååç(X):-
   tab(X).

/*
äúééçñåú åèéôåì áîñã äğúåğéí
*/



äåñó(Term):-
   assert(Term).

äåñó_áúçéìä(Term):-
   asserta(Term).

äåñó_áñåó(Term):-
   assertz(Term).

äñø(Term):-
   retract(Term).

äñø_ëì(Term):-
   retractall(Term).

îç÷(X,N):- 
   abolish(X,N).

èòï_åäåñó(X):- 
   consult(X).

èòï(X):-
   reconsult(X).

úéàåø:-
   listing.

úéàåø(G):-
   listing(G).

úéàåø(G,N):-
   listing(G/N).

ôñå÷(Head, Body):-
   clause(Head, Body).

ôñå÷(M,H,B):- !.

àøâåîğè(N,Term,Arg):-
   arg(N,Term,Arg).

ôğ÷èåø(Term,Functor,Arity):-
   functor(Term,Functor,Arity).

äñúø(X):- !.

ùëôì(G1,G2):- !.


/*
ùìéèä òì îğâğåï ääåëçä
*/


÷åøà(X):-
   call(X).

%ìà(X):-
%   not(X).

äëùì:-
   fail.

àîú:-
   true.

äôì:-
   halt.

çæåø:-
   repeat.

çæåø(G):- !.

/*
îúàøé éçñ
*/


/*******
(-N)






/*
Arithmetic Operators
*/


/*
X + Y

Sum of values of X and Y. 

X - Y

Value of X minus value of Y. 

X * Y

Value of X multiplied by value of Y. 

X / Y

Value of X divided by value of Y. Always returns a double precision
floating point value. 

X // Y

Integer division of X by Y-truncates result to the absolute integer.
That is, 11 // 4 =:= 2 and -11 // 4 =:= -2. 

X divs Y

Integer division such that the remainder is >= -Y/2 and < Y/2. 

X divu Y

Integer division such that the remainder is positive. 

X mod Y

The remainder after dividing the value of X by the value of Y. 

X mods Y

The remainder, constrained so that the result is >= -Y/2 and < Y/2. 

X modu Y

The remainder, constrained so that the result is positive. 

For the following bitwise operators the arguments must be 16 bit
integers. 

X /\ Y

Bitwise "and" of value of X and value of Y. 

X \/ Y

Bitwise "or" of value of X and value of Y. 

X << Y

Evaluates to X bit-shifted left by Y places. Note this is an arithmetic
shift (does not include the sign bit). So 0 is 1 << 16. 

X >> Y

Evaluates to X bit-shifted right by Y places. Again watch the sign bit
e.g. -4 >> 1 =:= -2 . 

X ** Y

Evaluates to X raised to the Y power. 

\ X

Evaluates to the bitwise complement of X (i.e., all those bits which
were 1 become 0 and vice versa). 

- X

Evaluates to the negative of X evaluated. 

Arithmetic Functions

acos(X)

acos evaluates to the angle (in radians) whose arccosine is X. 

asin(X)

asin evaluates to the angle (in radians) whose arcsine is X. 

atan(X)

atan evaluates to the angle (in radians) whose arctangent is X. 

cos(X)

cos evaluates to the cosine of X (in radians) 

exp(X)

exp evaluates to e raised to the power of X evaluated. 

float(X)

float converts X to a double precision floating point number. 

integer(X)

integer converts X to an integer (truncating any fractional part). 

ln(X)

ln evaluates to the natural log (loge()) of X evaluated. 

seed_random(I)

seed_random/1 is a predicate that seeds the random number
generator. It takes an integer argument. 

sin(X)

sin evaluates to the sine of X (in radians). 

sqrt(X)

sqrt evaluates to the square root of X. 

tan(X)

tan evaluates to the tangent of X (in radians). 

Built-in Atoms

There are a number of built-in atoms, which have predetermined
values that can be used in arithmetic expression. 

cputime 
     A floating point number with the number of CPU seconds
     expired. It is useful for timing functions, for example: 
     ?- T1 is cputime, dothing, T is T1 - cputime, write(time:T). 
e 
     The value "e" (2.718282..) 
pi 
     The value "pi" (3.14159 ..) 
random 
     A random floating point number >= 0.0 and < 1.0 

Copyright ©1987-2000 Amzi! inc. All Rights Reserved.

*/