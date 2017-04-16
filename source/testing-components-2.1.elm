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


type alias Model =
    List String


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


update : Msg -> Model -> Model
update msg model =
    let
        length =
            List.length model
    in
        case msg of
            Add ->
                appendLang length model

            Remove ->
                removeLang length model


appendLang length model =
    languages
        |> List.drop length
        |> List.take 1
        |> List.append model


removeLang length model =
    model
        |> List.take (length - 1)
