laberinto([
    [.., .., //, //, //, //, <>],
    [.., .., //, //, //, .., ..],
    [.., //, //, //, .., .., //],
    [.., .., .., //, .., //, //],
    [.., //, .., //, .., //, //],
    [.., .., .., .., .., .., ..],
    [//, .., //, .., //, //, ..],
    [.., .., //, .., //, //, ..],
    [//, //, //, .., .., .., ..]  
  ]).

reemplazar_en_matriz(posicion(X, Y), Matriz, NuevoValor, NuevaMatriz):-
    nth1(Y, Matriz, Fila),
    reemplazar_en_lista(X, Fila, NuevoValor, NuevaFila),
    reemplazar_en_lista(Y, Matriz, NuevaFila, NuevaMatriz).

reemplazar_en_lista(I, Lista, Valor, NuevaLista):-
    nth1(I, Lista, _, ListaSinElValor),
    nth1(I, NuevaLista, Valor, ListaSinElValor).

dibujar_con_posicion_actual(Laberinto, Posicion):-
    reemplazar_en_matriz(Posicion, Laberinto, "@-", LaberintoADibujar),
    dibujar(LaberintoADibujar).

dibujar(Laberinto):-
    limpiar_pantalla_si_se_puede,
    forall(member(Fila, Laberinto),
           (forall(member(Valor, Fila), dibujar_celda(Valor)), write("\n"))),
    sleep(0.15).

color_celda(.., white).
color_celda("@-", yellow).
color_celda(//, magenta).
color_celda(<>, cyan).

dibujar_celda(Celda):-
    color_celda(Celda, Color),
    ansi_format([fg(Color)], Celda, []).

limpiar_pantalla_si_se_puede:-
    current_predicate(tty_get_capability/3),
    tty_clear.

limpiar_pantalla_si_se_puede:-
    not(current_predicate(tty_get_capability/3)).
