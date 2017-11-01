module Main where

import Lens
import Control.Lens (view, set, over)

main :: IO ()
main = do
    putStrLn $ view _2 (1, "hello")
    putStrLn $ show $ set _2 111 (1, "hello")
    putStrLn $ show $ over _2 (*2) ("foo", 5)
