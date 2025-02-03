% Dato il seguente funtore “albero binario”: “Albero = nodo1(nodo2(nodo4, nodo5),
% nodo3(nodo6, nodo7(nodo8, nodo9)))”, costruire un predicato ricorsivo che ispeziona
% l’albero stampando tutti i suoi nodi. Quando l’albero non ha più figli, stampare “Foglia vuota”.

% nodo1(nodo2(nodo4, nodo5), nodo3(nodo6, nodo7(nodo8, nodo9))).

inspect_tree(Node) :-
	 \+ compound(Node),
    write('Nodo: '),
	write(Node),
    write(' Foglia vuota'),
	nl.

inspect_tree(Node) :-
	Node =.. [Root|Children],
	write('Nodo: '),
	write(Root),
	nl,
	inspect_children(Children).

inspect_children([]).
inspect_children([Child|RemainingChildren]) :-
    inspect_tree(Child),
    inspect_children(RemainingChildren).


% proviamo usando functor e args

ispeziona_albero(Albero) :-
    functor(Albero, Name, 0),
    write('Nodo: '), write(Name),
    write(' Foglia vuota'),
    nl.

ispeziona_albero(Albero) :-
    functor(Albero, Name, Arity),
    write('Nodo: '),
    write(Name),
    nl,
    (
        Arity > 0 -> 
        write_functor_args(Albero, Arity); true    
    ).

write_functor_args(_,0).
write_functor_args(Term, N) :-
    N > 0,
    arg(N, Term, Arg),
    ispeziona_albero(Arg),
    N1 is N-1,
    write_functor_args(Term, N1).

% query per testare il predicato
% ispeziona_albero(nodo1(nodo2(nodo4, nodo5), nodo3(nodo6, nodo7(nodo8, nodo9)))).
