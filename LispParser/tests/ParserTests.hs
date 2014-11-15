{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses, FlexibleContexts, UndecidableInstances #-}

module Main where

import LispParser
import Test.QuickCheck (Arbitrary)
import Test.QuickCheck (arbitrary)
import Test.QuickCheck (elements)
import Test.QuickCheck (listOf)
import Test.QuickCheck (quickCheck)
import Test.SmallCheck.Series (Serial)
import Test.SmallCheck.Series (generate)
import Test.SmallCheck.Series (series)
import Test.SmallCheck (Depth)
import Test.SmallCheck (smallCheck)
import Text.Printf (printf)

class PrintCode a where
  printCode :: a -> String

instance PrintCode LSymbol where
  printCode (LSymbol x) = x

lsymchars :: [Char]
lsymchars =  ['a'..'z']++['A'..'Z']++['0'..'9']++['!','$','%','^','&','*','-','_','=','+',';',':','\'','@','#','~',',','.','<','>','/','?','\\','|']

-- Without this Arbitrary instance that kills spaces, the test below should really fail...

instance Arbitrary LSymbol where
  arbitrary = fmap LSymbol $ listOf $ elements lsymchars

instance Monad m => Serial m LSymbol where
  series = generate f where
    f :: Depth -> [LSymbol]
    f 0 = []
    f 1 = [LSymbol "fred"] -- map (LSymbol . (:[])) lsymchars
    f n = undefined

main :: IO ()
main  = mapM_ (\(s,a) -> printf "%-25s: " s >> quickCheck a >> smallCheck 4 a) tests 

 
-- reversing twice a finite list, is the same as identity
prop_LSymbols_parse_themselves :: LSymbol -> Bool
prop_LSymbols_parse_themselves s = parsed ==  [LAtom $ LAtSymbol s]
  where (Right parsed) = lparse $ printCode s
 
tests :: [(String, (LSymbol -> Bool))]
tests  = [("LSymbols parse their printed selves", prop_LSymbols_parse_themselves)]

         
