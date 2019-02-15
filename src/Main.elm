module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (onClick)
import Tennis exposing (player1Scores)


type Msg
    = Player1Scores


type alias Model =
    Tennis.Game


view : Model -> Html Msg
view model =
    div []
        [ text (Tennis.scoreToString model), button [ onClick Player1Scores ] [ text "Player 1 Scores" ] ]


init : Model
init =
    Tennis.init


update : Msg -> Model -> Model
update msg model =
    case msg of
        Player1Scores ->
            player1Scores model


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
