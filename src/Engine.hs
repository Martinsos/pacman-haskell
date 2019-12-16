module Engine
    ( nextStep
      -- For testing only:
    , movePacman
    , calcNextPosition
    , foodPoints
    ) where

import qualified Data.Map.Strict as Map

import Game (Game)
import qualified Game
import Board (Board)
import qualified Board

-- TODO: Should I use State Monad here? Make Game an instance of state monad? Same goes for Board?
--   That might make things nicer.

nextStep :: Game -> Game
nextStep game = movePacman
    $ game { Game.numStepsElapsed = Game.numStepsElapsed game + 1 }

movePacman :: Game -> Game
movePacman game = newGame
    where
      score = Game.getScore game
      board = Game.getBoard game
      pacman = Board.getBoardPacman board
      objects = Board.getBoardObjects board
      newGame = game
          { Game.getBoard = newBoard
          , Game.getScore = newScore
          }
      newBoard = board
          { Board.getBoardPacman = newPacman
          , Board.getBoardObjects = newObjects
          }
      newPacman = pacman { Board.getPacmanPosition = newPacmanPosition }
      newPacmanPosition = calcNextPosition board (Board.getPacmanPosition pacman) (Board.getPacmanDirection pacman)
      objectAtNewPosition = Map.lookup newPacmanPosition objects
      newObjects = Map.delete newPacmanPosition objects
      newScore = case objectAtNewPosition of
          Just Board.Food -> score + foodPoints
          _ -> score

foodPoints :: Int
foodPoints = 10

calcNextPosition :: Board -> Board.Position -> Board.Direction -> Board.Position
calcNextPosition board currentPosition direction = if objectAtNextPosition == Just Board.Wall
                                                   then currentPosition
                                                   else (x'', y'')
    where
      (x, y) = currentPosition
      (x', y') = case direction of
          Board.East -> (x + 1, y)
          Board.West -> (x - 1, y)
          Board.North -> (x, y - 1)
          Board.South -> (x, y + 1)
      (x'', y'') = (x' `mod` (Board.getBoardWidth board), y' `mod` (Board.getBoardHeight board))
      objectAtNextPosition = Map.lookup (x'', y'') (Board.getBoardObjects board)
