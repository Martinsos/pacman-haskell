module EngineTest where

import Test.Tasty.Hspec

import Game (Game)
import qualified Game
import qualified Board
import qualified Engine

spec_Engine :: Spec
spec_Engine = do
    let game = Game.makeNewGame $ Board.fromAscii [ ".># " ]

    describe "nextStep" $ do
        let nextGame = Engine.nextStep game
        it "should increase numStepsElapsed for 1" $ do
            (Game.numStepsElapsed nextGame) `shouldBe` (Game.numStepsElapsed game + 1)
        it "should move pacman one field to the left" $ do
            let pacmanPosition = getPacmanPosition game
            getPacmanPosition nextGame `shouldBe` (fst pacmanPosition - 1, snd pacmanPosition)

    describe "movePacman" $ do
        -- TODO: This test (move pacman) is duplicated for nextStep function! But I want to also check for nextStep that
        --   pacman moved (that it calls movePacman).
        --   So how do I go about this, do I leave it copied or do something different?
        it "should move pacman for one field in it's direction" $ do
            let game' = Engine.movePacman game
            let pacmanPosition = getPacmanPosition game
            getPacmanPosition game' `shouldBe` (fst pacmanPosition - 1, snd pacmanPosition)

        it "should increase score for food points of one food when pacman eats it" $ do
            let game' = Engine.movePacman game
            Game.getScore game' `shouldBe` (Game.getScore game) + Engine.foodPoints

        it "should remove food when pacman eats it" $ do
            pending

        it "should not move pacman if it hits the wall" $ do
            let game' = Engine.movePacman $ Game.makeNewGame $ Board.fromAscii [ "#> " ]
            getPacmanPosition game' `shouldBe` getPacmanPosition game

    describe "calcNextPosition" $ do
        let board = Board.fromAscii [ "#. .", "...." ]
        it "should return position that is shifted for 1 in the correct direction" $ do
            Engine.calcNextPosition board (2, 0) Board.East `shouldBe` (3, 0)
            Engine.calcNextPosition board (2, 0) Board.West `shouldBe` (1, 0)
            Engine.calcNextPosition board (2, 1) Board.North `shouldBe` (2, 0)
            Engine.calcNextPosition board (2, 0) Board.South `shouldBe` (2, 1)
        it "should \"circulate\" the position if it gets out of board borders" $ do
            Engine.calcNextPosition board (3, 1) Board.East `shouldBe` (0, 1)
            Engine.calcNextPosition board (0, 1) Board.West `shouldBe` (3, 1)
            Engine.calcNextPosition board (2, 0) Board.North `shouldBe` (2, 1)
            Engine.calcNextPosition board (2, 1) Board.South `shouldBe` (2, 0)
        it "should return original position if there is a wall in place of next position" $ do
            Engine.calcNextPosition board (0, 1) Board.South `shouldBe` (0, 1)

  where
      getPacmanPosition :: Game -> Board.Position
      getPacmanPosition game = Board.getPacmanPosition $ Board.getBoardPacman $ Game.getBoard game
