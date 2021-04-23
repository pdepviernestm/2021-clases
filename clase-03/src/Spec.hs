module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 3" $ do
    it "una carta se puede jugar si es igual a otra " $ do
      sePuedeJugar unoRojo  unoRojo  `shouldBe`  True 
    it "una carta se puede jugar si tiene el mismo color que otra" $ do
      sePuedeJugar unoRojo  tresRojo   `shouldBe`  True 
    it "una carta se puede jugar si tiene el mismo numero que otra" $ do
      sePuedeJugar unoRojo  unoAmarillo    `shouldBe`  True 
    it "una carta  no se puede jugar si no comparte ni numero ni color con la del mazo" $ do
      sePuedeJugar unoRojo  (2,verde)     `shouldBe`  False 
