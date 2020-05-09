 /*
 **                  gfxHebrew.pro
 **
 **              ���� ������ ������
 **
 **                   � � � � �
 **                ���� ����� ���� 
 **          
 **               �� ������� ������ 
 */





 /*   
 **   EXTENDED PREDICATES:
 **   --------------------
 */



% show_message(MessageString).
% Opens a little window with a message and an OK button.

% ����� ���� ��� �� ������ 
% MessageString.
�����(MessageString):-	
	show_message(MessageString).


/*************************/


/*
get_message(Caption,Message,Default,UserText).
���� ���� ���� ��� ������ ����� ������. 
������ ����� �� �� �����,
 ������ ��� ���� ���� ������ ���� ���� ���� ����.
 ����� ����� �� ������ (�� ���� �� ��� �����).

*/
�����_������(Caption,Message,Default,UserText):-
	get_message(Caption,Message,Default,UserText).


/*************************/

/*
show_query(Message,Style,ButtonList,Selected).
���� ���� ����� �����.
 ������ ����� �� ������, �� ��� ����� ����� ����� ������� ����� ������.
 ����� ����� �� ������ ����� (�� ���� �� ��� �����).
����� �����:
 1 - �����, 2 - �����, 3 - �����, 4 - �����, �� ��� ��� - ���� ����.
������� ������� - ��, ��, �����, �����, ����, �����, ��� ����, ���, ����
*/

�����(Message,Style,ButtonList,Selected):-
	show_query(Message,Style,ButtonList,Selected).


/*************************/

% grab_messages.
% Gets all windows messages and continues. Usefull in loops to wait for user's response.

% ���� �� �� ������� ������� �"� ����� ������ ������
% ���� ���� �� ������ ������ �� ������ ��� ����� �� �����, ����� ����� ����

���_������:-
	grab_messages.



/*************************/
/*
still_working(Process).
���� ��� ������ ����� ����� �����.
������� ������� - wait_read, wait_key, wait_time, wait_menu
( ����� �����, ����� ����� ���, ����� ���� ���, ����� ����� ��� �������)
*/
����_������(Process):-
	still_working(Process).

/*************************/

% mouse_location(WindowX,WindowY).
% Returns the current mouse location (cordinates relative to current window).
�����_����(WindowX,WindowY):-
	mouse_location(WindowX,WindowY).

/*************************/

% sensor(TrueFalse).
% Returns/resets the sensor value of the current window.
% If sensor is "on", current window will execute dynamic function. Otherwise, nothing happens.

�����_�����(TrueFalse):-
	sensor(TrueFalse).

/*************************/

% font_list(List).
% Returns list of installed system fonts.

�����_������(List):-
	font_list(List).

/*************************/

% startg.
% Opens graphic server (main screen).

% ����� ���� ����� (���� ����� �����), ����� ����� ���� 0
���_����:-
 	startg.   

/*************************/


