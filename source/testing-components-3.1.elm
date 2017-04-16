-- From https://www.youtube.com/watch?v=wRGl3CveTgo


module Main exposing (..)

import Langs exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


init =
    { widget1 = { items = [], db = [ "a", "b", "c" ] }
    , widget2 = { items = [], db = [ "f", "ff", "fff" ] }
    , widget3 = { items = [], db = [ "X", "XX", "XXX" ] }
    }


type alias Model =
    { widget1 : Langs.Model
    , widget2 : Langs.Model
    , widget3 : Langs.Model
    }


type Msg
    = Widget1 Langs.Msg
    | Widget2 Langs.Msg
    | Widget3 Langs.Msg


update msg model =
    case msg of
        Widget1 widgetMsg ->
            { model | widget1 = Langs.update widgetMsg model.widget1 }

        Widget2 widgetMsg ->
            { model | widget2 = Langs.update widgetMsg model.widget2 }

        Widget3 widgetMsg ->
            { model | widget3 = Langs.update widgetMsg model.widget3 }


view model =
    div []
        [ div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Widget1 (Langs.view model.widget1) ]
        , div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Widget2 (Langs.view model.widget2) ]
        , div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Widget3 (Langs.view model.widget3) ]
        ]


main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
