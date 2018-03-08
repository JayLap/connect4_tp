
/* Board setting
	- : il n'y a aucun jeton sur la case
	x : jeton du player
	o : jeton du IA
	item 0 : haut de la colone
	item 6 : bas de la colone
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
show_board(board(X)):- show(X,6), print_colomns_number.

show(_,0).
show(X,N):- print_colomn(X,X2), nl, Ns is N-1, show(X2,Ns).

print_colomn([],_).
print_colomn([[X|X2]|XS],[X2|XS2]):- write(X), write('  '), print_colomn(XS,XS2).

print_colomns_number :- write('1  2  3  4  5  6  7').

/*  Validate user entry */
colomn(1).
colomn(2).
colomn(3).
colomn(4).
colomn(5).
colomn(6).
colomn(7).
colomn_available(X) :- colomn(X).

/* Turn to play */
turn_to_play(x) :- write('Your turn.\n').
turn_to_play(o) :- write('IA\'s turn.\n').

/* Who wins? */
print_winner(1) :- write('IA wins!\n').
print_winner(0) :- write('You win!\n').
print_winner(2) :- write('Tie\n').
winner(X, Y) :- etat_final(X), print_winner(Y).

/* Play the game :) */
play :- etat_initial(X), show_board(X).
