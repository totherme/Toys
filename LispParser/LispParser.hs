module LispParser where

import Control.Monad (liftM)
import Text.ParserCombinators.Parsec

-- * AST for a simple lisp

data LSymbol = LSymbol String deriving (Eq,Show)

data LAtom = LAtSymbol LSymbol | LAtString String | LAtInt Int deriving (Eq,Show)

data LProg = LAtom LAtom | LList [LProg] | LQuote LProg deriving (Eq,Show)

-- * Parser for that simple lisp, sans comments
                                                                 
lprog :: Parser LProg
lprog = fmap LAtom latom <|>
        fmap LList llist <|>
        fmap LQuote lquote

latom :: Parser LAtom
latom = fmap LAtSymbol lsymbol <|>
        fmap LAtString lstring <|>
        fmap LAtInt lint <?> "atom"

lsymbol :: Parser LSymbol
lsymbol = (fmap LSymbol $ many1 (lsymbchar <|> (char '\\' >> oneOf ('\\':lsymbolcharacters)))) <?>
          "symbol"

lsymbolcharacters :: [Char]
lsymbolcharacters = ['a'..'z']++['A'..'Z']++['0'..'9']++"!?/@$%^&*-_=+:#~.,><|"

lsymbchar :: Parser Char
lsymbchar = oneOf lsymbolcharacters <?> "symbol-char"

lstring :: Parser String
lstring = (do
  _ <- char '"'
  body <- lstringbody
  _ <- char '"'
  return body) <?> "lstring"

lstringbody :: Parser String
lstringbody = many (choice [noneOf "\\\"", char '\\' >> anyChar]) <?> "lstringbody"

lint :: Parser Int
lint = fmap read (many1 digit) <?> "lint"

llist :: Parser [LProg]
llist = (do
            _ <- char '('
            _ <- many space
            progs <- sepEndBy lprog (many1 space)
            _ <- char ')'
            return progs)
        <?> "s-expression"

lquote :: Parser LProg
lquote = (char '\'' >> fmap LQuote lprog) <?> "lquote"

-- | A parser for a whole lisp file -- a sequence of terms
lfile :: Parser [LProg]
lfile = do
  _ <- many space
  progs <- sepEndBy lprog (many space)
  eof
  return progs

-- | Parser to strip comments from a lisp file

lcomment :: Parser String
lcomment = (char ';' >> many (noneOf "\n\r") >> newline >> return "")
           <?> "lcomment"

lcstring :: Parser String
lcstring = (do
               _ <- char '"'
               body <- fmap concat $ many $ choice [liftM (:[]) (noneOf "\\\""), char '\\' >> anyChar >>= \c -> return ("\\"++[c])]
               _ <- char '"'
               return ('\"':body++"\"")) <?> "lstring"

commentStripper :: Parser String
commentStripper = do
  parts <- many1 (lcomment <|> fmap (:[]) (noneOf "\";") <|> lcstring)
  eof
  return $ concat parts

-- * Stringing the two together

-- | Function that parses a string as a lisp program.  
lparse :: String -> Either ParseError [LProg]
lparse str = let stripped = parse commentStripper "" str in
  either Left (parse lfile "") stripped

-- | Function that parses a file as a lisp program  
lparseFile :: FilePath -> IO (Either ParseError [LProg])
lparseFile path = do
  contents <- readFile path
  return $ lparse contents
              
