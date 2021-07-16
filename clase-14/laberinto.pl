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

laberinto_chiquito([[.., .., ..],
                    [.., .., ..],
                    [.., .., <>]]).

meta(<>).
pared(//).

solucion(Laberinto, Posicion, Camino):-
    solucion_sin_volver_hacia_atras(Laberinto, Posicion, [Posicion], Camino).

solucion_sin_volver_hacia_atras(Laberinto, Posicion, PosicionesPasadas, []):-
    casillero(Laberinto, Posicion, Casillero),
    meta(Casillero),
    dibujar_con_posicion_actual(Laberinto, Posicion).

solucion_sin_volver_hacia_atras(Laberinto, Posicion, PosicionesPasadas, [Direccion | Direcciones]):-
    casillero(Laberinto, Posicion, Casillero),
    not(meta(Casillero)),
    paso(Posicion, NuevaPosicion, PosicionesPasadas, Laberinto, Direccion),
    dibujar_con_posicion_actual(Laberinto, Posicion),
    solucion_sin_volver_hacia_atras(Laberinto, NuevaPosicion, [ NuevaPosicion | PosicionesPasadas ], Direcciones).

paso(Posicion, NuevaPosicion, PosicionesPasadas, Laberinto, Direccion):-
    proxima_posicion(Posicion, NuevaPosicion, Direccion),
    not(member(NuevaPosicion, PosicionesPasadas)),
    casillero(Laberinto, Posicion, Casillero),
    not(pared(Casillero)).

proxima_posicion(posicion(X, Y), posicion(NuevaX, Y), derecha):-
    NuevaX is X + 1.
proxima_posicion(posicion(X, Y), posicion(NuevaX, Y), izquierda):-
    NuevaX is X - 1.
proxima_posicion(posicion(X, Y), posicion(X, NuevaY), arriba):-
    NuevaY is Y - 1.
proxima_posicion(posicion(X, Y), posicion(X, NuevaY), abajo):-
    NuevaY is Y + 1.

casillero(Laberinto, posicion(X, Y), Casillero):-
    nth1(Y, Laberinto, Fila),
    nth1(X, Fila, Casillero).

:- begin_tests(laberinto).

test(si_ya_arrancas_en_la_meta_la_solucion_es_el_camino_vacio):-
    solucion([[.., ..],
              [.., <>]], posicion(2, 2), []).
test(si_arrancamos_a_un_casillero_de_la_meta_la_solucion_es_un_paso_en_la_direccion_de_la_meta):-
    solucion([[.., ..],
              [.., <>]], posicion(1, 2), [derecha]),
    solucion([[.., ..],
              [.., <>]], posicion(2, 1), [abajo]),
    solucion([[<>, ..],
              [.., ..]], posicion(1, 2), [arriba]),
    solucion([[<>, ..],
              [.., ..]], posicion(2, 1), [izquierda]).
test(si_no_estamos_en_la_solucion_el_camino_es_la_lista_de_pasos_que_me_llevan_hasta_la_meta):-
    solucion([[.., .., <>]], posicion(1, 1), [derecha, derecha]),
    solucion([[.., .., ..],
              [.., .., ..],
              [.., .., <>]], posicion(1, 1), [derecha, derecha, abajo, abajo]).

:- end_tests(laberinto).

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
