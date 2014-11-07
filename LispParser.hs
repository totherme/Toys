module LispParser where

import Text.ParserCombinators.Parsec

-- magic :: a
-- magic = error "Not implemented yet."

type LSymbol = String

data LAtom = LSymbol LSymbol | LString String | LInt Int deriving Show

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving Show

lprog :: Parser LProg
lprog = many space >> ((fmap LAtom latom) <|>
                       (fmap LList llist) <|>
                       (fmap LQuote lquote) <|>
                       (lcomment >> lprog))

latom :: Parser LAtom
latom = (fmap LSymbol lsymbol) <|>
        (fmap LString lstring) <|>
        (fmap LInt lint) <?> "atom"

lsymbol :: Parser LSymbol
lsymbol = many1 lsymbchar <?>
          "symbol"

lsymbchar :: Parser Char
lsymbchar = choice [letter, digit, oneOf "!?/@£$%^&*-_=+:#~.,><|"] <?> "symbol-char"

lstring :: Parser String
lstring = (do
  char '"'
  body <- lstringbody
  char '"'
  return body) <?> "lstring"

lstringbody :: Parser String
lstringbody = (many $ choice [noneOf "\\\"", (char '\\' >> anyChar)]) <?> "lstringbody"

lint :: Parser Int
lint = (fmap read $ many1 digit) <?> "lint"

llist :: Parser [LProg]
llist = (do
            char '('
            many space
            progs <- sepEndBy lprog (many1 space)
            many lcomment
            char ')'
            return $ progs)
        <?> "s-expression"

lquote :: Parser LProg
lquote = (char '\'' >> fmap LQuote lprog) <?> "lquote"

lcomment :: Parser ()
lcomment = (char ';' >> many (noneOf "\n\r") >> newline >> return ())
           <?> "lcomment"
           
lfile :: Parser [LProg]
lfile = do
  progs <- many lprog
  eof
  return progs
