module Schema.User exposing (..)

import GraphqElm.Argument as Argument exposing (Argument)
import GraphqElm.Field as Field exposing (Field, FieldDecoder)
import GraphqElm.Object as Object exposing (Object)
import GraphqElm.TypeLock exposing (TypeLocked)


type Type
    = Type


user : (a -> constructor) -> Object (a -> constructor) Type
user constructor =
    Object.object constructor


id : TypeLocked (FieldDecoder String) Type
id =
    Field.string "id"


name : TypeLocked (FieldDecoder String) Type
name =
    Field.string "name"


contains : String -> TypeLocked Argument Type
contains value =
    Argument.string "contains" value


idArg : String -> TypeLocked Argument Type
idArg value =
    Argument.string "id" value