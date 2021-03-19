module Main exposing (main)

import Browser
import Html exposing (Html, button, div, input, label, p, text)
import Html.Attributes exposing (for, id, name, type_)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, view = view, update = update }



-- MODEL


type alias Model =
    String


init : Model
init =
    "password"


view : Model -> Html Msg
view model =
    Html.form []
        [ div []
            [ label [ for "current-password" ] [ text "Current Password" ]
            , input [ type_ model, name "current-password", id "current-password" ] []
            ]
        , div []
            [ label [ for "new-password" ] [ text "New Password" ]
            , input [ type_ model, name "new-password", id "new-password" ] []
            ]
        , div []
            [ label [ for "show-passwords" ] []
            , input [ type_ "checkbox", name "show-passwords", id "show-passwords", onClick Checked ] []
            , text "Show passwords"
            ]
        , p []
            [ button [ type_ "submit" ] [ text "Change Passwords" ]
            ]
        ]



-- UPDATE


type Msg
    = Checked


update : Msg -> Model -> Model
update msg model =
    case msg of
        Checked ->
            if model == "password" then
                "text"

            else
                "password"
