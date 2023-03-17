import Data.Aeson
import Network.HTTP.Client

main = do
  putStrLn "Hello"
  putStrLn "World"
  let s = "{\"key\":\"KC7B10DOKGXXLYYVCGMKXF741JSRET9B\", \"text\":\"Lets get started!\", \"session_id\":\"Test Document UUID\"}"
  let url = "https://api.sapling.ai/api/v1/edits"
  manager <- newManager defaultManagerSettings
  nakedRequest <- parseRequest url
  let request = nakedRequest { method = "POST", requestBody = body }
  response <- httpLbs request manager
  let Just obj = decode (responseBody response)
  print (obj :: Object)
