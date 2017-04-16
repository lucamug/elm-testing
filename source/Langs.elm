module Langs exposing (Model, Msg, view, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { items : List String, db : List String }


type Msg
    = Add
    | Remove


update msg model =
    let
        length =
            List.length model.item
    in
        case msg of
            Add ->
                { model | items = appendLang length model }

            Remove ->
                { model | items = removeLang length model }


appendLang length model =
    model


removeLang length model =
    model


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
