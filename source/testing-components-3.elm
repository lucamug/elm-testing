module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


languages =
    [ "a", "b", "c" ]


main =
    beginnerProgram
        { model = []
        , view = view
        , update = update
        }


type Msg
    = Add
    | Remove


view langs =
    div []
        [ h1 [] [ text "test" ]
        , button [ onClick Add ] [ text "Add" ]
        , button [ onClick Remove ] [ text "Remove" ]
        , ul [ class "languages" ]
            (List.map languageItem langs)
        ]


languageItem language =
    li [ class "lang" ] [ text language ]


update msg langs =
    let
        length =
            List.length langs
    in
        case msg of
            Add ->
                languages
                    |> List.drop length
                    |> List.take 1
                    |> List.append langs

            Remove ->
                langs
                    |> List.take (length - 1)
