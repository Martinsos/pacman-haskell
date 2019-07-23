module AsciiRenderer
    ( renderBoard
    ) where

import Data.List (intercalate)

import Board (Board(..))


renderBoard :: Board -> String
renderBoard board = asciiBoard
    where
      asciiBoard = intercalate "\n" $ replicate (height board) asciiRow
      asciiRow = replicate (width board) asciiFood
      asciiFood = '.'
