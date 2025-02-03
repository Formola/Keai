% Dati i seguenti fatti costituenti le relazioni familiari di un albero genealogico, scrivere un
% programma in Prolog che costruisca una struttura albero. La creazione deve essere ricorsiva.
% Output atteso: lista fi funtori albero. Ogni funtore deve contenere tutta la discendenza di un personaggio.

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

build_tree_functor(Person, Tree) :-
    findall(Child, parents(Person, Child), Children),
    build_genealogy_tree(Children, SubTree), 
    Tree =..[tree, Person | SubTree].

build_genealogy_tree([], []).
build_genealogy_tree([Child|RemainingChildren], [ChildTree|RemainingSubTree]) :-
    build_tree_functor(Child, ChildTree), 
    build_genealogy_tree(RemainingChildren, RemainingSubTree).

% query for testing tree functors
% build_tree(sally, Tree), writeln(Tree).

build_genealogy(TreeList) :-
    findall(Person, parents(Person, _), Roots),
    build_genealogy_tree(Roots, TreeList).

% query for testing genealogy functorss
% build_genealogy(TreeList). 

% genealogy(TreeList) :-
%     findall(Person, parents(Person, _), Roots),
%     itera(Roots, TreeList).

% itera([], []).
% itera([Root|RemainingRoots], [RootTree|RemainingTrees]) :-
%     build_tree_functor(Root, RootTree), 
%     itera(RemainingRoots, RemainingTrees).

% query for testing genealogy functorss
% genealogy(TreeList).