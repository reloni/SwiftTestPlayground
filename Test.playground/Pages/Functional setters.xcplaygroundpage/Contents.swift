//: [Previous](@previous)

import Foundation

func incr(_ a: Int) -> Int {
    return a + 1
}

let pair = (42, "Swift")

func incrFirst<A>(_ pair: (Int, A)) -> (Int, A) {
    return (incr(pair.0), pair.1)
}

func first<A, B, C>(_ f: @escaping (A) -> C) -> ((A, B)) -> (C, B) {
    return { pair in
        return (f(pair.0), pair.1)
    }
}

func second<A, B, C>(_ f: @escaping (B) -> C) -> ((A, B)) -> (A, C) {
    return { pair in
        return (pair.0, f(pair.1))
    }
}

pair
    |> first(incr)
    |> first(String.init)
    |> second { $0.uppercased() }

let transform = first(incr)
    <> second { $0 + "!!!!O_o" }

pair |> transform

pair
    |> first(incr) >>> first(String.init)

pair
    |> second { $0.uppercased() }

let nested = ((1, true), "Swift")
nested
    |> (second >>> first) { !$0 }

nested
    |> (first <<< second) { !$0 }

nested
    |> second { $0.uppercased() }

(42, ["Swift", "Objective-C"])
    |> (second <<< map) { $0 + "!" }

dump(
    [(42, ["Swift", "Objective-C"]), (1729, ["Haskell", "PureScript"])]
        |> (map <<< second <<< map) { $0 + "!" }
)
