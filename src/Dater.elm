module Dater exposing (..)

import Date


monthToString : Date.Month -> String
monthToString mon =
    case mon of
        Date.Jan ->
            "Jan"

        Date.Feb ->
            "Feb"

        Date.Mar ->
            "Mar"

        Date.Apr ->
            "Apr"

        Date.May ->
            "May"

        Date.Jun ->
            "Jun"

        Date.Jul ->
            "Jul"

        Date.Aug ->
            "Aug"

        Date.Sep ->
            "Sep"

        Date.Oct ->
            "Oct"

        Date.Nov ->
            "Nov"

        Date.Dec ->
            "Dec"


convertDay : Int -> String
convertDay day =
    if day < 10 then
        "0" ++ toString day
    else
        toString day


transformDate : Result String Date.Date -> String
transformDate date =
    case date of
        Ok d ->
            (convertDay <| Date.day d)
                ++ " "
                ++ (monthToString <| Date.month d)
                ++ " "
                ++ (toString <| Date.year d)

        Err err ->
            err
