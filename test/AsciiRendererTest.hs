module AsciiRendererTest where

import Test.Tasty.Hspec

import qualified Board
import Pacman (Pacman(..))
import Game (makeNewGame)
import AsciiRenderer (renderBoard, renderField, renderPacman, renderGame)


spec_AsciiRenderer :: Spec
spec_AsciiRenderer = do
    describe "renderBoard" $ do
        it "Correctly renders small board" $ do
            let board = Board.fromList [ [Board.Food, Board.Wall]
                                       , [Board.Empty, Board.Wall]
                                       , [Board.Wall, Board.Wall]
                                       ]
            (renderBoard board) `shouldBe` ".#\n #\n##"
    describe "renderField" $ do
        it "Renders different types of fields correctly" $ do
            map renderField [Board.Food, Board.Wall, Board.Empty] `shouldBe` ".# "
    describe "renderPacman" $ do
        it "Renders pacman differently according to its direction" $ do
            let pacman = Pacman { direction = Board.East
                                , position = Board.Position { Board.getX = 0, Board.getY = 0 }
                                }
            let pacmans = map
                          (\d -> pacman { direction = d })
                          [Board.North, Board.East, Board.South, Board.West]
            map renderPacman pacmans `shouldBe` "v<^>"
    describe "renderGame" $ do
        it "Correctly renders new game with small board" $ do
            let board = Board.fromList [ [Board.Empty, Board.Wall]
                                       , [Board.Empty, Board.Food]
                                       ]
            let pacman = Pacman { direction = Board.East
                                , position = Board.Position { Board.getX = 0, Board.getY = 0 }
                                }
            let game = makeNewGame board pacman
            renderGame game `shouldBe` "<#\n ."
