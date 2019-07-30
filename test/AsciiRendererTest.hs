module AsciiRendererTest where

import Test.Tasty.Hspec

import qualified Board
import Pacman (Pacman(..))
import Game (makeNewGame)
import Direction
import AsciiRenderer (renderBoard, renderField, renderPacman)


spec_AsciiRenderer :: Spec
spec_AsciiRenderer = do
    describe "renderBoard" $ do
        it "Correctly renders small board" $ do
            let board = Board.fromList [ [Board.Food, BoardWall]
                                       , [Board.Empty, Board.Wall]
                                       , [Board.Wall, Board.Wall]
                                       ]
            (renderBoard board) `shouldBe` ".#\n #\n##"
    describe "renderField" $ do
        it "Renders different types of fields correctly" $ do
            map renderField [Board.Food, Board.Wall, Board.Empty] `shouldBe` ".# "
    describe "renderPacman" $ do
        it "Renders pacman differently according to its direction" $ do
            let pacman = Pacman { direction = East
                                , position = Board.Position { getX = 0, getY = 0 }
                                }
            let pacmans = map (\d -> pacman { direction = d }) [North, East, South, West]
            map renderPacman pacmans `shouldBe` "v<^>"
    describe "renderGame" $ do
        it "Correctly renders new game with small board" $ do
            let board = Board.fromList [ [Board.Empty, Board.Wall]
                                       , [Board.Empty, Board.Food]
                                       ]
            let pacman = Pacman { direction = East
                                , position = Board.Position { getX = 0, getY = 0 }
                                }
            let game = makeNewGame board pacman
            renderGame game `shouldBe` "<#\n ."
