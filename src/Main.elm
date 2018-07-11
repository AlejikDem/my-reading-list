module Main exposing (..)

import Html exposing (Html, text, div, h1)
import Html.Attributes exposing (..)


---- MODEL ----


type alias ActiveBook =
    { id : Int
    , title : String
    , startDate : String
    , expectation : String
    , isFiction : Bool
    }


type alias FinishedBook =
    { id : Int
    , title : String
    , startDate : String
    , expectation : String
    , isFiction : Bool
    , rate : Int
    , impression : String
    , readToEnd : Bool
    , endDate : String
    }


type alias Model =
    { activeBooks : List ActiveBook
    , finishedBooks : List FinishedBook
    }


initialModel : Model
initialModel =
    { activeBooks =
        [ { id = 0
          , title = "First Active"
          , startDate = "25 June"
          , expectation = "I think it will be great book"
          , isFiction = False
          }
        , { id = 1
          , title = "Second"
          , startDate = "27 June"
          , expectation = "I am not sure"
          , isFiction = True
          }
        ]
    , finishedBooks =
        [ { id = 2
          , title = "Stay Alive"
          , startDate = "2 May"
          , expectation = "I think it will be great book"
          , isFiction = True
          , rate = 4
          , impression = "It was great"
          , readToEnd = True
          , endDate = "12 May"
          }
        , { id = 3
          , title = "Second"
          , startDate = "12 April"
          , expectation = "I am not sure"
          , isFiction = False
          , rate = 3
          , impression = "Not so good"
          , readToEnd = False
          , endDate = "1 May"
          }
        ]
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- VIEW ----


activeBookItem : ActiveBook -> Html Msg
activeBookItem book =
    div [] [ text book.title ]


finishedBookItem : FinishedBook -> Html Msg
finishedBookItem book =
    div [] [ text book.title ]


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ h1 [ class "app-title" ] [ text "My Reading List" ]
        , div [ class "menu-buttons" ] [ text "buttons" ]
        , div [ class "books-wrapper" ]
            [ div
                [ class "books-active books" ]
                (List.map activeBookItem model.activeBooks)
            , div
                [ class "books-archived books" ]
                (List.map finishedBookItem model.finishedBooks)
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
