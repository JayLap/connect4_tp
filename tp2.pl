
/* UTILS */
/* Incrementing a number X */
incr(X, X1) :- X1 is X + 1.

/* Does nothing. Is use to copy the value A the second parameter.*/
copy(A, A).

/* finds the column number associated with the specific list */
find_column_number([], _, 8, _).
find_column_number([H|T], C, N, M):- H = C, M is N.
find_column_number([H|T], C, N, M):- N1 is N+1, find_column_number(T, C, N1, M).

/* finds the first free column of the board */
find_a_free_column([], 8, _).
find_a_free_column([H|T], N, M):- contient_pas('-', H), N1 is N+1, find_a_free_column(T, N1, M).
find_a_free_column([H|_], N, M):-M is N, not(contient_pas('-', H)).

/* find 3 characters in 3 lists are at the same indices, or increasing decreasing order */
row3(X,Y,Z):- length(X,N),length(Y,N),length(Z,N).
rightD3(X,Y,Z):- length(X,N1),length(Y,N2),length(Z,N3), N2 is N1+1, N3 is N2+1.
leftD3(X,Y,Z):- length(X,N1),length(Y,N2),length(Z,N3), N2 is N1-1, N3 is N2-1.

/* checks if a list does not contain a particular member */
contient_pas(_, []).
contient_pas(X, [H|T]):- X\=H, contient_pas(X, T).

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
etat_final(board(X), R):- append(_,[C|_], X) ,
                          append(_,[R,R,R,R|_],C).


/* rangee de quatre, ou diagonale de chaque direction */
etat_final(board(X), R):-
    append(_,[Col1, Col2, Col3, Col4|_], X),
    append(P1, [R|_], Col1),
    append(P2, [R|_], Col2),
    append(P3, [R|_], Col3),
    append(P4, [R|_], Col4),
 (row(P1,P2,P3,P4) ; rightD(P1,P2,P3,P4) ; leftD(P1,P2,P3,P4)).


/* partie nulle*/
etat_final(board([])).
etat_final(board([H|T])):- contient_pas('-', H), etat_final(board(T)).


/* fonctions pour determiner si c'est une rang�e, ou diagonale. */
row(W,X,Y,Z):- length(W,N),length(X,N),length(Y,N),length(Z,N).
rightD(W,X,Y,Z):- length(W,N1),length(X,N2),length(Y,N3),length(Z,N4), N2 is N1+1, N3 is N2+1, N4 is N3+1.
leftD(W,X,Y,Z):- length(W,N1),length(X,N2),length(Y,N3),length(Z,N4), N2 is N1-1, N3 is N2-1, N4 is N3-1.


/* les �tats conclusifs. Dependant du gagnant, un message different s'affiche. */
etat_final_humain(X, R):- etat_final(X, R), R = 'x', write('PLAYER WINS! :)'), nl, nl.
etat_final_ordi(X, R):- etat_final(X, R), R = 'o', write('IA WINS! :)'), nl, nl.
etat_final_egal(X):- etat_final(X), write('Partie Nul!').

/* --------------------------------------------------------------------------------------------*/

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

/* -----------------------------------------------------------------------------------------*/

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

/* Decide a winner */
/* Decide who's turn to play */
next_player('o', X, _) :- etat_final_humain(X, 'x'), play_again.
next_player('x', X, _) :- etat_final_ordi(X, 'o'), play_again.
next_player(_, X, _):- etat_final_egal(X), play_again.
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

/* JOUEUR IA */
/* Ici, l'ordi a plusieurs actions qu'il peut completer. En ordre de priorite:
 *  1. Bloque une colonne, rangee, ou diagonale gagnante du joueur
 *  humain.
 *  2. Jouer un jeton gagnant.
 *  3. Bloque l'avance d'un joueur qui pourrait l'amener a gagner.
 *  4. Joueur un jeton adjacent a ses autres, pour s'avancer vers une
 *  victoire.
 *  5. Dans le cas ou aucune de ses actions demeurent possible,
 *  l'ordinateur joue dans une colonne vide. */
