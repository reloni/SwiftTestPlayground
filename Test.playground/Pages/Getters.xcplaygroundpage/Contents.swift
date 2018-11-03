//: [Previous](@previous)

import Foundation

struct User {
    let id: Int
    let email: String
}

extension User {
    var isStaff: Bool {
        return self.email.hasSuffix("@pointfree.co")
    }
}

get(\User.id) >>> String.init

let users = [
    User(id: 1, email: "blob@pointfree.co"),
    User(id: 2, email: "protocol.me.maybe@appleco.example"),
    User(id: 3, email: "bee@co.domain"),
    User(id: 4, email: "a.morphism@category.theory")
]

users
    .map(get(\.email))

users
    .filter((!) <<< get(\.isStaff))

func their<Root, Value>(
    _ f: @escaping (Root) -> Value,
    _ g: @escaping (Value, Value) -> Bool
    )
    -> (Root, Root)
    -> Bool {
        
        return { g(f($0), f($1)) }
}

users
    .sorted(by: their(get(\.email), <))

users
    .max(by: their(get(\.email), <))?.email

func their<Root, Value: Comparable>(
    _ f: @escaping (Root) -> Value
    )
    -> (Root, Root)
    -> Bool {
        
        return their(f, <)
}

users
    .max(by: their(get(\.email)))?.email

struct Episode {
    let title: String
    let viewCount: Int
}

let episodes = [
    Episode(title: "Functions", viewCount: 961),
    Episode(title: "Side Effects", viewCount: 841),
    Episode(title: "UIKit Styling with Functions", viewCount: 1089),
    Episode(title: "Algebraic Data Types", viewCount: 729),
]

episodes
    .reduce(0) { $0 + $1.viewCount }

func combining<Root, Value>(
    _ f: @escaping (Root) -> Value,
    by g: @escaping (Value, Value) -> Value
    )
    -> (Value, Root)
    -> Value {
        
        return { value, root in
            g(value, f(root))
        }
}

episodes.reduce(0, combining(get(\.viewCount), by: +))

users.map(^\.id)
users.map(^\.email.count)
users.map(^\.email.count >>> String.init)
users.filter((!) <<< ^\.isStaff)

users.sorted(by: their(^\.email))
users.sorted(by: their(^\.email, >))
users.max(by: their(^\.email.count))?.email
users.min(by: their(^\.email.count))?.email
