module Library where
import PdePreludat

si :: Bool -> a -> a -> a
si condicion valor1 valor2 
    | condicion = valor1
    | otherwise = valor2

unos :: [Number]
unos = 1 : unos
-- 1 : unos
-- 1 : 1 : unos
-- 1 : 1 : 1 : unos
-- 1 : 1 : 1 : 1 : unos
-- 1 : 1 : 1 : 1 : 1 : unos

head' :: [a] -> a
head' (x : _) = x

-- head' unos
-- head' (1 : unos)
-- 1

repetir :: a -> [a]
repetir valor = valor : repetir valor

replicar :: Number -> a -> [a]
replicar cantidad valor = take cantidad (repetir valor)

naturales :: [Number]
naturales = [1..]

potenciasDeDos :: [Number]
potenciasDeDos = map (2 ^) [0..]

sumatoriaDeTodosLosNaturales :: Number
sumatoriaDeTodosLosNaturales = sum naturales -- sum necesita evaluar toda la lista, así que esto nunca va a terminar

losPares :: [Number]
-- losPares = [2,4..]
-- losPares = map (2*) naturales
losPares = filter even naturales

-- esta alternativa no termina:
-- losPares ++ [2 + last losPares]
-- (losPares ++ [2 + last losPares]) ++ [2 + last (losPares ++ [2 + last losPares])]
-- 

unaListaCualquiera :: [Number]
unaListaCualquiera = filter (<0) naturales
-- no puede llegar a calcular el primer elemento de la lista

serieDeFibonacci :: [Number]
-- serieDeFibonacci = map fibonacci [0..]
-- [0,1,1,2,3,5,8,13,21...
serieDeFibonacci =
    0 : 1 : zipWith (+) serieDeFibonacci (tail serieDeFibonacci)

fibonacci' :: Number -> Number
fibonacci' n = serieDeFibonacci !! n

-- 0 : 1 : zipWith (+) serieDeFibonacci (tail serieDeFibonacci)
-- 0 : 1 : (0 + 1) : (1 + (0 + 1)) : ((0 + 1) + (1 + (0 + 1)))
-- 0, 1, 1, 2, 3...

fibonacci :: Number -> Number
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- consultas

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f x y = f y x

-- >>> take 2 [1,2,3]
-- [1,2]
--
-- >>> flip take [1,2,3] 2
-- [1,2]
--
-- >>> flip take 2 [1,2,3]
-- Couldn't match expected type ‘[a]’ with actual type ‘Number’
-- Couldn't match expected type ‘Number’ with actual type ‘[Number]’

--

sumaPar 