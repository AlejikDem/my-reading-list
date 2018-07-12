module Utils exposing (..)

import Msg exposing (Msg)
import Html exposing (Html, i)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)
import Model exposing (ActiveBook, CurrentBook, emptyBook)


convertActiveToCurr : ActiveBook -> CurrentBook
convertActiveToCurr book =
    { emptyBook
        | id = Just book.id
        , title = book.title
        , expectation = book.expectation
        , isFiction = book.isFiction
    }


renderRating : Int -> Int -> Bool -> List (Html Msg)
renderRating rate max clickable =
    let
        aux rate max =
            if max == 0 then
                []
            else
                let
                    full =
                        rate > 0

                    classes =
                        classList
                            [ ( "fa-star", True )
                            , ( "fas", full )
                            , ( "far", not full )
                            , ( "clickable", clickable )
                            ]

                    action =
                        onClick (Msg.SetRate max)

                    attrs =
                        if clickable then
                            classes :: action :: []
                        else
                            [ classes ]
                in
                    (i
                        attrs
                        []
                    )
                        :: renderRating
                            (if full then
                                (rate - 1)
                             else
                                rate
                            )
                            (max - 1)
                            clickable
    in
        aux rate max
