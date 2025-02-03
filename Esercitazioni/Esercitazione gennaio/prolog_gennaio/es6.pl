% Siano dati i seguenti fatti:
edge(a, b, 2).
edge(c, d, 6).
edge(a, c, 6).
edge(d, e, 5).
edge(b, d, 2).
edge(f, g, 5).
% Creare un regola che ricerca il path con costo
% minimo.

path(X, X, [X], 0).
path(X, Y, [X|Path], TotalCost) :-
	edge(X, N, Cost),
	path(N, Y, Path, PathCost),
	TotalCost is PathCost + Cost.

all_paths(X, Y, Paths) :-
	findall((Path,TotalCost),
		path(X, Y, Path, TotalCost),
		Paths).

find_best_path(X, Y, BestPath) :-
	findall((Path, TotalCost),path(X, Y, Path, TotalCost),Paths), 
    best_path(Paths, BestPath).

best_path([(Path, Cost)], (Path, Cost)).
best_path([(Path,Cost)|RemainingPaths], (BestPath,BestCost)) :-
    best_path(RemainingPaths, (OtherPath, OtherCost)),
    (
        Cost < OtherCost -> 
        BestPath = Path, 
        BestCost = Cost
        
        ;

        BestPath = OtherPath,
        BestCost = OtherCost
        
    ).
