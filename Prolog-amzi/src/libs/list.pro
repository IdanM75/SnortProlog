/*
<HTML>
<HEAD>
<TITLE>Amzi! List Predicate Library</TITLE>
</HEAD>
<BODY>
<A NAME="contents"></A>
This file contains library predicates that perform
various list utilities.
<MENU>
<LI><A HREF="#append">append/3</A> - join or split lists
<LI><A HREF="#deleteN">deleteN/4</A> - delete the Nth element of a list
<LI><A HREF="#flatten">flatten/2</A> - flatten a list of nested lists
<LI><A HREF="#length">length/2</A> - get the length of a list
<LI><A HREF="#length_lte">length_lte/2</A> - compare lengths of lists
<LI><A HREF="#length_gte">length_gte/2</A> - compare lengths of lists
<LI><A HREF="#length_lt">length_lt/2</A> - compare lengths of lists
<LI><A HREF="#length_gt">length_gt/2</A> - compare lengths of lists
<LI><A HREF="#member">member/2</A> - find or generate members of list
<LI><A HREF="#nth_elem">nth_elem/3</A> - find the nth element of a list
<LI><A HREF="#permutation">permutation/3</A> - permute elements of a list
<LI><A HREF="#remove">remove/3</A> - remove an element from a list
<LI><A HREF="#remove_dups">remove_dups/2</A> - remove duplicate elements from a list
<LI><A HREF="#replace_elem">replace_elem/4</A> - replace an element in a list
<LI><A HREF="#reverse">reverse/2</A> - reverse a list
<LI><A HREF="#shuffle">shuffle/2</A> - randomly shuffle a list
<LI><A HREF="#write_list">write_list/2,3</A> - write separated list elements
<LI><A HREF="#writeq_list">writeq_list/2,3</A> - writeq separated list elements
</MENU>
<PRE>
*/

:- export
     append/3,
     deleteN/4,
     flatten/2,
     length/2,
     length_lte/2,
     length_gte/2,
     length_lt/2,
     length_gt/2,
     member/2,
     nth_elem/3,
     permutation/3,
     remove/3,
     remove_dups/2,
     replace_elem/4,
     reverse/2,
     shuffle/2,
     write_list/2,
     write_list/3,
     writeq_list/2,
     writeq_list/3.

/*
</PRE>
<H2><A NAME="append">append(L1_LV,L2_LV,L12_VL)</A></H2>
append/3 defines the relationship
that lists L1 and L2, appended together, equal list L12.
append/3 can be used in a number of different ways, depending
on which arguments are instantiated.  If the first two are, it
simply joins the two lists.  If just the third argument is, it
generates all possible splittings of the list.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

append([], X, X).
append([A|X], Y, [A|Z]) :- append(X,Y,Z).

/*
</PRE>
<H2><A NAME="deleteN">deleteN(N_I, Elem, In_L, Out_L)</A></H2>
Delete the N_I elem of the list In_L.  Elem is bound
to the deleted element and Out_L is bound to the remaining
list.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

deleteN(1, H, [H|Z], Z).
deleteN(_, _, [], []) :- !, fail.
deleteN(N, H, [X|Z], [X|Z2]) :-
  NN is N - 1,
  deleteN(NN, H, Z, Z2).

/*
</PRE>
<H2><A NAME="flatten">flatten(L1_L, L2_VL)</A></H2>
Take a list L1, that might have nested lists in it,
and flatten it into list L2, that does not have any
lists as elements.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

flatten([], []).
flatten( [X|T], [X|T2] ) :-
  var(X),
  !, flatten(T, T2).
flatten([ [] | T], T2) :-
  !, flatten(T, T2).
flatten([ [H|T] | T2], [H1|T3]) :-
  flatten([H|T], [H1|T1]),
  !, flatten([T1|T2], T3).
flatten([H|T], [H|T2]) :-
  flatten(T, T2).

/*
</PRE>
<H2><A NAME="length">length(L, VI)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

length(L, N) :-length(L, 0, N).

  length([], N, N).
  length([_|Y], X, N) :-
    XX is X + 1,
    length(Y, XX, N).

/*
</PRE>
<H2><A NAME="length_lte">length_lte(L1_L, L2_L)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

length_lte([], _).
length_lte([X1|Z1], [X2|Z2]) :-
  length_lte(Z1, Z2).

/*
</PRE>
<H2><A NAME="length_gte">length_gte(L1_L, L2_L)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

length_gte(L1, L2) :-
  length_lte(L2, L1).

/*
</PRE>
<H2><A NAME="length_lt">length_lt(L1_L, L2_L)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

length_lt([], [_|_]).
length_lt([X1|Z1], [X2|Z2]) :-
  length_lt(Z1, Z2).

/*
</PRE>
<H2><A NAME="length_gt">length_gt(L1_L, L2_L)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

length_gt(L1, L2) :-
  length_lt(L2, L1).

/*
</PRE>
<H2><A NAME="member">member(X, LV)</A></H2>
Find a member of a list, or generate all members
of a list.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

member(A, [A|_]).
member(A, [_|Z]) :- member(A, Z).

/*
</PRE>
<H2><A NAME="nth_elem">nth_elem(L, X, N)</A></H2>
Given a list, L, nth_elem finds either the position,
starting at 1, of the elem X, or the elem at position
N.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

nth_elem(L, X, N) :-
  nth_elem(L, X, 1, N).

  nth_elem([X|Z], X, N, N).
  nth_elem([_|Z], X, A, N) :-
    AA is A + 1,
    nth_elem(Z, X, AA, N).  

/*
</PRE>
<H2><A NAME="permutation">permutation(ListOfVars, List, LV)</A></H2>
permutation/3 assigns different values to the variables in the first
list from the values in the second.  The third list is the list of
unassigned values.  It works by simply deleting elements from the
list using remove/3.  Because it is deleting an element which is an
unbound variable, remove/3 simply deletes the next element and binds
its value to the variable, thus providing a simple way to assign
permuted values to a list of variables.  On backtracking, of course,
delete simply binds the variable to the next element of the list and
deletes it, thus eventually generating all permutations of a list.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

permutation([],L,L).
permutation([A|X],Y,L) :- atomic(A), permutation(X,Y,L).
permutation([A|X],Y,L) :- remove(A,Y,Y1), permutation(X,Y1,L).

/*
</PRE>
<H2><A NAME="remove">remove(Elem_X, L1_L, L2_LV)</A></H2>
<p><A HREF="#contents">Contents</A>
<PRE>
*/

