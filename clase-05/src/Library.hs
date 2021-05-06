module Library where
import PdePreludat

data Color = Rojo | Verde | Amarillo | Azul deriving (Show,Eq)

data Dibujo = Reversa | SaltarTurno deriving (Show,Eq)

data Carta = CartaNumerica{
    numero :: Number,
    color ::    Color 
} | CartaEspecial {
    dibujo ::Dibujo,
    color:: Color
} deriving(Show,Eq)

sonFiguras :: [Carta] -> [Carta]
sonFiguras cartas = filter esFigura cartas

cualesSonDe :: Color -> [Carta] -> [Carta]
cualesSonDe unColor cartas = filter (\carta -> esDeColor unColor carta) cartas

lasRojas :: [Carta] -> [Carta]
lasRojas cartas = filter esRoja cartas

esRoja :: Carta -> Bool
esRoja carta = esDeColor Rojo carta

esDeColor :: Color -> Carta -> Bool
esDeColor unColor carta = color carta == unColor

esFigura :: Carta -> Bool
esFigura (CartaEspecial _ _) = True
esFigura _ = True 

