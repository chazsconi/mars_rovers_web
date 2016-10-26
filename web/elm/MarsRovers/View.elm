module MarsRovers.View exposing (view)

import MarsRovers.Types exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)


view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (toString model.counter) ]
    , div [] [ text (toString model.rover) ]
    , div [ class "plateau" ]
      [
        i [class "fa fa-arrow-up rover", roverStyle model.rover] []
      ]
    , button [ onClick JoinChannel ] [ text "Join" ]
    ]

roverStyle : Rover -> Attribute msg
roverStyle rover =
  style
    [ ("bottom", toString(rover.y * 10) ++ "px")
    , ("left", toString(rover.x * 10) ++ "px")
    , ("transform", "rotate(" ++ toString(directionToAngle rover.d) ++ "deg)")
    ]

directionToAngle : String -> Int
directionToAngle direction =
  case direction of
    "N" -> 0
    "E" -> 90
    "S" -> 180
    "W" -> 270
    _   -> 0
