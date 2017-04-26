module CssTesting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Css exposing (..)


styles =
    Css.asPairs >> Html.Attributes.style


main =
    div
        [ styles
            [ backgroundColor (hex "ffa331")
            , opacity (num 0.5)
            ]
        ]
        [ Html.text "Hi!" ]
