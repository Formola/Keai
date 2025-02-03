% Data una lista di interi, iterare la lista,
% stampando su un file solo i valori della lista
% maggiori di 5

open_file(Path,List) :-
    open(Path, write, Fd), 
    print_list(Fd,List),
    close(Fd).

print_list(_,[]).
print_list(File, [H|T]) :-
    (
        H > 5 ->
        write(File,H), nl(File)
    ; true
    ), 
    print_list(File,T).