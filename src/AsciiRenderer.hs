module AsciiRenderer
    ( renderBoard
    , renderGame
    -- For tests only:
    ) where

import Data.Maybe
import qualified Data.Map.Strict as Map

import Game (Game)
import qualified Game
import Board (Board)
import qualified Board


renderBoard :: Board -> [String]
renderBoard board = [renderRow board y | y <- [0 .. (Board.getBoardHeight board) - 1]]

renderRow :: Board -> Int -> String
renderRow board y = [renderField board (x, y) | x <- [0 .. (Board.getBoardWidth board) - 1]]

renderField :: Board -> Board.Position -> Char
renderField board fieldPosition
    | isJust pacmanOnTheField = renderPacman $ fromJust pacmanOnTheField
    | isJust objectOnTheField = renderObject $ fromJust objectOnTheField
    | otherwise = renderEmptyField
  where
    pacmanOnTheField :: Maybe Board.Pacman
    pacmanOnTheField = let pacman = Board.getBoardPacman board
                       in if Board.getPacmanPosition pacman == fieldPosition then Just pacman else Nothing
    objectOnTheField :: Maybe Board.Object
    objectOnTheField = Map.lookup fieldPosition (Board.getBoardObjects board)

renderPacman :: Board.Pacman -> Char
renderPacman pacman
    | direction == Board.North = 'v'
    | direction == Board.East = '<'
    | direction == Board.West = '>'
    | direction == Board.South = '^'
    | otherwise = error "Pacman is invalid for rendering"
  where direction = Board.getPacmanDirection pacman

renderObject :: Board.Object -> Char
renderObject Board.Food = '·'
renderObject Board.Wall = '█'

renderEmptyField :: Char
renderEmptyField = ' '

renderGame :: Game -> [String]
renderGame game =
    [ "Score: " ++ show (Game.getScore game)
    , ""
    ] ++ (map (leftBoardPadding ++) $ renderBoard $ Game.getBoard game)
  where
    leftBoardPadding = take 4 $ repeat ' '
