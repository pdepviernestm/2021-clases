module Library where
import PdePreludat
import Data.List (isPrefixOf, isSuffixOf)

preguntar :: String -> String
preguntar oracion =
    agregarInterrogacionAlPrincipio (agregarInterrogacionAlFinal oracion)

leFaltaSignoDePreguntaAlFinal :: String -> Bool
leFaltaSignoDePreguntaAlFinal oracion = not ("?" `isSuffixOf` oracion)

agregarInterrogacionAlFinal :: String -> String
agregarInterrogacionAlFinal oracion
    | leFaltaSignoDePreguntaAlFinal oracion = oracion ++ "?"
    | otherwise = oracion

leFaltaSignoDePreguntaAlPrincipio :: String -> Bool
leFaltaSignoDePreguntaAlPrincipio oracion = not ("¿" `isPrefixOf` oracion)

agregarInterrogacionAlPrincipio :: String -> String
agregarInterrogacionAlPrincipio oracion
    | leFaltaSignoDePreguntaAlPrincipio oracion = "¿" ++ oracion
    | otherwise = oracion

-- ¿Y como implementaríamos ahora exclamar pero sin repetir lógica?
-- exclamar "hola" -> "¡hola!"
-- exclamar "hola!" -> "¡hola!"

-- isPrefixOf nos dice si un string empieza con otro string
-- isSuffixOf nos dice si un string termina con otro string
-- ++

-- >>> isSuffixOf "ojos" "anteojos"
-- True
--
-- >>> isPrefixOf "ante" "anteojos"
-- True
--
-- >>> "hola " ++ "mundo"
-- "hola mundo"

-- Queremos que funcione así:
-- >>> preguntar "hola"
-- "hola?"
-- >>> preguntar "hola?"
-- "hola?"