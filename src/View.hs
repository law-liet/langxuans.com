{-# LANGUAGE OverloadedStrings #-}
module View 
    ( home 
    ) where

import           Web.Scotty                           (ActionM, html)
import           Data.Monoid                          (mempty)
import           Data.Text.Lazy                       (toStrict)
import           Prelude                              hiding (head, div, id)
import           Text.Blaze.Html.Renderer.Text        (renderHtml)
import           Text.Blaze.Html5                     (Html, a, body, button,
                                                       dataAttribute, div, docTypeHtml,
                                                       form, h1, h3, head, link, meta, 
                                                       script, style, title, (!))
import           Text.Blaze.Internal                  (preEscapedText)
import           Text.Blaze.Html5.Attributes          (charset, class_, id, content, href,
                                                       httpEquiv, media, name,
                                                       rel, src, type_)

import           CSS                                  (layoutCss)

blaze :: Html -> ActionM ()
blaze = html . renderHtml

layout :: Html -> Html -> Html
layout t b = docTypeHtml $ do
           head $ do
             title t
             meta ! charset "utf-8"
             meta ! httpEquiv "X-UA-Compatible" ! content "IE=edge,chrome=1"
             meta ! name "description" ! content "Inspire Text"
             meta ! name "viewport" ! content "width=device-width"
             link ! href "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" ! rel  "stylesheet" ! media "screen"
             script ! src "//npmcdn.com/react@15.3.1/dist/react.js" $ mempty
             script ! src "//npmcdn.com/react-dom@15.3.1/dist/react-dom.js" $ mempty
             script ! src "//npmcdn.com/babel-core@5.8.38/browser.min.js" $ mempty
             script ! src "//npmcdn.com/jquery@3.1.0/dist/jquery.min.js" $ mempty
             script ! src "//npmcdn.com/remarkable@1.6.2/dist/remarkable.min.js" $ mempty
             style $ preEscapedText $ toStrict layoutCss
           body $ do
             b
             script ! type_ "text/babel" ! src "/index.js" $ mempty
             script ! src "//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" $ mempty
             script ! src "//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js" $ mempty

home :: ActionM ()
home = blaze $ layout "home" $ do
        h1 ! class_ "title" $ "Hello World!"
        h3 ! class_ "sign"  $ "- L. S., Oct. 24, 2015"
        div ! id "app" $ mempty
