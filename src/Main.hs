{-# LANGUAGE OverloadedStrings #-}
module Main where

import Data.Monoid
import Prelude hiding (div)

import Clay.Core.Render
import Clay.Core.Rule
import Clay.Core.Selector
import Clay.Style.Background
import Clay.Style.Color
import Clay.Style.Html
import Clay.Style.Properties
import Clay.Style.Size

main :: IO ()
main = css $

  rule body $
    do color             green
       border            solid (px 10) red
       borderLeftColor   green

       rule (div <> abbr) $
         do color red
            sym margin       (px 10) (px 20)
            backgroundRepeat repeatX
            background       red
            background       (Size (pct 20) (pct 30))
            backgroundImage  (url "http://www.w3.org/TR/2012/CR-css3-images-20120417/")
            backgroundSize   (Length (Just (px 4)) Nothing)

            self hover $
              color green

            pop 2 $
              do color purple
                 font "Arial, Helvetica, sans-serif" (pt 12) black

            root (html `with` ".open") $
              marginLeft (px 1)

            rule ("#content" <> q) $
              do color green
                 "-webkit-box-shadow" -: "10px 10px 0px rgba(12,12,23)"
