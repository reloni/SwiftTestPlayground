import Foundation

public func bfs(n: Int, m: Int, edges: [[Int]], s: Int) -> [Int] {
    let nodes = (1...n).map(BNode.init(name:))
    var nodeEdges = (1...n).map { _ in Set<Int>() }
    
    for edge in edges {
        let left = edge[0] - 1
        let right = edge[1] - 1
        nodeEdges[left].insert(right)
        nodeEdges[right].insert(left)
    }
    
    var queue = Queue<(node: BNode, level: Int)>()
    
    var traversed = Set<Int>()
    nodeEdges[s - 1].forEach {
        queue.enqueue((node: nodes[$0], level: 1))
        traversed.insert($0)
    }
    
    var result = Array(repeating: -1, count: n)
    
    while let val = queue.dequeue() {
        print("current: \(val.node.name). Level: \(val.level)")
        result[val.node.name - 1] = val.level * 6
        nodeEdges[val.node.name - 1].forEach {
            guard !traversed.contains($0) else { return }
            queue.enqueue((node: nodes[$0], level: val.level + 1))
            traversed.insert($0)
        }
    }
    
    result.remove(at: s - 1)
    return result
}

class BNode: CustomDebugStringConvertible, Hashable {
    static func == (lhs: BNode, rhs: BNode) -> Bool {
        return lhs.name == rhs.name
    }
    
    public var hashValue: Int { return name.hashValue }
    
    var debugDescription: String {
        return "Name: \(name)"
    }
    
    let name: Int
    
    init(name: Int) {
        self.name = name
    }
}
