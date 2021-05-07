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

-- Para implementar en clase

-- >>> aplicarDosVeces tail [1,2,3,4,5]
-- [3,4,5]
-- >>> aplicarDosVeces (\x -> x + 3) 5
-- 11
aplicarDosVeces :: (a -> a) -> a -> a 
aplicarDosVeces funcion valor = funcion (funcion valor)


-- >>> aplicarEnOrden tail length [1,2,3,4,5]
-- 4
-- >>> aplicarEnOrden not esFigura (CartaNumerica 5 Azul)
-- False
aplicarEnOrden = implementame

-- >>> positivos [-1,2,-4,5]
-- [2, 5]
positivos :: [Number] -> [Number]
positivos numeros = filter esPositivo numeros

esPositivo :: Number -> Bool
esPositivo numero = numero > 0 

-- >>> noHayNingunoMayorQue 5 [1,2,3]
-- True
-- >>> noHayNingunoMayorQue 2 [1,2,3]
-- False
noHayNingunoMayorQue :: Number -> [Number] -> Bool
noHayNingunoMayorQue maximo lista = all (\numero -> numero <= maximo) lista  

-- >>> tieneEspacio "hola"
-- False
-- >>> tieneEspacio "hola mundo"
-- True
tieneEspacio :: String -> Bool
tieneEspacio = implementame

-- >>> sumatoria [1,2,3,4,5]
-- 15
sumatoria :: [Number] -> Number
sumatoria numeros = foldl (+) 0 numeros
-- foldl1 (+) [1,2,3]
-- (1 + 2) + 3
--
-- foldl (+) 0 [1,2,3]
-- ((0 + 1) + 2) + 3

-- >>> concatenarTodas ["pero el ", "te", "ma to", "davia da", " para ", "mas"]
-- "pero el tema todavia da para mas"
concatenarTodas :: [String] -> String
concatenarTodas strings = foldl (++) "" strings

concatenarConEspacios :: [String] -> String
concatenarConEspacios strings =
    foldl concatenarConEspacio "" strings

concatenarConEspacio :: String -> String -> String
concatenarConEspacio "" otroString = otroString
concatenarConEspacio unString otroString = unString ++ " " ++ otroString

-- 
-- >>> cumpleTodas [esRoja, esFigura] (CartaEspecial Reversa Roja)
-- True
-- >>> cumpleTodas [(\carta -> esDeColor Verde carta), esFigura] (CartaEspecial Reversa Roja)
-- False
--
cumpleTodas :: [a -> Bool] -> a -> Bool
cumpleTodas condiciones valor =
    all (\condicion -> condicion valor) condiciones
