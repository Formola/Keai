% Dati i seguenti fatti costituenti gli archi di un grafo, scrivere un programma in Prolog che
% ricerchi tutti i possibili percorsi tra due nodi. Costruire ricorsivamente una lista di funtori
% “Percorso”.
% Esempio Output:
% ListaPercorsi = [percorso1(edge(placeA, placeB), edge(placeB, placeC), …), percorso2(…), …., percorsoN()]

edge(placeA, placeB).
edge(placeA, placeC).
edge(placeA, placeD).
edge(placeA, placeE).
edge(placeA, placeF).
edge(placeB, placeE).
edge(placeB, placeC).
edge(placeC, placeD).
edge(placeC, placeH).
edge(placeD, placeH).
edge(placeE, placeG).
edge(placeG, placeH).
edge(placeF, placeH).

path(X,X, [X]).
path(X,Y, [X|Path]) :- 
    edge(X,N), 
    path(N,Y,Path).

all_paths(X,Y,Paths, PathFunctor) :-
    findall(Path, path(X,Y, Path), Paths),
    create_path_functor(Paths, PathFunctor).

create_edge_functor([_], []).
create_edge_functor([StartEdge, EndEdge|RemainingNodes], [HeadEdgeFunctor|RemainingEdgeFunctor]) :-
	HeadEdgeFunctor =.. [edge, StartEdge, EndEdge],
	create_edge_functor([EndEdge|RemainingNodes], RemainingEdgeFunctor).

% query for testing edge functors
% create_edge_functor([placeA, placeB, placeC, placeD], Functors), maplist(writeln, Functors).

create_path_functor([], []).
create_path_functor([Path|RemainingPaths], [HeadFunctor| RemainingFunctors]) :- 
    create_edge_functor(Path, HeadEdgeFunctor),
    HeadFunctor =..[percorso,HeadEdgeFunctor],
    create_path_functor(RemainingPaths, RemainingFunctors).

% all_paths(placeA, placeH, Paths).
