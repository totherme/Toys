module LispParser where

import Text.ParserCombinators.Parsec

-- magic :: a
-- magic = error "Not implemented yet."

type LSymbol = String

data LAtom = LSymbol LSymbol | LString String | LInt Int deriving Show

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving Show

lispParser :: Parser LProg
lispParser = (fmap LAtom latom) <|>
             (fmap LList llist) <|>
             (fmap LQuote lquote) <|>
             (lcomment >> lispParser)

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
  progs <- sepEndBy lispParser (many1 space)
  char ')'
  return $ progs)
        <?> "s-expression"

lquote :: Parser LProg
lquote = char '\'' >> fmap LQuote lispParser

lcomment :: Parser ()
lcomment = char ';' >> many anyChar >> eol >> return () -- Of course, this could eat the whole file...
           -- Should learn a good way of doing anyChar \setminus eol
           
eol :: Parser String
eol = (try $ string "\r\n") <|>
      (try $ string "\n\r") <|>
      string "\n" <|>
      string "\r"

parseLispFile :: FilePath -> IO LProg
parseLispFile path = do
  fileContents <- readFile path
  either (error . show) return $ parse lispParser (show path) fileContents
