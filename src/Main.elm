module Main exposing (..)

import Html exposing (Html, text, div, h1, i)
import Html.Attributes exposing (..)
import Msg exposing (Msg)
import Dater exposing (transformDate)
import Utils exposing (renderRating)
import Date


---- MODEL ----


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
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        _ ->
            ( model, Cmd.none )



-- VIEW ----
-- <i class="fas far fa-star"></i>


activeBookItem : ActiveBook -> Html Msg
activeBookItem book =
    div
        [ classList
            [ ( "book", True )
            , ( "book--fiction", book.isFiction )
            , ( "book--non-fiction", not book.isFiction )
            ]
        ]
        [ div [ class "book__title" ] [ text book.title ]
        , div [ class "book__expectation book-icon" ]
            [ i [ class "fas fa-book" ] []
            ]
        , div [ class "book__date" ] [ text (transformDate book.startDate) ]
        , div [ class "book__edit book-icon" ]
            [ i [ class "fas fa-pencil-alt" ] []
            ]
        , div [ class "book__finish book-icon" ]
            [ i [ class "fas fa-flag-checkered" ] []
            ]
        ]


finishedBookItem : FinishedBook -> Html Msg
finishedBookItem book =
    div
        [ classList
            [ ( "book", True )
            , ( "book--fiction", book.isFiction )
            , ( "book--non-fiction", not book.isFiction )
            ]
        ]
        [ div [ class "book__title" ] [ text book.title ]
        , div [ class "book__rate" ] (renderRating book.rate 5)
        , div [ class "book-icon" ]
            [ i [ class "fas fa-book" ] []
            ]
        , div [ class "book-icon" ]
            [ i [ class "fab fa-tripadvisor" ] []
            ]
        , div [ class "book-icon" ]
            [ i [ class "far fa-calendar-alt" ] []
            ]

        -- , div [ class "book__date" ] [ text (transformDate book.startDate ++ " - " ++ transformDate book.endDate) ]
        ]


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ h1 [ class "app-title" ] [ text "My Reading List" ]
        , div [ class "menu-buttons" ] [ text "buttons" ]
        , div [ class "books-wrapper" ]
            [ div
                [ class "books-active books" ]
                (List.map activeBookItem model.activeBooks)
            , div [ class "divider" ] []
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
