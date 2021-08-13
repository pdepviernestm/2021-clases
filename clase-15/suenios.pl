% Valentina
% Tomas
% Juan
% Ariel

persona(Persona):-
    creeEn(_, Persona).

% creeEn(Personaje,PersonaQueCree)
creeEn(campanita,gabriel).
creeEn(magoDeOz,gabriel).
creeEn(cavenaghi,gabriel).
creeEn(conejoDePascua,juan).
creeEn(reyesMagos,macarena).
creeEn(magoCapria,macarena).
creeEn(campanita,macarena).

% alternativa
% creeEnPersonajes(Personajes, PersonaQueCree)
% creeEnPersonajes([campanita, magoDeOz, cavenaghi], gabriel).
% creeEnPersonajes([reyesMagos, magoCapria, campanita], macarena).
% creeEnPersonajes([], diego).
% diego no cree en nadie, entonces no lo ponemos

% creeEn(Personaje, Persona):-
%     creeEnPersonajes(Personajes, Persona),
%     member(Personaje, Personajes).
% creeEn(conejoDePascua, juan).

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

dificultad_suenio(serFutbolista(Equipo), 3):-
    equipo_chico(Equipo).

dificultad_suenio(serFutbolista(Equipo), 16):-
    not(equipo_chico(Equipo)).

equipo_chico(arsenal).
equipo_chico(aldosivi).

tiene_suenio_con_dificultad(Persona, Dificultad):-
    sueniaCon(Persona, Suenio),
    dificultad_suenio(Suenio, Dificultad).

ambiciosa(Persona):-
    persona(Persona),
    findall(Dificultad,
            tiene_suenio_con_dificultad(Persona, Dificultad),
            Dificultades),
    sum_list(Dificultades, DificultadTotal),
    DificultadTotal > 20.

tiene_quimica(Persona,Personaje):-
    creeEn(Personaje,Persona),
    hay_quimica_entre(Persona, Personaje).

hay_quimica_entre(Persona, campanita):-
    tiene_suenio_con_dificultad(Persona, Dificultad),
    Dificultad < 5.
hay_quimica_entre(Persona, Personaje):-
    campanita \= Personaje,
    forall(sueniaCon(Persona,Suenio), suenio_puro(Suenio)),
    not(ambiciosa(Persona)).


suenio_puro(serFutbolista(_)).
suenio_puro(cantante(CantidadDiscos)):- CantidadDiscos < 200_000.

:- begin_tests(suenios).

test(la_dificultad_de_ser_un_cantante_que_vende_mas_de_500000_discos_es_6, nondet):-
    dificultad_suenio(cantante(500_001), 6).

test(la_dificultad_de_ser_un_cantante_que_vende_500000_o_menos_discos_es_4) :-
    dificultad_suenio(cantante(500_000), 4),
    dificultad_suenio(cantante(250_000), 4).

test(la_dificultad_de_ganar_la_loteria_implica_una_dificultad_de_10_multiplicado_por_la_cantidad_de_numeros_apostados):-
    dificultad_suenio(ganarLoteria([1, 3]), 20),
    dificultad_suenio(ganarLoteria([1, 3, 5, 6]), 40).

test(la_dificultad_de_ser_futbolista_de_un_equipo_chico_es_3, nondet):-
    dificultad_suenio(serFutbolista(arsenal), 3).

test(la_dificultad_de_ser_futbolista_de_un_equipo_que_no_es_chico_es_16, nondet):-
    dificultad_suenio(serFutbolista(boca), 16).

test(una_persona_es_ambiciosa_si_la_dificultad_total_de_sus_suenios_es_mas_que_20, nondet):-
    ambiciosa(gabriel).

test(una_persona_no_es_ambiciosa_si_la_dificultad_total_de_sus_suenios_es_menor_o_igual_a_20):-
    not(ambiciosa(juan)),
    not(ambiciosa(macarena)).

test(una_persona_tiene_quimica_con_campanita_si_cree_en_ella_y_tiene_al_menos_un_suenio_de_dificultad_menor_a_5, nondet):-
    tiene_quimica(gabriel, campanita).

test(una_persona_tiene_quimica_con_un_personaje_si_cree_en_el_y_todos_sus_suenios_son_puros_y_la_persona_no_es_ambiciosa, nondet):-
    tiene_quimica(macarena, reyesMagos),
    not(tiene_quimica(gabriel, cavenaghi)).



:- end_tests(suenios).
