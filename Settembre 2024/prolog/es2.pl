% Scrivere un programma in Prolog che crei "ricorsivamente" un funtore "computer" a partire dai seguenti fatti Prolog:

%I fatti Prolog contengono il nome, il modello e il prezzo di ogni componente:
componente(scheda_video, 'NVIDIA GeForce RTX 3080', 1200).
componente(scheda_madre, 'ASUS ROG Strix Z590-E Gaming', 300).
componente(disco, 'Samsung 970 EVO Plus', 100).
componente(bus, 'PCIe 4.0', 50).
componente(periferiche, 'Razer BlackWidow Elite', 150).
componente(ram, 'Corsair Vengeance RGB Pro', 120).
componente(processore, 'Intel Core i9-11900K', 500).

% Fatti Prolog contenenti la lista dei core del processore con i rispettivi prezzi:
lista_cores([core1(50), core2(50), core3(50)]). % Il numero tra parentesi è il prezzo del core

% funtoreComputer(
%     funtoreDisco('Samsung 970 EVO Plus', 100),
%     funtorePeriferiche('Razer BlackWidow Elite', 150),
%     funtoreBus('PCIe 4.0', 50),
%     funtoreSchedaVideo('NVIDIA GeForce RTX 3080', 1200),
%     funtoreSchedaMadre(
%         funtoreProcessore(
%             [
%                 funtoreCore(core1, 50),
%                 funtoreCore(core2, 50),
%                 funtoreCore(core3, 50)
%             ],
%             'Intel Core i9-11900K',
%              500
%           ),
%         funtoreRAM('Corsair Vengeance RGB Pro', 120),
%         'ASUS ROG Strix Z590-E Gaming',
%          300
%     )
% ).

crea_funtore_componente(Tipo, FuntoreComponente) :-
    componente(Tipo, Modello, Prezzo),
    atom_concat(funtore, Tipo, NomeFuntore),
    FuntoreComponente =..[NomeFuntore, Modello, Prezzo].

crea_funtore_cores([], []).
crea_funtore_cores([Term|Cores], [FuntoreCore|FuntoriCores]) :-
    Term =..[Core, Prezzo],
    FuntoreCore =..[funtoreCore, Core, Prezzo], 
    crea_funtore_cores(Cores, FuntoriCores).

crea_funtore_processore(FuntoreProcessore) :-
    componente(processore, Modello, Prezzo),
    lista_cores(Cores),
    crea_funtore_cores(Cores, FuntoriCores),
    FuntoreProcessore =..[funtoreProcessore, FuntoriCores, Modello, Prezzo].


crea_funtore_schedaMadre(FuntoreSchedaMadre) :-
    crea_funtore_processore(FuntoreProcessore),
    crea_funtore_componente(ram, FuntoreRam),
    componente(scheda_madre, Modello, Prezzo),
    FuntoreSchedaMadre =..[funtoreSchedaMadre, FuntoreProcessore, FuntoreRam, Modello, Prezzo].

crea_funtore_computer(Computer) :-
    crea_funtore_componente(disco, FuntoreDisco),
    crea_funtore_componente(periferiche, FuntorePeriferiche),
    crea_funtore_componente(bus, FuntoreBus),
    crea_funtore_componente(scheda_video, FuntoreSchedaVideo),
    crea_funtore_schedaMadre(FuntoreSchedaMadre), 
    Computer=..[funtoreComputer, FuntoreDisco, FuntorePeriferiche, FuntoreBus, FuntoreSchedaVideo, FuntoreSchedaMadre].

% ?- crea_funtore_computer(Computer).


% Una volta creato il funtore “computer”, creare una regola Prolog
% che lo ispezioni ricorsivamente al fine di calcolare
% il prezzo complessivo del computer come somma dei 
% prezzi delle singole componenti.
% Utilizzare i predicati arg e functor.

% SommaComputer = SommaDisco + SommaPeriferiche + SommaBus + SommaSchedaVideo + SommaSchedaMadre
% SommaSchedaMadre = SommaBaseSchedaMadre + SommaProcessore + SommaRAM
% SommaProcessore = SommaBaseProcessore + SommaPrezziCores
% I valori “base” sono quelli riportati nei fatti Prolog.

get_component_price(ComponentFunctor, Prezzo) :-
	functor(ComponentFunctor, FunctorName, _),
	(
        FunctorName = funtoredisco -> arg(2, ComponentFunctor, Prezzo);
	    FunctorName = funtoreperiferiche -> arg(2, ComponentFunctor, Prezzo);
	    FunctorName = funtorebus -> arg(2, ComponentFunctor, Prezzo);
	    FunctorName = funtoreSchedaMadre -> calcola_prezzo_scheda_madre(ComponentFunctor, Prezzo);
	    FunctorName = funtorescheda_video -> arg(2, ComponentFunctor, Prezzo);
	    FunctorName = funtoreram -> arg(2, ComponentFunctor, Prezzo)
    ).

calcola_prezzo_scheda_madre(FuntoreSchedaMadre, Prezzo) :-
    FuntoreSchedaMadre =..[funtoreSchedaMadre, ProcessorFunctor, RamFunctor, _, BasePrice],
    calcola_prezzo_processore(ProcessorFunctor, ProcessorPrice),
    get_component_price(RamFunctor, RamPrice),
    Prezzo is BasePrice + ProcessorPrice + RamPrice. 

calcola_prezzo_processore(ProcessorFunctor, ProcessorPrice) :-
    ProcessorFunctor =..[funtoreProcessore, Cores, _ , BasePrice],
    calcola_prezzo_cores(Cores, CoresPrice),
    ProcessorPrice is BasePrice + CoresPrice.

calcola_prezzo_cores([], 0).
calcola_prezzo_cores([HeadCoreFunctor|Cores], CoresPrice) :-
    HeadCoreFunctor =..[funtoreCore, _ , CorePrice], 
    calcola_prezzo_cores(Cores, RemainingCoresPrice),
    CoresPrice is CorePrice + RemainingCoresPrice.


calcola_prezzo_computer(FunctorComputer, TotalPrice) :-
    FunctorComputer =..[funtoreComputer, FuntoreDisco, FuntorePeriferiche, FuntoreBus, FuntoreSchedaVideo, FuntoreSchedaMadre],
    get_component_price(FuntoreDisco, PrezzoDisco),
    get_component_price(FuntorePeriferiche, PrezzoPeriferiche),
    get_component_price(FuntoreBus, PrezzoBus),
    get_component_price(FuntoreSchedaVideo, PrezzoSchedaVideo),
    calcola_prezzo_scheda_madre(FuntoreSchedaMadre, PrezzoSchedaMadre), 
    TotalPrice is PrezzoDisco + PrezzoPeriferiche + PrezzoBus + PrezzoSchedaVideo + PrezzoSchedaMadre.

% ?- crea_funtore_computer(Computer), calcola_prezzo_computer(Computer, TotalPrice).