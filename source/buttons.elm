module Main exposing (..)

import Button
import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


type alias Model =
    { counterList : List Button.Model
    }


_ =
    Debug.log "xxx" Model


init : Model
init =
    Model
        [ 1
        , 999
        ]



{-


   init =
       Model
           [ Button.Model 0
           , Button.Model 999
           ]
-}


main =
    beginnerProgram { model = 0, view = view, update = update }


view model =
    div []
        [ Html.map Aaa (Button.view model)
        , Html.map Aaa (Button.view model)
        ]


type Msg
    = Aaa Button.Msg


update msg model =
    case Debug.log "buttons:msg" msg of
        Aaa msg2 ->
            Button.update msg2 model
