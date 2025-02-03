binary_tree(void). 
binary_tree(tree(Element, LeftSubTree, RightSubTree)) :- 
    binary_tree(LeftSubTree),
    binary_tree(RightSubTree).

% example query: binary_tree(tree(1, tree(2, void, void), tree(3, void, void))).

tree_member(X, tree(X, LeftSubTree, RightSubTree)).
tree_member(X, tree(Y, LeftSubTree, RightSubTree)) :- tree_member(X, LeftSubTree).
tree_member(X, tree(Y, LeftSubTree, RightSubTree)) :- tree_member(X, RightSubTree).

% example query: tree_member(2, tree(1, tree(2, void, void), tree(3, void, void))).


isotree(void,void).
isotree(tree(X, Left1, Right1), tree(X, Left2, Right2)) :- 
    isotree(Left1, Left2), isotree(Right1, Right2).
isotree(tree(X, Left1, Right1), tree(X, Left2, Right2)) :-
    isotree(Left1, Right2), isotree(Left2, Right1).

% example query: isotree(tree(1, tree(2, void, void), tree(3, void, void)), tree(1, tree(3, void, void), tree(2, void, void))).

replace(X,Y,X,Y).
replace(X,Y,Z,Z) :- X \= Z.

substitute(X,Y,void,void).

substitute(X, Y, tree(Element1,Left1,Right1), tree(Element2, Left2, Right2)) :-
    replace(X,Y,Element1,Element2),
    substitute(X,Y, Left1, Left2),
    substitute(X,Y,Right1, Right2).

% example query: substitute(2, 4, tree(1, tree(2, void, void), tree(3, void, void)), tree(1, tree(4, void, void), tree(3, void, void))).
% query for print the tree after substitution: tree_member(4, tree(1, tree(4, void, void), tree(3, void, void))).

preorder(void, []).
preorder(tree(X,L,R), Xs) :- 
preorder(L, Ls), preorder(R,Rs), append([X|Ls], Rs, Xs).

% example query: preorder(tree(1, tree(2, void, void), tree(3, void, void)), Xs).

inorder(void, []).
inorder(tree(X,L,R), Xs) :-
    inorder(L, Ls), inorder(R, Rs), append(Ls, [X|Rs], Xs).

% example query: inorder(tree(1, tree(2, void, void), tree(3, void, void)), Xs).

postorder(void,[]).
postorder(tree(X,L, R), Xs) :-
    postorder(L, Ls), postorder(R, Rs), append(Rs, [X], Rs1), append(Ls, Rs1, Xs).

% example query: postorder(tree(1, tree(2, void, void), tree(3, void, void)), Xs).