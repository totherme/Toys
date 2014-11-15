{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}

module Main where

import LispParser
import Test.QuickCheck
import Text.Printf (printf)
import Test.SmallCheck (smallCheck)
import Test.SmallCheck.Series (Serial)

-- Without this Arbitrary instance that kills spaces, the test below should really fail...
instance Arbitrary LSymbol where
  arbitrary = fmap LSymbol $ listOf $ elements $ ['a'..'z']++['A'..'Z']++['0'..'9']++['!','$','%','^','&','*','-','_','=','+',';',':','\'','@','#','~',',','.','<','>','/','?','\\','|']

instance Serial m String => Serial m LSymbol


class PrintCode a where
  printCode :: a -> String

instance PrintCode LSymbol where
  printCode (LSymbol x) = x

main :: IO ()
main  = mapM_ (\(s,a) -> printf "%-25s: " s >> quickCheck a >> smallCheck 4 a) tests 

 
-- reversing twice a finite list, is the same as identity
prop_LSymbols_parse_themselves :: LSymbol -> Bool
prop_LSymbols_parse_themselves s = parsed ==  [LAtom $ LAtSymbol s]
  where (Right parsed) = lparse $ printCode s
 
tests :: [(String, (LSymbol -> Bool))]
tests  = [("LSymbols parse their printed selves", prop_LSymbols_parse_themselves)]

         
