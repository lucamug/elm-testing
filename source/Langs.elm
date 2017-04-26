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
            List.length model.items
    in
        case msg of
            Add ->
                { model | items = appendLang length model }

            Remove ->
                { model | items = removeLang length model }


appendLang : Int -> Model -> List String
appendLang length model =
    model.db
        |> List.drop length
        |> List.take 1
        |> List.append model.items


removeLang : Int -> Model -> List String
removeLang length model =
    model.items
        |> List.take (length - 1)


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Add ] [ text "Add" ]
        , button [ onClick Remove ] [ text "Remove" ]
        , ul [ class "languages" ]
            (List.map languageItem model.items)
        ]


languageItem : String -> Html Msg
languageItem language =
    li [ class "lang" ] [ text language ]
