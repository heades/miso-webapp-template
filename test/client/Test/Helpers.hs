{-|
Module      : Helpers
Description : Useful helpers for writing tests
Copyright   : (c) Harley Eades, 2026
Maintainer  : harley.eades@gmail.com


-}
module  Test.Helpers (UnitTest(..)
                     ,test_case) where

import Test.Hspec            

-- | The type of a unit test corresponds to a pair of an output value and an
-- expected result.
data UnitTest a = UnitTest {
     test_output :: a -- ^ Output of a computation
    ,test_result :: a -- ^ Expected result of the test
}

test_case :: (Show a, Eq a) 
          => String 
          -> UnitTest a 
          -> SpecWith ()
test_case label t = it label $ (test_output t) `shouldBe` (test_result t)
