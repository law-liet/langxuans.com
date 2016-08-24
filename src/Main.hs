{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Web.Scotty                           (middleware, scotty, get, file)
import           System.Environment                   (lookupEnv)
import           Control.Monad
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)

import           View                                 (home)
import           Network.Wai.Middleware.Static

main :: IO ()
main = do
  port <- liftM (maybe 3000 read) $ lookupEnv "PORT"
  scotty port $ do
    middleware logStdoutDev
    middleware $ staticPolicy (noDots >-> addBase "static")
    get "/" home

    get "/resume" $ file "static/resume.pdf"
