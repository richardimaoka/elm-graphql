module Github.Enum.CommentAuthorAssociation exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| A comment author association with repository.

  - Member - Author is a member of the organization that owns the repository.
  - Owner - Author is the owner of the repository.
  - Collaborator - Author has been invited to collaborate on the repository.
  - Contributor - Author has previously committed to the repository.
  - FirstTimeContributor - Author has not previously committed to the repository.
  - FirstTimer - Author has not previously committed to GitHub.
  - None - Author has no association with the repository.

-}
type CommentAuthorAssociation
    = Member
    | Owner
    | Collaborator
    | Contributor
    | FirstTimeContributor
    | FirstTimer
    | None


decoder : Decoder CommentAuthorAssociation
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "MEMBER" ->
                        Decode.succeed Member

                    "OWNER" ->
                        Decode.succeed Owner

                    "COLLABORATOR" ->
                        Decode.succeed Collaborator

                    "CONTRIBUTOR" ->
                        Decode.succeed Contributor

                    "FIRST_TIME_CONTRIBUTOR" ->
                        Decode.succeed FirstTimeContributor

                    "FIRST_TIMER" ->
                        Decode.succeed FirstTimer

                    "NONE" ->
                        Decode.succeed None

                    _ ->
                        Decode.fail ("Invalid CommentAuthorAssociation type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : CommentAuthorAssociation -> String
toString enum =
    case enum of
        Member ->
            "MEMBER"

        Owner ->
            "OWNER"

        Collaborator ->
            "COLLABORATOR"

        Contributor ->
            "CONTRIBUTOR"

        FirstTimeContributor ->
            "FIRST_TIME_CONTRIBUTOR"

        FirstTimer ->
            "FIRST_TIMER"

        None ->
            "NONE"
