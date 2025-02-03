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

path(X, X, [X]).
path(Start, End, [Start|Path]) :-
	edge(Start, N),
	path(N, End, Path).

all_paths(X, Y, FinalFunctor) :-
	findall(Path,
		path(X, Y, Path),
		Paths),
	create_path_functor(Paths, FinalFunctor).

create_path_functor([], []).
create_path_functor([HeadPath|RemainingPath], [HeadFunctor|RemainingFunctor]) :-
	create_edge_functor(HeadPath, HeadEdgesFunctor),
	HeadFunctor =.. [percorso|HeadEdgesFunctor],
	create_path_functor(RemainingPath, RemainingFunctor).

create_edge_functor([_], []).
create_edge_functor([StartNode, EndNode|RemainingNodes], [HeadEdgeFunctor|RemainingEdgeFunctor]) :-
	HeadEdgeFunctor =.. [edge, StartNode, EndNode],
	create_edge_functor([EndNode|RemainingNodes], RemainingEdgeFunctor).