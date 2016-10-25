module MarsRovers.IO exposing (..)

import MarsRovers.Types exposing (..)

import Json.Decode as JD exposing ((:=))

roverUpdateDecoder : JD.Decoder Rover
roverUpdateDecoder =
    JD.object4 Rover
        ("id" := JD.int)
        ("x"  := JD.int)
        ("y"  := JD.int)
        ("d"  := JD.string)
