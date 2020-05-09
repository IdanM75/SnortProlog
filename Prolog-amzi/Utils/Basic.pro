:- op(1100,fx,@).

putnh(_,0) :- 
	!.
putnh(A,N) :-
	N >= 1,
	puth(A),
	NewN is N - 1,
	putnh(A,NewN).


tabh(0) :- 
	!.
tabh(N) :-
	N >= 1,
	writeh(' '),
	NewN is N -1,
	tabh(NewN).


write_colorh(X,C) :-
	colorh(Current),
	colorh(C),
	writeh(X),
	colorh(Current).


clear_colorh(C) :-
	colorh(Current),
	colorh(C),
	clearh,
	colorh(Current).


wait_keyh :-
	get_keyh(_).


new_window(X1,Y1,X2,Y2,Color,Border,Name) :-
	open_window(X1,Y1,X2,Y2,Color,Border,ID),
	assert( wdb(ID,Name) ),
	set_caption(Name).


current_window(Name) :-
	( var(Name) -> 
		( set_display(ID),
		  wdb(ID,Name) ) ;
		( wdb(ID,Name),
		  set_display(ID) ) ), !.


free_window(Name) :-
	wdb(ID,Name),
	close_window(ID).


polyline([]):- 
	!.
polyline([(X,Y)|Tail]):-
	connect(X,Y),
	polyline(Tail).


concat(List,Atom):-
	stringlist_concat(List,String),
	string_atom(String,Atom).

reconsult_list([]).
reconsult_list([File|List]):-
	reconsult(File),
	reconsult_list(List).

@ List :- reconsult_list(List).	