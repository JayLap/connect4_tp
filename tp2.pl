
/* Board setting ---------------------------------------------------------

	empty : il n'y a aucun jeton sur la case
	
*/

etat_initial(board(
	[	[jaune, jaune, jaune, jaune, empty, empty],
		[empty, empty, empty, empty, empty, empty],
		[empty, empty, empty, empty, empty, empty],
		[empty, empty, empty, empty, empty, empty],
		[empty, empty, empty, empty, empty, empty],
		[empty, empty, empty, empty, empty, empty],
		[empty, empty, empty, empty, empty, empty]
	])).	
		

/* Conditions de victoire ------------------------------------------------*/



etat_final(board([[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[_],[J, J, J, J, _, _]|...]), J):- not(J=empty).

etat_final(board([[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[_],[_, J, J, J, J, _]|...]), J):- not(J=empty).
	
etat_final(board([[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
etat_final(board([[_],[_],[_],[_],[_],[_],[_, _, J, J, J, J]|...]), J):- not(J=empty).
	
		
etat_final(board(
	[	[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A],
		[A, A, A, A, A, A]
	], n) :- not(A=empty)
).