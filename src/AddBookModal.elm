module AddBookModal exposing (addBookModal)

import Model exposing (Model, CurrentBook)
import Html exposing (Html, text, div, button, input, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Dialog


addBookForm : CurrentBook -> Html Msg
addBookForm currentBook =
    div [ class "add-modal__form modal-form" ]
        [ div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "Title" ]
            , div [ class "modal-form__field" ] [ input [ value currentBook.title ] [] ]
            ]
        , div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "Expectation" ]
            , div [ class "modal-form__field" ] [ textarea [ rows 6, value currentBook.expectation ] [] ]
            ]
        , div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "It is fiction" ]
            , div [ class "modal-form__field" ] [ input [ type_ "checkbox", checked currentBook.isFiction ] [] ]
            ]
        ]


addBookModal : Model -> Html Msg
addBookModal model =
    Dialog.view
        (if model.showAddBookModal then
            Just
                { closeMessage = Nothing
                , containerClass = Just "add-modal"
                , header = Just (div [ class "modal-top" ] [ text "Start new book" ])
                , body = Just (addBookForm model.currentBook)
                , footer =
                    Just
                        (div
                            [ class "modal__buttons" ]
                            [ button
                                [ class "btn success medium", onClick (Msg.CloseAddBookModal) ]
                                [ text "Start Book" ]
                            , button
                                [ class "btn danger medium", onClick (Msg.CloseAddBookModal) ]
                                [ text "Cancel" ]
                            ]
                        )
                }
         else
            Nothing
        )
