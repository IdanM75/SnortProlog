% Events.pro - illustrate date and time fields
%   with ODBC

main :-
  db_open(events),
  db_query(games,
    [home=H, away=A, day=D, time=T]),
  write(H:A), tab(1),
  write(D), tab(1), write(T), nl,
  fail.
main :-
  db_close.

db_table(games, home, a20).
db_table(games, away, a20).
db_table(games, day, d).
db_table(games, time, t).

