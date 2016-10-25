module MarsRovers.Types exposing (..)

import Phoenix.Socket as Socket

import Json.Encode as JE

type alias Model =
  { phxSocket : Socket.Socket Msg,
    counter : Int,
    rover : Rover
  }

type Msg
      = NoOp
      | PhoenixMsg (Socket.Msg Msg)
      | JoinChannel
      | ReceiveRoverUpdate JE.Value

type alias Rover =
  { id : Int
  , x : Int
  , y : Int
  , d : String
  }
