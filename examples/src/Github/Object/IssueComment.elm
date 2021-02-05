-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.IssueComment exposing (..)

import Github.Enum.CommentAuthorAssociation
import Github.Enum.CommentCannotUpdateReason
import Github.Enum.ReactionContent
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
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


{-| The actor who authored the comment.
-}
author :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.IssueComment
author object____ =
    Object.selectionForCompositeField "author" [] object____ (identity >> Decode.nullable)


{-| Author's association with the subject of the comment.
-}
authorAssociation : SelectionSet Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Object.IssueComment
authorAssociation =
    Object.selectionForField "Enum.CommentAuthorAssociation.CommentAuthorAssociation" "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


{-| Identifies the comment body.
-}
body : SelectionSet String Github.Object.IssueComment
body =
    Object.selectionForField "String" "body" [] Decode.string


{-| The comment body rendered to HTML.
-}
bodyHTML : SelectionSet Github.ScalarCodecs.Html Github.Object.IssueComment
bodyHTML =
    Object.selectionForField "ScalarCodecs.Html" "bodyHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


{-| Identifies the body of the issue rendered to text.
-}
bodyText : SelectionSet String Github.Object.IssueComment
bodyText =
    Object.selectionForField "String" "bodyText" [] Decode.string


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.IssueComment
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| Check if this comment was created via an email reply.
-}
createdViaEmail : SelectionSet Bool Github.Object.IssueComment
createdViaEmail =
    Object.selectionForField "Bool" "createdViaEmail" [] Decode.bool


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.IssueComment
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


{-| The actor who edited the comment.
-}
editor :
    SelectionSet decodesTo Github.Interface.Actor
    -> SelectionSet (Maybe decodesTo) Github.Object.IssueComment
editor object____ =
    Object.selectionForCompositeField "editor" [] object____ (identity >> Decode.nullable)


id : SelectionSet Github.ScalarCodecs.Id Github.Object.IssueComment
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Identifies the issue associated with the comment.
-}
issue :
    SelectionSet decodesTo Github.Object.Issue
    -> SelectionSet decodesTo Github.Object.IssueComment
issue object____ =
    Object.selectionForCompositeField "issue" [] object____ identity


{-| The moment the editor made the last edit
-}
lastEditedAt : SelectionSet (Maybe Github.ScalarCodecs.DateTime) Github.Object.IssueComment
lastEditedAt =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "lastEditedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


{-| Identifies when the comment was published at.
-}
publishedAt : SelectionSet (Maybe Github.ScalarCodecs.DateTime) Github.Object.IssueComment
publishedAt =
    Object.selectionForField "(Maybe ScalarCodecs.DateTime)" "publishedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder |> Decode.nullable)


{-| Returns the pull request associated with the comment, if this comment was made on a
pull request.
-}
pullRequest :
    SelectionSet decodesTo Github.Object.PullRequest
    -> SelectionSet (Maybe decodesTo) Github.Object.IssueComment
pullRequest object____ =
    Object.selectionForCompositeField "pullRequest" [] object____ (identity >> Decode.nullable)


{-| A list of reactions grouped by content left on the subject.
-}
reactionGroups :
    SelectionSet decodesTo Github.Object.ReactionGroup
    -> SelectionSet (Maybe (List decodesTo)) Github.Object.IssueComment
reactionGroups object____ =
    Object.selectionForCompositeField "reactionGroups" [] object____ (identity >> Decode.list >> Decode.nullable)


type alias ReactionsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , content : OptionalArgument Github.Enum.ReactionContent.ReactionContent
    , orderBy : OptionalArgument Github.InputObject.ReactionOrder
    }


{-| A list of Reactions left on the Issue.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - content - Allows filtering Reactions by emoji.
  - orderBy - Allows specifying the order in which reactions are returned.

-}
reactions :
    (ReactionsOptionalArguments -> ReactionsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.ReactionConnection
    -> SelectionSet decodesTo Github.Object.IssueComment
reactions fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent, content = Absent, orderBy = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "last" filledInOptionals____.last Encode.int, Argument.optional "before" filledInOptionals____.before Encode.string, Argument.optional "content" filledInOptionals____.content (Encode.enum Github.Enum.ReactionContent.toString), Argument.optional "orderBy" filledInOptionals____.orderBy Github.InputObject.encodeReactionOrder ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "reactions" optionalArgs____ object____ identity


{-| The repository associated with this node.
-}
repository :
    SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet decodesTo Github.Object.IssueComment
repository object____ =
    Object.selectionForCompositeField "repository" [] object____ identity


{-| The HTTP path for this issue comment
-}
resourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.IssueComment
resourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.IssueComment
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP URL for this issue comment
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Object.IssueComment
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


type alias UserContentEditsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of edits to this content.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
userContentEdits :
    (UserContentEditsOptionalArguments -> UserContentEditsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.UserContentEditConnection
    -> SelectionSet (Maybe decodesTo) Github.Object.IssueComment
userContentEdits fillInOptionals____ object____ =
    let
        filledInOptionals____ =
            fillInOptionals____ { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs____ =
            [ Argument.optional "first" filledInOptionals____.first Encode.int, Argument.optional "after" filledInOptionals____.after Encode.string, Argument.optional "last" filledInOptionals____.last Encode.int, Argument.optional "before" filledInOptionals____.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "userContentEdits" optionalArgs____ object____ (identity >> Decode.nullable)


{-| Check if the current viewer can delete this object.
-}
viewerCanDelete : SelectionSet Bool Github.Object.IssueComment
viewerCanDelete =
    Object.selectionForField "Bool" "viewerCanDelete" [] Decode.bool


{-| Can user react to this subject
-}
viewerCanReact : SelectionSet Bool Github.Object.IssueComment
viewerCanReact =
    Object.selectionForField "Bool" "viewerCanReact" [] Decode.bool


{-| Check if the current viewer can update this object.
-}
viewerCanUpdate : SelectionSet Bool Github.Object.IssueComment
viewerCanUpdate =
    Object.selectionForField "Bool" "viewerCanUpdate" [] Decode.bool


{-| Reasons why the current viewer can not update this comment.
-}
viewerCannotUpdateReasons : SelectionSet (List Github.Enum.CommentCannotUpdateReason.CommentCannotUpdateReason) Github.Object.IssueComment
viewerCannotUpdateReasons =
    Object.selectionForField "(List Enum.CommentCannotUpdateReason.CommentCannotUpdateReason)" "viewerCannotUpdateReasons" [] (Github.Enum.CommentCannotUpdateReason.decoder |> Decode.list)


{-| Did the viewer author this comment.
-}
viewerDidAuthor : SelectionSet Bool Github.Object.IssueComment
viewerDidAuthor =
    Object.selectionForField "Bool" "viewerDidAuthor" [] Decode.bool
