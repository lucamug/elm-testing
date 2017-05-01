module Button exposing (Model, view, Msg, update)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = init, view = view, update = update }


type alias Model =
    Int


type Msg
    = Increment Int
    | Decrement Int


init : Model
init =
    0


view model =
    div []
        [ button [ onClick (Increment 10) ] [ text "Increment 10" ]
        , div [] [ text (toString model) ]
        , button [ onClick (Decrement -10) ] [ text "Decrement 10" ]
        ]


update msg model =
    case Debug.log "button:msg" msg of
        Increment value ->
            model + value

        Decrement value ->
            model + value
