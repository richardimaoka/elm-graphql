module Github.Enum.StatusState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The possible commit status states.

  - Expected - Status is expected.
  - Error - Status is errored.
  - Failure - Status is failing.
  - Pending - Status is pending.
  - Success - Status is successful.

-}
type StatusState
    = Expected
    | Error
    | Failure
    | Pending
    | Success


decoder : Decoder StatusState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "EXPECTED" ->
                        Decode.succeed Expected

                    "ERROR" ->
                        Decode.succeed Error

                    "FAILURE" ->
                        Decode.succeed Failure

                    "PENDING" ->
                        Decode.succeed Pending

                    "SUCCESS" ->
                        Decode.succeed Success

                    _ ->
                        Decode.fail ("Invalid StatusState type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : StatusState -> String
toString enum =
    case enum of
        Expected ->
            "EXPECTED"

        Error ->
            "ERROR"

        Failure ->
            "FAILURE"

        Pending ->
            "PENDING"

        Success ->
            "SUCCESS"
