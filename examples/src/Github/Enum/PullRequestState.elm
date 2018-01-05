module Github.Enum.PullRequestState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible states of a pull request.

  - Open - A pull request that is still open.
  - Closed - A pull request that has been closed without being merged.
  - Merged - A pull request that has been closed by being merged.

-}
type PullRequestState
    = Open
    | Closed
    | Merged


decoder : Decoder PullRequestState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OPEN" ->
                        Decode.succeed Open

                    "CLOSED" ->
                        Decode.succeed Closed

                    "MERGED" ->
                        Decode.succeed Merged

                    _ ->
                        Decode.fail ("Invalid PullRequestState type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : PullRequestState -> String
toString enum =
    case enum of
        Open ->
            "OPEN"

        Closed ->
            "CLOSED"

        Merged ->
            "MERGED"
