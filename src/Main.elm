port module Main exposing (Model, Msg, main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, id)


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


port onIntersection : (String -> msg) -> Sub msg


type alias Model =
    { element : Maybe String }


init : () -> ( Model, Cmd msg )
init flags =
    ( { element = Nothing }, Cmd.none )


type Msg
    = Intersected String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Intersected element ->
            ( { model | element = Just element }, Cmd.none )


view : Model -> Html Msg
view model =
    main_ [ id "app" ]
        [ nav []
            [ ul []
                [ li [ class "item" ] [ text "item 1" ]
                , li [ class "item" ] [ text "item 2" ]
                , li [ class "item" ] [ text "item 3" ]
                , li [ class "item" ] [ text "item 4" ]
                , li [ class "item" ] [ text "item 5" ]
                , li [ class "item" ] [ text "item 5" ]
                , li [ class "item" ] [ text "item 6" ]
                , li [ class "item" ] [ text "item 7" ]
                , li [ class "item" ] [ text "item 8" ]
                , li [ class "item" ] [ text "item 9" ]
                , li [ class "item" ] [ text "item 10" ]
                ]
            ]
        , div [ class "recommendation", id "1" ] [ text "lazy item 1" ]
        , div [ class "recommendation", id "2" ] [ text "lazy item 2" ]
        , div [ class "recommendation", id "3" ] [ text "lazy item 3" ]
        , div [ class "recommendation", id "4" ] [ text "lazy item 4" ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    onIntersection Intersected
