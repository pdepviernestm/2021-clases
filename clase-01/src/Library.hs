module Library where
import PdePreludat

tau :: Number
tau = pi * 2
-- f(x) = 2 * pi * x
perimetroCirculo :: Number -> Number
perimetroCirculo radio = 2 * pi * radio

-- g(x) = pi * x * 2
perimetroCuadrado :: Number -> Number
perimetroCuadrado lado = 4 * lado

superficieCuadrado :: Number -> Number
superficieCuadrado lado = lado ^^ 2

superficieCubo :: Number -> Number
superficieCubo lado = 6 * superficieCuadrado lado

superficieCilindro :: Number -> Number -> Number
superficieCilindro altura radio =
     superficieLateralDelCilindro altura radio +
        superficieTapasDelCilindro radio

superficieLateralDelCilindro :: Number -> Number -> Number
superficieLateralDelCilindro altura radio = altura * perimetroCirculo radio

-- f(x)
superficieCirculo :: Number -> Number
superficieCirculo radio = pi * radio ^^ 2

-- g(x) = 2 + f(x)
superficieTapasDelCilindro :: Number -> Number
superficieTapasDelCilindro radio = 2 * superficieCirculo radio
