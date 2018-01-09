import Graphics.Element (..)
import Text as T
import Color (..)

main : Element
main =
  layers
    [ fittedImage 320 320 "/link.jpg"
    , width 320 (overlayText red)
    ]

make : Color -> T.Text -> T.Text
make color =
  T.color color

overlayText : Color -> Element
overlayText color =
  T.fromString "She sells sea shells."
    |> make color
    |> T.height 30
    |> T.bold
    |> T.centered