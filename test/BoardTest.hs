module BoardTest where

import Test.Tasty.Hspec

import Control.Exception (evaluate)

import Board


spec_Board :: Spec
spec_Board = do
    let fields = [ [Food, Wall]
                 , [Food, Wall]
                 , [Food, Empty]
                 ]
    let board = fromList fields
    it "Board made with fromList has correct dimensions" $ do
        (getWidth board, getHeight board) `shouldBe` (2, 3)
    -- TODO: we could write property test for this.
    it "toList should return list given to fromList." $ do
        toList board `shouldBe` fields
    it "fromList should throw error when rows are not of same length" $ do
        evaluate (fromList [[Food], [Food, Wall]]) `shouldThrow` errorCall "Rows are invalid!"
