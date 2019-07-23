module AsciiRendererTest where

import Test.Tasty.Hspec

import Board (Board(..))
import AsciiRenderer (renderBoard)


spec_renderBoard :: Spec
spec_renderBoard = do
    it "correctly renders 2x2 board" $ do
        let board = Board { width = 2, height = 2 }
        (renderBoard board) `shouldBe` "..\n.."
    it "correctly renders 3x3 board" $ do
        let board = Board { width = 3, height = 3 }
        (renderBoard board) `shouldBe` "...\n...\n..."
