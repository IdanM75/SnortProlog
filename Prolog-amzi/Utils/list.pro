% ����� ������
% ------------

:-op(700,xfx,���).
:-op(900,fy,[��]).
:-op(200,yf,[+,-,\]).

�����_������(_����,[_����|_]).

���(_����,_�����):-
	�����_������(_����,_�����).
���(_����,[_|_��_�����]):-
	���(_����,_��_�����).

�����_����(1,_����,_�����):-
	�����_������(_����,_�����).
�����_����(_�����,_����,[_|_��_�����]):-
	�����_����(_�����_���,_����,_��_�����),
	_����� ��� 1 + _�����_���.

����_������(0,[]).
����_������(_����,[_|_���]):-
    ����_������(_����,_���),
    _���� ��� 1 + _����.

����_�����(0,[]).
����_�����(_����,[_���|_���]):-
	����_�����(_����_���,_���),
	_���� ��� _��� + _����_���.


����([],_�����,_�����).
����([_����|_���],_�����,[_����|_���]):-
    ����(_���,_�����,_���).

����( _�����, _����� ) :-
    ����( _�����, [], _����� ), !.

����([],_����,_����).
����([_����|_���],_����,_�����):-
    ����(_���,[_����|_����],_�����).

���_��(_����,_����,_�����):-
    ����(_����),
    ����( ������(_����) ),
    ����;
    !,
    ����( ������(�����) ),
    ����_��(_�����).
     
����_��(L):-
    ���( ������(_����) ),
    !,
    ( _���� = �����,
      !,
      L = [] ;
      _���� \= �����,	
      L = [_����|_���],
      ����_��(_���)
    ).

	