import Foundation

public func numberOfDiscIntersections(_ A: [Int]) -> Int {
    var lower = [Int]()
    var upper = [Int]()
    
    for i in 0..<A.count {
        lower.append(i - A[i])
        upper.append(i + A[i])
    }
    
    lower.sort()
    upper.sort()
    
    var intersections = 0
    var lowerIndex = 0
    
    for upperIndex in 0..<A.count {
        while lowerIndex < A.count && upper[upperIndex] >= lower[lowerIndex] {
            intersections += lowerIndex
            intersections -= upperIndex
            lowerIndex += 1
        }
        
        if intersections > 10_000_000 {
            return -1
        }
    }
    
    return intersections
}
