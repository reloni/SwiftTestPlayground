import Foundation

public func brackets (_ S: String) -> Int {
    guard S != "" else { return 0 }
    let stack = Stack<Character>()
    for i in S.characters {
        switch i {
        case "(": stack.push(")")
        case "{": stack.push("}")
        case "[": stack.push("]")
        case let element:
            if let current = stack.pop(), current == element {
                continue
            } else {
                return 0
            }
        }
    }
    return stack.size == 0 ? 1 : 0
}

public class Stack<T> {
    var array = [T]()
    
    func push(_ v: T) {
        array.append(v)
    }
    
    func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T?{
        return array.last
    }
    
    var size: Int {
        return array.count
    }
}
