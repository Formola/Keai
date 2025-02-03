% Creare una regola ricorsiva che prende in
% ingresso una lista di stringhe, e torna in
% output la stessa lista dove ad ogni valore
% viene concatenata la stringa "ciao"

myconcat([],[]).
myconcat([H|T], [H_concat| T_concat]) :- 
    atom_concat(H, 'ciao', H_concat),
    myconcat(T, T_concat).
    
