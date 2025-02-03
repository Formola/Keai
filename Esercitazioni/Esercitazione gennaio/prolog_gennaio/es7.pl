% Creare una regola che verifica se due alberi
% sono isomorfi

isotree(void, void).
isotree(tree(X, Left1, Right1), tree(X, Left2, Right2)) :-
    isotree(Left1, Left2), isotree(Right1, Right2).
isotree(tree(X, Left1, Right1), tree(X, Left2, Right2)) :-
    isotree(Left1, Right2), isotree(Left2, Right1).

