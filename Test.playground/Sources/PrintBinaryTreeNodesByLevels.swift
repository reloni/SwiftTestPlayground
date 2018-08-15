import Foundation

public func printBinaryTreeNodesByLevels<T>(_ root: Node<T>) {
    var queue = Queue<Node<T>>()
    queue.enqueue(root)

    while true {
        if queue.count == 0 {
            break
        }

        var elementsCount = queue.count
        while elementsCount > 0 {
            let element = queue.dequeue()!

            print("\(element.value) ", terminator: "")
            
            if let left = element.left {
                queue.enqueue(left)
            }
            
            if let right = element.right {
                queue.enqueue(right)
            }
            
            elementsCount -= 1
        }
        
        print("")
    }
}

public class Node<T> {
    public var value: T
    public var left: Node<T>? = nil
    public var right: Node<T>? = nil
    public init(_ value: T) {
        self.value = value
    }
}

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
}
