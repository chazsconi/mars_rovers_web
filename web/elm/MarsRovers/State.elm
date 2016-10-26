module MarsRovers.State exposing (init, update, subscriptions)

import MarsRovers.Types exposing(..)
import MarsRovers.IO exposing(..)

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
  { phxSocket = initPhxSocket
  , counter = 0
  , rovers = Dict.empty
  }

initPhxSocket : Socket.Socket Msg
initPhxSocket =
  Socket.init "ws://localhost:4000/socket/websocket"
  |> Socket.withDebug
  |> Socket.on "rover:update" "plateau:public" ReceiveRoverUpdate

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  let
    msg = Debug.log "msg=" msg
    model = Debug.log "model=" model
  in
    case msg of
      NoOp ->
        (model, Cmd.none)

      JoinChannel ->
        let
          channel = Channel.init "plateau:public"
          (phxSocket, phxCmd) = Socket.join channel model.phxSocket
        in
          ({ model | phxSocket = phxSocket} , Cmd.map PhoenixMsg phxCmd)

      PhoenixMsg msg ->
        let
          ( phxSocket, phxCmd ) = Socket.update msg model.phxSocket
        in
          ( { model | phxSocket = phxSocket }
          , Cmd.map PhoenixMsg phxCmd
          )

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
  Socket.listen model.phxSocket PhoenixMsg
