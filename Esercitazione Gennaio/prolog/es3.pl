% Creare un predicato build_functor/3 che costruisce ricorsivamente un albero binario di
% profondità specificata.
% build_functor(Depth, Value, Tree)
% L'albero avrà la forma: node(Left, Right)

build_functor(0, Value, Value).
build_functor(Depth, Value, node(Left, Right)) :-
    NewDepth is Depth-1,
    build_functor(NewDepth, Value, Left), 
    build_functor(NewDepth, Value, Right).