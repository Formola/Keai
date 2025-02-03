% Dati i seguenti fatti costituenti le relazioni familiari di un albero genealogico, scrivere un
% programma in Prolog che costruisca una struttura albero. La creazione deve essere
% ricorsiva.

% Output atteso: lista fi funtori albero. Ogni funtore deve contenere tutta la discendenza di un
% personaggio.

parents(sally, jane).
parents(bob, jane).
parents(sally, john).
parents(bob, john).
parents(mary, sally).
parents(all, sally).
parents(ann, bob).
parents(mike, bob).
parents(jean, all).
parents(joe, all).
parents(ruth, mary).
parents(jim, mary).
parents(esther, ruth).
parents(mick, ruth).

build_tree(Person, Tree) :- 
    findall(Child, parents(Person, Child), Children),
    build_subtree(Children, Subtree),
    Tree =..[tree, Person | Subtree].

build_subtree([], []).
build_subtree([Child | RemainingChild], [ChildTree| RemainingTree]) :- 
    build_tree(Child, ChildTree),
    build_subtree(RemainingChild, RemainingTree).

genealogy(TreeList) :-
	findall(Person,parents(Person, _),Persons),
    itera(Persons, TreeList).

itera([], []).
itera([Person|TPerson], [PersonTree|TreeList]) :-
	build_tree(Person, PersonTree),
	itera(TPerson, TreeList).