% stopg.
% Closes graphic server (keeps what's on it).

% ����� ���� �����. ���� ���� �� �� ������� ������� ������
����_���_����:-
	stopg.  


/*************************/


% set_display(WindowID).
% if WindowID is an integer - it sets the current display.
% if WindowID is a variable - it returns the current display.

% �� ������ ��� ����� - ����� ���� ����� ����� ������ - ��� ����
% �� ����� ��� ���� ���� ����, ����� ��� ���� �� ����� ������
����_����(WindowID):-
	set_display(WindowID).

/*************************/


% set_caption(Name).
% if Name is a string - it sets the current window caption.
% if Name is a variable - it returns the current window caption.

% �� ������ ��� ����� - ����� �� ����� ����� ������
% �� ������ ��� ������ - ���� ������ �� ��� �����
�����_����(Name):-
	set_caption(Name).


/*************************/


% set_border(Border).
% if Border is an integer - it sets the current window border style.
% if Border is a variable - it returns the current window border style.


% �� ��� ������ ��� ����� - ����� ��� ������ �� ����� ������
% �� ��� ������ ��� ���� ������ ���� : ���� ����� ����� ����� �� ��
% ���� ��
�����_����(Border):-
	set_border(Border).  

/*
       **  border styles:  **
*      0 - no border						*
*      1 - single (in the middle)				*
*      2 - double (in the middle)				*
*     11 - single (in the far edge)				*
*     12 - double (two edges)					*
*     13 - triple (two edges and a middle)			*
*     21 - single (in the near edge)				*
*     51 - single, thick (in the middle)			*
*     52 - single, thick (in the far edge)			*
*     53 - single, thick (in the near edge)			*
*     61 - single, very thick (in the middle)			*
*     62 - single, very thick (in the far edge)			*
*     63 - single, very thick (in the near edge)		*
*								*
*   0-99 - no windows' border					*
*  100+N - normal window border plus user frame			*
*  200+N - thin window border plus user frame			*
*								*
*/


/*************************/

/*
set_icon(FileName).
���� �� ��� ����� ������ ������� �� �� ����
*/

���_����(FileName):-
	set_icon(FileName).

/*************************/

% open_window(X1,Y1,X2,Y2,Color,Border,WindowID).
% Opens a new window according to the cordinates 
% (cordinates are relative to the whole screen). It returns the WindowID.

���_����(X1,Y1,X2,Y2,Color,Border,WindowID):-
	open_window(X1,Y1,X2,Y2,Color,Border,WindowID).


/*************************/

% new_window(X1,Y1,X2,Y2,Color,Border,Name).
% Same as open_window, just sets the current Name for the window.

���_����_���(X1,Y1,X2,Y2,Color,Border,Name):-
	new_window(X1,Y1,X2,Y2,Color,Border,Name).

/*************************/

% current_window(Name).
% Same as set_display, just returns/selects the window by its Name (caption).
����_����_���(Name):-
   	current_window(Name).


/*************************/

% window_location(NewX,Newy).
% Sets/Returns the window location according to cordinates (relative to screen).

�����_����(NewX,Newy):-
	window_location(NewX,Newy).

/*************************/


% close_window(WindowID).
% Closes the specific window.

����_����(WindowID):-
	close_window(WindowID).

/*************************/

% free_window(Name).
% Same as close_window, just the window is identified by its Name (caption).

����_����_���(Name):-
	free_window(Name).


/*************************/

% close_window.
% Closes the current window and sets the main one, as the current display .

����_����:-
	close_window.

/*************************/

% update_display.
% Updates current window's display.

����_�����:-
	update_display.

/*************************/

/*
window_size(Width,Height).
����� �� ����� ����� �� ����� ������ (�� ���� �� ����� ���).
*/
����_����(Width,Height):-
	window_size(Width,Height).


/*************************/

% max_text(MaxX,MaxY).
% Returns the maximum text can be written in the current window.

���_����_�����(MaxX,MaxY):-
	 max_text(MaxX,MaxY).


/*************************/

% locate_cursorh(X,Y).
% Locates the textual cursor according to cordinates (relative to current window).

���_���(X,Y):-
	locate_cursorh(X,Y).	

/*************************/

% get_cursorh(X,Y).
% Gets the location of the textual cursor according ...

�����_���(X,Y):-
	get_cursorh(X,Y).

/*************************/

% show_cursorh.
% Makes the cursor of the current window visible.

���_���:-
	show_cursorh.

/*************************/

% hide_cursorh.
% Makes the cursor of the current window invisible.

����_���:-
	hide_cursorh.

/*************************/

% writeh(Text).
% Writes a text string on current window, in the current cursor location and in the current color.

����_�����(Text):-
	writeh(Text).

/*************************/

% write_colroh(Text,Color).
% Same as writeh, just in a certain temporary color.

����_����(Text,Color):-
	write_colorh(Text,Color).	


/*************************/
/*
transp(TrueFalse).
������ �����, ����� ���� ��� ��� �� ����� �� ��� ����
 ������ �� ��� ���� ����� ���� ���������.
 ������ ���� (1 ����� "��" �-0 ����� "��), ����� ���� �� �������.
*/

����_��_����(TrueFalse):-
	transp(TrueFalse).

/*************************/

% puth(Key).
% Writes a single character which its ASCII code is Key.

���_��(Key):-
	puth(Key).

/*************************/
% puth(Key,N).
% Exectues puth/1 N times.

���_��(Key,N):-
	putnh(Key,N).

/*************************/
% tabh(N).
% Executes puth(32,N) - N spaces ...
����_�����(N):-
	tabh(N).

/*************************/
% nlh.
% Starts a new line in current display.

����_�����:-
  	nlh.
  
/*************************/
% colorh(Color).
% if Color is an integer it sets the color as the current color.
% if Color is a variable it returns the current color in the current window.
���_����(Color):-
	colorh(Color).

/*************************/
% sound(Freq,Dur).
% Plas the specific frequency, Dur miliseconds.

����(Freq,Dur):-
	sound(Freq,Dur).
/*************************/
% clearh.
% Clears current display.

���:-
	clearh.
	
/*************************/

% clear_colorh(Color).
% Same as clearh, just in a certain temporary color.

���_����(Color):-
	clear_colorh(Color).	

/*************************/
% readh(Data).
% Reads data from user in current window. 
% If Data in an integer it returns an integer, and if it's a string - as a string.

���_�����(Data):-
	readh(Data).

/*************************/

% waith(Dur).
% Waits Dur miliseconds.

����(Dur):-
	waith(Dur).

/*************************/
% get_keyh(Key).
% Waits for a key to be pressed by user on current display. 
% It returns its code.

���_���(Key):-
	get_keyh(Key).	

/*************************/

/*
*       ** key codes:						*
*       1001 - INSERT						*
*       1002 - HOME						*
*       1003 - PAGE UP						*
*       1004 - DELETE						*
*       1005 - END						*
*       1006 - PAGE DOWN					*
*       1007 - UP						*
*       1008 - LEFT						*
*       1009 - DOWN						*
*       1010 - RIGHT						*
*								*
*								*
*       All other keys are according to their ASCII codes.	*
*								*
*/


/*************************/

% wait_key.
% Waits for any key to be pressed.

����_���:-
	wait_keyh.

/*************************/

% key_pressedh.
% Succeeds if any key is pressed and fails otherwise.

����_���:-
	key_pressedh.

/*************************/

% key_pressingh.
% Succeeds if any key is pressed and fails otherwise (keeps while key is down).

���_����:-
	key_pressingh.

/*************************/

% cordinates(TextX,TextY,GraphX,GraphY)
% Converts textual <=> graphical window cordinates.

���_�����������(TextX,TextY,GraphX,GraphY):-
	cordinates(TextX,TextY,GraphX,GraphY).


/*************************/

% rectangle(X1,Y1,X2,Y2).
% Draws a rectangle in current window according to cordinates given 
% (relative to current window). The border is determined by "pen" and the fill is determined by "brush".

����(X1,Y1,X2,Y2):-
	rectangle(X1,Y1,X2,Y2).

/*************************/

% ellipse(X1,Y1,X2,Y2).
% Similar to rectangle, except it draws an ellipse.

������(X1,Y1,X2,Y2):-
	ellipse(X1,Y1,X2,Y2).

/*************************/

% box(X1,Y1,X2,Y2).
% Similar to rectangle, except it doesn't have a border.
����_���_�����(X1,Y1,X2,Y2):-
	box(X1,Y1,X2,Y2).	

/*************************/
% line(X1,Y2,X2,Y2).
% Draws a line in current window according to cordinates given (relative to current window). 
% The color of the line is determined by "pen".

��(X1,Y1,X2,Y2):-
	line(X1,Y1,X2,Y2).

/*************************/

% arc(X1,Y1,X2,Y2,X3,Y3,XZ,Y4).
% Draws an arc in current window according to cordinates given (relative to current window). 
% The color of the arc is determined by "pen".

���(X1,Y1,X2,Y2,X3,Y3,XZ,Y4):-
	arc(X1,Y1,X2,Y2,X3,Y3,XZ,Y4).


/*************************/

% cirlce(X,Y,R).
% Draws a circle in current window according to cordinates given (relative to current window). 
% The color of the circle is determined by "pen" and the fill by "brush".

�����(X,Y,R):-
	circle(X,Y,R).

/*************************/
% connect(X,Y).
% Connects the current position of the graphic pointer to a certain point 
% (which its cordinates relative to current window). The color of the line is determined by "pen".

���_��_������(X,Y):-
	connect(X,Y).

/*************************/

% polyline(List)
% Draws lines from point to point in the List. Points are refered as a (X,Y) structure. 
% The starting point is the current location of the graphical pointer. 

���_������(List):-
	polyline(List).

/*************************/

% locate_pointer(X,Y).
% Locates the graphical pointer according to cordinates (relative to current window).

���_�����(X,Y):-
	locate_pointer(X,Y).

/*************************/

% find_pointer(X,Y).
% Gets the current location of the graphical pointer ...

�����_�����(X,Y):-
	find_pointer(X,Y).


/*************************/


% brush(Color,Style).
% Sets/Returns current brush proprties.
% Style 0 is the normal (solid). Others give nice patterns.

�����(Color,Style):-
	brush(Color,Style).
	
/*************************/
% pen(Color,Width,Style).
% Sets/Returns current pen proprties.
% Style 0 is the normal (solid). Others give nice patterns.

�����(Color,Width,Style):-
	pen(Color,Width,Style).


/*************************/

% paste_graphics(X1,Y1,X2,Y2,GraphicFile).
% Pastes a graphic file (and fits it to a given rectangle) on current window.

�����_������(X1,Y1,X2,Y2,GraphicFile):-
	paste_graphics(X1,Y1,X2,Y2,GraphicFile).

/*************************/

% rgb(Red,Green,Blue,Color).
% Implements a color by using red, green and blue ingredients.

���(Red,Green,Blue,Color):-
	 rgb(Red,Green,Blue,Color).

/*************************/

% multimedia_open(File).
% Opens and initializes multimedia control with specific file.

���_���������(File):-
	multimedia_open(File).	

/*************************/

% multimedia_play/stop/pause/rewind.
% Controls the multimedia control with the current file loaded.

����_���������:-
	multimedia_play.
����_���������:-
	multimedia_stop.
����_���������:-
	multimedia_pause.
����_���������:-
	multimedia_rewind.

/*************************/

% multimedia_direct(WindowID,X1,Y1,X2,Y2).
% Determines the display of the current multimedia to a certain window on a rectnagle on it.
% Cordinates are relative to current window.

���������_�����(WindowID,X1,Y1,X2,Y2):-
	multimedia_direct(WindowID,X1,Y1,X2,Y2).

/*************************/

% multimedia_unrect.
% Clears all multimedia directions in all windows.

���_���������_�������:-
	multimedia_unrect.

/*************************/

% menu(X1,Y1,X2,Y2,TColor,SColor,OptionList,Selected).
% Opens a menu in a given rectangle (cordinates are relative to screen). 
% The color is the same as textual color (a number which determines both text color 
% and background color). The second color is a textual color for the selection.
% The lists contains strings/atoms and if something is being selected
%  X returns the string/atom. If ESC is being pressed, it returns NO.

�����(X1,Y1,X2,Y2,TColor,SColor,OptionList,Selected):-
	menu(X1,Y1,X2,Y2,TColor,SColor,OptionList,Selected).	

 /*************************/

% clear_controls.
% Clear all dynamic controls in the current window.

���_������:-
	clear_controls.

/*************************/

% window_exists(WindowID).
% Checks whether a certain window exists according to its ID.

����_����(WindowID):-
	window_exists(WindowID).

/*************************/

% control_exists(ControlID).
% Checks whether a certain control exists according to its ID (in the current window).

����_����(ControlID):-
	control_exists(ControlID).

/*************************/

% destroy_control(ControlID).
% Destroys a certain control (such as button) from the current window, according to its ID given.

���_����(ControlID):-
	destroy_control(ControlID).	

/*************************/

% show_control(ControlID).
% Shows a certain control in a current window according to its ID given.

���_����(ControlID):-
	show_control(ControlID).

/*************************/

% hide_control(ControlID).
% Hides a certain control in a current window according to its ID given.

����_����(ControlID):-
	hide_control(ControlID).

/*************************/

% enable_control(ControlID).
% Enables a certain control in a current window according to its ID given.
����_����(ControlID):-
	enable_control(ControlID).

/*************************/

% disable_control(ControlID).
% Disable a certain control in a current window according to its ID given.
����_��_����(ControlID):-
	disable_control(ControlID).

/*************************/

% focus_control(ControlID).
% Sets focus on a certain control in a current window according to its ID given.
�����_����(ControlID):-
	focus_control(ControlID).

/*************************/

% btf_control(ControlID).
% Brings a certain control to the front of a current window according to its ID given.
����_�����(ControlID):-
	btf_control(ControlID).

/*************************/

% stb_control(ControlID).
% Sends a certain control to the back of a current window according to its ID given.

����_�����(ControlID):-
	stb_control(ControlID).
/*************************/

% control_surface(ControlID,X,Y,Width,Height).
% Resets/returns the location and size of a certain control according to its given ID. 
% The cordinates are relative to current window.

�����_����(ControlID,X,Y,Width,Height):-
	control_surface(ControlID,X,Y,Width,Height).

/*************************/

% control_caption(ControlID,Caption).
% Resets/returns the caption/text of a certain control according to its given ID.

��_����(ControlID,Caption):-
	control_caption(ControlID,Caption).

/*************************/

% control_font(ControlID,Name,Color,Size,Style).
% Resets/returns the font properties of a certain control. The color is a graphic color such as
% in "pen" or "brush" and can be determines via rgb/4.

����_����(ControlID,Name,Color,Size,Style):-
	control_font(ControlID,Name,Color,Size,Style).
	
/*************************/

% control_checked(ControlID,TrueFalse).
% Toggles between checked and unchecked mode, if TrueFalse is a variable and returns the new value.
% If TrueFalse is a value, sets as the new value (same as transp).

����_�����(ControlID,TrueFalse):-
	control_checked(ControlID,TrueFalse).

/*************************/

% control_resized(ControlID,TrueFalse).
% Returns/sets the current state of the control.

����_����_����(ControlID,TrueFalse):-
	control_resized(ControlID,TrueFalse).

/*************************/

% create_button(Caption,X,Y,Width,Height,ControlID).
% Creates a new button and adds it to the current window. The cordinates of the button are relative to current window. It returns an ID number to identif and handle the button

����(Caption,X,Y,Width,Height,ControlID):-
	create_button(Caption,X,Y,Width,Height,ControlID).

/*************************/

% create_editbox(Text,X,Y,Width,Height,ControlID).
% Creates a new editbox and adds it to the current window. 
% The cordinates of the editbox are relative to current window. 
% It returns an ID number to identif and handle the editbox

����_����(Text,X,Y,Width,Height,ControlID):-
	create_editbox(Text,X,Y,Width,Height,ControlID).
	
/*************************/

% create_label(Caption,X,Y,Width,Height,ControlID).
% Creates a new label and adds it to the current window. 
% The cordinates of the label are relative to current window. 
% It returns an ID number to identif and handle the label

�����(Caption,X,Y,Width,Height,ControlID):-
	create_label(Caption,X,Y,Width,Height,ControlID).

/*************************/

% create_checkbox(Text,X,Y,Width,Height,ControlID).
% Creates a new checkbox and adds it to the current window. 
% The cordinates of the checkbox are relative to current window. 
% It returns an ID number to identif and habdle the checkbox

����_�����(Text,X,Y,Width,Height,ControlID):-
	create_checkbox(Text,X,Y,Width,Height,ControlID).

/*************************/

/*
create_image(FileName,X,Y,Width,Height,ControlID).
���� ����� ������ ���� (�����) ��� ��, ��� �� ����� �����.

*/
�����(FileName,X,Y,Width,Height,ControlID):-
	create_image(FileName,X,Y,Width,Height,ControlID).

/*************************/


