module Github.Enum.ReactionOrderField exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| A list of fields that reactions can be ordered by.

  - CreatedAt - Allows ordering a list of reactions by when they were created.

-}
type ReactionOrderField
    = CreatedAt


decoder : Decoder ReactionOrderField
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "CREATED_AT" ->
                        Decode.succeed CreatedAt

                    _ ->
                        Decode.fail ("Invalid ReactionOrderField type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : ReactionOrderField -> String
toString enum =
    case enum of
        CreatedAt ->
            "CREATED_AT"
