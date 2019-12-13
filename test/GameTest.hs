module GameTest where

import Test.Tasty.Hspec

import qualified Board
import qualified Game

spec_Game :: Spec
spec_Game = do
    let board = Board.fromAscii ["<..", "..."]
    let newGame = Game.makeNewGame board
    describe "New game" $ do
        it "New game starts with score == 0" $ do
            Game.getScore newGame `shouldBe` 0
        it "New game starts with 0 steps elapsed" $ do
            Game.numStepsElapsed newGame `shouldBe` 0
        it "New game is not over" $ do
            Game.isOver newGame `shouldBe` False
