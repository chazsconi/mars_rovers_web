module MarsRovers.View exposing (view)

import MarsRovers.Types exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model.counter) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
