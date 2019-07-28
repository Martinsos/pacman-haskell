module GameTest where

import Test.Tasty.Hspec

import Game

spec_Game :: Spec
spec_Game = do
    describe "New game" $ do
        it "New game starts with score == 0" $ do
            getScore newGame `shouldBe` 0
        it "New game starts with 0 steps elapsed" $ do
            numStepsElapsed newGame `shouldBe` 0
        it "New game is not over" $ do
            isOver newGame `shouldBe` False
