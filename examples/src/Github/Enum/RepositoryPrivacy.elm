module Github.Enum.RepositoryPrivacy exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The privacy of a repository

  - Public - Public
  - Private - Private

-}
type RepositoryPrivacy
    = Public
    | Private


decoder : Decoder RepositoryPrivacy
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "PUBLIC" ->
                        Decode.succeed Public

                    "PRIVATE" ->
                        Decode.succeed Private

                    _ ->
                        Decode.fail ("Invalid RepositoryPrivacy type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : RepositoryPrivacy -> String
toString enum =
    case enum of
        Public ->
            "PUBLIC"

        Private ->
            "PRIVATE"
