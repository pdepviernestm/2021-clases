module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 2" $ do
    it "si le paso a preguntar una oracion sin signos de pregunta, se los agrega" $ do
      preguntar "hola" `shouldBe` "¿hola?"
    it "si le paso a preguntar una oracion con signo de pregunta solo al final, le agrega el del principio" $ do
      preguntar "como estas?" `shouldBe` "¿como estas?"
    it "si le paso a preguntar una oracion con signo de pregunta solo al principio, le agrega el del final" $ do
      preguntar "¿como estas" `shouldBe` "¿como estas?"
    it "si le paso a preguntar una oracion con signos de pregunta, la deja igual" $ do
      preguntar "¿como estas?" `shouldBe` "¿como estas?"
    
