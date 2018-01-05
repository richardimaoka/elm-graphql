module Github.Enum.RepositoryContributionType exposing (..)

import Json.Decode as Decode exposing (Decoder)


{-| The reason a repository is listed as 'contributed'.

  - Commit - Created a commit
  - Issue - Created an issue
  - PullRequest - Created a pull request
  - Repository - Created the repository
  - PullRequestReview - Reviewed a pull request

-}
type RepositoryContributionType
    = Commit
    | Issue
    | PullRequest
    | Repository
    | PullRequestReview


decoder : Decoder RepositoryContributionType
decoder =
    Decode.string
        |> Decode.andThen
            (\string ->
                case string of
                    "COMMIT" ->
                        Decode.succeed Commit

                    "ISSUE" ->
                        Decode.succeed Issue

                    "PULL_REQUEST" ->
                        Decode.succeed PullRequest

                    "REPOSITORY" ->
                        Decode.succeed Repository

                    "PULL_REQUEST_REVIEW" ->
                        Decode.succeed PullRequestReview

                    _ ->
                        Decode.fail ("Invalid RepositoryContributionType type, " ++ string ++ " try re-running the graphqelm CLI ")
            )


toString : RepositoryContributionType -> String
toString enum =
    case enum of
        Commit ->
            "COMMIT"

        Issue ->
            "ISSUE"

        PullRequest ->
            "PULL_REQUEST"

        Repository ->
            "REPOSITORY"

        PullRequestReview ->
            "PULL_REQUEST_REVIEW"
