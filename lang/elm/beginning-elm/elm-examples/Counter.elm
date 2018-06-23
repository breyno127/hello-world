module Counter exposing (..)

import Html exposing (..)
import Html.Events exposing (..)
import VirtualDom


-- Model


type alias Model =
    Int


initialModel : Model
initialModel =
    0



-- View


view : Model -> Html Msg
view model =
    VirtualDom.node "div"
        []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (toString model)
        , button [ onClick Increment ] [ text "+" ]
        ]



-- Update


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1



-- Entry point


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
