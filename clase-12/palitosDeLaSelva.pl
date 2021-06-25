/*animal(Nombre,Clase, Medio)*/
animal(ballena,mamifero,acuatico).
animal(tiburon,pez,acuatico).
animal(lemur,mamifero,terrestre).
animal(golondrina,ave,aereo).
animal(tarantula,insecto,terrestre).
animal(lechuza,ave,aereo).
animal(orangutan,mamifero,terrestre).
animal(tucan,ave,aereo).
animal(puma,mamifero,terrestre).
animal(abeja,insecto,aereo).
animal(leon,mamifero,terrestre).
animal(lagartija,reptil,terrestre).


/* tiene(Quien, Que, Cuantos)*/
tiene(nico, ballena, 1).
tiene(nico, lemur, 2).
tiene(nico, golondrina, 1).

tiene(maiu, lemur, 1).
tiene(maiu, tarantula, 1).
tiene(maiu, tucan, 1).
tiene(maiu, leon,2).

tiene(juanDS, golondrina, 1).
tiene(juanDS, lechuza, 1).
tiene(juanDS, puma, 1).
tiene(juanDS, lagartija, 1).

tiene(juanR, tiburon, 2).
tiene(juanR, orangutan,1).

tiene(feche,tiburon,1).

tiene(aye, Animal, 1):-
    animal(Animal, _, _).

animalDificil(Animal):-
    nadieTiene(Animal).

animalDificil(Animal):-
    unicoPoseedor(Animal, UnicoPoseedor),
    tiene(UnicoPoseedor, Animal, 1).

nadieTiene(Animal):-
    animal(Animal, _, _),
    not(tiene(_, Animal, _)).

unicoPoseedor(Animal, Persona):-
    tiene(Persona, Animal, _),
    not((tiene(OtraPersona, Animal, _),
     Persona \= OtraPersona)).
    
leGusta(nico, Animal):-
    animal(Animal, _, terrestre),
    Animal \= lemur.
leGusta(maiu, Animal):-
    animal(Animal, Clase, _),
    Clase \= insecto.
leGusta(maiu, abeja).
leGusta(juanDS, Animal):- animal(Animal, _, acuatico).
leGusta(juanDS, Animal):- animal(Animal, ave, _).
leGusta(juanR, Animal):- tiene(juanR, Animal, _).
leGusta(feche, lechuza).
leGusta(aye, abeja).

estaTriste(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal,_), not(leGusta(Persona, Animal))).

estaFeliz(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal, _),
           leGusta(Persona, Animal)).

% tieneTodosDe(Persona, Medio):-
%     tiene(Persona, _, _),
%     animal(_, _, Medio),
%     forall(tiene(Persona, Animal, _),
%            animal(Animal, _, Medio)).

% tieneTodosDe(Persona, Clase):-
%     tiene(Persona, _, _),
%     animal(_, Clase, _),
%     forall(tiene(Persona, Animal, _),
%            animal(Animal, Clase, _)).

% Podemos sacar la repeticion de logica asi:

esDeClaseOMedio(Animal, Clase):-
    animal(Animal, Clase, _).
esDeClaseOMedio(Animal, Medio):-
    animal(Animal, _, Medio).

tieneTodosDe(Persona, ClaseOMedio):-
    tiene(Persona, _, _),
    esDeClaseOMedio(_, ClaseOMedio),
    forall(tiene(Persona, Animal, _),
           esDeClaseOMedio(Animal, ClaseOMedio)).

completoLaColeccion(Persona):-
    tiene(Persona, _, _),
    forall(animal(Animal, _, _),
           tiene(Persona, Animal, _)).

% completoLaColeccion(Persona):-
%     tiene(Persona, _, _),
%     not((animal(Animal, _, _),
%          not(tiene(Persona, Animal, _))
%         )).

tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, _),
    not(leGusta(Persona, Animal)).
tieneParaIntercambiar(Persona, Animal):-
    tiene(Persona, Animal, Cantidad),
    Cantidad > 1.

tieneParaOfrecerle(Dador, Receptor):-
    tieneParaIntercambiar(Dador, Animal),
    leGusta(Receptor, Animal),
    not(tiene(Receptor, Animal, _)).

manejaElMercado(Persona):-
    tieneParaOfrecerle(Persona, _),
    forall(
        (leGusta(OtraPersona, _), Persona \= OtraPersona),
        tieneParaOfrecerle(Persona, OtraPersona)
    ).

