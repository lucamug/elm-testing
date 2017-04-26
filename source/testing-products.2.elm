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
    = Product1 Products.Msg
    | Product2 Products.Msg
    | Product3 Products.Msg
    | Product4 Products.Msg


update : Msg -> Model -> Model
update msg model =
    model



{-
   update : Msg -> Model -> Model
   update msg model =
       case msg of
           Product1 productMsg ->
               { model | product1 = Products.update productMsg model.product1 }

           Product2 productMsg ->
               { model | product2 = Products.update productMsg model.product2 }

           Product3 productMsg ->
               { model | product3 = Products.update productMsg model.product3 }

           Product4 productMsg ->
               { model | product4 = Products.update productMsg model.product4 }

-}


view : Model -> Html Msg
view model =
    div [] [ text (toString (model.productList)) ]



{-

   view : Model -> Html Msg
   view model =
       div
           [ styles
               [ Css.padding (Css.px 10)
               ]
           ]
           [ header
           , div [] [ Html.map Product1 (Products.view ifNothingThenEmptyProduct (Array.get 0 model.productList)) ]
           , div [] [ Html.map Product2 (Products.view ifNothingThenEmptyProduct (Array.get 0 model.productList)) ]
           , div [] [ Html.map Product3 (Products.view ifNothingThenEmptyProduct (Array.get 0 model.productList)) ]
           , div [] [ Html.map Product4 (Products.view ifNothingThenEmptyProduct (Array.get 0 model.productList)) ]
           , footer
           ]
-}


ifNothingThenEmptyProduct product =
    case product of
        Nothing ->
            Product "Empty" 0 False

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
