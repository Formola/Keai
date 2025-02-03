sibling(X,Y) :- parent(P,X), parent(P,Y).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z),ancestor(Z,Y).


brother(X,Y) :- male(X), sibling(X,Y).
sister(X,Y) :- female(X), sibling(X,Y).

uncle(X,Y) :- brother(X,Z), parent(Z,Y).
aunt(Z,Y) :- sister(X,Z), parent(Z,Y).

nephew(X,Y) :- male(X), uncle(Y,X).
nephew(X,Y) :- male(X), aunt(Y,X).

niece(X,Y) :- female(X), uncle(Y,X).
niece(X,Y) :- female(X), aunt(Y,X).

