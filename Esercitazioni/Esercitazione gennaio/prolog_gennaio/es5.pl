% Siano dati i seguenti fatti:
edge(a, b).
edge(c, d).
edge(a, c).
edge(d, e).
edge(b, d).
edge(f, g).
% Creare un regola che ricerca tutti i percorsi tra
% duenodieliinserisceinunalista.

path(X, X, [X], _).
path(X,Y,[X|Path], Visited) :- 
    edge(X, N), 
    \+member(N, Visited), 
    path(N, Y, Path, [X|Visited]).

all_paths(X,Y, Paths) :- 
    findall(Path, path(X,Y, Path, [X]), Paths).
    
