-- From https://www.youtube.com/watch?v=wRGl3CveTgo#t=2399.056449
-- Still not working


module Main exposing (..)

import Langs exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


init =
    { frontend = { items = [], db = [ "a", "b", "c" ] }
    , backend = { items = [], db = [ "1", "2", "3" ] }
    }


type alias Model =
    { frontend : Langs.Model
    , backend : Langs.Model
    }


type Msg
    = Frontend Langs.Msg
    | Backend Langs.Msg


update msg model =
    case msg of
        Frontend frontendMsg ->
            { model | frontend = Langs.update frontendMsg model.frontend }

        Backend backendMsg ->
            { model | backend = Langs.update backendMsg model.backend }


view model =
    div []
        [ h1 [] [ text "test" ]
        , Html.map Frontend (Langs.view model.frontend)
        , Html.map Backend (Langs.view model.backend)
        ]


main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
