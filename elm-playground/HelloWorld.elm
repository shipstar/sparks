module HelloWorld where

import Graphics.Element (Element)
import Color (..)
import TextPrinter

main : Element
main = TextPrinter.printString "Hello World"