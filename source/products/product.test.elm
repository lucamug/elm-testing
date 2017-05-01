module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Product
import Array


type alias Model =
    Product.Model


type alias Position =
    Int


type alias ProductList =
    List Product.Model


type Msg
    = ShowPrice Position
    | HidePrice Position


init : Model
init =
    Product.Model False 24.31 "Photocamera" "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPrice position ->
            { model | priceInView = False }

        HidePrice position ->
            { model | priceInView = True }


updateProduct : ProductList -> Position -> Product.ProductPriceInView -> ProductList
updateProduct productList position value =
    let
        oldProduct =
            getProduct productList position

        newProduct =
            { oldProduct | priceInView = value }
    in
        setProduct productList position newProduct


getProduct : ProductList -> Position -> Product.Model
getProduct productList position =
    let
        product =
            Array.get position (Array.fromList productList)
    in
        case product of
            Nothing ->
                Product.Model False 0 ("PRODUCT NOT FOUND Position " ++ toString position ++ " not found") ""

            Just val ->
                val


setProduct : ProductList -> Position -> Product.Model -> ProductList
setProduct productList position product =
    let
        productArray =
            Array.set position product (Array.fromList productList)
    in
        Array.toList productArray


view : Model -> Html Msg
view model =
    Product.view model 9999 ShowPrice HidePrice


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
