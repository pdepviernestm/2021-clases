

% Se calcula como 5 * sospechosidad + 42 / nobleza.

% lechuza(nombre,sospechosidad,nobleza).

lechuza(pepita,0,42).
lechuza(josefa,1,42).
lechuza(laPadrina,75,42).
lechuza(laPadrina2,100,42).
lechuza(laPadrina3,70,42).
lechuza(keanuReeves,1,51).
lechuza(hoothoot,2,100).

violencia(Lechuza,Violencia):-
    lechuza(Lechuza,Sospechosidad,Nobleza),
    Violencia is Sospechosidad * 5 + 42/Nobleza.

%Si una lechuza es vengativa. Lo es si su violencia es mayor a 100.

esVengativa(Lechuza):-
    violencia(Lechuza,Violencia),
    Violencia >= 100.


% Si una lechuza es mafiosa, que se cumple si no es buena gente o su sospechosidad es al menos 75. 
% Decimos que es buena gente si no es vengativa y su nobleza es mayor a 50.

esMafiosa(Lechuza):-
    lechuza(Lechuza,Sospechosidad,_),
    Sospechosidad >= 75.

esMafiosa(Lechuza):-
    lechuza(Lechuza,_,_),
    not(esBuenaGente(Lechuza)).

esBuenaGente(Lechuza):-
    lechuza(Lechuza,_,Nobleza), 
    Nobleza >50,
    not(esVengativa(Lechuza)).

:- begin_tests(lechuzas).

%nondet
test(la_violencia_de_una_lechuza_es_su_sospechosidad_por_5_mas_42_sobre_su_nobleza) :-
    violencia(pepita,1),
    violencia(josefa,6).

test(una_lechuza_con_mas_de_100_de_violencia_es_vengativa):-
    esVengativa(laPadrina),
    esVengativa(laPadrina2).

test(una_lechuza_con_menos_de_100_de_violencia_no_es_vengativa):-
    not(esVengativa(pepita)).


test(una_lechuza_es_mafiosa_si_su_sospechosidad_es_al_menos_75,nondet):-
    esMafiosa(laPadrina),
    esMafiosa(laPadrina2).

test(una_lechuza_no_es_mafiosa_si_su_sospechosidad_es_menor_a_75_y_es_buena_gente):-
    not(esMafiosa(keanuReeves)).

test(una_lechuza_es_buena_gente_si_no_es_vengativa_y_su_nobleza_es_mayor_a_50):-
    esBuenaGente(keanuReeves),
    esBuenaGente(hoothoot).

test(una_lechuza_no_es_buena_gente_si_es_vengativa):-
    not(esBuenaGente(laPadrina)).

test(una_lechuza_no_es_buena_gente_si_a_pesar_de_no_ser_vengativa_su_nobleza_no_es_mayor_a_50):-
    not(esBuenaGente(pepita)).

test(al_menos_una_lechuza_es_buena_gente,nondet):-
    esBuenaGente(_).

test(una_lechuza_es_mafiosa_si_su_sospechosidad_es_menor_a_75_pero_no_es_buena_gente):-
    esMafiosa(laPadrina3).

:- end_tests(lechuzas).










