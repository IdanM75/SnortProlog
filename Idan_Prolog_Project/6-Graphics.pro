
%% ������
%% ------
%%
%% ����	: ���� ����
%% ----------------



%% ����_���(_���).  -	��� �� ����� �� ����.	
%% ==========================================

����_���(���(_���,_���)):-
		����_���(_���),
		����_���_��(_���).


%% ���� ��� ����� ����� ���� ��� �� ���� ����.
%% ===========================================

����_���_��(_���):-
		����,
		����,
		����('��� ���� �� ����� �'),
		����(_���),
		����.


%% ���� ��� ����� ����� �������� �� ��� ����� �� �� ����� ������� ����.
%% ====================================================================

����_���(_���):-  
	����_���(_�����,_�����), 	
	
	����,����,
	����('    '),

	���_������(1,_���1,_�����),				
		����('  '),����(_���1),����_����_��_����(_���1),		
	_���1 = _�����,

	����,
	����('    '),

	���_������(1,_���2,_�����),
		����(' ---'),
	_���2 = _�����,

	���_������(1,_����,_�����),
		����,
		����('  '),����(_����),����_����_��_����(_����),

		���_������(1,_���,_�����),
			����_�����( �����(_����,_���), _���),
		_��� = _�����,


		����('|'),����,
		����('    '),

		���_������(1,_���3,_�����),
			����(' ---'),
		_���3 = _�����,
	_���� = _�����,
	����.



%% ���� ��� ���� ��� ������ ���� �������� ��� ���� �� ���� ���� ����� ��� ���� �� �����.
%% ======================================================================================

����_����_��_����(_����):-
		_���� < 10,!,
		����(' ').


%% ��� ��� ���� ���� ���, ������� ����� ���� �� �� _���� ���� �- 10 �� �� _���� ����� ����.
%% =========================================================================================

����_����_��_����(_����).	



%% �� �� ��� �� ������ ������� ������ �� ������ ��� ����, ���� ������ ���� ���.
%% =============================================================================

����_�����(_�����,_���):-               		
		����('|'),
                �����_�����(_�����),
		���(���(_���,_�����),_���), !,	
		����_��_���(_���, _����),
		����(' '),����(_����),����(' ').


%% ����� �� ������ �� ������ ����.
%% ===============================

����_�����(_�����,_���):-
                �����_�����(_�����),
		����_��_���(���, _����),
		����(' '),����(_����),����(' ').

����_�����(_�����,_���):-
		     �� (�����_�����(_�����)),
                     ����('XXX').         


����_��_���(���� , '�').
����_��_���(���  , '�').
����_��_���(���  , ' ').



%%===============================================================================
%%===============================================================================
%%===============================================================================



���_���( _��� ):-
		����_���_��(_���, _����),
		����_���(_���, _���),
	     
		���_���(_���),	
		���_���_��(_����).


���_���_��(_���):-
	����_���( _���, _���� ),

     %% �����( _����, _����, _���� , _���� , _���� , _����),
	�����( _���� ,  630, 40, 120 , 65 , _���� ),
	
	����_�����_������_����( _�����_���� ,  ���),
	����_����_������_����( _�����_����  , _����),

	����(_�����_����),
    							
	1 = 1 .						
													


����_���( ��� , 'Images\\TW.BMP' ).
����_���( ����, 'Images\\TB.BMP' ).



%% ���� ��� ���� ����� ���� �� ��� ����� �� �� ����� ������� ����.
%% ================================================================

���_���(_���):-

	�����('Images\\backround.bmp'   ,  0, 0, 1050, 1050 , _),
	
	����_���(_�����, _������),

	���_������(1 , _����, _�����),
				
		���_������(1 , _�����, _������),

			����_����_������( _�����, _���� ),
			����_���_������( _�����, _����� ),
					                           	   
			���_�����( _����� , _���),

		_����� = _������,
	_���� = _�����,

	 ����_������,

	1 = 1.


%% ���� ��� ����� ������, ������ ������� ����.  ������ ������� �� ������� ����� ���� ����.
%% =======================================================================================

����_������:-
	�����_�����(_����, _�����, _����, _����, _����, _����),
		�����(_����, _����, _����, _����, _����, _����),

	        ����_�����_������_����( _�����_����, _�����),
		����_����_������_����( _�����_����  , _����),

		����(_�����_����),

	����.


����_������.


%% �����_�����(_����, _�����, _�����_����, _�����_����, _����, _����)
%% ==================================================================

�����_�����('Images\\ora.bmp'        , ������    , 630, 160, 120, 60).
�����_�����('Images\\Advice.bmp'     , �����     , 630, 220, 120, 60).
�����_�����('Images\\back.bmp'       , ����      , 630, 280, 120, 60).

�����_�����('Images\\NewGame.bmp'    , ����_���  , 630, 400, 120, 60).
�����_�����('Images\\save.bmp'       , �����     , 630, 460, 120, 60).
�����_�����('Images\\reload.bmp'     , ���_����  , 630, 520, 120, 60).
�����_�����('Images\\exit.bmp'       , �����     , 630, 580, 120, 60).



%% ����_�����(_����, _����) - ��� ������� ������ �����.
%% ========================

   ����_�����(70 , 70).	


%% ���� ��� ���� ���� ����� �� ������ ������� ����� ��. ������ �� ������� �� ��� 1 - 10.
%% ======================================================================================

/*
	����   	|  	����� ������
	--------|------------------------
	  1    	|	Images\pic1.bmp
	  2    	|	Images\pic2.bmp
	  3	|	Images\pic3.bmp
	  4	|	Images\pic3.bmp
	  ..	|	...	
	  ..	|	...
	  10	|	Images\pic10.bmp

*/


