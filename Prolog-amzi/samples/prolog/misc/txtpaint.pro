%-------------------------------------------------------------------
% TXTPAINT.PRO - a demonstration of Amzi! Prolog DOS mouse and
%                screen predicates.
%
% Copyright (c) 1994-1995, Amzi! inc.
% All rights reserved
%
% To run the program, enter ALIS TXTPAINT at the DOS prompt.
%

%-------------------------------------------------------------------
% main/0 - the main entry point, called by ALIS or the runtime engine
%

main :-
  initialize,
  mouse_loop.

%-------------------------------------------------------------------
% initialize/0 - initialize the various screen areas
%

initialize :-
  cls,
  banner,
  color_menu,
  brush_menu,
  quit_button,
  drawing_area,
  hide_cursor,
  m_reset,
  m_show.

  banner :-
    tmove(0,0),
    tab(20), write($TXTPAINT - A Demonstration of the Amzi! Prolog\n$),
    tab(20), write($      DOS mouse and screen predicates.$).

  color_menu :-
    tmove(4,0),
    write($Color$),
    tmove(5,0), attr(red, Ared), wca(2, 219, Ared),
    tmove(5,2), attr(blue, Ablue), wca(2, 219, Ablue),
    tmove(6,0), attr(green, Agreen), wca(2, 219, Agreen),
    tmove(6,2), attr(yellow, Ayellow), wca(2, 219, Ayellow).

  brush_menu :-
    tmove(4,6),
    write($Brush$),
    attr(white, Aw),
    tmove(5,6), wca(2, 219, Aw),
    tmove(5,8), wca(2, 178, Aw),
    tmove(6,6), wca(2, 177, Aw),
    tmove(6,8), wca(2, 176, Aw).

  quit_button :-
    attr(blue:cyan, At),
    tmove(8,1), wca(1,` , At),
    tmove(8,2), wca(1,`Q, At),
    tmove(8,3), wca(1,`u, At),
    tmove(8,4), wca(1,`i, At),
    tmove(8,5), wca(1,`t, At),
    tmove(8,6), wca(1,` , At).

  drawing_area :-
    attr(cyan, A),
    tmove(4,13), wca(1,201,A),
    tmove(4,14), wca(65,205,A),
    tmove(4,79), wca(1,187,A),
    cntr_set(1,5),
    repeat,
    cntr_inc(1,R),
    tmove(R,13), wca(1,186,A),
    tmove(R,79), wca(1,186,A),
    R >= 22,
    tmove(23,13), wca(1,200,A),
    tmove(23,14), wca(65,205,A),
    tmove(23,79), wca(1,188,A),
    !.
    

%-------------------------------------------------------------------
% mouse_loop/0 - respond to various mouse clicks
%

mouse_loop :-
  attr(red,Ared),
  assert(color(Ared)),                       % initialize color and brush
  assert(brush(219)),
  repeat,
  m_press(0, _, _, _),                     % reset the press counter to 0
  get_press(R,C),
  process_press(R,C),
  done.                          % 'done' will be assert when quit picked

  get_press(R, C) :-
    repeat,
    m_press(0, Np, R, C),
    Np > 0,
    !.

  process_press(R,C) :-
    loc(quit,R,C),
    assert(done),
    m_hide,
    cls,
    show_cursor,
    halt,
    !.
  process_press(R,C) :-
    loc(draw,R,C),
    draw_while_down,
    !.
  process_press(R,C) :-
    loc(color,R,C),
    pick_color(R,C),
    !.
  process_press(R,C) :-
    loc(brush,R,C),
    pick_brush(R,C),
    !.
  process_press(_,_).

    loc(Name,R,C) :-
      bounds(Name,R1,C1,R2,C2),
      R >= R1,
      R =< R2,
      C >= C1,
      C =< C2.

      bounds(quit,8,1,8,6).
      bounds(draw,5,14,22,78).
      bounds(color,5,0,6,3).
      bounds(brush,5,6,6,9).

    draw_while_down :-
      m_release(0, _, _, _),                 % initialize release counter
      color(At),
      brush(Char),
      m_hide,                             % hide mouse cursor for drawing
      m_rowlimit(5,22),                  % keep mouse within drawing area
      m_collimit(14,78),
      repeat,
      m_release(0, Nr, _, _),                      % button released yet?
      m_status(_, _, Row, Col),                      % get mouse position
      tmove(Row, Col),                       % move the real cursor there
      wca(1, Char, At),                          % and leave a paint spot
      Nr > 0,                           % if Nr = 0, button is still down
      m_rowlimit(0,24),                            % free the mouse again
      m_collimit(0,79),
      m_show,                                           % and lets see it
      !.

    pick_color(5,C) :- C =< 1, set_color(red).
    pick_color(5,C) :- C > 1, set_color(blue).
    pick_color(6,C) :- C =< 1, set_color(green).
    pick_color(6,C) :- C > 1, set_color(yellow).

      set_color(C) :-
        retract(color(_)),
        attr(C, A),
        assert(color(A)).

    pick_brush(5,C) :- C =< 7, set_brush(219).
    pick_brush(5,C) :- C > 7, set_brush(178).
    pick_brush(6,C) :- C =< 7, set_brush(177).
    pick_brush(6,C) :- C > 7, set_brush(176).

      set_brush(B) :-
        retract(brush(_)),
        assert(brush(B)).

