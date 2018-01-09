import Graphics.Element (Element)
import Text (asText)


factorial : Int -> Int
factorial n =
    if n <= 1
      then 1
      else n * factorial (n-1)


main : Element
main =
  asText (factorial 50)