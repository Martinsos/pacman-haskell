module BoardTest where

import Test.Tasty.Hspec

import Board


spec_defaultBoard :: Spec
spec_defaultBoard = do
    it "has dimensions of 10 x 10" $ do
        (width defaultBoard) `shouldBe` 10
        (height defaultBoard) `shouldBe` 10
