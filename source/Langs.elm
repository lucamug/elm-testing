module Langs exposing (Model, Msg, view, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { items : List String, db : List String }


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
