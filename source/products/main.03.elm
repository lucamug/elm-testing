module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Array


type alias Product =
    { name : String
    , price : Float
    , priceInView : Bool
    , picture : String
    }


products =
    [ Product "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
    , Product "TV" 24.22 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
    , Product "Product 3" 36.45 False "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
    , Product "Watch" 48.77 False "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
    , Product "Bicycle" 24.38 False "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
    , Product "Movie" 36.43 False "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
    , Product "Laptop" 48.17 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
    , Product "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
    , Product "TV" 24.22 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
    , Product "Product 3" 36.45 False "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
    , Product "Watch" 48.77 False "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
    , Product "Bicycle" 24.38 False "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
    , Product "Movie" 36.43 False "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
    , Product "Laptop" 48.17 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
    , Product "Photocamera" 24.31 False "https://files.rakuten-static.de/789653a5d4e1d8bf4e00a151560691bf/thumbs/280/f0/b3bfab63536f86c4270a811e67da80e6/hero5-action-kamera.jpg"
    , Product "TV" 24.22 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/f5/5808ec3fcee27fddd4f6d80bd6512061/ue-55ku6070-led-fernseher-dvb-t2cs2-hdmi-usb-ci-und-wlan.jpg"
    , Product "Product 3" 36.45 False "https://files.rakuten-static.de/a80a984051650024bc9aba3c601fb83a/thumbs/280/a1/ade697c2eb8f1eec8d3bbba3eaae031c/gartenliege-rio-grande-liegestuhl-sonnenliege-relaxliege.jpg"
    , Product "Watch" 48.77 False "https://files.rakuten-static.de/af7ab40167d6ddd2323eba2ce7b0b90b/thumbs/280/14/e56931b625ab4a22d5c8fcbc2309042d/firenze-herrenuhr-chronograph-schwarz-orange-edelstahl-lederarmband-neu.jpg"
    , Product "Bicycle" 24.38 False "https://files.rakuten-static.de/e9d9152203630452fef5a10bdbe6f01b/thumbs/280/2d/c4494d84e489e8022313b5190a8cf0c5/likeabike-jumper-von-kokua-like-a-bike-orange.jpg"
    , Product "Movie" 36.43 False "http://marketplace.rakuten-static.de/cms_content/homepage/content/images/wuaki/vaiana.jpeg"
    , Product "Laptop" 48.17 False "https://files.rakuten-static.de/f3855ffaeec75bf2c71373c5eacfb286/thumbs/280/5d/f958bcfe9f68145916aa2f65df5179ac/aspire-e-15-e5-575g-59z7-15-6-und-quot-full-hd-gaming-notebook-940mx-intel-core-i5-8gb-ram.jpg"
    ]


type alias Model =
    { productList : List Product
    }


init : Model
init =
    Model products


type Msg
    = ShowPrice Int
    | HidePrice Int


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "background-color", "#dddddd" )
            , ( "font-family", "arial" )
            , ( "height", "100%" )
            ]
        ]
        [ div
            [ style
                [ ( "display", "flex" )
                , ( "flex-wrap", "wrap" )
                , ( "justify-content", "center" )
                ]
            ]
            (List.indexedMap (\position product -> productView product position) model.productList)
        ]


productView : Product -> Int -> Html Msg
productView product position =
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
                [ text (toString product.price ++ "€") ]
          else
            div
                [ style
                    [ ( "padding", "4px" )
                    ]
                ]
                [ text "Click for Price" ]
        ]


update msg model =
    case msg of
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
                Product ("PRODUCT NOT FOUND Position " ++ toString position ++ " not found") 0 False ""

            Just val ->
                val


main : Program Never Model Msg
main =
    beginnerProgram
        { model = init
        , view = view
        , update = update
        }
