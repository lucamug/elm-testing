module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { name : String
    , price : Float
    , priceInView : Bool
    , picture : String
    }


init : Model
init =
    Model "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"


type Msg
    = ShowPrice
    | HidePrice


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPrice ->
            { model | priceInView = True }

        HidePrice ->
            { model | priceInView = False }


view : Model -> Html Msg
view model =
    div
        [ if model.priceInView then
            onClick HidePrice
          else
            onClick ShowPrice
        ]
        [ div [] [ text model.name ]
        , img [ src model.picture ] []
        , div []
            [ if model.priceInView then
                text (toString model.price ++ "€")
              else
                text "Click for Price"
            ]
        ]


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
