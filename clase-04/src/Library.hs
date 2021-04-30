module Library where
import PdePreludat

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

unasCartas :: [Carta]
unasCartas = [CartaNumerica 0 Azul, CartaNumerica 1 Azul, CartaNumerica 1 Verde]

otrasCartas :: [Carta]
otrasCartas = CartaNumerica 3 Rojo : CartaNumerica 9 Verde : CartaNumerica 0 Azul : []

-- >>> ultimaCarta unasCartas
-- CartaNumerica 1 Verde
ultimaCarta = implementame

-- >>> primeras 1 unasCartas
-- [CartaNumerica 0 Azul]
-- >>> primeras 2 unasCartas
-- [CartaNumerica 0 Azul, CartaNumerica 1 Azul]
primeras n cartas = implementame

-- >>> cartasAColores unasCartas
-- [Azul, Azul, Verde]
cartasAColores cartas = implementame

-- Ejemplos en clase con listas

mazoConUnaSolaCarta :: [Carta]
mazoConUnaSolaCarta = [CartaNumerica 5 Rojo]

esListaVacia :: Eq a => [a] -> Bool
esListaVacia xs = xs == [] 

esListaVacia' :: [a] -> Bool
esListaVacia' [] = True
esListaVacia' _ = False

esListaCon1SoloElemento :: [a] -> Bool
esListaCon1SoloElemento (x : []) = True
esListaCon1SoloElemento _ = False

esListaCon1SoloElemento' :: [a] -> Bool
esListaCon1SoloElemento' [x] = True
esListaCon1SoloElemento' _ = False

esListaCon1SoloElemento'' :: Eq a => [a] -> Bool
esListaCon1SoloElemento'' lista = lista /= [] && tail lista == []

esListaCon1SoloElemento''' :: Eq a => [a] -> Bool
esListaCon1SoloElemento''' [] = False
esListaCon1SoloElemento''' lista = tail lista == []
