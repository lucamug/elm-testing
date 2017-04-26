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



-- PRODUCTS MODEL --


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
    ]



-- MAIN MODEL --


type alias Model =
    { productList : List Product
    }


init : Model
init =
    { productList = products
    }


type Msg
    = L0 Products.Msg
    | L1 Products.Msg


view model =
    let
        product =
            getProduct model.productList 0

        productView =
            Products.view product
    in
        div []
            [ div [] [ Html.map L0 productView ]
            , div [] [ Html.map L1 productView ]
            , div [] [ text (toString (L0)) ]
            ]


update : Msg -> Model -> Model
update msg model =
    let
        _ =
            Debug.log "update:msg" msg
    in
        model



--   { model | productList = setProduct (model.productList position product)
{-
    Product1 productMsg position ->
        { model | product1 = Products.update productMsg (getProduct model.productList position) }

   Product2 productMsg ->
       { model | product2 = Products.update productMsg model.product2 }


   Product3 productMsg ->
       { model | product3 = Products.update productMsg model.product3 }

   Product4 productMsg ->
       { model | product4 = Products.update productMsg model.product4 }

-}


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
