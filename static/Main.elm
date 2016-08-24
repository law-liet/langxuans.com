import Html exposing (..)
import Html.App as App

main = App.beginnerProgram { model = 0, view = view, update = update}

update msg model = model

view model = 
  h1 [] [ text "hello world"]
