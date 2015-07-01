module Validator.Validators where

import Prelude
import Data.Foldable
import Global
-- import Data.Array (map)
import Data.String

isDigit :: String -> Boolean
isDigit = not <<< isNaN <<< readInt 10

-- isLetter = elem allLetters
--     where allLetters = enumFromTo "a" "z"

hasDigits = any isDigit <<< split ""

-- hasLetters =  any isLetter <<< split ""

noDigits :: String -> Boolean
noDigits = not <<< hasDigits

allDigits :: String -> Boolean
allDigits = not <<< noDigits

-- securePassword :: String -> Boolean
-- securePassword = 
