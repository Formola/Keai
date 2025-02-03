subterm(Term, Term).
subterm(Sub, Term) :-
	compound(Term),
	Term =.. [F|Args],
	subterm_list(Sub, Args).

subterm_list(Sub, [Arg|_]) :-
	subterm(Sub, Arg).
subterm_list(Sub, [_|Args]) :-
	subterm_list(Sub, Args).

% query: subterm(Sub, tree(a, tree(b, void, void), tree(c, void, void))).

subterm_with_functor(Term, Term).
subterm_with_functor(Sub, Term) :-
    compound(Term),
    functor(Term, F, N),  % functor here is used to ge the name and arity of the term
    subterm(N, Sub,Term).

subterm(N, Sub, Term) :- 
    N > 1, 
    N1 is N-1, 
    subterm(N1, Sub, Term).
subterm(N, Sub, Term) :-
    arg(N, Term, Arg),
    subterm(Sub, Arg).

% query: subterm_with_functor(Sub, tree(a, tree(b, void, void), tree(c, void, void))).