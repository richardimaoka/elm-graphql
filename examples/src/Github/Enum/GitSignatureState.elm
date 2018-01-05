module Github.Enum.GitSignatureState exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The state of a Git signature.

  - Valid - Valid signature and verified by GitHub.
  - Invalid - Invalid signature.
  - MalformedSig - Malformed signature.
  - UnknownKey - Key used for signing not known to GitHub.
  - BadEmail - Invalid email used for signing.
  - UnverifiedEmail - Email used for signing unverified on GitHub.
  - NoUser - Email used for signing not known to GitHub.
  - UnknownSigType - Unknown signature type.
  - Unsigned - Unsigned.
  - GpgverifyUnavailable - Internal error - the GPG verification service is unavailable at the moment.
  - GpgverifyError - Internal error - the GPG verification service misbehaved.
  - NotSigningKey - The usage flags for the key that signed this don't allow signing.
  - ExpiredKey - Signing key expired.

-}
type GitSignatureState
    = Valid
    | Invalid
    | MalformedSig
    | UnknownKey
    | BadEmail
    | UnverifiedEmail
    | NoUser
    | UnknownSigType
    | Unsigned
    | GpgverifyUnavailable
    | GpgverifyError
    | NotSigningKey
    | ExpiredKey


decoder : Decoder GitSignatureState
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "VALID" ->
                        Decode.succeed Valid

                    "INVALID" ->
                        Decode.succeed Invalid

                    "MALFORMED_SIG" ->
                        Decode.succeed MalformedSig

                    "UNKNOWN_KEY" ->
                        Decode.succeed UnknownKey

                    "BAD_EMAIL" ->
                        Decode.succeed BadEmail

                    "UNVERIFIED_EMAIL" ->
                        Decode.succeed UnverifiedEmail

                    "NO_USER" ->
                        Decode.succeed NoUser

                    "UNKNOWN_SIG_TYPE" ->
                        Decode.succeed UnknownSigType

                    "UNSIGNED" ->
                        Decode.succeed Unsigned

                    "GPGVERIFY_UNAVAILABLE" ->
                        Decode.succeed GpgverifyUnavailable

                    "GPGVERIFY_ERROR" ->
                        Decode.succeed GpgverifyError

                    "NOT_SIGNING_KEY" ->
                        Decode.succeed NotSigningKey

                    "EXPIRED_KEY" ->
                        Decode.succeed ExpiredKey

                    _ ->
                        Decode.fail ("Invalid GitSignatureState type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : GitSignatureState -> String
toString enum =
    case enum of
        Valid ->
            "VALID"

        Invalid ->
            "INVALID"

        MalformedSig ->
            "MALFORMED_SIG"

        UnknownKey ->
            "UNKNOWN_KEY"

        BadEmail ->
            "BAD_EMAIL"

        UnverifiedEmail ->
            "UNVERIFIED_EMAIL"

        NoUser ->
            "NO_USER"

        UnknownSigType ->
            "UNKNOWN_SIG_TYPE"

        Unsigned ->
            "UNSIGNED"

        GpgverifyUnavailable ->
            "GPGVERIFY_UNAVAILABLE"

        GpgverifyError ->
            "GPGVERIFY_ERROR"

        NotSigningKey ->
            "NOT_SIGNING_KEY"

        ExpiredKey ->
            "EXPIRED_KEY"
