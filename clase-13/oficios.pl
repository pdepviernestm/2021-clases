:- use_module(library(clpfd)).
% ^ esto no es necesario que lo revisen o lo usen

% maestro(migue,cocinero).
% maestro(carla,alquimista).
% aprendiz(feche,mecanico).
% oficial(aye,alquimista).

trabajador(gise, profesion(alquimista, maestro)).
trabajador(gise, profesion(mecanico, maestro)).
trabajador(gise, profesion(cocinero, maestro)).

trabajador(lucas, profesion(alquimista, experto)).
trabajador(juan, profesion(alquimista, aprendiz)).
trabajador(aye, profesion(alquimista, oficial)).
trabajador(feche, profesion(mecanico, aprendiz)).
trabajador(carla, profesion(alquimista, maestro)).
trabajador(migue, profesion(cocinero, maestro)).

mismoArea(profesion(Area, _), profesion(Area, _)).

% si la quisiesemos hacer
% inversible podríamos hacer esto:
% mismoArea(profesion(Area, UnaExperiencia),
            % profesion(Area, OtraExperiencia)):-
%     trabajador(_,
                % profesion(Area, UnaExperiencia)),
%     trabajador(_,
                % profesion(Area, OtraExperiencia)).
tieneHerramienta(gise,llaveInglesa).
tieneHerramienta(feche,llaveInglesa).
tieneHerramienta(migue,ollaEssen).
tieneHerramienta(carla, mechero).
tieneHerramienta(aye, piedraFilosofal).
tieneHerramienta(migue, piedraFilosofal).

camaradas(Persona,OtraPersona):-
    % si le pasamos aye y carla
    trabajador(Persona,Profesion),
% Profesion = profesion(alquimista, oficial)
    trabajador(OtraPersona,OtraProfesion),
% Profesion = profesion(alquimista, maestro)
    mismoArea(Profesion, OtraProfesion),
    Persona \= OtraPersona.

puedeEntrenar(QuienEntrena,QuienAprende):-
    camaradas(QuienEntrena,QuienAprende),
    tieneMasExperiencia(QuienEntrena,QuienAprende).

% tieneMasExperiencia(
%     trabajador(_, profesion(_, maestro)),
% carla = trabajador(_, profesion(_, maestro)) ? false
%     trabajador(_, profesion(_, oficial))
% ).
% tieneMasExperiencia(
%     trabajador(_, profesion(_, oficial)),
%     trabajador(_, profesion(_, aprendiz))
% ).

tieneMasExperiencia(MasExperimentado, MenosExperimentado):-
    trabajador(MasExperimentado,
                profesion(_, ExperienciaMayor)),
    trabajador(MenosExperimentado,
                profesion(_, ExperienciaMenor)),
    masExperiencia(ExperienciaMayor, ExperienciaMenor).

% Definida por extensión,
% escribimos cada uno de los casos
%
% Problema: si se agrega un caso nuevo,
% tengo que agregar todas las combinaciones
% de ese caso
% masExperiencia(maestro, experto).
% masExperiencia(maestro, oficial).
% masExperiencia(maestro, aprendiz).
% masExperiencia(experto, oficial).
% masExperiencia(experto, aprendiz).
% masExperiencia(oficial, aprendiz).

% Le asignamos a cada experiencia un valor
% que ya es comparable, como un numero
%
% Si se agrega uno nuevo, hay que modificar
% los numeros de los que estan mas arriba
% masExperiencia(ExpMayor, ExpMenor) :-
%     nivelExperiencia(ExpMayor, NivelMayor),
%     nivelExperiencia(ExpMenor, NivelMenor),
%     NivelMayor > NivelMenor.

% nivelExperiencia(maestro, 4).
% nivelExperiencia(experto, 3).
% nivelExperiencia(oficial, 2).
% nivelExperiencia(aprendiz, 1).

% Definida por recursividad
%
% Si se agrega una experiencia nueva
% hay que modificar en 2 lugares
% para decir de quien es el siguiente
% y de quien es el anterior

nivelSiguiente(maestro, experto).
nivelSiguiente(experto, oficial).
nivelSiguiente(oficial, aprendiz).

masExperiencia(ExpMayor, ExpMenor):-
    nivelSiguiente(ExpMayor, ExpMenor).

masExperiencia(ExpMayor, ExpMenor):-
    nivelSiguiente(ExpMayor, ExpIntermedia),
    masExperiencia(ExpIntermedia, ExpMenor).

puedeHacer(Persona, cocinarMilanesasConPure) :-
    trabajador(Persona, profesion(cocinero, _)).

