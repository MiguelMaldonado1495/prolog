pertenece(E,[X]):- E=:=X, write("si encuentra en la lista").
pertenece(E,[X]):- write("no se encuentra en la lista").
pertenece(E,[X|XS]):- E=:=X, write("si se encuentra en la lista").
pertenece(E,[X|XS]):- E=\=X, pertenece(E,XS). 

size([U],1).
size([X|XS],R) :- size(XS,Count), R is 1+ Count.

concatenar([],L2,L2).
concatenar([X|XS],L2,[X|R]) :- concatenar(XS,L2,R).

eliminar(_,[],[]).
eliminar(E,[E],[]).
eliminar(E,[X|XS],RES):- E =:= X, eliminar(E,XS,RES).
eliminar(E,[X|XS],[X|RES]):- E =\= X, eliminar(E,XS,RES).


agregar(Elem,R1,[Elem|R1]).

separar([],[],[]).
separar([X|Tail],[X|R1],R2) :- X mod 2 =:= 0, separar(Tail,R1,R2).
separar([X|Tail],R1,[X|R2]):- X mod 2 =\= 0, separar(Tail,R1,R2).


ascendente([X1,X2|[]]) :- X1 < X2.
ascendente([X1,X2|Tail]) :- X1 < X2, ascendente([X2|Tail]).


descendente([X1,X2|[]]) :- X1 > X2.
descendente([X1,X2|Tail]) :- X1 > X2, descendente([X2|Tail]).

aplanar([],[]).
aplanar([X|R],[X|P]):- atomic(X), aplanar(R,P).
aplanar([X|R],P):- not(atomic(X)), aplanar(X,P_X), aplanar(R,P_R),
concatenar(P_X,P_R,P).

menor([_|[]],[]).
menor([A1,A2|B],[A2|L]):- A1 > A2, menor([A1|B],L).
menor([A1,A2|B],L):- A1 =< A2, menor([A1|B],L).


mayor([_|[]],[]).
mayor([A1,A2|B],[A2|L]):- A1 < A2, mayor([A1|B],L).
mayor([A1,A2|B],L):- A1 >= A2, mayor([A1|B],L).


invertir([],[]).
invertir([X|XS],L):- invertir(XS,Z), concatenar(Z,[X],L).
