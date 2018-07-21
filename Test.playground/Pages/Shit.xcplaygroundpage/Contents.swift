//: [Previous](@previous)

import Foundation

enum SomeData<A, B> {
    case some1(A)
    case some2(B)
}

func testFunc<B>(_ value: SomeData<Never, B>) {
    switch value {
    case .some2(let b): print(b)
    }
}

testFunc(.some2(2))
//: [Next](@next)
