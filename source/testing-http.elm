-- Read more about this program in the official Elm guide:
-- https://guide.elm-lang.org/architecture/effects/http.html
-- https://ellie-app.com/PrnPCS5537a1/0


module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Http
import Css exposing (..)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as JP
import String


styles =
    Css.asPairs >> Html.Attributes.style


main =
    Html.program
        { init = init "no ip yet"
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { ip : String
    , spinner : Spinner
    , classStatus : String
    }


init : String -> ( Model, Cmd Msg )
init initialValue =
    ( Model initialValue Present "aaa"
    , Cmd.batch [ resetIP, sendIPCommand ]
    )


type Spinner
    = Present
    | Absent


lodingSpinner : Spinner -> Html msg
lodingSpinner spinner =
    if spinner == Present then
        div
            [ styles
                [ position absolute
                , opacity (num 0.8)
                , bottom (px 0)
                , top (px 0)
                , left (px 0)
                , right (px 0)
                , backgroundColor (hex "ffeeaa")
                , textAlign center
                , padding (px 100)
                , fontSize (Css.em 2)
                ]
            ]
            [ Html.text "Loading..."
            ]
    else
        Html.text ""


type Msg
    = SendIPrequest
    | SendShopsRequest
    | SendShopsRequest2
    | NewIp (Result Http.Error String)
    | NewShops (Result Http.Error Shops)
    | ResetIp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ =
            1

        -- Debug.log "UPDATE - Received msg" msg
    in
        case msg of
            SendIPrequest ->
                ( { model | ip = "Sending request...", spinner = Present }, sendIPCommand )

            SendShopsRequest ->
                ( { model | ip = "Sending request...", spinner = Present }, sendShopsCommand )

            SendShopsRequest2 ->
                ( { model | ip = "Sending request...", spinner = Present }, sendShopsCommand2 )

            NewIp (Ok newUrl) ->
                ( { model | ip = newUrl, spinner = Absent }, Cmd.none )

            NewIp (Err error) ->
                ( { model | ip = toString error, spinner = Absent }, Cmd.none )

            NewShops (Ok newUrl) ->
                ( { model | ip = toString newUrl, spinner = Absent }, Cmd.none )

            NewShops (Err error) ->
                ( { model | ip = toString error, spinner = Absent }, Cmd.none )

            ResetIp ->
                ( { model | ip = "IP Resetted" }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ styles
            [ margin (px 20) ]
        ]
        [ h2 [] [ Html.text "Getting IP" ]
        , button [ onClick SendIPrequest ] [ Html.text "Get IP" ]
        , button [ onClick ResetIp ] [ Html.text "Reset IP" ]
        , button [ onClick SendShopsRequest ] [ Html.text "Get Shops" ]
        , button [ onClick SendShopsRequest2 ] [ Html.text "Get Shops2" ]
        , h3 [] [ Html.text model.ip ]
        , lodingSpinner model.spinner
        ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- HTTP


resetIP : Cmd Msg
resetIP =
    Cmd.none


sendIPCommand : Cmd Msg
sendIPCommand =
    (Http.send NewIp) getIP


sendShopsCommand : Cmd Msg
sendShopsCommand =
    (Http.send NewIp) getShops


sendShopsCommand2 : Cmd Msg
sendShopsCommand2 =
    (Http.send NewShops) getShops2


getIP : Http.Request String
getIP =
    (Http.get "https://httpbin.org/delay/0.2") decodeIpUrl


getShops : Http.Request String
getShops =
    (Http.get "http://api.jsoneditoronline.org/v1/docs/77631954b73e8a4a6fad097055f97004") decodeShopsUrl


getShops2 : Http.Request Shops
getShops2 =
    (Http.get "http://api.jsoneditoronline.org/v1/docs/77631954b73e8a4a6fad097055f97004") dataDecoder


decodeIpUrl : Decode.Decoder String
decodeIpUrl =
    Decode.at [ "origin" ] Decode.string


decodeShopsUrl : Decode.Decoder String
decodeShopsUrl =
    Decode.at [ "data" ] Decode.string


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
