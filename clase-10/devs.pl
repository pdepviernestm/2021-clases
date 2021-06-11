programaEn(nahuel, javascript).
programaEn(juan, haskell).
programaEn(juan, ruby).
programaEn(caro, haskell).
programaEn(caro, scala).

colegas(Persona, Colega):-
    programaEn(Persona, Lenguaje),
    programaEn(Colega, Lenguaje),
    Persona \= Colega.

:-begin_tests(clase1).

test(si_usan_el_mismo_lenguaje_son_colegas, nondet):-
    colegas(juan, caro).

test(si_no_usan_el_mismo_lenguaje_no_son_colegas):-
    \+ colegas(nahuel, juan).

:-end_tests(clase1).

% Queremos implementar si una persona puede
% aprender un lenguaje de otra.
%
% Esto se cumple cuando la primera
% no programa en ese lenguaje y la segunda sí.
