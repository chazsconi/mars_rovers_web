module MarsRovers.Types exposing (..)

type alias Model =
  { counter: Int
  }

type Msg
      = NoOp
      | Increment
      | Decrement
