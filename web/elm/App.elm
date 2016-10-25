module App exposing (..)

import MarsRovers.State as State
import MarsRovers.View as View

import Html.App

main : Program Never
main =
    Html.App.program
        { init = State.init
        , update = State.update
        , subscriptions = State.subscriptions
        , view = View.view
        }
