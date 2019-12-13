module BoardTest where

import Test.Tasty.Hspec

import Control.Exception (evaluate)
import qualified Data.Map.Strict as Map

import qualified Board


spec_Board :: Spec
spec_Board = do
    let ascii = [ " <."
                , " #."
                ]
    let board = Board.fromAscii ascii
    it "Board made with fromAscii has correct dimensions" $ do
        (Board.getBoardWidth board, Board.getBoardHeight board) `shouldBe` (3, 2)
    it "getBoardObjects should return correct objects." $ do
        (Board.getBoardObjects board) `shouldBe`
            (Map.fromList [((2, 0), Board.Food), ((2, 1), Board.Food), ((1, 1), Board.Wall)])
    it "getBoardPacman should return correct pacman." $ do
        (Board.getBoardPacman board) `shouldBe`
            (Board.Pacman { Board.getPacmanPosition = (1, 0), Board.getPacmanDirection = Board.East })
    it "fromAscii should throw error when rows are not of same length" $ do
        evaluate (Board.fromAscii ["<..", ".."]) `shouldThrow` errorCall "Rows are invalid!"
