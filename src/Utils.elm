module Utils exposing (..)

import Msg exposing (Msg)
import Html exposing (Html, i)
import Html.Attributes exposing (classList)


renderRating : Int -> Int -> List (Html Msg)
renderRating rate max =
    let
        aux rate max =
            if max == 0 then
                []
            else
                let
                    full =
                        rate > 0
                in
                    (i
                        [ classList
                            [ ( "fa-star", True )
                            , ( "fas", full )
                            , ( "far", not full )
                            ]
                        ]
                        []
                    )
                        :: renderRating
                            (if full then
                                (rate - 1)
                             else
                                rate
                            )
                            (max - 1)
    in
        aux rate max
