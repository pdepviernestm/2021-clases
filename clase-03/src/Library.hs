module Library where
import PdePreludat

rojo = Rojo
verde = Verde
azul = Azul
amarillo = Amarillo
-- Queremos saber si una carta del Uno se puede jugar luego de otra.
unoRojo = CartaNumerica 1 rojo
dosVerde= CartaNumerica 2 verde
tresRojo= CartaNumerica 3 rojo

unoAmarillo= CartaNumerica 1 amarillo

reversaRojo= CartaEspecial Reversa Rojo

data Carta = CartaNumerica{
    numero :: Number,
    color ::    Color 
} | CartaEspecial {
    dibujo ::Dibujo,
    color:: Color
} deriving(Show,Eq)

sePuedeJugar:: Carta -> Carta -> Bool 
sePuedeJugar unaCarta cartaDelMazo = compartenValor unaCarta cartaDelMazo  || compartenColor unaCarta cartaDelMazo


compartenValor:: Carta -> Carta -> Bool
compartenValor (CartaNumerica valorDeCarta _) (CartaNumerica valorDeOtraCarta _) = valorDeCarta == valorDeOtraCarta
compartenValor (CartaEspecial dibujoCarta _) (CartaEspecial dibujoOtraCarta _) = dibujoCarta == dibujoOtraCarta
compartenValor _ _ = False

compartenColor:: Carta -> Carta -> Bool
compartenColor unaCarta otraCarta = color unaCarta == color otraCarta

data Color = Rojo | Verde | Amarillo | Azul deriving(Show,Eq)

data Dibujo = Reversa | SaltarTurno deriving(Show,Eq)

juan :: (Number, [Char])
juan = (20, "juan")





-- Las cartas que tienen numero y color,  =se pueden jugar sobre cartas que tengan el mismo numero o el mismo color.

-- Las cartas de reversa o saltear turno que también tienen color, se pueden jugar sobre otra carta de la misma figura o del mismo color.

-- Finalmente, las cartas de +4 cambian el color así que se pueden jugar sobre cualquier otra carta.

-- Luego de un  +4  se puede jugar otro +4 o cualquier carta que coincida en color




