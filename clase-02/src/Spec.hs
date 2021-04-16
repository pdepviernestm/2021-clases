module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 2" $ do
    it "test de mentira" $ do
      1 + 1 `shouldBe` 3
    
    