puedeHacer(Persona,recalentarComida):-
    trabajador(Persona,profesion(cocinero,_)).

puedeHacer(Persona,recalentarComida):-
    tieneHerramienta(Persona,mechero).

puedeHacer(Persona, producirMedicina(Cantidad)) :-
    trabajador(Persona, profesion(alquimista, Experiencia)),
    not(masExperiencia(Experiencia, oficial)),
    between(0, 100, Cantidad).

puedeHacer(Persona, producirMedicina(Cantidad)):-
    trabajador(Persona,profesion(alquimista,Experiencia)),
    masExperiencia(Experiencia,oficial),
    between(0, 100000, Cantidad).
    % no es realmente correcto, lo hacemos asi
    % solo para que nos quede inversible

% así es inversible, pero esta usando cosas
% que no les vamos a pedir en los tps o parcial:
%
% puedeHacer(Persona, producirMedicina(Cantidad)):-
%     trabajador(Persona,profesion(alquimista,Experiencia)),
%     masExperiencia(Experiencia,oficial),
%     Cantidad #>= 0.

puedeHacer(Persona,repararAparato(_, Herramienta)):-
    trabajador(Persona,profesion(mecanico,_)),
    tieneHerramienta(Persona,Herramienta).
puedeHacer(migue,repararAparato(_,_)).

puedeHacer(Persona,crearObraMaestra(Area)):-
    trabajador(Persona,profesion(Area,maestro)).

puedeHacer(Persona, crearObraMaestra(alquimista)) :-
    tieneHerramienta(Persona, piedraFilosofal).

puedeCubrir(QuienCubre, QuienEsCubierto, Tarea) :-
    puedeHacer(QuienCubre, Tarea),
    puedeHacer(QuienEsCubierto, Tarea),
    QuienCubre \= QuienEsCubierto.

% solucion con forall
% esIrremplazable(Persona,Tarea):-
%     puedeHacer(Persona,Tarea),
%     forall(
%         trabajador(OtraPersona, _),
%         not(puedeCubrir(OtraPersona,Persona,Tarea))
%         ).

% solucion con not (son equivalentes)
esIrremplazable(Persona,Tarea):-
    puedeHacer(Persona,Tarea),
    not(puedeCubrir(_, Persona, Tarea)).

esComodin(Persona) :-
    trabajador(Persona, _),
    forall(puedeHacer(_, Tarea), puedeHacer(Persona, Tarea)).

% si tuviesemos un predicado inversible esEntero\1
% esEntero(Numero).

% trabajador(migue, cocinero, ollaEssen).
% trabajador(migue, cocinero, sarten).
% % vs
% trabajador(migue, cocinero).

% tieneHerramienta(migue, ollaEssen).
% tieneHerramienta(migue, sarten).

% % vs
% tieneOllaEssen(migue).
% tieneSarten(migue).
% % Se complica preguntar que o si alguien tiene una herramienta cualquiera
% % tieneAlgunaHerramienta(Alguien):-
% %     tieneOllaEssen(Alguien).
% % tieneAlgunaHerramienta(Alguien):-
% %     tieneSarten(Alguien).

:- begin_tests(clase13).

test(dos_personas_son_camaradas_si_trabajan_en_el_mismo_area):-
    camaradas(aye, carla).

test(camaradas_es_un_predicado_irreflexivo):-
    not(camaradas(aye, aye)).

test(dos_personas_no_son_camaradas_si_no_trabajan_en_el_mismo_area):-
    not(camaradas(migue, aye)).

test(una_persona_no_puede_entrenar_a_otra_si_no_son_camaradas):-
    not(puedeEntrenar(migue, feche)).

test(una_persona_puede_entrenar_a_otra_si_son_camaradas_y_tiene_mas_experiencia, nondet):-
    puedeEntrenar(carla, aye),
    puedeEntrenar(carla, lucas),
    puedeEntrenar(lucas, aye),
    puedeEntrenar(carla, juan),
    puedeEntrenar(lucas, juan),
    puedeEntrenar(aye, juan).

test(si_una_persona_es_cocinera_puede_realizar_la_tarea_cocinar_milanesas_con_pure, nondet):-
    puedeHacer(migue, cocinarMilanesasConPure).

test(si_una_persona_no_es_cocinera_no_puede_realizar_la_tarea_cocinar_milanesas_con_pure):-
    not(puedeHacer(feche, cocinarMilanesasConPure)).

test(si_una_persona_es_cocinera_puede_realizar_la_tarea_recalentar_comida, nondet):-
    puedeHacer(migue, recalentarComida).

