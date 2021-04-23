module Library where
import PdePreludat

rojo = "Rojo"
verde = "Verde"
azul = "Azul"
amarillo = "Amarillo"
-- Queremos saber si una carta del Uno se puede jugar luego de otra.
unoRojo = (1,rojo)
dosVerde=(2,verde)
tresRojo=(3,rojo)

unoAmarillo=(1,amarillo)

type Carta = (Number,String)

sePuedeJugar:: Carta -> Carta -> Bool 
sePuedeJugar unaCarta cartaDelMazo = compartenValor unaCarta cartaDelMazo  || compartenColor unaCarta cartaDelMazo

compartenValor:: Carta -> Carta -> Bool
compartenValor unaCarta otraCarta = fst unaCarta == fst otraCarta

compartenColor:: Carta -> Carta -> Bool
compartenColor unaCarta otraCarta = snd unaCarta == snd otraCarta
-- Las cartas que tienen numero y color,  =se pueden jugar sobre cartas que tengan el mismo numero o el mismo color.

-- Las cartas de reversa o saltear turno que también tienen color, se pueden jugar sobre otra carta de la misma figura o del mismo color.

-- Finalmente, las cartas de +4 cambian el color así que se pueden jugar sobre cualquier otra carta.

-- Luego de un  +4  se puede jugar otro +4 o cualquier carta que coincida en color




