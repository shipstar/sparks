# elm-playground

**DISCLAIMER: I am not a Haskellist, so beware the terrible code you might find in here.**

I've been working with React a lot lately and reading a decent amount about Clojure/Om/core.async. When I saw elm-lang, it looked like an interesting application of many of the same concepts.

I'm still thrashing at [the type system](http://elm-lang.org/learn/Understanding-Types.elm) (curse you, dynamic languages!) and trying to wrap my head around [Signals](http://elm-lang.org/learn/What-is-FRP.elm), but maybe you can learn something from my struggles.

After treading water by modifying examples, I decided to start working through [Elm by Example](http://elm-by-example.org/), which has been a much gentler introduction to the concepts.

[The core documentation](http://package.elm-lang.org/packages/elm-lang/core/1.1.0) is also helpful once you figure out the type system.

Let me know if this helps at all!

#### Entertaining Things I've Found in the Documentation
> Okay, but lets say you just don't care about recommendations and you have a great infix operator. Add them in a separate module. When someone sees an infix operator they are unfamiliar with, they can scan the imports for a Whatever.Infix module and limit the scope of their annoying search for your dumb operator."

&mdash; from [Avoid Infix Operators](http://package.elm-lang.org/help/design-guidelines#avoid-infix-operators)


> Note that tuples with 7 or more elements are not comparable; why are your tuples so big?

&mdash; from [Comparison](http://package.elm-lang.org/packages/elm-lang/core/1.1.0/Basics#comparison)
