% Creare una regola ricorsiva che ispeziona il seguente funtore:
% computer(cpu(intel_i9), componenti(ram(sedici_gb), gpu(nvidia_rtx_3080)))
% La regola deve stampare il nome di tutte le
% componenti. Quando l’arità di un componente
% è 0, stampare "Componente non specificato.

% computer(
%     cpu(intel_i9),
%     componenti(
%         ram(sedici_gb),
%         gpu(nvidia_rtx_3080)
%     )
% )

ispeziona(Computer) :- 
    functor(Computer, Name, Arity), 
    write(Name), 
    (
        Arity > 0 ->     
        write('('), nl, 
        write_functor_args(Computer, Arity),
        write(')'), nl ; true

    ).

write_functor_args(_,0).
write_functor_args(Term, N) :-
    N > 0,
    arg(N, Term, Arg),
    ispeziona(Arg), 
    NewN is N-1, 
    write_functor_args(Term, NewN).



% soluzione luigi
ispeziona_computer(Computer) :-
	functor(Computer, _, 0),
	write("Componente non specificato."),
	nl.

ispeziona_computer(Computer) :-
	functor(Computer, Name, Arity),
	write("Componente: "),
	write(Name),
    nl,
	write("Numero di sottocomponenti: "),
	write(Arity),
	nl,

	(Arity > 0 ->

	    arg(1, Computer, PrimoComponente),
		write("Ispeziona il primo sottocomponente."),
		nl,
		ispeziona_computer(PrimoComponente),

		(Arity > 1 ->
	        arg(2, Computer, SecondoComponente),
			write("Ispeziona il secondo sottocomponente."),
			nl,
			ispeziona_computer(SecondoComponente)
        ; true
        )

    ; true
    ).