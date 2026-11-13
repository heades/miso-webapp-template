{-|
Module      : ViewModel
Description : The updateView modal for the view
Copyright   : (c) Harley Eades, 2026
Maintainer  : harley.eades@gmail.com


-}
module ViewModel (ViewModel(..),Action(..),updateView,initialModel) where

import Miso ( Effect )
import Model ()

data ViewModel = ViewModel
    deriving (Eq, Show)

initialModel :: ViewModel
initialModel = ViewModel

data Action 
  = Init

updateView :: Action -> Effect () () ViewModel Action
updateView = \case
  Init -> pure ()