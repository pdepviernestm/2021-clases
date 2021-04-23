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
      sePuedeJugar unoRojo  dosVerde      `shouldBe`  False 
    it "una carta  especial se puede jugar despues de si misma" $ do
      sePuedeJugar reversaRojo   reversaRojo       `shouldBe`  True 
    it "una carta  especial se puede jugar despues de una carta especial que comparte dibujo" $ do
      sePuedeJugar reversaRojo   (CartaEspecial  Reversa Amarillo )       `shouldBe`  True
    it "una carta  especial  se puede jugar despues de una carta especial que comparte color" $ do
      sePuedeJugar reversaRojo   (CartaEspecial  SaltarTurno  Rojo )       `shouldBe`  True
    it "una carta  especial  no se puede jugar despues de una carta especial que no comparte color ni dibujo" $ do
      sePuedeJugar reversaRojo   (CartaEspecial  SaltarTurno  Amarillo  )       `shouldBe`  False
    it "una carta  numerica  no se puede jugar despues de una carta especial que no comparte color ni dibujo" $ do
      sePuedeJugar unoRojo    (CartaEspecial  SaltarTurno  Amarillo  )       `shouldBe`  False
    it "una carta  especial   se puede jugar despues de una carta numerica que comparte color" $ do
      sePuedeJugar reversaRojo   (CartaNumerica  2  Rojo  )       `shouldBe`  True
    it "una carta  numerica   se puede jugar despues de una carta especial que comparte color" $ do
      sePuedeJugar (CartaNumerica  2  Rojo  ) reversaRojo          `shouldBe`  True