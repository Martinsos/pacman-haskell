module AsciiRenderer
    ( renderGame
    -- For tests only:
    , renderBoard
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
renderRow board y = concat [renderField board (x, y) | x <- [0 .. (Board.getBoardWidth board) - 1]]

renderField :: Board -> Board.Position -> String
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

-- NOTE: We render single fields with 3 horizontally consecutive 3, in order to compensate for
--   vertical elongation that is present in most terminals. That is why we print " < " instead of "<".

renderPacman :: Board.Pacman -> String
renderPacman pacman
    | direction == Board.North = " v "
    | direction == Board.East = " < "
    | direction == Board.West = " > "
    | direction == Board.South = " ^ "
    | otherwise = error "Pacman is invalid for rendering"
  where direction = Board.getPacmanDirection pacman

renderObject :: Board.Object -> String
renderObject Board.Food = " · "
renderObject Board.Wall = "███"

renderEmptyField :: String
renderEmptyField = "   "

renderGame :: Game -> [String]
renderGame game =
    [ "Score: " ++ show (Game.getScore game)
    , "Time: " ++ show (Game.numStepsElapsed game)
    , ""
    ] ++ (map (leftBoardPadding ++) $ renderBoard $ Game.getBoard game)
  where
    leftBoardPadding = take 4 $ repeat ' '
