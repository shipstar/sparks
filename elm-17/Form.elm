import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

import Regex exposing (..)
import String exposing (..)


main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { name : String,
    age : String,
    password : String,
    confirmation : String,
    submitted : Bool
  }

model : Model
model =
  { name = ""
  , age = ""
  , password = ""
  , confirmation = ""
  , submitted = False
  }

-- UPDATE

type Msg
  = Name String
  | Age String
  | Password String
  | Confirmation String
  | Submit

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name newName ->
      { model | name = newName }

    Age newAge ->
      { model | age = newAge }

    Password newPassword ->
      { model | password = newPassword }

    Confirmation newConfirmation ->
      { model | confirmation = newConfirmation }

    Submit ->
      { model | submitted = True }

-- view
view : Model -> Html Msg
view model =
  div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "text", placeholder "Age", onInput Age ] []
    , input [ type' "password", placeholder "Password", onInput Password ] []
    , input [ type' "password", placeholder "Re-enter Password", onInput Confirmation ] []
    , viewValidation model
    , button [ type' "submit", onClick Submit ] [ text "Submit" ]
    ]

isVariedPassword : String -> Bool
isVariedPassword password
  =  Regex.contains (regex "[a-z]") password
  &&  Regex.contains (regex "[A-Z]") password
  &&  Regex.contains (regex "\\d") password

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if not model.submitted then
        ("", "")
      else if String.isEmpty model.name then
        ("red", "Name cannot be blank!")
      else if Result.withDefault -1 (String.toInt model.age) == -1 then
        ("red", "Age must be a number!")
      else if String.length model.password < 8 then
        ("red", "Password is too short!")
      else if not (isVariedPassword model.password) then
        ("red", "Password must contain at least one uppercase letter, one lowercase letter, and one number!")
      else if model.password /= model.confirmation then
        ("red", "Passwords do not match!")
      else
        ("green", "OK")
  in
    div [ style [("color", color)] ] [ text message ]