�����_�����(_����, _����):-
	����_�������(_����, _���_�������),						
	����_�������(['Images\\', 'pic', _���_�������, '.bmp'], _����).



%% ���� ��� ���� �� ������ ������� ��� ����� ����� ��� ����� �����  '���/2'
%% ========================================================================


���_�����(_����� , _���):-
    	�����_�����_������(_�����, _����, _����, _����, _����),
    	�����_������(_�����, _���, _����),
    	�����(_����, _����, _����, _����, _����, _����),

    	����_�����_������_����( _�����_����, _�����),
	����_����_������_����( _�����_����  , _����),

    	����( _�����_���� ),

	1 = 1 .


%% �� ������ ����� ����� ����� �� �� ������ ���� ��� ����� ����. 
%%==============================================================

���_�����(_����� , _���):-				
		   ��  �����_�����(_�����).



%% ���� ���� ����������� ���������� �� ����� ������ ���� ������������ ������ �������� ���� �����.
%% ================================================================================================

�����_�����_������(_�����, _����, _����, _����, _����):-

					����_����_������( _�����, _���� ),
					����_���_������( _�����, _����� ),

    					����_�����(_����, _����), 
					
					_�����_���� ��� _�����,
					_����_���� ��� _����,
					

					_����  ���   _���� * _�����_����*3//4,	%% ������ ����� �� ������� ������� ������� �� �� ��� ����
    					_����  ���  _����  * _����_����//2 +0.	%% ��� ����� ������ ����� ����� ����� ����� ������



%% �� ���� ���� �� ���� �� �� �� �����.
%% ====================================

�����_������(_����� , _����, _����):-
		����_�����_����(_���, _�����),
		����_���_��_���(_���, _���),
		����_���_����(_����, _���),
    		
		�����_����(_���,  _����),!.



%% �� ���� �� ���� �� ���� , ��� ������ �����, �� ����� ����� ����.
%%			     ================
%% =================================================================


�����_������(_����� , _����, 'Images\\FillBlack.bmp'):- %% ��� ��� ����
                       		����_�����_����(_���, _�����),
		       		�� ����_���_�����(_����, _���),
                       		�����_�����(_�����),
		       		����_���(_���_����, _����),
		       		����_���_��(_���_����, ����),
		       		�� ����_����(_���_����, ����(_�����)),
		       		����_���(_���_���, _����),
		       		����_���_��(_���_���, ���),
		       		����_����(_���_���, ����(_�����)).


�����_������(_����� , _����, 'Images\\FillWhite.bmp'):- %% ��� ���� ����
                       		����_�����_����(_���, _�����),
		       		�� ����_���_�����(_����, _���),
                       		�����_�����(_�����),
		       		����_���(_���_����, _����),
		       		����_���_��(_���_����, ����),
		       		����_����(_���_����, ����(_�����)),
		       		����_���(_���_���, _����),
		       		����_���_��(_���_���, ���),
		       		�� ����_����(_���_���, ����(_�����)).


�����_������(_����� , _����, 'Images\\FillBoth.bmp'):- %% �� ��� �� ���� �����
                       		����_�����_����(_���, _�����),
		       		�� ����_���_�����(_����, _���),
                       		�����_�����(_�����),
		       		����_���(_���_����, _����),
		       		����_���_��(_���_����, ����),
		       		�� ����_����(_���_����, ����(_�����)),
		       		����_���(_���_���, _����),
		       		����_���_��(_���_���, ���),
		       		�� ����_����(_���_���, ����(_�����)).



�����_������( _����� , _���� , 'Images\\oval_empty.bmp' ):- %% ��� ������ ������ �����
				����_�����_����(_���, _�����),
				�� ����_���_�����(_����, _���),				
				�����_�����(_�����),
				����_���(_���_����, _����),
		    		����_���_��(_���_����, ����),
		     		����_����(_���_����, ����(_�����)),
		       		����_���(_���_���, _����),
		       		����_���_��(_���_���, ���),
		       		����_����(_���_���, ����(_�����)).



%% ��� ��� �� ���� ������ ��.
%% ==========================

�����_����(����, 'Images\\Black.bmp').

�����_����(��� , 'Images\\white.bmp').



%%===============================================================================
%%===============================================================================
%%================================ ����_����( _��� ) ============================
%%===============================================================================
%%===============================================================================



%% ����_����( _��� ) - ���� �� ���� ���	
%% =======================================


%% ����_����( _���_���)
%%=======================

����_����( _���):-
		����_���_��(_���, _���),
		����_���(_���, _���),
		����_���(_���),
		����_���(_���).




%% ����� �� �� ������� ��� �� ������ ������ �������, �� ������� �� �������� ������.
%%=================================================================================


����_���(_���):-
	����_���(_�����, _������),
	���_������(1 , _����, _�����),				
		���_������(1 , _�����, _������), 
			����_����_������(_�����, _����),
			����_���_������(_�����, _�����),
			����_�����( _�����, _���),
		_����� = _������,
	_���� = _�����.

����_���(_). 



%% ������ �� ������ ������ ����� ����� �� �� ���� ����� ���� ��.
%%==============================================================

����_�����( _�����, _���):-
    	�����_������(_�����, _���, _����),
	����_�����_������_����( _�����_����, _�����),
	����_�����_����(_�����_����),
	����_����_������_����( _�����_����  , _����),
	��_����(_����,_����).



����_���(_����):-
		����_�����_������_����( _�����_����, ���),
		����_�����_����(_�����_����),
		����_����_������_����( _�����_����  , _����),	 
		
		����_���(_����,_����),
		��_����(_����,_����).
