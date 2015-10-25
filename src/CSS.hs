{-# LANGUAGE OverloadedStrings #-}

module CSS 
    ( layoutCss 
    ) where

import           Clay
import           Data.Text.Lazy (Text)

layoutCss :: Text
layoutCss = render $ do
  
  body ? 
    do background      black

  element ".title" ? 
    do color           wheat
       marginTop       (pct 20)
       fontWeight      (weight 200)
       fontSize        (em 8)
       borderBottom    solid (px 1) wheat
       textAlign       (alignSide sideCenter)

  element ".sign" ?
    do color           wheat
       textAlign       (alignSide sideCenter)
       fontWeight      (weight 200)