remove(A,[A|X],X).
remove(A,[B|X],[B|Y]) :- remove(A,X,Y).

/*
</PRE>
<H2><A NAME="remove_dups">remove_dups(List1_L,List2_L)</A></H2>
remove_dups removes all the duplicates from List1 and returning
the list of unique elements List2.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

remove_dups([], []).
remove_dups([X|Y], Z) :-
   is_member(X,Y), 
   !, remove_dups(Y,Z).
remove_dups([X|Y], [X|Z]) :-
   remove_dups(Y, Z).

/*
</PRE>
<H2><A NAME="replace_elem">replace_elem(OldElem, NewElem, Lin, Lout)</A></H2>
Replace OldElem in list Lin, with NewElem, returning the new list
in Lout.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

replace_elem(_, _, [], _) :- !, fail.
replace_elem(Old, New, [Old|Z], [New|Z]) :- !.
replace_elem(Old, New, [X|Z], [X|Z2]) :-
  replace_elem(Old, New, Z, Z2).


/*
</PRE>
<H2><A NAME="reverse">reverse(List_L, RevList_LV)</A></H2>
Reverses List_L to RevList_LV.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

reverse(A, Z) :- reverse(A, [], Z).

   reverse([], Z, Z).
   reverse([A|X], SoFar, Z) :- reverse(X, [A|SoFar], Z).

/*
</PRE>
<H2><A NAME="shuffle">shuffle(In_L, Out_L)</A></H2>
Randomly shuffles the list In_L and returns Out_L, the
shuffled list.  To get the same shuffling each time,
use the built-in predicate seed_random/1 to provide an
integer starting seed for random.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

shuffle(Tin, Tout) :-
  shuffle1(Tin, [], Tout).

  shuffle1([], A, A).
  shuffle1(Tin, A, Tout) :-
    length(Tin, L),
    N is 1 + integer( random * L ),
    deleteN(N, Elem, Tin, Tx),
    shuffle1(Tx, [Elem|A], Tout).
   
/*
</PRE>
<H2><A NAME="write_list">write_list(L, Separator_AS)</A></H2>
write_list/2 writes each of the elements of a list, writing the
Separator between elements.  For example, write_list(L, $\n  $),
will write the elements of list L on newlines, indented two spaces.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

write_list([], _).
write_list([X], _) :-
  !, write(X).
write_list([X|Y], Separator) :-
  write(X),
  write(Separator),
  write_list(Y, Separator).

write_list(H, [], _).
write_list(H, [X], _) :-
  !, write(H, X).
write_list(H, [X|Y], Separator) :-
  write(H, X),
  write(H, Separator),
  write_list(H, Y, Separator).
  
/*
</PRE>
<H2><A NAME="writeq_list">writeq_list(L, Separator_AS)</A></H2>
writeq_list/2 writeqs each of the elements of a list, writing the
Separator between elements.  For example, writeq_list(L, $\n  $),
will write the elements of list L on newlines, indented two spaces.
<p><A HREF="#contents">Contents</A>
<PRE>
*/

writeq_list([X], _) :-
  !, writeq(X).
writeq_list([X|Y], Separator) :-
  writeq(X),
  write(Separator),
  writeq_list(Y, Separator).

writeq_list(H, [X], _) :-
  !, writeq(H, X).
writeq_list(H, [X|Y], Separator) :-
  writeq(H, X),
  write(H, Separator),
  writeq_list(H, Y, Separator).
  
