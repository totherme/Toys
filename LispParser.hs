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
latom = ((return . LSymbol) =<< lsymbol) <|>
        ((return . LString) =<< lstring) <|>
        ((return . LInt) =<< lint)

lsymbol :: Parser LSymbol
lsymbol = many1 lsymbchar

lsymbchar :: Parser Char
lsymbchar = choice [letter, digit, char '!', char '?', char '/', char '@'] -- bored now

lstring :: Parser String
lstring = magic

lint :: Parser Int
lint = magic

llist :: Parser [LProg]
llist = magic

lquote :: Parser LProg
lquote = magic
  
                                                                 
