mago(ron).
mago(harry).

tieneRopaUsada(ron).
tieneRopaUsada(harry).

pelirrojo(ron).

esUnWeasley(Alguien):-
    mago(Alguien),
    tieneRopaUsada(Alguien),
    pelirrojo(Alguien).
