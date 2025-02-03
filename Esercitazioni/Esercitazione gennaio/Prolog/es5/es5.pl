% es grafo, dati i fatti crea una regola che ricerca un path con costo minimo

test(Path,Cost) :-findAll(Path0,Cost0).

path(A,B,[B,A],C) :- edge(A,B,C).

best_path([(Path,Cost)],Path,Cost).
