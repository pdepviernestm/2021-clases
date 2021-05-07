module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 5" $ do
    describe "sumatoria" $ do
      it "dada una lista de numeros, me da la suma de todos ellos" $ do
        sumatoria [1,2,3] `shouldBe` 6
      it "dada una lista vacia, me da 0" $ do
        sumatoria [] `shouldBe` 0
    describe "concatenarTodas" $ do
      it "dadas varias palabras, me devuelve la concatenacion de ellas" $ do
        concatenarTodas ["hola ", "mundo"] `shouldBe` "hola mundo"
      it "si no hay ninguna palabra, me da el string vacio" $ do
        concatenarTodas [] `shouldBe` ""
    describe "concatenarConEspacios" $ do
      it "dadas varias palabras, me las concatena separandolas por espacios" $ do
        concatenarConEspacios ["hola", "mundo"] `shouldBe` "hola mundo"
      it "si no hay ninguna palabra, me da el string vacio" $ do
        concatenarConEspacios [] `shouldBe` ""
    describe "positivos" $ do
      it "dada una lista vacia, me da la misma lista" $ do
        positivos [] `shouldBe` []
      it "dada una con solo positivos, me da la misma lista" $ do
        positivos [1, 3, 5] `shouldBe` [1, 3, 5]
      it "dada una de numeros, me da otra con solo los positivos" $ do
        positivos [1, 0, 3, -2, -6, 5, -4] `shouldBe` [1, 3, 5]
    describe "noHayNingunoMayorQue" $ do
      it "si le paso una lista vacia me da True" $ do
        noHayNingunoMayorQue 5 [] `shouldBe` True
      it "si le paso una lista con todos elementos menores da True" $ do
        noHayNingunoMayorQue 5 [1,2,3] `shouldBe` True
      it "si le paso una lista con todos elementos menores o iguales da True" $ do
        noHayNingunoMayorQue 5 [1,2,3,5] `shouldBe` True
      it "si le paso una lista con algun elemento mayor da False" $ do
        noHayNingunoMayorQue 5 [1,2,6,3,5] `shouldBe` False
    describe "cumpleTodas" $ do
      it "si le paso una lista vacia de condiciones, da True" $ do
        cumpleTodas [] 5 `shouldBe` True
      it "si le paso unas condiciones y un valor, y alguna condicion no la cumple ese valor, da False" $ do
        cumpleTodas [even] 5 `shouldBe` False
      it "si le paso unas condiciones y un valor, y el valor cumple todas las condiciones, da True" $ do
        cumpleTodas [odd, (\n -> n < 10)] 5 `shouldBe` True
    describe "aplicarDosVeces" $ do        
      let sumarDos n = n + 2 
      it "si le paso un valor, y una funcion, aplica 2 veces seguidas la funcion" $ do
        aplicarDosVeces sumarDos 3 `shouldBe` 7

escribime :: Expectation
escribime = implementame
