
%% ��� ����
%% --------
%%
%% ����	: ���� ����.
%% -----------------



%% ���_����(_���, _����, _���_���)
%% ===============================


���_����( _���, �����, _���):-
                 ����(����_�����).	%% ������ ������� ������: '����_�����'
	
				
%% ===================================================================================


���_����( _��� , ����� , _���_���):- 
                            ���_�����(_���),                             
                            �����(����_���_����(_���, 3 , _����), _����),!,
                            ����(_����),
                            ����,		
                            ���_����_�����(_����),!,
                            �����('�� ����� ������'),
                            ����_��_����(_����),
                            ���_����_��_����(_���, _����, _���_���),
                            !.


����_��_����(_����):-
	�����('?��� ���� ���� �� ����',4,[��,��],��),!,				
	���_����_���(600, 50 , 1600, 850, 240, 102, '����'),
	���,
    	���_�����(_����,_),

    	%%%=======================
    	����_�����('���� �� ��� ����� �����'),
    		���_�����(_���),
    		!,
    	%%% =======================

    	����_����_���('����'),

	����_����_���('Flood Fill').



����_��_����(_).

		

���_����_��_����( _���, _����, _���_���):-
                                   _��� = ���(_���,_���),
                                   �����('?��� ���� ���� �� ������',4,[��,��],��),!,	
                                   ���_����(_���,_����,_���_���),
                                   ���_����_�����(_����),
                                   1=1.


���_����_��_����( _���, _����, _���):-
		���_����_�����(_����).



���_����_�����(_�����):-
		�����_����(_�����, _����),
		��_����( _����, 'images\\ADV.bmp').
		


���_����_�����(_�����):-
		�����_����(_�����, _����),
		��_����( _����, 'images\\oval_empty.bmp').			



%% ===================================================================================

���_����( _, ���� , _���):-
			���_����(_���).

�����_���_����(_���):-
                      ���_��(���_����(_)),
                      ����(���_����(_���)).


%% ===================================================================================


���_����( _���, ����_���, _���_��� ):- 
	                                ���_����(_���_���),
                                        !.

%% ===================================================================================

���_����( _���,������, _��� ):- 
	                                ���_����_���(1000, 200 , 1600, 400, 240, 102, '������'),
	   				���,

    					�����('Images\\orar.bmp'   ,  0, 0, 600, 200 , _),

    					���_�����(_���),
    					!,
    				
    					����_����_���('������'),

					����_����_���('Flood Fill'),

                                        !.

%% ===================================================================================

���_����( _���,�����, _��� ):- 

	                        ���_�('GameSave.pro'),  

                       		����_���(_�����, _�����),
                        	����('����_���('),
                        	����(_�����),
                        	����(', '),
                        	����(_�����),
                        	����(').'),

                        	����, ����, ����,

                        	���_����(����, _���_����_1),
                        	����('���_����(����, '),
                        	����(_���_����_1),
                        	����(').'),

                       		����, ����, ����,

                        	���_����(���, _���_����_2),
                        	����('���_����(���, '),
                        	����(_���_����_2),
                        	����(').'),

                        	����, ����, ����,
  
                      		%% ����� ����.
                        	����('���_����('),
                        	����(_���),
                        	����(').'),

                        	����_�,

                        	�����('������ ������ ������'), !.

%% ===================================================================================

���_����( _, ���_����, _��� ):- 
	                        ����_�����,
  				
                            	���_�('GameSave.pro'),

                            	���(����_���(_�����, _�����)),
                            	����(����_���(_�����, _�����)),
									
                            	���(���_����(����, _���_����_1)),		
                            	����(���_����(����, _���_����_1)),		
								
                            	���(���_����(���, _���_����_2)),		
                            	����(���_����(���, _���_����_2)),

                            	���(���_����(_���)),

                            	����_�('GameSave.pro'),

                            	����_���(_���),
                            	���_���(_���),
                                �����('.������ ������� ������'),
                                !.


%% ===================================================================================

%% ���_����(_���, _����, _���_���)
%% ===============================
  
%% ���_����(_���, 						%% ���� ���� ����
%%         _����,  		 				%% _���� = ����( _���, _������, _������)			
%%         _���_��� ):-						%% ���� ���� ����� ������ �����, ���� ����� ���.


%%===============================================================================



%% ����_����( _���,  _���_����)
%%==============================

����_����(��� , ����).

����_����(����, ���).



%% ==============================================================================


���_����( ���(_���, _���), 
	  ����(_�����), 
	  ���(_���_����, [ ���(_���, _�����) | _���])):-							
			
			����_����( _���,  _���_����),!.
		


���_����( ���(_���, _���), 
	  _�����, 
	  ���(_���_����, [ ���(_���, _�����) | _���])):-							
			
			����_����( _���,  _���_����),!.				


			