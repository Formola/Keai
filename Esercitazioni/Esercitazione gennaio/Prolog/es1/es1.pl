% Predicato principale
scrivi_maggiori_di_cinque(Lista, NomeFile) :-
    open(NomeFile, write, Fd),  % Apri il file in modalità scrittura
    scrivi_lista(Lista, Fd),    % Scrivi i valori maggiori di 5 nel file
    close(Fd).                  % Chiudi il file

% Scrive nel file i valori maggiori di 5 della lista
% è un predicato ricorsivo, partiamo dal caso base
scrivi_lista([], _).
% scrivi_lista([H|T], Fd) :-
%    H > 5,                          % Controlla se il valore è maggiore di 5
%    write(Fd, H),               % Scrive il valore nel file
%    write(Fd, '\n'),            % Aggiunge un nuovo rigo
%    scrivi_lista(T, Fd).        % Passa al prossimo elemento
%scrivi_lista([H|T], Fd) :-
%    H =< 5,                         % Se il valore non è maggiore di 5
%    scrivi_lista(T, Fd).        % Salta e passa al prossimo elemento
    
scrivi_lista([], _).
scrivi_lista([H|T], Fd) :-
    H > 5
    ->  write(Fd, H),
        write(Fd, '\n'),
        scrivi_lista(T, Fd);
    write(Fd,'error'),
    write(Fd, '\n'),
    scrivi_lista(T, Fd).
