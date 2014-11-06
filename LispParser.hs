module LispParser where

import Text.ParserCombinators.Parsec

magic :: a
magic = error "Not implemented yet."

type LSymbol = String

data LAtom = LSymbol LSymbol | LString String | LInt Int deriving Show

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving Show

lispParser :: Parser LProg
lispParser = ((return . LAtom) =<< latom) <|>
             ((return . LList) =<< llist) <|>
             ((return . LQuote) =<< lquote)

latom :: Parser LAtom
latom = magic

lsymbol :: Parser LSymbol
lsymbol = magic

lstring :: Parser String
lstring = magic

lint :: Parser Int
lint = magic

llist :: Parser [LProg]
llist = magic

lquote :: Parser LProg
lquote = magic
  
                                                                 
