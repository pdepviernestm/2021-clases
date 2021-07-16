jugador(amarillo).
jugador(magenta).
jugador(azul).
jugador(verde).
jugador(negro).
jugador(rojo).

continente(americaDelSur).
continente(americaDelNorte).
continente(asia).
continente(oceania).
continente(europa).
continente(africa).

estaEn(americaDelSur, argentina).
estaEn(americaDelSur, brasil).
estaEn(americaDelSur, chile).
estaEn(americaDelSur, uruguay).
estaEn(americaDelSur, peru).
estaEn(americaDelSur, colombia).

estaEn(americaDelNorte, alaska).
estaEn(americaDelNorte, yukon).
estaEn(americaDelNorte, canada).
estaEn(americaDelNorte, oregon).
estaEn(americaDelNorte, nuevaYork).
estaEn(americaDelNorte, terranova).
estaEn(americaDelNorte, labrador).
estaEn(americaDelNorte, mexico).
estaEn(americaDelNorte, groenlandia).
estaEn(americaDelNorte, california).

estaEn(europa, islandia).
estaEn(europa, granBretania).
estaEn(europa, suecia).
estaEn(europa, rusia).
estaEn(europa, polonia).
estaEn(europa, alemania).
estaEn(europa, italia).
estaEn(europa, francia).
estaEn(europa, espania).

estaEn(asia, aral).
estaEn(asia, tartaria).
estaEn(asia, taimir).
estaEn(asia, kamchatka).
estaEn(asia, china).
estaEn(asia, siberia).
estaEn(asia, japon).
estaEn(asia, mongolia).
estaEn(asia, iran).
estaEn(asia, gobi).
estaEn(asia, india).
estaEn(asia, malasia).
estaEn(asia, turquia).
estaEn(asia, israel).
estaEn(asia, arabia).

estaEn(oceania, australia).
estaEn(oceania, sumatra).
estaEn(oceania, java).
estaEn(oceania, borneo).

estaEn(africa, sahara).
estaEn(africa, egipto).
estaEn(africa, etiopia).
estaEn(africa, madagascar).
estaEn(africa, sudafrica).
estaEn(africa, zaire).

ocupa(aral, magenta).

ocupa(alaska, amarillo).
ocupa(yukon, amarillo).
ocupa(oregon, amarillo).
ocupa(canada, amarillo).
ocupa(groenlandia, amarillo).
ocupa(labrador, amarillo).
ocupa(terranova, amarillo).
ocupa(nuevaYork, amarillo).
ocupa(california, amarillo).
ocupa(mexico, amarillo).

ocupa(islandia, amarillo).
ocupa(suecia, amarillo).
ocupa(rusia, amarillo).
ocupa(polonia, amarillo).

ocupa(turquia, amarillo).

ocupa(sahara, amarillo).
ocupa(egipto, amarillo).
ocupa(etiopia, amarillo).
ocupa(zaire, amarillo).
ocupa(madagascar, amarillo).
ocupa(sudafrica, amarillo).

ocupa(argentina, azul).
ocupa(chile, azul).
ocupa(uruguay, azul).

ocupa(china, azul).
ocupa(japon, azul).
ocupa(iran, azul).
ocupa(india, azul).
ocupa(malasia, azul).
ocupa(gobi, azul).

ocupa(australia, azul).
ocupa(borneo, azul).
ocupa(java, azul).
ocupa(sumatra, azul).

ocupa(israel, negro).
ocupa(arabia, negro).

ocupa(mongolia, verde).
ocupa(taimir, verde).
ocupa(tartaria, verde).
ocupa(siberia, verde).
ocupa(kamchatka, verde).

ocupa(italia, verde).

ocupa(brasil, verde).
ocupa(colombia, verde).
ocupa(peru, verde).

ocupa(francia, rojo).
ocupa(granBretania, rojo).
ocupa(espania, rojo).
ocupa(alemania, rojo).

% le_corresponden_ejercitos(Jugador, 3):-
%     cantidad_paises(Jugador, CantidadPaises),
%     CantidadPaises < 6.

% Esta solucion tiene un bug, yo podría tener menos de 6 paises y aun así tener un continente (oceania)
% le_corresponden_ejercitos(Jugador, CantidadEjercitos):-
%     cantidad_paises(Jugador, CantidadPaises),
%     CantidadPaises >= 6,
%     bonus_por_continentes_ocupados(Jugador, CantidadEjercitosPorContinentes),
%     CantidadEjercitos is div(CantidadPaises, 2) + CantidadEjercitosPorContinentes.

% bonus_por_continentes_ocupados(Jugador, CantidadTotalDeEjercitos):-
%     findall(CantidadEjercitos,
%             (ocupa_continente(Jugador, Continente),
%             puntos_por_continente(Continente, CantidadEjercitos)), CantidadesDeEjercitos),
%     sum_list(CantidadesDeEjercitos, CantidadTotalDeEjercitos).

% Alterntiva:
puede_incorporar_ejercitos(Jugador, CantidadEjercitos):-
    cantidad_paises(Jugador, CantidadPaises),
    CantidadEjercitos is max(3, div(CantidadPaises, 2)).

puede_incorporar_ejercitos(Jugador, CantidadEjercitos):-
    ocupa_continente(Jugador, Continente),
    puntos_por_continente(Continente, CantidadEjercitos).

le_corresponden_ejercitos(Jugador, CantidadTotalEjercitos):-
    jugador(Jugador),
    findall(CantidadEjercitos,
            puede_incorporar_ejercitos(Jugador, CantidadEjercitos),
            CantidadesDeEjercitos),
    sum_list(CantidadesDeEjercitos, CantidadTotalEjercitos).


puntos_por_continente(oceania, 2).
puntos_por_continente(africa, 3).
puntos_por_continente(americaDelSur, 3).
puntos_por_continente(americaDelNorte, 5).
puntos_por_continente(europa, 5).
puntos_por_continente(asia, 7).

% Alternativa:
%
% le_corresponden_ejercitos(Jugador, CantidadEjercitos):-
%     cantidad_paises(Jugador, CantidadPaises),
%     CantidadEjercitos is max(3, div(CantidadPaises, 2)).

cantidad_paises(Jugador, CantidadPaises):-
    jugador(Jugador),
    findall(Pais, ocupa(Pais, Jugador), Paises),
    length(Paises, CantidadPaises).

ocupa_continente(Jugador, Continente):-
    continente(Continente),
    jugador(Jugador),
    forall(estaEn(Continente, Pais), ocupa(Pais, Jugador)).

:- begin_tests(teg).

test(si_tiene_menos_de_6_paises_le_corresponden_3_ejercitos, nondet):-
    le_corresponden_ejercitos(magenta, 3).
test(si_tiene_6_paises_o_mas_le_corresponden_tantos_ejercitos_como_la_mitad_de_sus_paises_redondeando_para_abajo):-
    le_corresponden_ejercitos(verde, 4).
test(si_tiene_continentes_ocupados_le_corresponden_ejercitos_por_sus_paises_ocupados_mas_el_bonus_por_continente):-
    le_corresponden_ejercitos(azul, 8),
    le_corresponden_ejercitos(amarillo, 18).
test(si_ocupa_todos_los_paises_que_estan_en_un_continente_ocupa_ese_continente):-
    ocupa_continente(azul, oceania).
test(si_no_ocupa_todos_los_paises_que_estan_en_un_continente_no_ocupa_ese_continente):-
    not(ocupa_continente(verde, asia)).

:- end_tests(teg).