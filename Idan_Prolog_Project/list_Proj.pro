% ����� ������
% ------------

���(_����,[_����|_]).

���(_����,[_|_��_�����]):-
	���(_����,_��_�����).



�����_����(1,_����,_�����):-
		�����_������(_����,_�����).

�����_����(_�����,_����,[_|_��_�����]):-
		�����_����(_�����_���,_����,_��_�����),
		_�����  ���  1 + _�����_���.

����_�����_������(_����_�����,[_����_�����]).

����_�����_������(_����_�����,[_|_���]):-
	����_�����_������(_����_�����,_���).

                  



����_������(0,[]).

����_������(_����,[_|_���]):-
    	����_������(_����,_���),
    	_���� ��� 1 + _����.



����_�����(0,[]).

����_�����(_����,[_���|_���]):-
		����_�����(_����_���,_���),
		_����  ���  _��� + _����_���.



����([],_�����,_�����).

����([_����|_���],_�����,[_����|_���]):-
    		����(_���,_�����,_���).



%% ----------------------------------------------
%% ����� ����� ������ ������ ��� >> ����� �����.


����([],[]).

����([[]|_���],_�����):-
	����(_���,_�����).

����([[_���|_���]|_������],_�����):-
	�����(_���),
	����(_���,_���_�����),
	����([_���|_������],_���_�����),
	����(_���_�����,_���_�����,_�����).


����([[_���|_���]|_������],[_���|_�����]):-
	�� �����(_���),
	����([_���|_������],_�����).

����([_���|_������],[_���|_�����]):-
	�� �����(_���),
	����(_������,_�����).

�����([]).
�����([_|_]).

%% --------------------------------------------
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

%%=========================================

�����_������(_����, [_����|_]).


���_���(A,B,C):-
	findall(A,B,C).



���_�����(_����, _�����):-
    ����_������(_����, _�����),
    �����(_�����),
    _���� ��� _����� * _���� +1,
    ����(_����, _�����),
    �����_����(_�����, _����, _�����).



%% ���_������(_����,_����,_����).  ��� �� ����� ������ ������ ��� ������ ������.
%%===============================
���_������(_����,_����,_����):-_����=<_����.

���_������(_����,_����,_����):-_���� <_����,
                                _����_���� ��� _���� + 1,
                                ���_������(_����_����,_����,_����).




���_�����(_���,_���):- _��� >= 0 .
���_�����(_���,_�����):- _���< 0, _����� ��� _���*(-1).



%============================ 17. �. ============================== 

                             
                                                                                
%%% 17. �.  �����_�����_������(_����_����,_�����_�����,_�����_����).                       

%%% ��� ��' 1: ���� �� ����� ����� ��� ������ ������ ������ ����� ���� �� ������ ������� ��� '�����'
�����_�����_������(_����,[],[]). 

%%% ��� ��' 2:                                               
�����_�����_������(_����,[_����|_�����],_�����).                                

%%% ��� ��' 3:
�����_�����_������(_����,[_����1|_�����],[_����1|_�����_����]):-                
     			_���� \= _����1,
     			�����_�����_������(_����,_�����,_�����_����). 



%%====================================================================



����_����(_����,[_����|_���],_���).

����_����(_����,[_�����|_���],[_�����|_���_���]):-
			����_����(_����,_���,_���_���).
	
		
%%====================================================================


	
�����([],[]). 
                                                                  
�����([_����|_�����],[_���_�����|_�����1]):-                                    
     				���(_����,_���_�����),                                                     
     				�����(_�����,_�����1).  
  

%%====================================================================



% �����_���(_��������,_�����,_�������).

�����_���(_��������,[],[]).

�����_���(_��������,[_����|_���],[_������|_���_������]):-
	���_���(_��������,_����,_������),
	�����_���(_��������,_���,_���_������).

%%% ���_���(����,_��,_����):-
%%%	�����(_��,_,_����).


%%====================================================================


%% �����_������(_������_����_������, _������_������, _������).
%% ============================================================


%% �. ��� �����. �� ������ ���� ������ ��� ���� �� �� ����� ������ ��� ����.

