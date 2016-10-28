module MarsRovers.Types exposing (..)

import Json.Encode as JE
import Dict

type alias Rovers = Dict.Dict Int Rover

type alias Model =
  { state : State
  , rovers : Rovers
  }

type State
    = Connecting
    | Connected
    | Disconnecting
    | Disconnected

type Msg
      = NoOp
      | UpdateState State
      | JoinChannel
      | LeaveChannel
      | ReceiveRoverUpdate JE.Value

type alias Rover =
  { id : Int
  , x : Int
  , y : Int
  , d : String
  }
