module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 3" $ do
    it "" $ do
      2 + 2 `shouldBe` 4
