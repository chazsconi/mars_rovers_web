module MarsRovers.State exposing(init, update, subscriptions)

import MarsRovers.Types exposing(..)

-- MODEL

init : (Model, Cmd Msg)
init =
  (model, Cmd.none)

model : Model
model =
  { counter = 0
  }

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NoOp ->
      (model, Cmd.none)

    Increment ->
      ({model | counter = model.counter + 1}, Cmd.none)

    Decrement ->
      ({model | counter = model.counter - 1}, Cmd.none)

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none
