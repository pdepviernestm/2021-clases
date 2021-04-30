module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 4" $ do
    it "2 + 2 es 4" $ do
      2 + 2 `shouldBe` 4