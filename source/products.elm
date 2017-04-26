module Products exposing (Model, Msg, view, update)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Css
import Css.Elements


styles =
    Css.asPairs >> Html.Attributes.style


type alias Model =
    { name : String
    , price : Int
    , priceInView : Bool
    }


type Msg
    = ShowPrice
    | HidePrice


update msg model =
    case msg of
        ShowPrice ->
            { model | priceInView = True }

        HidePrice ->
            { model | priceInView = False }


view : Model -> Html Msg
view model =
    div
        [ styles
            [ Css.padding (Css.px 20)
            , Css.margin (Css.px 10)
            , Css.display Css.inlineBlock
            , Css.width (Css.px 300)
            , Css.height (Css.px 100)
            ]
        ]
        [ div [] [ text model.name ]
        , if model.priceInView then
            div []
                [ button [ onClick HidePrice ] [ text "Hide Price" ]
                , div [] [ text (toString model.price ++ " €") ]
                ]
          else
            div []
                [ button [ onClick ShowPrice ] [ text "Show Price" ]
                , div [] [ text "" ]
                ]
        ]