/* L'ordinateur cherche une colonne ou les conditions s'appliquent, et il joue dans la colonne. */

/* colonne de 3 */
machine(board(X), X2):- (append(_,[C|_], X),
                         append(_,['-','x','x','x'|_],C))
                       ->(find_column_number(X, C, 1, M),
                         not(contient_pas('-', C)),
                          machine_play(X, X2, M)).

machine(board(X), X2):- (append(_,[C|_], X),
                         append(_,['-','o','o','o'|_],C))
                       ->(find_column_number(X, C, 1, M),
                         not(contient_pas('-', C)),
                          machine_play(X, X2, M)).
/* rangee, ou diagonale de deux ou plus */
machine(board(X), X2):-
    (   append(_,[Col1, Col2, Col3|_], X),
    append(P1, ['-'|_], Col1),
    append(P2, ['o'|_], Col2),
    append(P3, ['o'|_], Col3),    (row3(P1,P2,P3); rightD3(P1,P2,P3); leftD3(P1,P2,P3)))
    -> (find_column_number(X, Col3, 1, M),
       not(contient_pas('-', Col3)),
       machine_play(X, X2, M)).

machine(board(X), X2):-
    (   append(_,[Col1, Col2, Col3|_], X),
    append(P1, ['o'|_], Col1),
    append(P2, ['o'|_], Col2),
    append(P3, ['-'|_], Col3),    (row3(P1,P2,P3); rightD3(P1,P2,P3); leftD3(P1,P2,P3)))
    -> (find_column_number(X, Col1, 1, M),
       not(contient_pas('-', Col1)),
       machine_play(X, X2, M)).

machine(board(X), X2):-
    (   append(_,[Col1, Col2, Col3|_], X),
    append(P1, ['x'|_], Col1),
    append(P2, ['x'|_], Col2),
    append(P3, ['-'|_], Col3),    (row3(P1,P2,P3); rightD3(P1,P2,P3); leftD3(P1,P2,P3)))
    -> (find_column_number(X, Col3, 1, M),
       not(contient_pas('-', Col3)),
       machine_play(X, X2, M)).

machine(board(X), X2):-
    (   append(_,[Col1, Col2, Col3|_], X),
    append(P1, ['-'|_], Col1),
    append(P2, ['x'|_], Col2),
    append(P3, ['x'|_], Col3),    (row3(P1,P2,P3); rightD3(P1,P2,P3); leftD3(P1,P2,P3)))
    -> (find_column_number(X, Col1, 1, M),
       not(contient_pas('-', Col1)),
       machine_play(X, X2, M)).

/* colonne de deux */
machine(board(X), X2):- (append(_,[C|_], X),
                         append(_,['-','-','x','x'|_],C))
                       ->(find_column_number(X, C, 1, M),
                         not(contient_pas('-', C)),
                           machine_play(X, X2, M)).
machine(board(X), X2):- (append(_,[C|_], X),
                         append(_,['-','-','o','o'|_],C))
                       ->(find_column_number(X, C, 1, M),
                         not(contient_pas('-', C)),
                           machine_play(X, X2, M)).
/* colonne de un 'o' */
machine(board(X), X2):- (append(_,[C|_], X),
                         append(_,['-','-','-','o'|_],C))
                       ->(find_column_number(X, C, 1, M),
                         not(contient_pas('-', C)),
                           machine_play(X, X2, M)).

/*  dans le cas exception ou aucune des conditions s'appliquent */
machine(board(X), X2):- find_a_free_column(X, 1, M),machine_play(X, X2, M).

/*  l'action de jouer un jeton */
machine_play(X, X2, C):-  move_coin('o', board(X), X2, C),
                          show_board(X2), nl, nl,
                          next_player('x', X2, _).
