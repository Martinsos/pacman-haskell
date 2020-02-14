module Main where

import Control.Concurrent (threadDelay)

import Game (Game)
import qualified Game
import qualified Engine
import Board (Board)
import qualified Board
import qualified AsciiRenderer

-- TODO: I might want to consider using:
--   https://hackage.haskell.org/package/brick
--     -> Tetris was done with this: https://github.com/SamTay/tetris ! I should see how they did it.
--        I think this file has the relevant code: https://github.com/samtay/tetris/blob/master/src/UI/Game.hs .
--   https://hackage.haskell.org/package/ansi-terminal
--   After looking more into this, I think it might be worth going with Brick, here is user guide:
--     https://github.com/jtdaugherty/brick/blob/master/docs/guide.rst
--   I might decide to use it completely to render pacman, or just to render ascii for pacman, but anyway it will
--   handle the events and rendering and so on.
--   Another option is to come up with my own solution for this. Not sure what is better for learning purposes.


main :: IO ()
main = do
    let game = Game.makeNewGame initialBoard
    executeGame game
    return ()
  where
    executeGame :: Game -> IO ()
    executeGame game = do
      printGame game
      threadDelay 1000000
      executeGame $ Engine.nextStep game

    printGame :: Game -> IO ()
    printGame game = do
      clearScreen
      let rows = AsciiRenderer.renderGame game
      sequence_ $ map putStrLn rows

    clearScreen = putStr "\ESC[2J"


-- TODO: Move this to lib (/src), the knowledge about initial board? To Board?
initialBoard :: Board
initialBoard = Board.fromAscii
    [ "##############################"
    , "##############################"
    , "##............##............##"
    , "##.####.#####.##.#####.####.##"
    , "##.####.#####.##.#####.####.##"
    , "##.####.#####.##.#####.####.##"
    , "##..........................##"
    , "##.####.##.########.##.####.##"
    , "##.####.##.########.##.####.##"
    , "##......##....##....##......##"
    , "#######.##### ## #####.#######"
    , "#######.##### ## #####.#######"
    , "##   ##.##          ##.##   ##"
    , "#######.## ###  ### ##.#######"
    , "#######.## ###  ### ##.#######"
    , "       .   ##    ##   .       "
    , "#######.## ######## ##.#######"
    , "#######.## ######## ##.#######"
    , "##   ##.##          ##.##   ##"
    , "#######.## ######## ##.#######"
    , "#######.## ######## ##.#######"
    , "##............##............##"
    , "##.####.#####.##.#####.####.##"
    , "##.####.#####.##.#####.####.##"
    , "##...##........>.......##...##"
    , "####.##.##.########.##.##.####"
    , "####.##.##.########.##.##.####"
    , "##......##....##....##......##"
    , "##.##########.##.##########.##"
    , "##.##########.##.##########.##"
    , "##..........................##"
    , "##############################"
    , "##############################"
    ]
