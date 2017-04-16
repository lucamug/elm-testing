-- From https://www.youtube.com/watch?v=wRGl3CveTgo#t=2399.056449


module Main exposing (..)

import Langs exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


init =
    { frontend = { items = [], db = [ "a", "b", "c" ] }
    , backend = { items = [], db = [ "f", "ff", "fff" ] }
    , widget3 = { items = [], db = [ "X", "XX", "XXX" ] }
    }


type alias Model =
    { frontend : Langs.Model
    , backend : Langs.Model
    , widget3 : Langs.Model
    }


type Msg
    = Frontend Langs.Msg
    | Backend Langs.Msg
    | Widget3 Langs.Msg


update msg model =
    case msg of
        Frontend widgetMsg ->
            { model | frontend = Langs.update widgetMsg model.frontend }

        Backend widgetMsg ->
            { model | backend = Langs.update widgetMsg model.backend }

        Widget3 widgetMsg ->
            { model | widget3 = Langs.update widgetMsg model.widget3 }


view model =
    div []
        [ div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Frontend (Langs.view model.frontend) ]
        , div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Backend (Langs.view model.backend) ]
        , div [ style [ ( "float", "left" ), ( "padding", "1em" ) ] ] [ Html.map Widget3 (Langs.view model.widget3) ]
        ]


main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
