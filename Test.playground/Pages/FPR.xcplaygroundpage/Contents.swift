//: [Previous](@previous)

import Foundation

precedencegroup ForwardApplication {
    associativity: left
}

infix operator |>: ForwardApplication
func |> <A, B>(a: A, f: (A) -> B) -> B {
    return f(a)
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}
infix operator >>>: ForwardComposition
func >>> <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> ((A) -> C) {
    return { input in
        return g(f(input))
    }
}

func square<T: Numeric>(_ value: T) -> T {
    return value * value
}

func increment<T: Numeric>(_ value: T) -> T {
    return value + 1
}

2 |> square |> increment
2 |> increment |> square

(increment >>> square)(2)

2 |> square >>> increment >>> String.init

[1, 2, 3, 4, 5].map(square >>> increment >>> String.init)

//2 |> increment |> square


