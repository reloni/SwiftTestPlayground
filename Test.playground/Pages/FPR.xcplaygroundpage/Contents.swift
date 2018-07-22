//: [Previous](@previous)

import Foundation

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

55 |> square

