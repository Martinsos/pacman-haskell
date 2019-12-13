module GameTest where

import Test.Tasty.Hspec

import Board (Position(..), Direction(..))
import qualified Board
import Pacman (Pacman(..))
import Game

spec_Game :: Spec
spec_Game = do
    let board = Board.fromList $ replicate 2 $ replicate 2 Board.Food
    let pacman = Pacman { direction = East, position = Board.Position { getX = 0, getY = 0 } }
    let newGame = makeNewGame board pacman
    describe "New game" $ do
        it "New game starts with score == 0" $ do
            getScore newGame `shouldBe` 0
        it "New game starts with 0 steps elapsed" $ do
            numStepsElapsed newGame `shouldBe` 0
        it "New game is not over" $ do
            isOver newGame `shouldBe` False
