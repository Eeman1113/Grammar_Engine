module Main where

import Data.Aeson
import Network.HTTP.Client
import Network.HTTP.Types.Header
import Network.HTTP.Types.Method

main = do
  putStrLn "Hello"
  putStrLn "World"
  let s = "{\"key\":\"KC7B10DOKGXXLYYVCGMKXF741JSRET9B\", \"text\":\"Lets get started!\", \"session_id\":\"Test Document UUID\"}"
  let url = "https://api.sapling.ai/api/v1/edits"
  manager <- newManager defaultManagerSettings
  nakedRequest <- parseRequest url
  let request = nakedRequest {
        method = methodPost,
        requestBody = RequestBodyLBS (LBS.pack s),
        requestHeaders = [(hContentType, contentJson)]
      }
  response <- httpLbs request manager
  let Just obj = decode (responseBody response)
  print (obj :: Object)
