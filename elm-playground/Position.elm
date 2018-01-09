import Graphics.Element (..)
import Signal (Signal, map, map2)
import Mouse
import Text (asText, plainText)
import Debug


main : Signal Element
main =
  let position = Debug.watch "Mouse" <- Mouse.position
  
  map asText Mouse.position
