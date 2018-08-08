import Foundation

public func maxProfit(_ A: [Int]) -> Int {
    guard A.count > 1 else { return 0 }
    var left = A[0]
    var diff = 0
    
    for i in (1..<A.count) {
        if A[i] < left {
            left = A[i]
        } else {
            let tmp = abs(A[i] - left)
            if tmp > diff {
                diff = tmp
            }
        }
    }
    
    return diff
}
