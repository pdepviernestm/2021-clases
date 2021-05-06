module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Tests de clase 5" $ do
    it "" $ do
      escribime

escribime :: Expectation
escribime = implementame
