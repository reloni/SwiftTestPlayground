//: [Previous](@previous)

import Foundation

func property<Object, Value> (_ kp: WritableKeyPath<Object, Value>) -> (@escaping (Value) -> Value) -> (Object) -> Object {
    return { value in
        return { object in
            var copy = object
            copy[keyPath: kp] = value(copy[keyPath: kp])
            return copy
        }
    }
}

infix operator .~: ForwardComposition
public func .~ <Object, Value>(_ kp: WritableKeyPath<Object, Value>, _ v: Value) -> (Object) -> Object {
    return (property(kp)) { _ in v }
}

struct Person {
    var firstName: String
    var age: Int
}

let p1 = Person(firstName: "John", age: 43)
let prop = (property(\Person.age)) { _ in 55 }
dump(prop(p1))

let p2 = Person(firstName: "", age: 22)
    |> (property(\Person.age)) { _ in 55 }
    |> (property(\Person.firstName)) { _ in "Test user" }
dump(p2)

let dateFormatter = DateFormatter()
    |> (property(\.dateFormat)) { _ in "yyyy-MM-dd HH:mm" }
    |> (property(\.timeZone)) { _ in TimeZone(secondsFromGMT: 0) }
    |> (property(\.locale)) { _ in Locale(identifier: "en_US_POSIX") }
Date() |> dateFormatter.string

let dateOnlyFormatter = DateFormatter()
    |> \.dateFormat .~ "yyyy-MM-dd"
    |> \.timeZone .~ TimeZone(secondsFromGMT: 0)
    |> \.locale .~ Locale(identifier: "en_US_POSIX")
Date() |> dateOnlyFormatter.string

let timeOnlyFormatter =
    (property(\DateFormatter.dateFormat)) { _ in "HH:mm" }
    <> (property(\.timeZone)) { _ in TimeZone(secondsFromGMT: 60 * 60 * 2) }
    <> (property(\.locale)) { _ in Locale(identifier: "en_US_POSIX") }
Date() |> timeOnlyFormatter(DateFormatter()).string
