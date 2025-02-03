mymember(X,[X|_]).
mymember(X,[_|Y]) :- mymember(X,Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

myappend([],A,A).
myappend([X|Y],Z,[X|W]) :- myappend(Y,Z,W).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rappend([X|Y],Z,[X|W]) :- rappend(Y,Z,W).
rappend([],A,A).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlength([],0).
xlength([_|Y],N) :- xlength(Y,N-1).

mylength([],0).
mylength([_|Y],N) :- mylength(Y,M), N is M+1.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implementing Length with an accumulator


mylen2(L,N) :- lenacc(L,0,N).

lenacc([],A,A).

lenacc([H|T],A,N) :- A1 is A+1, lenacc(T,A1,N).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


swap_first_two([X,Y|Rest],[Y,X|Rest]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


factorial(0,1).

factorial(X,Y) :- W is X-1,
                  factorial(W,Z),
                  Y is Z*X.
%% Factorial using an accumulator

factorial2(0,N,N).

factorial2(N,A,F) :-
   N > 0,
   A1 is N*A,
   N1 is N -1,
   factorial2(N1,A1,F).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sumlist([],0).

sumlist([X|Rest],Ans) :- sumlist(Rest,Partial),
                         Ans is Partial+X.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
