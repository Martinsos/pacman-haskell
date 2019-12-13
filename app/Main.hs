module Main where

import qualified Game
import Board (Board)
import qualified Board
import qualified AsciiRenderer

main :: IO ()
main = do
    let game = Game.makeNewGame initialBoard
    let rows = AsciiRenderer.renderGame game
    sequence_ $ map putStrLn rows

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
