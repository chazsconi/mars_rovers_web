module MarsRovers.View exposing (view)

import MarsRovers.Types exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import Dict
import Html.Lazy exposing (lazy)

view : Model -> Html Msg
view model =
  div []
    [ div [ class "plateau" ] (roversView model.rovers)
    , connectButtonView model.state
    ]

connectButtonView : State -> Html Msg
connectButtonView state =
  case state of
    Disconnected  -> button [ onClick JoinChannel ]   [ text "Connect" ]
    Connected     -> button [ onClick LeaveChannel ]  [ text "Disconnect" ]
    Connecting    -> button [] [ text "Connecting.." ]
    Disconnecting -> button [] [ text "Disonnecting.." ]

roversView : Rovers -> List (Html Msg)
roversView rovers =
  Dict.values rovers
  |> (List.map (lazy roverView))

roverView : Rover -> Html Msg
roverView rover =
  i [class "fa fa-arrow-up rover", roverStyle rover] []

roverStyle : Rover -> Attribute msg
roverStyle rover =
  style
    [ ("bottom", toString(rover.y * 1) ++ "px")
    , ("left", toString(rover.x * 1) ++ "px")
    , ("transform", "rotate(" ++ toString(directionToAngle rover.d) ++ "deg)")
    , ("color", roverIdToColor rover.id)
    ]

directionToAngle : String -> Int
directionToAngle direction =
  case direction of
    "N" -> 0
    "E" -> 90
    "S" -> 180
    "W" -> 270
    _   -> 0

roverIdToColor : Int -> String
roverIdToColor id =
  case id % 4 of
    0 -> "red"
    1 -> "green"
    2 -> "blue"
    3 -> "black"
    _ -> ""
