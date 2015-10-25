{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Web.Scotty                           (middleware, scotty, get)
import           System.Environment                   (lookupEnv)
import           Control.Monad
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)

import           View                                 (home)

main :: IO ()
main = do
  port <- liftM (maybe 3000 read) $ lookupEnv "PORT"
  scotty port $ do
    middleware logStdoutDev
    get "/" home