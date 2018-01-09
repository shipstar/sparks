-- Got a bit of help from http://stackoverflow.com/questions/37227421/how-do-i-add-a-second-die-to-this-elm-effects-example
-- to get two dice working.

import Html exposing (Html, br, button, div, h1, img, text)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Random
import Svg exposing (Svg, svg, circle, rect)
import Svg.Attributes as SA

main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }

-- MODEL

type alias Model =
  { die1 : Int
  , die2 : Int
  }

-- UPDATE

type Msg
  = Roll
  | NewFaces (Int, Int)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Roll ->
      (model, Random.generate NewFaces (Random.pair (Random.int 1 6) (Random.int 1 6)))

    NewFaces (val1, val2) ->
      ({ model | die1 = val1, die2 = val2 }, Cmd.none)

-- VIEW

view : Model -> Html Msg
view model =
  div []
  [ die model.die1
  , die model.die2
  , br [] []
  , button [ onClick Roll ] [ text "Roll "]
  ]

die : Int -> Html.Html msg
die n =
  svg
    [ SA.width "120", SA.height "120", SA.viewBox "0 0 120 120" ]
    (
      List.append
      [ rect
        [ SA.x "10"
        , SA.y "10"
        , SA.width "100"
        , SA.height "100"
        , SA.rx "15"
        , SA.ry "15"
        , SA.fill "white"
        , SA.stroke "black"
        ] []
      ]
      (pips n)
    )

pips : Int -> List (Html.Html msg)
pips n =
  List.map pip (pipLocations n)

pip : (Int, Int) -> Svg msg
pip (cx, cy) =
  circle
  [
    SA.cx (toString cx)
  , SA.cy (toString cy)
  , SA.r "8"
  , SA.fill "red"
  ] []


pipLocations : Int -> List (Int, Int)
pipLocations n =
  case n of
    1 ->
      [ (60, 60) ]

    2 ->
      [ (30, 30)
      , (90, 90)
      ]

    3 ->
      [ (30, 30)
      , (60, 60)
      , (90, 90)
      ]

    4 ->
      [ (30, 30)
      , (90, 30)
      , (90, 90)
      , (30, 90)
      ]

    5 ->
      [ (30, 30)
      , (90, 30)
      , (90, 90)
      , (30, 90)
      , (60, 60)
      ]

    6 ->
      [ (30, 30)
      , (90, 30)
      , (90, 90)
      , (30, 90)
      , (30, 60)
      , (90, 60)
      ]

    _ ->
      []


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none

-- INIT

init : (Model, Cmd Msg)
init =
  (Model 3 2, Cmd.none)
