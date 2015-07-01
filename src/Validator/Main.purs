module Validator.Main where

import Prelude
import Control.Bind
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.DOM.Simple.Document
import Data.DOM.Simple.Element
import Data.DOM.Simple.Window
import Data.DOM.Simple.Types
import Data.Traversable
import qualified Control.Monad.Eff.JQuery as J
import Validator.Actions
import Validator.Validators
import Data.Foldable
import qualified Data.Array as A
import qualified Data.Array.Unsafe as UA

-- setInputValid :: forall eff. HTMLElement -> Eff (dom :: _ | eff) HTMLElement
-- setInputValid input = do
--   classRemove "invalid" input
--   classAdd "valid" input
--   return input

-- setInputInvalid :: forall eff. HTMLElement -> Eff (dom :: _ | eff) HTMLElement
-- setInputInvalid input = do
--   classRemove "valid" input
--   classAdd "invalid" input
--   return input

-- validateInput :: forall eff. HTMLElement -> Eff (dom :: _ | eff) HTMLElement
-- validateInput input = do
--   inputName <- getAttribute "name" input
--   functionName <- getAttribute "validator" input
--   -- trace $ inputName ++ ": " ++ functionName
--   return input

-- modifyInputs :: forall eff. HTMLDocument -> Eff (dom :: _ | eff) [HTMLElement]
-- modifyInputs = querySelectorAll "input[validator]" >=> sequence <<< A.map setInputValid

-- main = do
--   doc <- document globalWindow
--   -- modifyInputs doc
--   inputs <- querySelectorAll "input[validator]" doc
--   -- trace $ "number of input[validator] elements: " ++ (show $ A.length inputs)
--   let input = UA.head inputs
--   isValid <- validateInput input
--   trace $ "isvalid: " ++ (show isValid)
--   trace "done"


main = J.ready $ do
         watch noDigits =<< ($.) "input[name=username]" 
         watch allDigits =<< ($.) "input[name=zipcode]" 
         -- inputs <- ($.) ("input[validator]") :: forall t. Eff (dom :: DOM.DOM | t) J.JQuery
         -- inputs' <- (J.toArray (inputs :: J.JQuery))
         -- let x = map (\x -> J.JQuery x) (inputs' :: [DOM.Node])
         -- -- map (watch ((==) "new")) (inputs' :: [DOM.Node])
         -- trace "done"
