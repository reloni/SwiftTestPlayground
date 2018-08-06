import Foundation

public func dominator(_ A: [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var size = 0
    var candidate = -1
    var candidateIndex = -1
    
    for i in 0..<A.count {
        if size == 0 {
            size += 1
            candidate = A[i]
            candidateIndex = i
        } else {
            if candidate == A[i] {
                size += 1
            } else {
                size -= 1
            }
        }
    }
    
    if size <= 0 {
        return -1
    }
    
    var count = 0
    
    A.forEach { i in
        if i == candidate {
            count += 1
        }
    }
    
    if count > A.count / 2 {
        return candidateIndex
    }
    
    return -1
}
