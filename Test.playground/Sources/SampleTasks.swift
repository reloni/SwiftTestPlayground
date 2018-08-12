import Foundation

public func task1(_ A: inout [Int], _ B: inout [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    for i in 0..<A.count {
        if A[i] < B[i] {
            A[i] = B[i]
        }
    }
    
    let sorted = A.sorted()
    var smallest = sorted[0]
    for i in 1..<sorted.count {
        if sorted[i] < smallest {
            smallest = sorted[i]
        } else {
            if sorted[i] - smallest > 1 {
                return smallest + 1
            }
            smallest = sorted[i]
        }
    }
    
    return smallest + 1
}

func task2(_ T : inout [Int]) -> [Int] {
    var connections = Array(repeating: [Int](), count: T.count)
    var capital = 0
    
    for i in 0..<T.count {
        if i == T[i] {
            capital = i
        } else {
            connections[T[i]].append(i)
        }
    }
    
    var results = Array(repeating: 0, count: T.count)
    countDistances(&results, connections: connections, currentIndex: capital, arrayPosition: 0)
    
    return results
}

func countDistances(_ array: inout [Int], connections: [[Int]], currentIndex: Int, arrayPosition: Int) {
    array[arrayPosition] += connections[currentIndex].count
    for i in connections[currentIndex] {
        countDistances(&array, connections: connections, currentIndex: i, arrayPosition: arrayPosition + 1)
    }
}
