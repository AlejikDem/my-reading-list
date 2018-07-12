module Msg exposing (..)

import Model exposing (ActiveBook)


type Msg
    = ToggleAddBookModal Bool
    | ToggleFinishBookModal Bool
    | ToggleEdit ActiveBook
    | SetRate Int
