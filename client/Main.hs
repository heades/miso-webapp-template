-----------------------------------------------------------------------------
{-# LANGUAGE CPP               #-}
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
-----------------------------------------------------------------------------
module Main (main) where
-----------------------------------------------------------------------------
import Miso    

import View
import ViewModel

-----------------------------------------------------------------------------
#ifdef WASM
foreign export javascript "hs_start" main :: IO ()
#endif
-----------------------------------------------------------------------------
main :: IO ()
main = startAppWithContext (defaultEvents <> keyboardEvents <> pointerEvents) () app
-----------------------------------------------------------------------------
app :: Component () () ViewModel Action
app = (component initialModel updateView appView)
  {  mount  = Just Init
    ,styles = [ Href "/css/base.css" (True :: CacheBust) ]
    ,useContext = True
  }
-----------------------------------------------------------------------------
