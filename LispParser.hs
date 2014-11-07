module LispParser where

import Text.ParserCombinators.Parsec

-- magic :: a
-- magic = error "Not implemented yet."

type LSymbol = String

data LAtom = LSymbol LSymbol | LString String | LInt Int deriving Show

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving Show

lprog :: Parser LProg
lprog = (fmap LAtom latom) <|>
        (fmap LList llist) <|>
        (fmap LQuote lquote) <|>
        (lcomment >> lprog)

latom :: Parser LAtom
latom = (fmap LSymbol lsymbol) <|>
        (fmap LString lstring) <|>
        (fmap LInt lint) <|>
        (lcomment >> latom)

lsymbol :: Parser LSymbol
lsymbol = many1 lsymbchar <?>
          "symbol"

lsymbchar :: Parser Char
lsymbchar = choice [letter, digit, oneOf "!?/@£$%^&*-_=+:#~.,><|"]

lstring :: Parser String
lstring = do
  char '"'
  body <- lstringbody
  char '"'
  return body

lstringbody :: Parser String
lstringbody = many $ choice [lsymbchar, space, (char '\\' >> anyChar)]

lint :: Parser Int
lint = fmap read $ many1 digit

llist :: Parser [LProg]
llist = (do
  char '('
  many space
  progs <- sepEndBy lprog (many1 space)
  char ')'
  return $ progs)
        <?> "s-expression"

lquote :: Parser LProg
lquote = char '\'' >> fmap LQuote lprog

lcomment :: Parser ()
lcomment = char ';' >> many (noneOf "\n\r") >> newline >> return ()
           
lfile :: Parser LProg
lfile = do
  prog <- lprog
  eof
  return prog
