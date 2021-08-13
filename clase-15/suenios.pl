% Valentina
% Tomas
% Juan
% Ariel

% creeEn(Personaje,PersonaQueCree)
creeEn(campanita,gabriel).
creeEn(magoDeOz,gabriel).
creeEn(cavenaghi,gabriel).
creeEn(conejoDePascua,juan).
creeEn(reyesMagos,macarena).
creeEn(magoCapria,macarena).
creeEn(campanita,macarena).

% alternativa
% creeEn(Personajes, PersonaQueCree)
% creeEn([campanita, magoDeOz, cavenaghi], gabriel).
% creeEn([conejoDePascua], juan).
% creeEn([reyesMagos, magoCapria, campanita], macarena).
% creeEn([], diego).
% diego no cree en nadie, entonces no lo ponemos

% sueniaCon(Persona, Suenio)
sueniaCon(gabriel, ganarLoteria([5, 9])).
sueniaCon(gabriel, serFutbolista(arsenal)).
sueniaCon(juan, cantante(100_000)).
sueniaCon(macarena, cantante(10_000)).

dificultad_suenio(cantante(CantidadAVender), 6) :-
    CantidadAVender > 500_000.

dificultad_suenio(cantante(CantidadAVender),4):-
    CantidadAVender =< 500_000.

dificultad_suenio(ganarLoteria(Numeros), Dificultad) :-
    length(Numeros, CantNumeros),
    Dificultad is 10 * CantNumeros.

:- begin_tests(suenios).

test(la_dificultad_de_ser_un_cantante_que_vende_mas_de_500000_discos_es_6):-
    dificultad_suenio(cantante(500_001), 6).

test(la_dificultad_de_ser_un_cantante_que_vende_500000_o_menos_discos_es_4) :-
    dificultad_suenio(cantante(500_000), 4),
    dificultad_suenio(cantante(250_000), 4).

:- end_tests(suenios).
