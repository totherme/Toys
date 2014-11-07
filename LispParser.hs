module LispParser where

import Text.ParserCombinators.Parsec

-- magic :: a
-- magic = error "Not implemented yet."

-- AST for a simple lisp

type LSymbol = String

data LAtom = LSymbol LSymbol | LString String | LInt Int deriving Show

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving Show

-- Parser for that simple lisp, sans comments
                                                                 
lprog :: Parser LProg
lprog = ((fmap LAtom latom) <|>
         (fmap LList llist) <|>
         (fmap LQuote lquote))

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
            char ')'
            return $ progs)
        <?> "s-expression"

lquote :: Parser LProg
lquote = (char '\'' >> fmap LQuote lprog) <?> "lquote"

lfile :: Parser [LProg]
lfile = do
  many space
  progs <- sepEndBy lprog (many space)
  eof
  return progs

-- Parser to strip comments from a lisp file

lcomment :: Parser String
lcomment = (char ';' >> many (noneOf "\n\r") >> newline >> return "")
           <?> "lcomment"

commentStripper :: Parser String
commentStripper = do
  parts <- many1 (lcomment <|> (fmap (:[]) (noneOf "\";")) <|> (lstring >> return ""))
  return $ concat parts

-- Stringing the two together
           
lparse :: String -> Either ParseError [LProg]
lparse str = let stripped = parse commentStripper "" str in
  either Left (parse lfile "") stripped

lparseFile :: FilePath -> IO (Either ParseError [LProg])
lparseFile path = do
  contents <- readFile path
  return $ lparse contents
              
