module Main exposing (..)

import Html exposing (..)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as JP
import String


payload =
    """
{
    "data": {
        "shops.zz": [{
            "name": "redeem",
            "deals": [{
                "tagline": "Reedem your<br>Super Points!!",
                "subline": "at <b>Viber</b>, <b>Wuaki</b> or get <b>Vouchers</b><br>FARFUTURE<br>Time to the launch <span class='countdown' data-expiringDate='2017-04-18T00:00:00'>-__☼__:__:__</span>",
                "cta": "Redeem Now",
                "type": "center",
                "url": "?pagina=riscatta_i_tuoi_super_punti",
                "priority": 300,
                "categories": [
                    "top"
                ],
                "bnrColor": "#eee",
                "bnrStyle": [
                    "background-repeat: no-repeat",
                    "background-color: #fff",
                    "background-image: url(http://intl.rakuten-static.com/b/gb/image/am/bnrs/viber-1700x700.png)",
                    "background-size:cover",
                    "background-position: center center",
                    "border-color: black",
                    "color: #3D3E40"
                ]
            }]
        }, {
            "name": "IWOOT",
            "tagline": "I Want One Of Those stocks gadgets and fun accesseries for all ages.",
            "description": "Shop the vast range of gadgets, gizmos and gifts at IWOOT. Featuring just-in products from top brands DeLonghi, Pop! Vinyl, Marvel, DC Star Wars, LEGO and many more, you'll find hundreds of novelty gift ideas for all ages, carefully arranged for your convenience by occasion, recipient, theme and price point. Free UK Next Day Delivery when you spend £40 or more!",
            "logoSize": "387x158",
            "url": "http://www.awin1.com/cread.php?awinaffid=293179&awinmid=1202&p=http%3A%2F%2Fwww.iwantoneofthose.com",
            "modUrl": "http://intl.rakuten-static.com/b/gb/image/am/mods/igogo-modal-1400x500.png",
            "percentage": 7,
            "priority": 180,
            "pointsTranslation": "up",
            "categories": [
                "gifts",
                "coupon"
            ],
            "t&c": [
                "Please refer to the retailers own terms and conditions regarding this offer.",
                "Super Points are not earned on warranty purchases.",
                "Super Points are not earned on Reserve and Collect orders.",
                "Super Points are not earned on installation costs.",
                "Super Points are not earned on VAT/sales tax, delivery charges, credit card fees, gift wrapping or other service charges.",
                "Super Points are not earned on purchases from third party sites.",
                "1% Super Points earned on Consoles and Electronics.",
                "2% Super Points earned on DVDs and Games.",
                "6% Super Points earned on Bodycare, Clothing, Gifts, Health, Homeware, Sports, Toys and Vitamins.",
                "£3 in Super Points earned on 1 month product subscriptions.",
                "£7 in Super Points earned on 3 month product subscriptions.",
                "£11 in Super Points earned on 6 month product subscriptions.",
                "£15 in Super Points earned on 12 month product subscriptions. "
            ],
            "deals": [{
                "taglineForBanner": "10% off when<br>you spend £45.",
                "tagline": "10% off when you spend £45 with code 10IW45",
                "coupon": "10IW45",
                "url": "http://www.awin1.com/cread.php?awinaffid=293179&awinmid=1202&p=http%3A%2F%2Fwww.iwantoneofthose.com",
                "image": "",
                "imageSize": "90%",
                "topColor": "#f3d9cc",
                "bnrStyle": [
                    "background-repeat: no-repeat",
                    "background-color: #f3d9cc",
                    "background-size: contain",
                    "background-image: url(http://intl.rakuten-static.com/b/gb/image/am/bnrs/iwoot-sliderimage1.png)",
                    "background-position: right center",
                    "border-color: black",
                    "color: #000"
                ],
                "priority": 180,
                "pointsTranslation": "up",
                "categories": [
                    "gifts",
                    "top"
                ],
                "t&c": [
                    "",
                    ""
                ],
                "expiration": ""
            }]
        }]
    }
}

"""


type alias Shops =
    { elmShops : List Shop
    }


type alias Shop =
    { elmName : String
    , elmDeals : List Deal
    }


type alias Deal =
    { elmTagline : String
    }


main =
    div []
        [ h1 [] [ text "Json Decoder" ]
        , p [] [ text (toString (Decode.decodeString dataDecoder payload)) ]
        ]


dataDecoder : Decoder Shops
dataDecoder =
    Decode.at [ "data" ] shopsDecoder


shopsDecoder : Decoder Shops
shopsDecoder =
    JP.decode Shops
        |> JP.required "shops.zz" (Decode.list shopDecoder)


shopDecoder : Decoder Shop
shopDecoder =
    JP.decode Shop
        |> JP.required "name" Decode.string
        |> JP.required "deals" (Decode.list dealDecoder)


dealDecoder : Decoder Deal
dealDecoder =
    JP.decode Deal
        |> JP.required "tagline" Decode.string
