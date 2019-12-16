module SimpleGameFixture
    ( game
    , board
    ) where

import Game (Game, makeNewGame)
import Board (Board, fromAscii)

boardAscii :: [String]
boardAscii = [ "   .#"
             , ".# .#"
             , "..^.."
             ]

board :: Board
board = fromAscii boardAscii

game :: Game
game = makeNewGame board
