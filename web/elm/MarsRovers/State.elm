module MarsRovers.State exposing (init, update, subscriptions)

import MarsRovers.Types exposing(..)
import MarsRovers.IO exposing(..)

import Phoenix
import Phoenix.Socket as Socket
import Phoenix.Channel as Channel
import Json.Decode as JD exposing (decodeValue)
import Dict

-- MODEL

init : (Model, Cmd Msg)
init =
  (model, Cmd.none)

model : Model
model =
  { state = Disconnected
  , rovers = Dict.empty
  }

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  -- let
  --   msg = Debug.log "msg=" msg
  --   model = Debug.log "model=" model
  -- in
    case msg of
      NoOp ->
        (model, Cmd.none)

      UpdateState state ->
        ({model | state = state}, Cmd.none)

      JoinChannel ->
        ({model | state = Connecting}, Cmd.none)

      LeaveChannel ->
        ({model | state = Disconnecting}, Cmd.none)

      ReceiveRoverUpdate raw ->
        case JD.decodeValue roverUpdateDecoder raw of
            Ok rover ->
              ({model | rovers = updateRovers rover model.rovers}, Cmd.none)

            Err error ->
                ( model, Cmd.none )

updateRovers : Rover -> Rovers -> Rovers
updateRovers rover rovers =
  Dict.insert rover.id rover rovers


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  case model.state of
    Connecting    -> Phoenix.connect socket [channel]
    Connected     -> Phoenix.connect socket [channel]
    _             -> Phoenix.connect socket []

channel : Channel.Channel Msg
channel =
  Channel.init "plateau:public"
  |> Channel.on "rover:update" ReceiveRoverUpdate
  |> Channel.onJoin  (\_ -> UpdateState Connected)
  |> Channel.onLeave (\_ -> UpdateState Disconnected)

socket : Socket.Socket
socket =
  Socket.init "ws://localhost:4000/socket/websocket"
