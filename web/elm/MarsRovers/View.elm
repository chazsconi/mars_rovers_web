module MarsRovers.View exposing (view)

import MarsRovers.Types exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text (toString model.counter) ]
    , div [] [ text (toString model.rover) ]
    , button [ onClick JoinChannel ] [ text "Join" ]
    ]
