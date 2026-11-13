{-|
Module      : View
Description : The view for the app
Copyright   : (c) Harley Eades, 2026
Maintainer  : harley.eades@gmail.com


-}
module View (appView) where

import Miso ( View, text )
import Miso.Html.Element qualified as H
import Miso.Html.Property qualified as HP
import ViewModel ( Action, ViewModel )

appView :: ViewModel -> View () () ViewModel Action
appView _ =
  H.main_ [ HP.id_ "page-root" ]
    [ H.p_ [] [ text "app view" ] ]