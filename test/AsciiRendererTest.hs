module AsciiRendererTest where

import Test.Tasty.Hspec

import Board (Field(..), fromList)
import AsciiRenderer (renderBoard, renderField)


spec_renderBoard :: Spec
spec_renderBoard = do
    it "correctly renders small board" $ do
        let board = fromList [[Food, Wall], [Empty, Wall], [Wall, Wall]]
        (renderBoard board) `shouldBe` ".#\n #\n##"

spec_renderField :: Spec
spec_renderField = do
    it "Renders different types of fields correctly" $ do
        map renderField [Food, Wall, Empty] `shouldBe` ".# "
