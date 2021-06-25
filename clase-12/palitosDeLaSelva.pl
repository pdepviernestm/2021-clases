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
tiene(maiu, lemur, 1).
tiene(maiu, tarantula, 1).
tiene(juanDS, golondrina, 1).
tiene(juanDS, lechuza, 1).
tiene(juanR, tiburon, 2).
tiene(nico, golondrina, 1).
tiene(juanDS, puma, 1).
tiene(maiu, tucan, 1).
tiene(juanR, orangutan,1).
tiene(maiu,leon,2).
tiene(juanDS,lagartija,1).
tiene(feche,tiburon,1).

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
leGusta(feche, lechuza).

estaTriste(Persona):-
    tiene(Persona, _, _),
    forall(tiene(Persona, Animal,_), not(leGusta(Persona, Animal))).
    
:- begin_tests(clase3).

test(un_animal_no_es_dificil_si_alguien_lo_tiene_mas_de_una_vez):-
    not(animalDificil(leon)).

test(un_animal_no_es_dificil_si_mas_de_una_persona_lo_tiene):-
    not(animalDificil(lemur)).

test(un_animal_es_dificil_si_nadie_lo_tiene, nondet):-
    animalDificil(abeja).

test(un_animal_es_dificil_si_solo_lo_tiene_una_persona_una_vez):-
    animalDificil(ballena).

test(una_persona_no_esta_triste_si_tiene_algun_animal_que_le_gusta):-
    not(estaTriste(maiu)).

test(una_persona_esta_triste_si_no_tiene_animales_que_le_gusten, nondet):-
    estaTriste(nico).

:- end_tests(clase3).
