module Button exposing (Model, view, Msg, update)

import Html exposing (beginnerProgram, div, button, text)
import Html.Events exposing (onClick)


main =
    beginnerProgram { model = init, view = view, update = update }


type alias Model =
    { counter : Int
    , id : Int
    }


type Msg
    = Increment Int
    | Decrement Int


init : Model
init =
    Model 0 999


view model =
    div []
        [ button [ onClick (Increment 10) ] [ text "Increment 10" ]
        , div [] [ text (toString model) ]
        , button [ onClick (Decrement -10) ] [ text "Decrement 10" ]
        ]


update msg model =
    let
        counter =
            model.counter
    in
        case Debug.log "button:msg" msg of
            Increment value ->
                { model | counter = counter + value }

            Decrement value ->
                { model | counter = counter + value }
