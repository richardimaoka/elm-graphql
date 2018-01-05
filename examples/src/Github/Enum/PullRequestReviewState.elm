module Github.Enum.PullRequestReviewState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible states of a pull request review.

  - Pending - A review that has not yet been submitted.
  - Commented - An informational review.
  - Approved - A review allowing the pull request to merge.
  - ChangesRequested - A review blocking the pull request from merging.
  - Dismissed - A review that has been dismissed.

-}
type PullRequestReviewState
    = Pending
    | Commented
    | Approved
    | ChangesRequested
    | Dismissed


decoder : Decoder PullRequestReviewState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "PENDING" ->
                        Decode.succeed Pending

                    "COMMENTED" ->
                        Decode.succeed Commented

                    "APPROVED" ->
                        Decode.succeed Approved

                    "CHANGES_REQUESTED" ->
                        Decode.succeed ChangesRequested

                    "DISMISSED" ->
                        Decode.succeed Dismissed

                    _ ->
                        Decode.fail ("Invalid PullRequestReviewState type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : PullRequestReviewState -> String
toString enum =
    case enum of
        Pending ->
            "PENDING"

        Commented ->
            "COMMENTED"

        Approved ->
            "APPROVED"

        ChangesRequested ->
            "CHANGES_REQUESTED"

        Dismissed ->
            "DISMISSED"
