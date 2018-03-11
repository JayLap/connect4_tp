
/* BOARD SETTINGS
	- : empty space
	x : user coin
	o : IA coin
	item 0 : top of column
	item 6 : bottom of column
*/
etat_initial(board([[-, -, -, -, -, -],
					[-, -, -, -, -, -],
					[-, -, -, -, -, -],
					[-, -, -, -, -, -],
					[-, -, -, -, -, -],
					[-, -, -, -, -, -],
					[-, -, -, -, -, -]])).

/* VICTORY CONDITIONS

 colonne de quatre */
etat_final(board([[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J = -).

etat_final(board([[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J = -).

etat_final(board([[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J = -).
etat_final(board([[_],[_],[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J = -).

/*rangée de quatre*/
etat_final(board([[J |...], [J |...], [J| ...], [J|...] |...]), J):- not(J = -).
etat_final(board([[_], [J |...], [J |...], [J| ...], [J|...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [J |...], [J |...], [J| ...], [J|...]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [J |...], [J |...], [J| ...], [J|...]]), J):- not(J = -).

etat_final(board([[_,J |...], [_,J |...], [_,J | ...], [_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_,J |...], [_,J |...], [_,J | ...], [_,J |...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [_,J |...], [_,J |...], [_,J | ...], [_,J |...]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [_,J |...], [_,J |...], [_,J | ...], [_,J |...]]), J):- not(J = -).

etat_final(board([[_,_,J |...], [_,_,J |...], [_,_,J | ...], [_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_,_,J |...], [_,_,J |...], [_,_,J | ...], [_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_], [_,_,J |...], [_,_,J |...], [_,_,J | ...], [_,_,J |...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [_,_,J |...], [_,_,J |...], [_,_,J | ...], [_,_,J |...]]), J):- not(J = -).

etat_final(board([[_,_,_,J |...], [_,_,_,J |...], [_,_,_,J | ...], [_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_,_,_,J |...], [_,_,_,J |...], [_,_,_,J | ...], [_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_], [_,_,_,J |...], [_,_,_,J |...], [_,_,_,J | ...], [_,_,_,J |...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [_,_,_,J |...], [_,_,_,J |...], [_,_,_,J | ...], [_,_,_,J |...]]), J):- not(J = -).

etat_final(board([[_,_,_,_,J |...], [_,_,_,_,J |...], [_,_,_,_,J | ...], [_,_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_,_,_,_,J |...], [_,_,_,_,J |...], [_,_,_,_,J | ...], [_,_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_], [_,_,_,_,J |...], [_,_,_,_,J |...], [_,_,_,_,J | ...], [_,_,_,_,J |...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [_,_,_,_,J |...], [_,_,_,_,J |...], [_,_,_,_,J | ...], [_,_,_,_,J |...]]), J):- not(J = -).

etat_final(board([[_,_,_,_,_,J |...], [_,_,_,_,_,J |...], [_,_,_,_,_,J | ...], [_,_,_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_,_,_,_,_,J |...], [_,_,_,_,_,J |...], [_,_,_,_,_,J | ...], [_,_,_,_,_,J |...] |...]), J):- not(J = -).
etat_final(board([[_], [_], [_,_,_,_,_,J |...], [_,_,_,_,_,J |...], [_,_,_,_,_,J | ...], [_,_,_,_,_,J |...], [_]]), J):- not(J = -).
etat_final(board([[_], [_], [_], [_,_,_,_,_,J], [_,_,_,_,_,J], [_,_,_,_,_,J], [_,_,_,_,_,J]]), J):- not(J = -).

/*diagonal*/
etat_final(board([	[J, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[J, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[J, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[J, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, J, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, J],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, J],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, J],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, J, _, _, _],
					[_, _, _, J, _, _],
					[_, _, _, _, J, _],
					[_, _, _, _, _, J]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, J],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, J],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, J],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, J],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, J, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[J, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[J, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[J, _, _, _, _, _],
					[_, _, _, _, _, _]]),
					J):- not(J = -).

etat_final(board([	[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, _, _, _],
					[_, _, _, J, _, _],
					[_, _, J, _, _, _],
					[_, J, _, _, _, _],
					[J, _, _, _, _, _]]),
					J):- not(J = -).

/* partie nulle*/
etat_final(board([	[A, A, A, A, A, A],
					[A, A, A, A, A, A],
					[A, A, A, A, A, A],
					[A, A, A, A, A, A],
					[A, A, A, A, A, A],
					[A, A, A, A, A, A],
					[A, A, A, A, A, A]],
					n) :- not(A = -)).

/* PRINT BOARD FUNCTIONS */
show_board(board(X)):- show(X,0), print_columns_number.
/* Start at row 0 to 5 */
show(_,6).
show(A,N):- print_column(A,B), nl, M is N + 1, show(B, M).
/* Print the first element of every column */
print_column([],_).
print_column([[A|B]|C],[B|D]):- write(A), write('  '), print_column(C,D).
/* Show number of the columns */
print_columns_number :- write('1  2  3  4  5  6  7').

/* OPERATIONS */
/*  Validate player entry */
column(1).
column(2).
column(3).
column(4).
column(5).
column(6).
column(7).
column(_) :- write('Invalid column number.'), nl, nl, enter_column_number(_).
enter_column_number(X) :- write('Enter a column number : '), nl,
											 read(N), nl, column(N), X is N.
move(X, N, 'x') :- write('Player move coin to '),
									 write(N), write(' column.'), nl,
									 show_board(X).

/* PLAY GAME */
/* Text to display at the beginning of the game */
intro_text :- nl, write('CONNECT FOUR'), nl,
				write('Player (x) starts first.'), nl, nl.
/* Play the game :) */
play :- intro_text,
        etat_initial(X),
		  	show_board(X), nl, nl,
				enter_column_number(N), write(N).
