
/* UTILS */
/* Incrementing a number X */
incr(X, X1) :- X1 is X + 1.
/* Does nothing. Is use to copy the value A the second parameter.*/
copy(A, A).

/* BOARD SETTINGS
	- : empty space
	x : user coin
	o : IA coin
	item 0 : top of column
	item 6 : bottom of column
*/
board([[_, _, _, _, _, _],
			[_, _, _, _, _, _],
			[_, _, _, _, _, _],
			[_, _, _, _, _, _],
			[_, _, _, _, _, _],
			[_, _, _, _, _, _],
			[_, _, _, _, _, _]]).

etat_initial(board([[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -]])).

/* CONDITIONS de VICTOIRE */
/* colonne de quatre */
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

/* rangée de quatre */
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

/* diagonal */
etat_final(board([[J, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[J, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[J, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[J, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _]]),
									J):- not(J = -).

etat_final(board([[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, J, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _]]),
									J):- not(J = -).

etat_final(board([[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, J],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, J],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, J],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, J, _, _, _],
									[_, _, _, J, _, _],
									[_, _, _, _, J, _],
									[_, _, _, _, _, J]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, J],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, J],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, J],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, J],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, J, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[J, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[J, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[J, _, _, _, _, _],
									[_, _, _, _, _, _]]),
									J):- not(J = -).

etat_final(board([[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, _, _, _],
									[_, _, _, J, _, _],
									[_, _, J, _, _, _],
									[_, J, _, _, _, _],
									[J, _, _, _, _, _]]),
									J):- not(J = -).

/* partie nulle*/
etat_final(board([[A, A, A, A, A, A],
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
show(A,N):- print_row(A,B), nl, M is N + 1, show(B, M).

/* Print the first element of every column */
print_row([],_).
print_row([[A|B]|C],[B|D]):- write(A), write('  '), print_row(C,D).

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

/* Place a coin in a column */
add_coin_in_column(X, ['-'], [X]).
add_coin_in_column(X, ['-', A|B], [X, A|B]) :- A \== '-'.
add_coin_in_column(X, ['-', A|B], ['-', A1|B1]) :- (A == '-'),
																									 add_coin_in_column(X, [A|B], [A1|B1]).
add_coin_in_column(_, [A|_], _) :- A \== '-',
																	write('Wrong move : the column is full!'), nl,
																	write('Game stopped.'), nl, nl,
																	play_again.

/* Find the desired column and move a coin in the column */
find_column(X, [A|B], [A|B2], N, M) :- N \== M,
																			 incr(M, M2),
																			 copy(A, A),
																			 find_column(X, B, B2, N, M2).
find_column(X, [A|B], [A1|B], N, M) :- N == M,
																			 copy(B, B),
																			 add_coin_in_column(X, A, A1).

/* Move a coin in the specified column */
move_coin(X, board(Y), board(Y2), N) :- find_column(X, Y, Y2, N, 1).

/* Player move */
player(X, X2) :- enter_column_number(N),
						     move_coin('x', X, X2, N),
						     show_board(X2), nl, nl,
								 next_player('o', X2, _).

/* IA move */
machine(X, X2) :- write('IA move a coin in colunm 7.'), nl, nl,
						      move_coin('o', X, X2, 7),
                  show_board(X2), nl, nl,
									next_player('x', X2, _).

/* Decide a winner */
win('x', X) :- etat_final(X),
							 write('PLAYER WINS! :)'), nl, nl.
win('o', X) :- etat_final(X),
							 write('IA WINS! :)'), nl, nl.

/* Decide who's turn to play */
next_player('o', X, _) :- win('x', X), play_again.
next_player('x', X, _) :- win('o', X), play_again.
next_player('o', X, X2) :- machine(X, X2).
next_player('x', X, X2) :- player(X, X2).

/* Text to display at the beginning of the game */
intro_text :- nl, write('CONNECT FOUR'), nl,
				write('Player (x) starts first.'), nl, nl.

/* Play the game :) */
play :- intro_text,
        etat_initial(X),
		  	show_board(X), nl, nl,
				player(X, _).

/* Play again */
response('yes') :- play.
response(_) :- write('Wrong answer :)'), nl, nl,
							 play_again.
play_again :- write('Do you want to play again?'), nl,
							write('yes/no'), nl,
							read(X), response(X).
