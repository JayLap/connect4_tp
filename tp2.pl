
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


#Colonne de 4
etat_final(board(
	[	[J, J, J, J, _, _]|restB]), J):- not(J=empty)
	;etat_final(restB, J).

	
	
#Partie nulle 
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