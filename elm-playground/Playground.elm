module Playground where

import Color (Color, rgb)
import List (map, drop, length, head)

testColor : Int -> Int -> Color
testColor total index =
  let colorVal = 255 // total * index
  in (rgb colorVal colorVal colorVal)