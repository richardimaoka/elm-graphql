module Github.Enum.GistOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| Properties by which gist connections can be ordered.

  - CreatedAt - Order gists by creation time
  - UpdatedAt - Order gists by update time
  - PushedAt - Order gists by push time

-}
type GistOrderField
    = CreatedAt
    | UpdatedAt
    | PushedAt


decoder : Decoder GistOrderField
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

                    _ ->
                        Decode.fail ("Invalid GistOrderField type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : GistOrderField -> String
toString enum =
    case enum of
        CreatedAt ->
            "CREATED_AT"

        UpdatedAt ->
            "UPDATED_AT"

        PushedAt ->
            "PUSHED_AT"
