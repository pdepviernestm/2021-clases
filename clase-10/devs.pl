programaEn(nahuel, javascript).
programaEn(juan, haskell).
programaEn(juan, ruby).
programaEn(caro, haskell).
programaEn(caro, scala).
programaEn(feche, java).

colegas(Persona, Colega):-
    programaEn(Persona, Lenguaje),
    programaEn(Colega, Lenguaje),
    Persona \= Colega.


% Queremos implementar si una persona puede
% aprender un lenguaje de otra.
%
% Esto se cumple cuando la primera
% no programa en ese lenguaje y la segunda sí.
% ejemplo: nahue puede aprender scala de caro.

puedeAprenderDe(QuienAprende, QuienEnsenia, LenguajeAAprender):-
    programaEn(QuienEnsenia, LenguajeAAprender),
    programaEn(QuienAprende, _),
    not(programaEn(QuienAprende, LenguajeAAprender)).

% Como se comportaria ante esta consulta:
% puedeAprenderDe(tito, caro, haskell)
% Ligamos QuienAprende = tito, QuienEnsenia = caro, LenguajeAAprender = haskell
% puedeAprenderDe(tito, caro, haskell):-
%     programaEn(caro, haskell),
%     programaEn(tito, _),
%     not(programaEn(tito, haskell)).
% programaEn(caro, haskell) -> es true
% programaEn(tito, _) -> es false porque por principio de universo cerrado, tito no programa en ningun lenguaje
% Entonces, puedeAprenderDe(tito, caro, haskell) es falso

% Como se comportaria ante esta consulta:
% puedeAprenderDe(Persona, caro, Lenguaje)
% Ligamos QuienEnsenia = caro
% puedeAprenderDe(Persona, caro, Lenguaje):-
%     programaEn(caro, Lenguaje),
%     programaEn(Persona, _),
%     not(programaEn(Persona, Lenguaje)).
% Ligamos Lenguaje = haskell
% puedeAprenderDe(Persona, caro, haskell):-
%     programaEn(caro, haskell),
%     programaEn(Persona, _),
%     not(programaEn(Persona, haskell)).
% Ligamos Persona = nahuel
% puedeAprenderDe(nahuel, caro, haskell):-
%     programaEn(caro, haskell),
%     programaEn(nahuel, _),
%     not(programaEn(nahuel, haskell)).

% ESTO tiene un problema de inversibilidad
%
% En `not(programaEn(nahuel, Lenguaje))` estamos preguntando si nahuel programa en CUALQUIER lenguaje, eso es verdad
% entonces el not da false y toda la consulta da false :(
%
% puedeAprenderDe(nahuel, caro, Lenguaje):-
%     not(programaEn(nahuel, Lenguaje)),
%     programaEn(caro, Lenguaje).
% nahuel, caro, Lenguaje

:-begin_tests(clase1).

test(si_usan_el_mismo_lenguaje_son_colegas, nondet):-
    colegas(juan, caro).

test(si_no_usan_el_mismo_lenguaje_no_son_colegas):-
    \+ colegas(nahuel, juan).

test(una_persona_puede_aprender_un_lenguaje_de_otra_si_no_programa_en_un_lenguaje_y_la_otra_si):-
    puedeAprenderDe(nahuel, caro, scala).

test(una_persona_no_puede_aprender_un_lenguaje_en_el_que_ya_programa):-
    \+ puedeAprenderDe(caro, juan, haskell).

:-end_tests(clase1).

% Y si quisiesemos tener a tito en la base de conocimientos como alguien que no conoce ningun lenguaje?

% Si no lo ponemos, ya se cumple. Lo unico que va a pasar es que tito no va a aparecer en consultas existenciales.

% Si quisiesemos que aparezca pero que aun asi no conozca ningun lenguaje, podriamos:

% Una alternativa
% programaEn(tito, ninguno).

% puedeAprenderDe(QuienAprende, QuienEnsenia, LenguajeAAprender):-
%     programaEn(QuienEnsenia, LenguajeAAprender),
%     programaEn(QuienAprende, _),
%     not(programaEn(QuienAprende, LenguajeAAprender)),
%     LenguajeAAprender \= ninguno.

% Otra alternativa

% persona(tito).
% persona(Persona):-
%     programaEn(Persona, _).

% puedeAprenderDe(QuienAprende, QuienEnsenia, LenguajeAAprender):-
%     programaEn(QuienEnsenia, LenguajeAAprender),
%     persona(QuienAprende),
%     not(programaEn(QuienAprende, LenguajeAAprender)).
