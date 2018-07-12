module Main exposing (..)

import Html exposing (Html, text, div, h1, i, button, input, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Model exposing (Model, ActiveBook, FinishedBook, initialModel, emptyBook)
import AddBookModal exposing (addBookModal)
import FinishBookModal exposing (finishBookModal)
import BookItems exposing (activeBookItem, finishedBookItem)
import Utils exposing (convertActiveToCurr)


---- MODEL ----


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.CloseAddBookModal ->
            ( { model | showAddBookModal = False }, Cmd.none )

        Msg.CloseFinishBookModal ->
            ( { model | showFinishBookModal = False }, Cmd.none )

        Msg.OpenAddBook ->
            ( { model
                | currentBook = emptyBook
                , showAddBookModal = True
              }
            , Cmd.none
            )

        Msg.OpenFinishBook book ->
            ( { model
                | currentBook = convertActiveToCurr book
                , showFinishBookModal = True
              }
            , Cmd.none
            )

        Msg.ToggleEdit book ->
            ( { model
                | currentBook = convertActiveToCurr book
                , showAddBookModal = True
              }
            , Cmd.none
            )

        Msg.SetRate rate ->
            let
                currBook =
                    model.currentBook

                newCurrentBook =
                    { currBook | rate = rate }
            in
                ( { model | currentBook = newCurrentBook }, Cmd.none )



-- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "wrapper" ]
        [ h1 [ class "app-title" ] [ text "My Reading List" ]
        , div [ class "menu-buttons" ]
            [ button
                [ class "btn success medium"
                , onClick Msg.OpenAddBook
                ]
                [ text "Start new book" ]
            ]
        , div [ class "books-wrapper" ]
            [ div
                [ class "books-active books" ]
                (List.map activeBookItem model.activeBooks)
            , div [ class "divider" ] []
            , div
                [ class "books-archived books" ]
                (List.map finishedBookItem model.finishedBooks)
            ]
        , addBookModal model
        , finishBookModal model
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
