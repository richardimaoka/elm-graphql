module Github.Enum.RepositoryAffiliation exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The affiliation of a user to a repository

  - Owner - Repositories that are owned by the authenticated user.
  - Collaborator - Repositories that the user has been added to as a collaborator.
  - OrganizationMember - Repositories that the user has access to through being a member of an organization. This includes every repository on every team that the user is on.

-}
type RepositoryAffiliation
    = Owner
    | Collaborator
    | OrganizationMember


decoder : Decoder RepositoryAffiliation
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "OWNER" ->
                        Decode.succeed Owner

                    "COLLABORATOR" ->
                        Decode.succeed Collaborator

                    "ORGANIZATION_MEMBER" ->
                        Decode.succeed OrganizationMember

                    _ ->
                        Decode.fail ("Invalid RepositoryAffiliation type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


{-| Convert from the union type representating the Enum to a string that the GraphQL server will recognize.
-}
toString : RepositoryAffiliation -> String
toString enum =
    case enum of
        Owner ->
            "OWNER"

        Collaborator ->
            "COLLABORATOR"

        OrganizationMember ->
            "ORGANIZATION_MEMBER"
