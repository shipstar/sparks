module FibonacciBars where

import Color (Color, rgb)
import Fibonacci (fibonacci, fibonacciWithIndexes)
import Graphics.Collage (collage, filled, rect)
import Graphics.Element (Element, down, flow, right)
import List (drop, head, length, map)
import Text (asText)

color : Int -> Int -> Color
color total index =
  let
    colorVal = 255 // total * index
  in
    rgb colorVal (255 - colorVal) 0

bar : (Int -> Color) -> (Int, Int) -> Element
bar colorFunc (index, n) =
  flow right [
    collage (n*20) 20 [ filled (colorFunc index) (rect (toFloat n * 20) 20)],
    asText n
  ]

main =
  let fibs = fibonacciWithIndexes 10
      total = length fibs
      colorFunc = color total
  in flow down <| map (bar colorFunc) fibs