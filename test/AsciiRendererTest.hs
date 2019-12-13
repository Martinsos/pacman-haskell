module AsciiRendererTest where

import Test.Tasty.Hspec

import qualified Board
import AsciiRenderer (renderBoard)


spec_AsciiRenderer :: Spec
spec_AsciiRenderer = do
    describe "renderBoard" $ do
        it "Correctly renders small board" $ do
            let ascii = [ "   .#"
                        , ".# .#"
                        , "..^.."
                        ]
            let board = Board.fromAscii ascii
            (renderBoard board) `shouldBe` ascii
