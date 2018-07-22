//: [Previous](@previous)

import Foundation

func print(date: Date, text: String) -> String {
    return "\(date.timeIntervalSince1970) \(text)"
}

print(date: Date(), text: "Some text")

//func curry<A, B, C>(_ f: @escaping (A, B) -> C) -> (A) -> (B) -> C {
//    return { a in
//        return { b in
//            return f(a, b)
//        }
//    }
//}

let newPrint = curry(print)(Date())

newPrint("Text 1")
newPrint("Text 2")

let newStr1 = curry(String.init(data:encoding:))

let data = "Some data".data(using: .utf8)!
newStr1(data)(.utf8)

let newStr2 = flip(curry(String.init(data:encoding:)))(.utf8)
newStr2(data)

func flip<A, C>(_ f: @escaping (A) -> () -> C) -> () -> (A) -> C {
    return {
        return { a in
            return f(a)()
        }
    }
}

let upper = flip(String.uppercased)
upper()("Some")

let upper2 = zurry(flip(String.uppercased))
upper2("some text")
