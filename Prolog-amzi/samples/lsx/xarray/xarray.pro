% xarray.pro
%
%    sample Prolog program that uses the make_array/2 and
%    array_elem/3 predicates implemented in xarray.c
%
% $Log: xarray.pro,v $
% Revision 1.1.1.1  2000/12/29 01:53:55  dennis
% changed to a5 dir
%
% Revision 1.1.1.1  2000/11/23 01:37:46  dennis
% All the samples in the new amzi5 cvs directory
%
% Revision 1.3  2000/01/25 10:21:24  dennis
% log comment experiment
%
%
%

main :-
  test.

test :-
  make_array(A, 5),     % create array of 5 elements
  array_elem(A, 3, 9),  % set third element to 9
  array_elem(A, 4, 16), % set fourth element to 16
  array_elem(A, 3, X),  % retrieve third element
  array_elem(A, 4, Y),  % retrieve fourth element
  write($element 3 is $), write(X), nl,
  write($element 4 is $), write(Y), nl,
  delete_array(A).

