ispeziona_computer(Computer) :-
	functor(Computer,_,0),
	write('componente non specificato.'),n1.
	

ispeziona_computer(Computer) :- 
	functor(Computer,Nome,Arity),
	write('componente: '),write(Nome),write('num sottocomponeti: '),write(Arity),
	( Arity > 0 ->
		arg(1,Computer,PrimoComponente),
		write('ispeziona primo sottocomp'),n1,
		ispeziona_computer(PrimoComponente),
		( Arity > 1 ->
			arg(2,Computer,SecondoComponente),
			write('ispeziona secondo sottocmpoente'),n1,
			ispeziona_computer(SecondoComponente)
		; true
	);
	true
	).
