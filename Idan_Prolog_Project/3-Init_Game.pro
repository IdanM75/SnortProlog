
%% ���� ����
%% ---------
%% ����	: ���� ����.
%% -----------------


����_����:-
        ����_�����,

	���_����_���,
        ���_��_�����,
        ���_���_����_���,
        ���_���_����_����,

        %% ���_����_���(_����_�����_����, _����_�����_���� , _����_�����_����, _����_�����_����, _���_����, _���_�����, _��_����),
           ���_����_���(100, 100, 900, 800, 16, 162, 'Flood Fill'), 

	���_������(_���),
        ����_���(_���),
	����_���(_���), 
        ����(���_����(_���)),


        ���_���(_���),			

	1=1.



����_�����:-  ���_��(����_���(_, _)),
              ���_��(���(_, _)),
              ���_��(���_����(_, _)),
              ���_��(���_�����(_)),
              ���_��(���_����(_)),

              ���_��(����_�����),

	      ���_��(�����_����(_, _)),
	      ���_��(����_����(_)).



%%===========================�����================================%%

%% �����( �����_X_����_�����_������   , �����_Y_����_�����_������, 
%%        �����_X_����_������_������  , �����_Y_����_������_������, 
%%        ���_����_��_������_�����    , ���_����_��_��_������_�����_��_���_������,
%%        �����_���������_���_��_�����, _������ ).
		
%%===============================================================================



���_����_���:-
		�����(570, 30, 800, 200, 138, 139, ['����� �� 3', '����� �� 4', '����� �� 5'], _�����), 		
		���_��(����_���(_,_)),                
		����_���_���(_�����).

���_��_�����:-
                �����(570, 30, 800, 200, 138, 139, ['���� �����', '����� �����', '�������'], _�����),
                ���_��(���_������( ���(_,_))),
                ����_���_��(_�����).

���_���_����_���:-
                �����(570, 30, 800, 200, 138, 139, ['��� ����','��� ���� 0', '��� ���� 1', '��� ���� 2','��� ���� 3','MinMax ���'], _�����),
                ���_��(���_����(_,_)),
                ����_���_����_���(_�����).

���_���_����_����:-
                �����(570, 30, 800, 200, 138, 139, ['���� ����','���� ���� 0', '���� ���� 1', '���� ���� 2','���� ���� 3','MinMax ����'], _�����),
                ����_���_����_����(_�����).



����_���_���('����� �� 3'):-
                           ����(����_���( 9, 5)),		 	
		           1 = 1.

����_���_���('����� �� 4'):-
                      	   ����(����_���( 13, 7)),		 	
			   1 = 1.

����_���_���('����� �� 5'):-
                           ����(����_���( 17, 9)),				
		           1 = 1.



����_���_��('���� �����'):-
                           ����(���_������( ���( ��� ,[] ))),
                           1 = 1.

����_���_��('����� �����'):-
                           ����(���_������( ���( ���� ,[] ))),
                           1 = 1.

����_���_��('�������'):-
                           ����_����(2,_����),
                           ����_����(_����,_���),
                           ����(���_������( ���( _��� ,[]))),
                           1 = 1.



����_���_����_���('��� ����'):-
                           ����(���_����(���, �����(����))),
                           1=1.

����_���_����_���('��� ���� 0'):-
                           ����(���_����(��� , ����(0))),
                           1=1.

����_���_����_���('��� ���� 1'):-
                           ����(���_����(��� , ����(1))),
                           1=1.

����_���_����_���('��� ���� 2'):-
                           ����(���_����(��� , ����(2))),
                           1=1.

����_���_����_���('��� ���� 3'):-
                           ����(���_����(��� , ����(3))),
                           1=1.

����_���_����_���('MinMax ���'):-
                           ����(���_����(��� , ����(4))),
                           1=1.



����_���_����_����('���� ����'):-
                           ����(���_����(����, �����(����))),
                           1=1.

����_���_����_����('���� ���� 0'):-
                           ����(���_����(���� , ����(0))),
                           1=1.

����_���_����_����('���� ���� 1'):-
                           ����(���_����(���� , ����(1))),
                           1=1.

����_���_����_����('���� ���� 2'):-
                           ����(���_����(���� , ����(2))),
                           1=1.

����_���_����_����('���� ���� 3'):-
                           ����(���_����(���� , ����(3))),
                           1=1.

����_���_����_����('MinMax ����'):-
                           ����(���_����(���� , ����(4))),
                           1=1.



����_����( _����_�����, _����):- �����(_����_���_0_�_1),
                                 _����_���� ��� _����_���_0_�_1 * _����_����� + 1,
                                 ����(_����_����, _����).

����_����(1,����).
����_����(2,���).



%% ����_���(_�����,  _�����)
%%==========================

%%����_���( 9 , 5). %% ����� �� ����
%%����_���( 13, 7). %% ����� �� ����
%%����_���( 17, 9). %% ����� �� ���



%%���_������( ���( _��� ��,_�����_����)).
%%=======================================		



%% ����_���(_���).		
%% ===============

%% ��� �� ���� ������ �� ������:  ���_�����(_���).



����_���(_���):-
	���_��(���_�����(_)),
        ����(���_�����(_���)).
