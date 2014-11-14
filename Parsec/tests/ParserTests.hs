 {-# LANGUAGE TypeSynonymInstances #-}
 {-# LANGUAGE FlexibleInstances #-}


module Main where

import LispParser
import Test.QuickCheck
import Text.Printf (printf)

  -- Without this Arbitrary instance that kills spaces, the test below should really fail...
-- instance Arbitrary LSymbol where
--   arbitrary = listOf $ elements $ ['a'..'z']++['A'..'Z']++['0'..'9']++['!','$','%','^','&','*','-','_','=','+',';',':','\'','@','#','~',',','.','<','>','/','?','\\','|']

class PrintCode a where
  printCode :: a -> String

instance PrintCode LSymbol where
  printCode = id

main :: IO ()
main  = mapM_ (\(s,a) -> printf "%-25s: " s >> a) tests
 
-- reversing twice a finite list, is the same as identity
prop_LSymbols_parse_themselves :: LSymbol -> Bool
prop_LSymbols_parse_themselves s = parsed ==  [LAtom (LSymbol s)]
  where (Right parsed) = lparse (printCode s)
 
tests :: [(String, IO ())]
tests  = [("LSymbols parse their printed selves", quickCheck prop_LSymbols_parse_themselves)]

         