�����_������([],_,[]).



%% �. �� ����� ����� ���� ������ ����� ������ ���� ������ ������ 
%%    �� ������� ���� �������� ������ ����� ������� �� ��� ���� ������ ������.

%%    ���� �- !  (cut), ���� ��� ������ else.  �� ���� ���� ������ ����� �- ! ������� ���� ���� ����������.

�����_������([_����|_���_�����],_�����,_�����_����):-
		���(_����,_�����),!,
		�����_������(_���_�����,_�����,_�����_����).



%% �. �� ����� ����� ���� ������ ����� ������ �� ���� ������ ������ 
%%    �� ������� ���� ������ ������ �������� ������ ����� ������� �� ��� ���� ������ ������.

�����_������([_����|_���_�����],_�����,[_����|_���]):-
		�����_������(_���_�����,_�����,_���).

%%================================================================================================= 
                          
                                                                                
%%% 18. ����_��(_����_����,_�����_�����,_�����_���_��_������_�����_�����).  
%%========================================================================
           
����_��(_����,[],[]). 
                                                          
����_��(_����,[_����|_�����],_�����_����):-                                     
     			����_��(_����,_�����,_�����_����). 
                                        
����_��(_����,[_����1|_�����],[_����1|_�����_����]):-                           
     					_���� \= _����1,
     					����_��(_����,_�����,_�����_����).  

%%================================================================================================= 
                                     
                                                                                
%%% 19. �����_�����(_�����_�����,_�����_����_���_��������). 
%%=========================================================
                           
�����_�����([],[]).    
                                                         
�����_�����([_����|_�����],[_����|_�����_����]):-                               
     				����_��(_����,_�����,_�����1),                                             
     				�����_�����(_�����1,_�����_����).  

%%=================================================================================================    



                                                                                
%%% 37. ����(_�����,_�����_����). - ���� ����� ������ ����� ���� ������ ���.
%%===========================================================================

����([_�����],_����� ).

����([_�����|_���_�������],_�����_�������):-
       		����(_���_�������,_�����_���_�������_��������),
       		����(_�����,_�����_���_�������_��������,_�����_�������).

%%=================================================================================================    


/*

%% ����� while - �� 2 �����
%% -----------
%% �� ��� ��� �-2 ������ �� ������, ������ ������ �����.

����_��_���_��(_���1,_���2):-
	����_���(_���1,_,_);
	����_���(_���2,_,_).

����_���(_���,_�,[_�|_���]):-�� _���.
����_���(_���,_�,[_|_���]):-�� _���,����_���(_���,_�,_���).

*/

%%===============================================================================
%%===============================================================================
%%===============================================================================
%%================================ ����� �������� ===============================
%%===============================================================================
%%===============================================================================
%%===============================================================================

%% �� ����� ��� �� �����.
%% ======================

����_�������(_����, _������):-
			_���� < 10,
			����_�������(_����, _������).



%% �� ����� ��� ��� ���� ���� ���� ���.
%% =====================================

����_�������(_����, _������):-
			_���� >= 10,
			���_����(_����, _�����, _���),
			����_�������(_�����, _������_�����),
			����_�������(_���, _������_��_���),
			����_�������([_������_��_���,_������_�����], _������).



%% ����� �� ���� ������ �� �����.
%% ===============================

���_����(_����, _�����, _���):-
			_�����  ���  _����  mod 10,
			_���  ���  _����  // 10.



%% ����_�������(_����_����, _����_�������).
%% =========================================

����_�������(0, '0').
����_�������(1, '1').
����_�������(2, '2').
����_�������(3, '3').
����_�������(4, '4').
����_�������(5, '5').
����_�������(6, '6').
����_�������(7, '7').
����_�������(8, '8').
����_�������(9, '9').


%%==========================================================================



%% �� ��� ���� ����/������
%% =======================

����_���(_��):-
	����(_��),����.

����_���(_��):-
	����('���� '),
	����(_��),����,����.

%%===============================================================================


���_������(_����, _����, _���, _�����):-
            _��� ��� _���� // _����,
            _����� ��� _���� mod _����.
	

