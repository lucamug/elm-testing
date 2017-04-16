module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Product =
    { id : Int
    , name : String
    }


products : List Product
products =
    [ { id = 10, name = "Product1" }
    , { id = 20, name = "product2" }
    ]


main =
    div [ style [ ( "padding", "1em" ) ] ]
        [ siteHeader

        -- render the todos edit and list sub-views using pars of the model,
        -- then "tag" outgoing messages with TodosMsg
        , siteBody
        , siteFooter
        ]


renderProduct product =
    li []
        [ text <| toString product.id
        , text " "
        , b [] [ text product.name ]
        ]


siteBody =
    ul [] (List.map renderProduct products)


siteHeader : Html msg
siteHeader =
    header []
        [ h1 [] [ text "List of Products" ]
        , p []
            [ text "Built with "
            , atb "http://elm-lang.org" "Elm"
            ]
        ]


siteFooter : Html msg
siteFooter =
    header []
        [ p [] [ text "Footer" ]
        ]


atb : String -> String -> Html msg
atb url title =
    a
        [ href url
        , target "_blank"
        ]
        [ text title ]
