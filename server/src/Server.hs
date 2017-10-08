{-# LANGUAGE DataKinds, OverloadedStrings, TypeOperators #-}

module Server
    ( API
    , api
    , server
    ) where

import Data.Monoid
import Data.Text
import Servant
import Web.FormUrlEncoded

type API = "greeting" :> Get '[PlainText] Text
  :<|> "greeting" :> Capture "name" Text :> Get '[PlainText] Text
  :<|> "register" :> ReqBody '[FormUrlEncoded] User :> Post '[PlainText] NoContent

api :: Proxy API
api = Proxy

server :: Server API
server = return "hello world!"
  :<|> greet
  :<|> undefined

greet :: Monad m => Text -> m Text
greet name = return ("hello " <> name <> "!")

mischa :: User
mischa = User
  { firstName = "Mischa"
  , lastName = "Stephens"
  , email = "sirmischa@gmail.com"
  }

data User = User
  { firstName :: Text
  , lastName :: Text
  , email :: Text
  } deriving (Eq,Ord,Show)

instance FromForm User where
  fromForm f = User
    <$> parseUnique "first" f
    <*> parseUnique "last"  f
    <*> parseUnique "email" f
