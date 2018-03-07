
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

etat_final(board(
	[	[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A]], n) :- not(A = -)).

/* Print board functions */

print_board([]).
print_board([A|B]) :- print_board(B),format(' ~w  ~w  ~w  ~w  ~w  ~w  ~w ~n', A).

/*  Add a coin in the row */
row(1).
row(2).
row(3).
row(4).
row(5).
row(6).
row(7).

/* Play the game :) */

play() :- print_board([[x, x, o, x, x, o, o],
											[-, x, o, o, x, -, o],
											[-, -, x, o, -, -, -],
											[-, -, -, x, -, -, -],
											[-, -, -, -, -, -, -],
											[-, -, -, -, -, -, -]]),
											write(' 1  2  3  4  5  6  7').
