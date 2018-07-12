module FinishBookModal exposing (finishBookModal)

import Model exposing (Model, CurrentBook)
import Html exposing (Html, text, div, button, input, textarea)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Msg exposing (Msg)
import Dialog
import Utils exposing (renderRating)


finishBookForm : CurrentBook -> Html Msg
finishBookForm currentBook =
    div [ class "add-modal__form modal-form" ]
        [ div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "Impression" ]
            , div [ class "modal-form__field" ] [ textarea [ rows 6, value currentBook.impression ] [] ]
            ]
        , div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "Rate" ]
            , div [ class "modal-form__field" ] (renderRating currentBook.rate 5 True)
            ]
        , div [ class "modal-form__item" ]
            [ div [ class "modal-form__label" ] [ text "Read to End" ]
            , div [ class "modal-form__field" ] [ input [ type_ "checkbox", checked currentBook.readToEnd ] [] ]
            ]
        ]


finishBookModal : Model -> Html Msg
finishBookModal model =
    Dialog.view
        (if model.showFinishBookModal then
            Just
                { closeMessage = Nothing
                , containerClass = Just "finish-modal"
                , header = Just (div [ class "modal-top" ] [ text "Finish book" ])
                , body = Just (finishBookForm model.currentBook)
                , footer =
                    Just
                        (div
                            [ class "modal__buttons" ]
                            [ button
                                [ class "btn success medium", onClick (Msg.ToggleFinishBookModal False) ]
                                [ text "Start Book" ]
                            , button
                                [ class "btn danger medium", onClick (Msg.ToggleFinishBookModal False) ]
                                [ text "Cancel" ]
                            ]
                        )
                }
         else
            Nothing
        )