test(si_una_persona_tiene_un_mechero_puede_realizar_la_tarea_recalentar_comida, nondet):-
    puedeHacer(carla, recalentarComida).

test(si_una_persona_no_es_cocinera_ni_tiene_un_mechero_no_puede_realizar_la_tarea_recalentar_comida):-
    not(puedeHacer(feche, recalentarComida)).

test(una_persona_que_no_es_alquimista_no_puede_producir_medicina):-
    not(puedeHacer(migue, producirMedicina(10))).

test(si_una_persona_es_alquimista_oficial_o_menor_puede_hacer_menos_de_100_gramos, nondet):-
    puedeHacer(aye, producirMedicina(80)).

test(si_una_persona_es_alquimista_oficial_o_menor_puede_hacer_100_gramos, nondet):-
    puedeHacer(aye, producirMedicina(100)).

test(si_una_persona_es_alquimista_oficial_o_menor_no_puede_hacer_mas_de_100_grames):-
    not(puedeHacer(aye, producirMedicina(101))).

test(si_una_persona_es_alquimista_experta_o_mas_puede_hacer_cualquier_cantidad_de_medicina, nondet):-
    puedeHacer(lucas, producirMedicina(80)),
    puedeHacer(lucas, producirMedicina(200)),
    puedeHacer(carla, producirMedicina(80)),
    puedeHacer(carla, producirMedicina(200)).

test(migue_puede_reparar_cualquier_aparato, nondet):-
    puedeHacer(migue, repararAparato(tele, destornillador)).

test(una_persona_que_trabaja_en_mecanica_puede_arreglar_un_aparato_si_tiene_la_herramienta_necesaria, nondet):-
    puedeHacer(feche, repararAparato(tele, llaveInglesa)).

test(una_persona_no_puede_arreglar_un_aparato_aunque_tenga_la_herramienta_necesaria_si_no_es_mecanica):-
    not(puedeHacer(aye, repararAparato(radio, piedraFilosofal))).

test(un_maestro_en_un_area_puede_realizar_la_tarea_de_crear_una_obra_maestra_de_ese_area, nondet):-
    puedeHacer(migue, crearObraMaestra(cocinero)).

test(una_persona_puede_crear_una_obra_maestra_de_alquimia_aun_sin_ser_maestro_si_es_que_tiene_una_piedra_filosofal, nondet):-
    puedeHacer(aye, crearObraMaestra(alquimista)).

test(una_persona_puede_crear_una_obra_maestra_de_alquimia_aun_sin_ser_maestro_o_alquimista_si_es_que_tiene_una_piedra_filosofal):-
    puedeHacer(migue, crearObraMaestra(alquimista)).

test(una_persona_no_puede_crear_una_obra_maestra_de_su_area_si_no_es_maestro):-
    not(puedeHacer(feche, crearObraMaestra(mecanico))).

test(una_persona_no_puede_crear_una_obra_maestra_de_otro_area):-
    not(puedeHacer(carla, crearObraMaestra(mecanico))).

test(una_persona_puede_cubrir_a_otra_en_una_tarea_si_ambas_pueden_realizarla, nondet):-
    puedeCubrir(carla, aye, crearObraMaestra(alquimista)).

test(una_persona_no_puede_cubrir_a_otra_en_una_tarea_si_no_puede_realizar_esa_tarea):-
    not(puedeCubrir(juan, aye, crearObraMaestra(alquimista))).

test(puede_cubrir_es_irreflexiva_respecto_a_la_persona):-
    not(puedeCubrir(carla, carla, crearObraMaestra(alquimista))).

test(una_persona_es_irremplazable_si_es_la_unica_que_puede_hacer_una_tarea, nondet):-
    esIrremplazable(gise, crearObraMaestra(mecanico)).

test(una_persona_no_es_irremplazable_si_no_es_la_unica_que_puede_hacer_una_tarea):-
    not(esIrremplazable(carla, crearObraMaestra(alquimista))).

test(una_persona_no_es_irremplazable_si_ni_puede_realizar_la_tarea):-
    not(esIrremplazable(lucas, cocinarMilanesasConPure)),
    not(esIrremplazable(juan, cocinarMilanesasConPure)).

test(una_persona_no_es_comodin_si_existe_alguna_tarea_que_no_pueda_realizar):-
    not(esComodin(juan)).

test(una_persona_es_comodin_si_puede_realizar_todas_las_tareas, nondet):-
    esComodin(gise).

:- end_tests(clase13).