import qualified NLP.POS as POS
import qualified Language.Haskell.GrammarCheck as GC
import qualified System.Console.Haskeline as H
 
-- Tokenize the input string
tokenize :: String -> [String]
tokenize = words
 
-- Tag each token with its part of speech
tag :: String -> [(String, POS.Tag)]
tag = POS.pos . words
 
-- Check and correct the grammar of the tagged tokens
check :: [(String, POS.Tag)] -> [(String, POS.Tag)]
check = GC.correct . GC.check
 
-- Main function to take user input, perform grammar checking, and display results
main :: IO ()
main = do
  -- Prompt user to enter input
  input <- H.runInputT H.defaultSettings $ H.getInputLine "Enter some text: "
 
  -- If input is not empty, tokenize, tag, and check the grammar of the input
  case input of
    Just str -> do
      let tokens = tag $ unwords $ tokenize str
      let corrections = check tokens
 
      -- Print the corrected text
      H.outputStrLn "Corrected text:"
      H.outputStrLn $ unwords $ map fst corrections
 
    -- If input is empty, display an error message
    Nothing -> H.outputStrLn "Error: No input provided."