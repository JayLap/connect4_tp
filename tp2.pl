
/* Board setting
	- : il n'y a aucun jeton sur la case
	x : jeton du player
	o : jeton du IA
*/
etat_initial(board([[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -],
										[-, -, -, -, -, -]])).

/* Victory conditions */

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

etat_final(board([[A, A, A, A, A, A],
									[A, A, A, A, A, A],
									[A, A, A, A, A, A],
									[A, A, A, A, A, A],
									[A, A, A, A, A, A],
									[A, A, A, A, A, A],
									[A, A, A, A, A, A]],
									n) :- not(A = -)).

/* Print board functions */

print_board([]).
print_board([A|B]) :- print_board(B),format('  ~w  ~w  ~w  ~w  ~w  ~w  ~w ~n', A).
print_colomns() :- write('\n  1  2  3  4  5  6  7\n\n').

/*  Add a coin in the row */
colomn(1).
colomn(2).
colomn(3).
colomn(4).
colomn(5).
colomn(6).
colomn(7).
colomn_available(X) :- colomn(X).
add_coin(1) :- write('IA wins!\n').

/* Turn to play */
turn_to_play(x) :- write('Your turn.\n').
turn_to_play(o) :- write('IA\'s turn.\n').

/* Who wins? */
wins(1) :- write('IA wins!\n').
wins(0) :- write('You win!\n').
wins(2) :- write('Tie\n').

/* Play the game :) */

play() :- print_board([[x, x, o, x, x, o, o],
											[-, x, o, o, x, -, o],
											[-, -, x, o, -, -, -],
											[-, -, -, x, -, -, -],
											[-, -, -, -, -, -, -],
											[-, -, -, -, -, -, -]]),
											print_colomns().

play(A) :- row(A), print_board([[x, x, o, x, x, o, o],
																[-, x, o, o, x, -, o],
																[-, -, x, o, -, -, -],
																[-, -, -, x, -, -, -],
																[-, -, -, -, -, -, -],
																[-, -, -, -, -, -, -]], x),
																print_colomns().
