module Msg exposing (..)

import Model exposing (ActiveBook)


type Msg
    = CloseAddBookModal
    | CloseFinishBookModal
    | OpenAddBook
    | OpenFinishBook ActiveBook
    | ToggleEdit ActiveBook
    | SetRate Int
