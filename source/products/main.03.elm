module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array


type alias Product =
    { priceInView : ProductPriceInView
    , price : Float
    , name : String
    , picture : String
    }


type alias Model =
    { productList : ProductList
    }


type alias Position =
    Int


type alias ProductPriceInView =
    Bool


type alias ProductList =
    List Product


type Msg
    = ShowPrice Position
    | HidePrice Position


init : Model
init =
    Model
        [ Product False 24.31 "Photocamera" "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
        , Product False 24.22 "TV" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
        , Product False 36.45 "Product 3" "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
        , Product False 48.77 "Watch" "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
        , Product False 24.38 "Bicycle" "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
        , Product False 36.43 "Movie" "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
        , Product False 48.17 "Laptop" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
        , Product False 24.31 "Photocamera" "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
        , Product False 24.22 "TV" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
        , Product False 36.45 "Product 3" "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
        , Product False 48.77 "Watch" "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
        , Product False 24.38 "Bicycle" "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
        , Product False 36.43 "Movie" "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
        , Product False 48.17 "Laptop" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
        , Product False 24.31 "Photocamera" "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
        , Product False 24.22 "TV" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
        , Product False 36.45 "Product 3" "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
        , Product False 48.77 "Watch" "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
        , Product False 24.38 "Bicycle" "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
        , Product False 36.43 "Movie" "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
        , Product False 48.17 "Laptop" "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
        ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        ShowPrice position ->
            { model | productList = updateProduct model.productList position True }

        HidePrice position ->
            { model | productList = updateProduct model.productList position False }


updateProduct : ProductList -> Position -> ProductPriceInView -> ProductList
updateProduct productList position value =
    let
        oldProduct =
            getProduct productList position

        newProduct =
            { oldProduct | priceInView = value }
    in
        setProduct productList position newProduct


getProduct : ProductList -> Position -> Product
getProduct productList position =
    let
        product =
            Array.get position (Array.fromList productList)
    in
        case product of
            Nothing ->
                Product False 0 ("PRODUCT NOT FOUND Position " ++ toString position ++ " not found") ""

            Just val ->
                val


setProduct : ProductList -> Position -> Product -> ProductList
setProduct productList position product =
    let
        productArray =
            Array.set position product (Array.fromList productList)
    in
        Array.toList productArray


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "background-color", "#dddddd" )
            , ( "font-family", "arial" )
            ]
        ]
        [ div
            [ style
                [ ( "display", "flex" )
                , ( "flex-wrap", "wrap" )
                , ( "justify-content", "center" )
                ]
            ]
            (List.indexedMap (\position product -> viewProduct product position) model.productList)
        ]


viewProduct : Product -> Position -> Html Msg
viewProduct product position =
    div
        [ if product.priceInView then
            onClick (HidePrice position)
          else
            onClick (ShowPrice position)
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


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
