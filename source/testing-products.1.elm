-- From https://www.youtube.com/watch?v=wRGl3CveTgo


module Main exposing (..)

import Products exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array
import Css
import Css.Elements


styles =
    Css.asPairs >> Html.Attributes.style


type alias Model =
    { product1 : Products.Model
    , product2 : Products.Model
    , product3 : Products.Model
    , product4 : Products.Model
    }


type alias Product =
    { name : String
    , price : Int
    , priceInView : Bool
    }


products : List Product
products =
    [ Product "Product 1" 12 False
    , Product "Product 2" 24 False
    , Product "Product 3" 36 False
    , Product "Product 4" 48 False
    ]


init : Model
init =
    { product1 = { name = "Product 1", price = 12, priceInView = False }
    , product2 = { name = "Product 2", price = 24, priceInView = False }
    , product3 = { name = "Product 3", price = 36, priceInView = False }
    , product4 = { name = "Product 4", price = 48, priceInView = False }
    }


type Msg
    = Product1 Products.Msg
    | Product2 Products.Msg
    | Product3 Products.Msg
    | Product4 Products.Msg


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


view : Model -> Html Msg
view model =
    div
        [ styles
            [ Css.padding (Css.px 10)
            ]
        ]
        [ header
        , div [] [ Html.map Product1 (Products.view model.product1) ]
        , div [] [ Html.map Product2 (Products.view model.product2) ]
        , div [] [ Html.map Product3 (Products.view model.product3) ]
        , div [] [ Html.map Product4 (Products.view model.product4) ]
        , footer
        ]


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
