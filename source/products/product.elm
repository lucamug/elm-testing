module Product exposing (Model, ProductPriceInView, view, Msg, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array


type alias Model =
    { priceInView : ProductPriceInView
    , price : Float
    , name : String
    , picture : String
    }


type alias ProductPriceInView =
    Bool


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPrice position ->
            { model | priceInView = True }

        HidePrice position ->
            { model | priceInView = False }


type Msg
    = ShowPrice Position
    | HidePrice Position


type alias Position =
    Int



-- view : Model -> Position -> Html Msg


view product position =
    div
        [ if product.priceInView then
            onClick (ShowPrice position)
          else
            onClick (HidePrice position)
        , style
            [ ( "padding", "20px" )
            , ( "margin", "10px" )
            , ( "display", "inline-block" )
            , ( "cursor", "pointer" )
            , ( "text-align", "center" )
            , ( "background-color", "#ffffff" )
            , ( "border", "1px solid grey" )
            , ( "width", "120px" )
            ]
        ]
        [ div [] [ text product.name ]
        , div
            [ style
                [ ( "padding-bottom", "100%" )
                , ( "position", "relative" )
                ]
            ]
            [ img
                [ src product.picture
                , style
                    [ ( "position", "absolute" )
                    , ( "max-width", "100%" )
                    , ( "max-width", "70%" )
                    , ( "max-height", "70%" )
                    , ( "margin", "auto" )
                    , ( "top", "0" )
                    , ( "left", "0" )
                    , ( "bottom", "0" )
                    , ( "right", "0" )
                    , ( "max-height", "100%" )
                    , ( "transition", "all 0.5s" )
                    , if product.priceInView then
                        ( "transform", "rotateY(360deg)" )
                      else
                        ( "transform", "rotateY(0deg)" )
                    ]
                ]
                []
            ]
        , if product.priceInView then
            div
                [ style
                    [ ( "backgroundColor", "#aaffaa" )
                    , ( "padding", "4px" )
                    ]
                ]
                [ text (toString product.price ++ "$") ]
          else
            div
                [ style
                    [ ( "padding", "4px" )
                    ]
                ]
                [ text "Click for Price" ]
        ]
