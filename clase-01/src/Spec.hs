module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de ejemplo" $ do
    it "2 y 2 son 4" $ do
      2 + 2 `shouldBe` 4
    it "4 y 2 son 6" $ do
      4 + 2 `shouldBe` 6
    it "el perimetro de un circulo es 2 pi por radio" $ do
      perimetroCirculo 5 `shouldBe` 31.415926536
    it "la superficie de un circulo es pi por radio al cuadrado" $ do
      superficieCirculo 10 `shouldBe` 314.159265359
    it "el perimetro de un cuadrado es la suma de sus lados" $ do
      perimetroCuadrado 2 `shouldBe` 8
      perimetroCuadrado 5 `shouldBe` 20
    it "la superficie de un cuadrado es su lado al cuadrado" $ do
      superficieCuadrado 5 `shouldBe` 25
    it "la superficie de un cubo es 6 por lado al cuadrado" $ do
      superficieCubo 5 `shouldBe` 150
    it ("la superficie de un cilindro es la superficie de las 2 tapas" ++
        "la superficie lateral que es la altura por el perimetro de la circcunferencia") $ do
      superficieCilindro 3 5 `shouldBe` 251.327412287
    



