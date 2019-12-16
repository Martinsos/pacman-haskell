module AsciiRendererTest where

import Test.Tasty.Hspec

import qualified Board
import qualified Game
import AsciiRenderer (renderBoard, renderGame)


spec_AsciiRenderer :: Spec
spec_AsciiRenderer = do
    let simpleBoardAscii = [ "   .#"
                           , ".# .#"
                           , "..^.."
                           ]
    let simpleBoardAsciiRendering = [ "          · ███"
                                    , " · ███    · ███"
                                    , " ·  ·  ^  ·  · "
                                    ]
    describe "renderBoard" $ do
        it "Correctly renders small board" $ do
            let board = Board.fromAscii simpleBoardAscii
            (renderBoard board) `shouldBe` simpleBoardAsciiRendering

    describe "renderGame" $ do
        it "Correctly renders new game with simple board" $ do
            let simpleBoard = Board.fromAscii simpleBoardAscii
            let game = Game.makeNewGame simpleBoard
            (renderGame game) `shouldBe`
                [ "Score: " ++ show (Game.getScore game)
                , "Time: " ++ show (Game.numStepsElapsed game)
                , ""
                ] ++ (map ("    " ++) simpleBoardAsciiRendering)
