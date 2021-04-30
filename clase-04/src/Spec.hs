module Spec where
import PdePreludat
import Library
import Test.Hspec

unoRojo = CartaNumerica 1 Rojo
dosVerde = CartaNumerica 2 Verde

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 4" $ do
    describe "ultimaCarta" $ do
      it "de una lista de una sola carta, me da esa carta" $ do
        ultimaCarta [unoRojo] `shouldBe` unoRojo
      it "dada una lista, me devuelve la última carta" $ do
        ultimaCarta [unoRojo, dosVerde] `shouldBe` dosVerde
    describe "primerasCartas" $ do
      it "si le pasamos 0, nos da una lista vacia" $ do
        primeras 0 [unoRojo, dosVerde] `shouldBe` []
        primeras 0 [] `shouldBe` []
      it "si le pasamos un numero, nos da una lista con tantos valores como ese numero" $ do
        primeras 1 [unoRojo, dosVerde] `shouldBe` [unoRojo]
        primeras 3 [unoRojo, dosVerde, dosVerde, unoRojo] `shouldBe` [unoRojo, dosVerde, dosVerde]
    describe "cartasAColores" $ do
      it "si le paso una lista vacia, me da una lista vacia" $ do
        cartasAColores [] `shouldBe` []
      it "si le paso una lista con una carta, me da una lista con un valor que es el color de esa carta" $ do
        cartasAColores [unoRojo] `shouldBe` [Rojo]
        cartasAColores [unoRojo, dosVerde, dosVerde] `shouldBe` [Rojo, Verde, Verde]