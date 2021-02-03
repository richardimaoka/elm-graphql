-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql
module GithubNoFormat.Enum.GistPrivacy exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The privacy of a Gist

  - Public - Public
  - Secret - Secret
  - All - Gists that are public and secret

-}
type GistPrivacy
    = Public
    | Secret
    | All
list : List GistPrivacy
list =
    [Public, Secret, All]
decoder : Decoder GistPrivacy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "PUBLIC" ->
                        Decode.succeed Public

                    "SECRET" ->
                        Decode.succeed Secret

                    "ALL" ->
                        Decode.succeed All

                    _ ->
                        Decode.fail ("Invalid GistPrivacy type, " ++ string ++ " try re-running the @dillonkearns/elm-graphql CLI ")
        )
        

{-| Convert from the union type representing the Enum to a string that the GraphQL server will recognize.
-}
toString : GistPrivacy -> String
toString enum =
    case enum of
        Public ->
                "PUBLIC"


        Secret ->
                "SECRET"


        All ->
                "ALL"


{-| Convert from a String representation to an elm representation enum.
This is the inverse of the Enum `toString` function. So you can call `toString` and then convert back `fromString` safely.

    Swapi.Enum.Episode.NewHope
        |> Swapi.Enum.Episode.toString
        |> Swapi.Enum.Episode.fromString
        == Just NewHope

This can be useful for generating Strings to use for <select> menus to check which item was selected.

-}
fromString : String -> Maybe GistPrivacy
fromString enumString =
    case enumString of
        "PUBLIC" ->
                Just Public


        "SECRET" ->
                Just Secret


        "ALL" ->
                Just All

        _ ->
                Nothing