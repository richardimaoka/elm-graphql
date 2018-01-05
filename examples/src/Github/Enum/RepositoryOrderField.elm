module Github.Enum.RepositoryOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Properties by which repository connections can be ordered.

  - CreatedAt - Order repositories by creation time
  - UpdatedAt - Order repositories by update time
  - PushedAt - Order repositories by push time
  - Name - Order repositories by name
  - Stargazers - Order repositories by number of stargazers

-}
type RepositoryOrderField
    = CreatedAt
    | UpdatedAt
    | PushedAt
    | Name
    | Stargazers


decoder : Decoder RepositoryOrderField
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "CREATED_AT" ->
                        Decode.succeed CreatedAt

                    "UPDATED_AT" ->
                        Decode.succeed UpdatedAt

                    "PUSHED_AT" ->
                        Decode.succeed PushedAt

                    "NAME" ->
                        Decode.succeed Name

                    "STARGAZERS" ->
                        Decode.succeed Stargazers

                    _ ->
                        Decode.fail ("Invalid RepositoryOrderField type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : RepositoryOrderField -> String
toString enum =
    case enum of
        CreatedAt ->
            "CREATED_AT"

        UpdatedAt ->
            "UPDATED_AT"

        PushedAt ->
            "PUSHED_AT"

        Name ->
            "NAME"

        Stargazers ->
            "STARGAZERS"
