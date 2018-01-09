module TextPrinter where

import Graphics.Element (Element)
import Color (..)
import Text

printString : String -> Element
printString str =  
  Text.fromString str
    |> Text.color green
    |> Text.italic
    |> Text.bold
    |> Text.height 60
    |> Text.leftAligned