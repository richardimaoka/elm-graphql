-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Interface.RepositoryInfo exposing (..)

import Github.Enum.RepositoryLockReason
import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.ScalarCodecs
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (FragmentSelectionSet(..), SelectionSet(..))
import Json.Decode as Decode


type alias Fragments decodesTo =
    { onRepository : SelectionSet decodesTo Github.Object.Repository
    , onRepositoryInvitationRepository : SelectionSet decodesTo Github.Object.RepositoryInvitationRepository
    }


{-| Build an exhaustive selection of type-specific fragments.
-}
fragments :
    Fragments decodesTo
    -> SelectionSet decodesTo Github.Interface.RepositoryInfo
fragments selections____ =
    Object.exhaustiveFragmentSelection
        [ Object.buildFragment "Repository" selections____.onRepository
        , Object.buildFragment "RepositoryInvitationRepository" selections____.onRepositoryInvitationRepository
        ]


{-| Can be used to create a non-exhaustive set of fragments by using the record
update syntax to add `SelectionSet`s for the types you want to handle.
-}
maybeFragments : Fragments (Maybe decodesTo)
maybeFragments =
    { onRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    , onRepositoryInvitationRepository = Graphql.SelectionSet.empty |> Graphql.SelectionSet.map (\_ -> Nothing)
    }


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Interface.RepositoryInfo
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The description of the repository.
-}
description : SelectionSet (Maybe String) Github.Interface.RepositoryInfo
description =
    Object.selectionForField "(Maybe String)" "description" [] (Decode.string |> Decode.nullable)


{-| The description of the repository rendered to HTML.
-}
descriptionHTML : SelectionSet Github.ScalarCodecs.Html Github.Interface.RepositoryInfo
descriptionHTML =
    Object.selectionForField "ScalarCodecs.Html" "descriptionHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


{-| Returns how many forks there are of this repository in the whole network.
-}
forkCount : SelectionSet Int Github.Interface.RepositoryInfo
forkCount =
    Object.selectionForField "Int" "forkCount" [] Decode.int


{-| Indicates if the repository has issues feature enabled.
-}
hasIssuesEnabled : SelectionSet Bool Github.Interface.RepositoryInfo
hasIssuesEnabled =
    Object.selectionForField "Bool" "hasIssuesEnabled" [] Decode.bool


{-| Indicates if the repository has wiki feature enabled.
-}
hasWikiEnabled : SelectionSet Bool Github.Interface.RepositoryInfo
hasWikiEnabled =
    Object.selectionForField "Bool" "hasWikiEnabled" [] Decode.bool


{-| The repository's URL.
-}
homepageUrl : SelectionSet (Maybe Github.ScalarCodecs.Uri) Github.Interface.RepositoryInfo
homepageUrl =
    Object.selectionForField "(Maybe ScalarCodecs.Uri)" "homepageUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder |> Decode.nullable)


{-| Indicates if the repository is unmaintained.
-}
isArchived : SelectionSet Bool Github.Interface.RepositoryInfo
isArchived =
    Object.selectionForField "Bool" "isArchived" [] Decode.bool


{-| Identifies if the repository is a fork.
-}
isFork : SelectionSet Bool Github.Interface.RepositoryInfo
isFork =
    Object.selectionForField "Bool" "isFork" [] Decode.bool


{-| Indicates if the repository has been locked or not.
-}
isLocked : SelectionSet Bool Github.Interface.RepositoryInfo
isLocked =
    Object.selectionForField "Bool" "isLocked" [] Decode.bool


{-| Identifies if the repository is a mirror.
-}
isMirror : SelectionSet Bool Github.Interface.RepositoryInfo
isMirror =
    Object.selectionForField "Bool" "isMirror" [] Decode.bool


{-| Identifies if the repository is private.
-}
isPrivate : SelectionSet Bool Github.Interface.RepositoryInfo
isPrivate =
    Object.selectionForField "Bool" "isPrivate" [] Decode.bool


{-| The license associated with the repository
-}
license : SelectionSet (Maybe String) Github.Interface.RepositoryInfo
license =
    Object.selectionForField "(Maybe String)" "license" [] (Decode.string |> Decode.nullable)


{-| The license associated with the repository
-}
licenseInfo :
    SelectionSet decodesTo Github.Object.License
    -> SelectionSet (Maybe decodesTo) Github.Interface.RepositoryInfo
licenseInfo object____ =
    Object.selectionForCompositeField "licenseInfo" [] object____ (identity >> Decode.nullable)


{-| The reason the repository has been locked.
-}
lockReason : SelectionSet (Maybe Github.Enum.RepositoryLockReason.RepositoryLockReason) Github.Interface.RepositoryInfo
lockReason =
    Object.selectionForField "(Maybe Enum.RepositoryLockReason.RepositoryLockReason)" "lockReason" [] (Github.Enum.RepositoryLockReason.decoder |> Decode.nullable)


{-| The repository's original mirror URL.
-}
mirrorUrl : SelectionSet (Maybe Github.ScalarCodecs.Uri) Github.Interface.RepositoryInfo
mirrorUrl =
    Object.selectionForField "(Maybe ScalarCodecs.Uri)" "mirrorUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder |> Decode.nullable)


{-| The name of the repository.
-}
name : SelectionSet String Github.Interface.RepositoryInfo
name =
    Object.selectionForField "String" "name" [] Decode.string


{-| The repository's name with owner.
-}
nameWithOwner : SelectionSet String Github.Interface.RepositoryInfo
nameWithOwner =
    Object.selectionForField "String" "nameWithOwner" [] Decode.string


{-| The User owner of the repository.
-}
owner :
    SelectionSet decodesTo Github.Interface.RepositoryOwner
    -> SelectionSet decodesTo Github.Interface.RepositoryInfo
owner object____ =
    Object.selectionForCompositeField "owner" [] object____ identity


{-| Identifies when the repository was last pushed to.
-}
pushedAt : SelectionSet (Maybe Github.ScalarCodecs.DateTime) Github.Interface.RepositoryInfo
pushedAt =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "pushedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


{-| The HTTP path for this repository
-}
resourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Interface.RepositoryInfo
resourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


type alias ShortDescriptionHTMLOptionalArguments =
    { limit : OptionalArgument Int }


{-| A description of the repository, rendered to HTML without any links in it.

  - limit - How many characters to return.

-}
shortDescriptionHTML :
    (ShortDescriptionHTMLOptionalArguments -> ShortDescriptionHTMLOptionalArguments)
    -> SelectionSet Github.ScalarCodecs.Html Github.Interface.RepositoryInfo
shortDescriptionHTML fillInOptionals____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { limit = Absent }

        optionalArgs____ =
            [ Argument.optional "limit" filledInOptionals____.limit Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionForField "ScalarCodecs.Html" "shortDescriptionHTML" optionalArgs____ (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Interface.RepositoryInfo
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP URL for this repository
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Interface.RepositoryInfo
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)
