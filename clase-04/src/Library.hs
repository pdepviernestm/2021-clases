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
ultimaCarta :: [Carta] -> Carta
ultimaCarta [x] = x
ultimaCarta (_ : elResto) = ultimaCarta elResto

-- ultimaCarta [unoRojo, dosVerde, tresAzul]
-- ultimaCarta [dosVerde, tresAzul]
-- ultimaCarta [tresAzul]
-- tresAzul

-- >>> primeras 1 unasCartas
-- [CartaNumerica 0 Azul]
-- >>> primeras 2 unasCartas
-- [CartaNumerica 0 Azul, CartaNumerica 1 Azul]
primeras :: Number -> [Carta] -> [Carta]
primeras 0 _ = []
primeras n (x:xs) = x : primeras (n-1) xs

primeras' :: Number -> [Carta] -> [Carta]
primeras' n lista
    | n == 0 = []
    | otherwise = head lista : primeras (n-1) (tail lista)
-- primeras 2 [unoRojo, dosVerde, tresAzul]
-- unoRojo : primeras 1 [dosVerde, tresAzul]
-- unoRojo : dosVerde : primeras 0 [tresAzul]
-- unoRojo : dosVerde : []
-- [unoRojo, dosVerde]

-- >>> cartasAColores unasCartas
-- [Azul, Azul, Verde]
cartasAColores :: [Carta]->[Color]
cartasAColores [] = []
cartasAColores lista = color (head lista) : cartasAColores (tail lista)

cartasAColores' :: [Carta]->[Color]
cartasAColores' [] = []
cartasAColores' (primeraCarta : resto) = color primeraCarta : cartasAColores' resto

-- cartasAColores [unoAzul, dosAzul, tresVerde]
-- color unoAzul : cartasAColores [dosAzul, tresVerde]
-- color unoAzul : color dosAzul : cartasAColores [tresVerde]
-- color unoAzul : color dosAzul : color tresVerde : cartasAColores []
-- color unoAzul : color dosAzul : color tresVerde : []
-- Azul : Azul : Verde : []
-- [Azul, Azul, Verde]

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
