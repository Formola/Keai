edge(a, b).
edge(c, d).
edge(a, c).
edge(d, e).
edge(b, d).
edge(f, g).

% se vuoi che il grafo sia non orientato
%edge(X,Y) :- edge(Y,X).

% connected(Node, Node).
% connected(Node1, Node2) :- edge(Node1,Link), connected(Link, Node2).

% path(X,X, [X]).
% path(X,Y, [X|P]) :- edge(X, N), path(N,Y,P).

% query: path(a, e, P).

% connected predicate to prevent infinite loop
% connected(X,X,Visited).
% connected(X,Y, Visited) :- edge(X,N), not(member(N, Visited)), connected(N, Y, [N|Visited]).

% path predicate to use visited list to prevent infinite loop
path(X, X, [X], Visited).
path(X, Y, [X|Path], Visited) :-
	edge(X, N),
	not(member(N, Visited)),
	path(N, Y, Path, [N|Visited]).

% query: connected(a, e).

% regola per trovare tutti i percorsi tra due nodi e li inserisce in una lista
all_path(X,Y, Paths) :- 
    findall(Path, path(X,Y,Path, [X]), Paths).
    
% se il grafo è anche pesato
%paths(X, X, [X], 0).
%paths(X, Y, [X|Path], TotalCost) :-
%    edge(X, N, Cost),
%    paths(N,Y, Path, PathCost),
%    TotalCost is PathCost + Cost.
