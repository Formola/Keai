% First Family Tree

male(albert).
female(alice).
male(edward).
female(victoria).
parent(albert,edward).
parent(victoria,edward).
parent(albert,alice).
parent(victoria,alice).


%-------------------------------------

% Second Family Tree


male(tom).
male(peter).
male(doug).
female(susan).
male(david).
parent(doug, susan).
parent(tom, william).
parent(doug, david).
parent(doug, tom).
grandfather(GP, GC) :- male(GP), parent(GP, X), parent(X, GC).
sister(X,Y) :- female(X), parent(P, X), parent(P, Y).
brother(X,Y) :- male(X), parent(P, X), parent(P, Y).
cousin(X,Y) :- X \= Y, parent(W,X), parent(K,W), parent(K,Z), parent(Z,Y).
cousin(X,Y) :- X \= Y, parent(W,X), sister(W,Z), parent(Z,Y).
cousin(X,Y) :- X \= Y, parent(W,X), brother(W,Z), parent(Z,Y).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).
