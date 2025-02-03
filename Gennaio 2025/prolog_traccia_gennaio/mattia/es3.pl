% Dato il seguente funtore “albero binario”: “Albero = nodo1(nodo2(nodo4, nodo5),
% nodo3(nodo6, nodo7(nodo8, nodo9)))”, costruire un predicato ricorsivo che ispeziona
% l’albero stampando tutti i suoi nodi. Quando l’albero non ha più figli, stampare “Foglia vuota”.

inspect_tree(Node) :-
	 \+ compound(Node),
	write(Node),
	write(': Foglia vuota'),
	nl.

inspect_tree(Node) :-
	Node =.. [Root|Children],
	write('Nodo: '),
	write(Root),
	nl,
	inspect_children(Children).

inspect_children([]).
inspect_children([Child|Rest]) :-
	inspect_tree(Child),
	inspect_children(Rest).

albero(nodo1(nodo2(nodo4, nodo5), nodo3(nodo6, nodo7(nodo8, nodo9)))).