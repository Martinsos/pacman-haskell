module Board
    ( Board(..)
    , Pacman(..)
    , Object(..)
    , Position
    , Direction(..)
    , fromAscii
    ) where

import Control.Exception (assert)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map

data Board = Board
    { getBoardWidth :: Int
    , getBoardHeight :: Int
    , getBoardPacman :: Pacman
    , getBoardObjects :: Map Position Object
    } deriving (Show)

data Pacman = Pacman
    { getPacmanDirection :: Direction
    , getPacmanPosition :: Position
    } deriving (Show, Eq)

data Object = Food | Wall deriving (Show, Eq)

type Position = (Int, Int) -- (x, y) where top left corner of board is (0, 0) and bottom right is (width, height).

data Direction = North | East | South | West deriving (Eq, Show, Ord)

fromAscii :: [String] -> Board
fromAscii rows
    | not areRowsValid = error "Rows are invalid!"
    | otherwise = Board
                  { getBoardHeight = height
                  , getBoardWidth = width
                  , getBoardPacman = pacman
                  , getBoardObjects = objects
                  }
  where
    areRowsValid = (height > 0) && (width > 0) && (all ((== width) . length) rows)
    height = length rows
    width = length (rows !! 0)

    cells :: [(Position, Char)]
    cells = concatMap (\(x, row) -> map (\(y, char) -> (((x, y), char))) (zip [0..] row)) (zip [0..] rows)

    pacmans :: [Pacman]
    pacmans = [p | Just p <- map (\(position, char) -> pacmanFromAscii position char) cells]
    pacman = assert (length pacmans == 1) $ head pacmans

    objectCells :: [(Position, Object)]
    objectCells = [ (position, object)
                  | (position, Just object) <- map (\(position, char) -> (position, objectFromAscii char)) cells
                  ]
    objects = Map.fromList objectCells

objectFromAscii :: Char -> Maybe Object
objectFromAscii '.' = Just Food
objectFromAscii '#' = Just Wall
objectFromAscii _ = Nothing

pacmanFromAscii :: Position -> Char -> Maybe Pacman
pacmanFromAscii position char = if (char `elem` ("><^v" :: String))
                                then Just (Pacman
                                           { getPacmanPosition = position
                                           , getPacmanDirection = directionFromAscii char})
                                else Nothing
    where
      directionFromAscii '<' = East
      directionFromAscii '>' = West
      directionFromAscii '^' = South
      directionFromAscii 'v' = North
      directionFromAscii _ = error "Not a valid pacman character!"
