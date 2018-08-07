import Foundation

public func maxDoubleSliceSum(_ A: [Int]) -> Int {
    guard A.count > 3 else { return 0 }
    
    var startings = Array.init(repeating: 0, count: A.count)
    var endings = Array.init(repeating: 0, count: A.count)
    
    for i in 1..<(A.count - 1) {
        endings[i] = max(0, endings[i - 1] + A[i])
        startings[A.count - 1 - i] = max(0, startings[A.count - i] + A[A.count - 1 - i])
    }
    
    var result = 0
    for i in 1..<(A.count - 1) {
        result = max(result, endings[i - 1] + startings[i + 1])
    }
    
    return result
}
