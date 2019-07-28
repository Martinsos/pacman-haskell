module PacmanTest where

import Test.Tasty.Hspec

import Direction (Direction(..))
import Pacman


spec_Pacman :: Spec
spec_Pacman = do
    it "Pacman's initial direction is East" $ do
        let pacman = newPacman
        getDirection pacman `shouldBe` East

    it "We can set pacman's new direction" $ do
        let pacman = newPacman
        let pacman' = setDirection pacman North
        getDirection pacman' `shouldBe` North
        let pacman'' = setDirection pacman' West
        getDirection pacman'' `shouldBe` West
