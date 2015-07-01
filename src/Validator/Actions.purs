module Validator.Actions where

import Control.Monad.Eff
import Data.Either
import Data.Foreign
import Control.Monad
import Data.DOM.Simple.Element
import Data.DOM.Simple.Events
import Data.DOM.Simple.Types
import qualified Control.Monad.JQuery as J

($.) :: forall eff. String -> Eff (dom :: DOM.DOM | eff) J.JQuery
($.) = J.select

toggleHighlightError :: forall inp. J.JQuery -> Eff (dom :: DOM.DOM | inp) J.JQuery
toggleHighlightError input = J.css { "border-color": "red", "border-width": "medium" } input

-- gives "x" in the case of Right "x" or the provided default value
fromEither :: forall r l . r -> Either l r -> r
fromEither def = either (const def) id

validate :: forall t . (String -> Boolean)
                       -> J.JQuery -> 
                          Eff (dom :: DOM.DOM | t) J.JQuery
validate validator input = do
  inputValue <- liftM1 (fromEither "") (readString <$> J.getValue input)
  let valid = validator $ inputValue
  J.toggleClass' "invalid" (not valid) input
  J.toggleClass' "valid" valid input

toggleValid :: forall t. HTMLElement -> Eff (dom :: DOM | t) Unit
toggleValid input = do
  classRemove "invalid" input
  classAdd "valid" input
  pure unit

toggleInvalid :: forall t. HTMLElement -> Eff (dom :: DOM | t) Unit
toggleInvalid input = do
  classRemove "valid" input
  classAdd "invalid" input
  pure unit

-- toggleInvalid input = do
--   classRemove "invalid" input
--   classAdd "valid" input  

validate' :: forall t . (String -> Boolean)
                       -> HTMLElement -> 
                          Eff (dom :: DOM.DOM | t) Unit
validate' validator input = do
  -- let valid = true
  -- if true then toggleValid input else toggleInvalid input
  pure unit

watch :: forall t. (String -> Boolean) -> J.JQuery -> Eff (dom :: DOM.DOM | t) J.JQuery
watch validator input = do
  flip (J.on "blur") input $ \_ _ -> do
    validate validator input

f = unit

watch' :: forall t. (String -> Boolean) -> HTMLElement -> Eff (dom :: DOM.DOM | t) Unit
watch' validator input = do
  -- addEventListener "blur" f input
  pure unit


-- Do I want to mix code/presentation... is it really?
-- use <*> to apply to v
-- applyFunction "allDigits" = Just allDigits
-- checkFunction str = 
