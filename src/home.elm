module Main exposing (main)


import Browser exposing (Document)
import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

type alias Model = {}


view : Model -> Document Msg
view model =
    { title = "Website"
    , body = [ header Home
         , h1 [ ] [ text "Coming sooon..." ]
         , footer
         ]
    }


-- HEADER


type Tab
  = News
  | Community
  | Home


header : Tab -> Html msg
header tab =
  div [ class "header" ]
    [ div [ class "nav" ]
        [ a [ href "/"
            , style "color" "white"
            , style "font-size" "32px"
            ]
            [ text "leap"
            ]
        , div [ class "tabs" ] <| List.map (viewTab tab) <|
            [ TabInfo Community "community" "/community"
            , TabInfo News "news" "/news"
            ]
        ]
    ]


viewTab : Tab -> TabInfo -> Html msg
viewTab currentTab info =
  let
    attrs =
      if currentTab == info.tab then
        [ style "font-weight" "bold" ]
      else
        []
  in
  a (href info.link :: attrs) [ text info.name ]


type alias TabInfo =
  { tab : Tab
  , name : String
  , link : String
  }


-- FOOTER


footer : Html msg
footer =
  div [class "footer"]
    [ text "© 2019 LEAP BGC" ]

type Msg
    = NothingYet


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main : Program () Model Msg
main =
    Browser.document
        { init = \_ -> ( {}, Cmd.none )
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
