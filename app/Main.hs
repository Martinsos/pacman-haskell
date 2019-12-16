module Main where

import Control.Concurrent

import qualified Game
import qualified Engine
import Board (Board)
import qualified Board
import qualified AsciiRenderer

main :: IO ()
main = do
    let game = Game.makeNewGame initialBoard
    executeGame game
  where
    printGame game = do
      clearScreen
      let rows = AsciiRenderer.renderGame game
      sequence_ $ map putStrLn rows
    executeGame game = do
        printGame game
        threadDelay 1000000
        let game' = Engine.nextStep game
        executeGame game'
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
