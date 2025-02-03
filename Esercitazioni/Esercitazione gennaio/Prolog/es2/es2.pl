% Predicato principale
%concatena_ciao([], []).  % Caso base: lista vuota
%concatena_ciao([H|T], [H_ciao|T_ciao]) :-
%    atom_concat(H, 'ciao', H_ciao),  % Concatena 'ciao' all'atomo H
%    concatena_ciao(T, T_ciao).       % Ricorsione sulla coda della lista


% vediamo come lo fa luigi

start(Lista,Lista2) :- regolaRicorsiva(Lista,Lista2).

regolaRicorisiva().
regolaRicorsiva([head|tail], [StringaConcat|ListaOutput]) :-
	stringa = "ciao",
	atom_concat(head,stringa, StringaConcat),
	regolaRicorsiva(tail, ListaOutput). 
