module Library where
import PdePreludat

-- Queremos saber si una carta del Uno se puede jugar luego de otra.

-- Las cartas que tienen numero y color, se pueden jugar sobre cartas que tengan el mismo numero o el mismo color.

-- Las cartas de reversa o saltear turno que también tienen color, se pueden jugar sobre otra carta de la misma figura o del mismo color.

-- Finalmente, las cartas de +4 cambian el color así que se pueden jugar sobre cualquier otra carta.

-- Luego de un  +4  se puede jugar otro +4 o cualquier carta que coincida en color
