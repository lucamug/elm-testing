-- From https://www.youtube.com/watch?v=wRGl3CveTgo


module Main exposing (..)

import Products exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array
import Css
import Css.Elements
import Array


styles =
    Css.asPairs >> Html.Attributes.style



-- MAIN MODEL --


type alias Model =
    { productList : List Product
    }


init : Model
init =
    { productList = products
    }


type Msg
    = ShowPrice Int
    | HidePrice Int


view model =
    div []
        [ div [ styles [ (Css.property "display") "flex", (Css.property "flex-wrap") "wrap" ] ] (List.indexedMap (\position product -> pView product position) model.productList)
        ]


pView product position =
    div
        [ styles
            [ Css.padding (Css.px 20)
            , Css.margin (Css.px 10)
            , Css.display Css.inlineBlock
            , Css.float (Css.left)
            ]
        ]
        [ div [] [ text product.name ]
        , div [] [ text ("Position: " ++ toString position) ]
        , if product.priceInView then
            div []
                [ button [ onClick (HidePrice position) ] [ text "Hide Price" ]
                , div [] [ text (toString product.price ++ " €") ]
                ]
          else
            div []
                [ button [ onClick (ShowPrice position) ] [ text "Show Price" ]
                , div [] [ text "" ]
                ]
        ]


productView productList position =
    let
        product =
            getProduct productList position
    in
        div
            [ styles
                [ Css.padding (Css.px 20)
                , Css.margin (Css.px 10)
                , Css.display Css.inlineBlock
                ]
            ]
            [ div [] [ text product.name ]
            , div [] [ text ("Position: " ++ toString position) ]
            , if product.priceInView then
                div []
                    [ button [ onClick (HidePrice position) ] [ text "Hide Price" ]
                    , div [] [ text (toString product.price ++ " €") ]
                    ]
              else
                div []
                    [ button [ onClick (ShowPrice position) ] [ text "Show Price" ]
                    , div [] [ text "" ]
                    ]
            ]



-- PRODUCT


type alias Product =
    { name : String
    , price : Int
    , priceInView : Bool
    }


products =
    [ Product "Product 1" 12 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    ]


update msg model =
    case Debug.log "update:msg" msg of
        ShowPrice position ->
            { model | productList = changePriceInView model.productList position True }

        HidePrice position ->
            { model | productList = changePriceInView model.productList position False }


changePriceInView productList position value =
    let
        oldCurrentProduct =
            getProduct productList position

        newCurrentProduct =
            { oldCurrentProduct | priceInView = value }
    in
        setProduct productList position newCurrentProduct


setProduct productList position product =
    let
        productArray =
            Array.fromList productList

        newProductArray =
            Array.set position product productArray
    in
        Array.toList newProductArray


getProduct productList position =
    let
        productArray =
            Array.fromList productList

        product =
            Array.get position productArray
    in
        case product of
            Nothing ->
                Product ("PRODUCT NOT FOUND Position " ++ toString position ++ " not found") 0 False

            Just val ->
                val


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }


header =
    h1 [] [ text "Testing with Products" ]


footer =
    h3 [] [ text "Footer" ]