% delQueMasTiene(Persona, Animal):-
%     tiene(Persona, Animal, CantidadDeAnimal),

%     forall(
%         (tiene(Persona, OtroAnimal, CantidadDeOtroAnimal),
%         OtroAnimal \= Animal),
    
%         CantidadDeAnimal > CantidadDeOtroAnimal
%     ).

delQueMasTiene(Persona, Animal):-
        tiene(Persona, Animal, _),
        forall(
            (tiene(Persona, OtroAnimal, _),
             OtroAnimal \= Animal),
        
             tieneMasDe(Persona, Animal, OtroAnimal)
        ).

tieneMasDe(Persona, Animal, OtroAnimal):-
    tiene(Persona, Animal, CantidadAnimal),
    tiene(Persona, OtroAnimal, CantidadOtroAnimal),
    CantidadAnimal > CantidadOtroAnimal.

:- begin_tests(clase3).

test(un_animal_no_es_dificil_si_alguien_lo_tiene_mas_de_una_vez):-
    not(animalDificil(leon)).

test(un_animal_no_es_dificil_si_mas_de_una_persona_lo_tiene):-
    not(animalDificil(lemur)).

test(un_animal_es_dificil_si_solo_lo_tiene_una_persona_una_vez):-
    animalDificil(abeja).

test(una_persona_no_esta_triste_si_tiene_algun_animal_que_le_gusta):-
    not(estaTriste(maiu)).

test(una_persona_esta_triste_si_no_tiene_animales_que_le_gusten, nondet):-
    estaTriste(nico).

test(una_persona_esta_feliz_si_le_gustan_todos_los_animales_que_tiene, nondet):-
    estaFeliz(juanR).

test(una_persona_no_esta_feliz_si_tiene_algun_animal_que_no_le_gusta):-
    not(estaFeliz(nico)).

test(tiene_todos_de_se_cumple_para_una_persona_y_un_medio_si_la_persona_tiene_solamente_animales_de_ese_medio, nondet):-
    tieneTodosDe(feche, acuatico).

test(tiene_todos_de_no_se_cumple_para_una_persona_y_un_medio_si_la_persona_tiene_algun_animal_que_no_sea_de_ese_medio):-
    not(tieneTodosDe(nico, acuatico)).

test(tiene_todos_de_se_cumple_para_una_persona_y_una_clase_si_la_persona_tiene_solamente_animales_de_esa_clase, nondet):-
    tieneTodosDe(feche, pez).

test(tiene_todos_de_no_se_cumple_para_una_persona_y_una_clase_si_la_persona_tiene_algun_animal_que_no_sea_de_esa_clase, nondet):-
    not(tieneTodosDe(nico, mamifero)).

test(completo_la_coleccion_si_tiene_todos_los_animales, nondet):-
    completoLaColeccion(aye).

test(no_completo_la_coleccion_si_le_falta_algun_animal):-
    not(completoLaColeccion(feche)).

test(una_person_tiene_para_intercambiar_un_animal_si_lo_tiene_y_no_Le_gusta, nondet):-
    tieneParaIntercambiar(nico, ballena).

test(una_person_tiene_para_intercambiar_un_animal_si_lo_tiene_repetido, nondet):-
    tieneParaIntercambiar(maiu, leon).

test(una_persona_no_tiene_para_intercambiar_un_animal_que_no_tiene, nondet):-
    not(tieneParaIntercambiar(feche, leon)).

test(una_persona_no_tiene_para_intercambiar_un_animal_que_tiene_solo_una_vez, nondet):-
    not(tieneParaIntercambiar(maiu, lemur)).

test(una_persona_tiene_para_ofrecerle_a_otra_si_tiene_para_intercambiar_un_animal_que_la_otra_no_tenga_y_le_guste, nondet):-
    tieneParaOfrecerle(maiu, nico).

test(una_persona_no_tiene_para_ofrecerle_a_otra_si_no_tiene_para_intercambiar_un_animal_que_le_guste_y_le_falte_a_la_otra_persona, nondet):-
    not(tieneParaOfrecerle(maiu, aye)).

test(del_que_mas_tiene_es_verdad_para_una_persona_y_un_animal_si_tiene_mas_de_ese_que_de_otros, nondet):-
    delQueMasTiene(nico, lemur).

:- end_tests(clase3).
