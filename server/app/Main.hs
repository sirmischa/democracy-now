module Main where

import Network.Wai.Handler.Warp
import Servant
import Server

main :: IO ()
main = run 8000 $ serve api server
