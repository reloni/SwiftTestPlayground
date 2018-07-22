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
