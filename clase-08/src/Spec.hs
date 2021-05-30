module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 8" $ do
    it "al pasar una condicion verdadera a si, devuelve el primer valor" $ do
      si (10 > 3) "10esMayor" "3esMayor" `shouldBe` "10esMayor"
    it "al pasar una condicion falsa a si, devuelve el segundo valor" $ do
      si (2 > 3) 5 10 `shouldBe` 10
    it "unos deberia ser todos 1s" $ do
      take 10 unos `shouldBe` [1,1,1,1,1,1,1,1,1,1]
    it "repetir deberia ser una lista con todos el elemento a repetir" $ do
      take 10 (repetir 1) `shouldBe` [1,1,1,1,1,1,1,1,1,1]
      take 3 (repetir "hola") `shouldBe` ["hola", "hola", "hola"]
    it "replicar deberia ser una lista con el elemento a repetir tantas veces como se pida" $ do
      replicar 10 1 `shouldBe` [1,1,1,1,1,1,1,1,1,1]
      replicar 3 "hola" `shouldBe` ["hola", "hola", "hola"]
    it "naturales deberia ser los enteros mayores a 0 en orden" $ do
      take 10 naturales `shouldBe` [1,2,3,4,5,6,7,8,9,10]
    it "potenciasDe2 deberia ser todas las potencias de 2 en orden" $ do
      take 10 potenciasDeDos `shouldBe` [1,2,4,8,16,32,64,128,256,512]
    it "losPares deberia ser los numeros pares en orden" $ do
      take 10 losPares `shouldBe` [2,4,6,8,10,12,14,16,18,20]
    it "serieDeFibonacci deberia ser los numeros de la serie de fibonacci" $ do
      take 10 serieDeFibonacci `shouldBe` [0,1,1,2,3,5,8,13,21,34]
