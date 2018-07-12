module Model exposing (..)

import Date


type alias CurrentBook =
    { id : Maybe Int
    , title : String
    , expectation : String
    , isFiction : Bool
    , rate : Int
    , impression : String
    , readToEnd : Bool
    }


type alias ActiveBook =
    { id : Int
    , title : String
    , startDate : Result String Date.Date
    , expectation : String
    , isFiction : Bool
    }


type alias FinishedBook =
    { id : Int
    , title : String
    , startDate : Result String Date.Date
    , expectation : String
    , isFiction : Bool
    , rate : Int
    , impression : String
    , readToEnd : Bool
    , endDate : Result String Date.Date
    }


type alias Model =
    { activeBooks : List ActiveBook
    , finishedBooks : List FinishedBook
    , showAddBookModal : Bool
    , showFinishBookModal : Bool
    , currentBook : CurrentBook
    }


emptyBook : CurrentBook
emptyBook =
    { id = Nothing
    , title = ""
    , expectation = ""
    , isFiction = False
    , rate = 1
    , impression = ""
    , readToEnd = False
    }


initialModel : Model
initialModel =
    { activeBooks =
        [ { id = 0
          , title = "First Active"
          , startDate = Date.fromString "Jun 25 2018"
          , expectation = "I think it will be great book"
          , isFiction = False
          }
        , { id = 1
          , title = "Second"
          , startDate = Date.fromString "Jun 28 2018"
          , expectation = "I am not sure"
          , isFiction = True
          }
        ]
    , finishedBooks =
        [ { id = 2
          , title = "Stay Alive"
          , startDate = Date.fromString "May 2 2018"
          , expectation = "I think it will be great book"
          , isFiction = True
          , rate = 4
          , impression = "It was great"
          , readToEnd = True
          , endDate = Date.fromString "May 12 2018"
          }
        , { id = 3
          , title = "Second"
          , startDate = Date.fromString "April 12 2018"
          , expectation = "I am not sure"
          , isFiction = False
          , rate = 3
          , impression = "Not so good"
          , readToEnd = False
          , endDate = Date.fromString "May 1 2018"
          }
        ]
    , showAddBookModal = False
    , showFinishBookModal = False
    , currentBook = emptyBook
    }
