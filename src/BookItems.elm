module BookItems exposing (..)

import Html exposing (Html, text, div, button, i, input, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Dater exposing (transformDate)
import Utils exposing (renderRating)
import Model exposing (ActiveBook, FinishedBook)


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
        , div [ class "book-icon tooltiper" ]
            [ i [ class "fas fa-book" ] []
            , div [ class "book-tooltip" ] [ text book.expectation ]
            ]
        , div [ class "book__date" ] [ text (transformDate book.startDate) ]
        , div [ class "book__edit book-icon" ]
            [ i [ class "fas fa-pencil-alt", onClick (Msg.ToggleEdit book) ] []
            ]
        , div [ class "book__finish book-icon", onClick (Msg.OpenFinishBook book) ]
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
        , div [ class "book__rate" ] (renderRating book.rate 5 False)
        , div [ class "book-icon tooltiper" ]
            [ i [ class "fas fa-book" ] []
            , div [ class "book-tooltip" ] [ text book.expectation ]
            ]
        , div [ class "book-icon tooltiper" ]
            [ i [ class "fab fa-tripadvisor" ] []
            , div [ class "book-tooltip" ] [ text book.impression ]
            ]
        , div [ class "book-icon tooltiper" ]
            [ i [ class "far fa-calendar-alt" ] []
            , div [ class "book-tooltip" ]
                [ text (transformDate book.startDate ++ " - " ++ transformDate book.endDate) ]
            ]
        ]
