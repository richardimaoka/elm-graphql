module Api.Object.Subscribable exposing (..)

import Api.Enum.SubscriptionState
import Api.Object
import Graphqelm.Argument as Argument exposing (Argument)
import Graphqelm.Field as Field exposing (Field, FieldDecoder)
import Graphqelm.Object as Object exposing (Object)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.Subscribable
build constructor =
    Object.object constructor


id : FieldDecoder String Api.Object.Subscribable
id =
    Field.fieldDecoder "id" [] Decode.string


viewerCanSubscribe : FieldDecoder Bool Api.Object.Subscribable
viewerCanSubscribe =
    Field.fieldDecoder "viewerCanSubscribe" [] Decode.bool


viewerSubscription : FieldDecoder Api.Enum.SubscriptionState.SubscriptionState Api.Object.Subscribable
viewerSubscription =
    Field.fieldDecoder "viewerSubscription" [] Api.Enum.SubscriptionState.decoder