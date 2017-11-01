module Main where

import Lens

main :: IO ()
main = do
    putStrLn $ view _2 (1, "hello")
    putStrLn $ show $ set _2 111 (1, "hello")
    putStrLn $ show $ over _2 (*2) ("foo", 5)
    putStrLn $ show $ over (both) (*2) (1, 2)
