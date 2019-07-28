module AsciiRendererTest where

import Test.Tasty.Hspec

import Board (Field(..), fromList)
import Pacman (newPacman, setDirection)
import Direction
import AsciiRenderer (renderBoard, renderField, renderPacman)


spec_AsciiRenderer :: Spec
spec_AsciiRenderer = do
    describe "renderBoard" $ do
        it "Correctly renders small board" $ do
            let board = fromList [[Food, Wall], [Empty, Wall], [Wall, Wall]]
            (renderBoard board) `shouldBe` ".#\n #\n##"
    describe "renderField" $ do
        it "Renders different types of fields correctly" $ do
            map renderField [Food, Wall, Empty] `shouldBe` ".# "
    describe "renderPacman" $ do
        it "Renders pacman differently according to its direction" $ do
            let pacmans = map (setDirection newPacman) [North, East, South, West]
            map renderPacman pacmans `shouldBe` "v<^>"
