import Foundation

public func peaks(_ A: [Int]) -> Int {
    guard A.count > 2 else { return 0 }
    
    var peakIndexes = [Int]()
    for i in (1..<(A.count - 1)) {
        if A[i - 1] < A[i] && A[i] > A[i + 1] {
            peakIndexes.append(i)
        }
    }
    
    guard peakIndexes.count > 0 else { return 0 }
    
    var maxSlices = peakIndexes.count
    
    for _ in 1...peakIndexes.count {
        if A.count % maxSlices != 0 {
            maxSlices -= 1
            continue
        }
        
        let sliceLength = A.count / maxSlices
        var slicesDetected = 0
        
        for i in peakIndexes {
            if i / sliceLength == slicesDetected {
                slicesDetected += 1
            }
        }
        
        if slicesDetected == maxSlices {
            return slicesDetected
        }
        
        maxSlices -= 1
    }
    
    return maxSlices
}
