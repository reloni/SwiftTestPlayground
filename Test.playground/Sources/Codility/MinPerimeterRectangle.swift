import Foundation

public func minPerimeterRectangle(_ N: Int) -> Int {
    // write your code in Swift 3.0 (Linux)
    guard N > 1 else { return 4 }
    
    var i = 1
    var divisor = 0
    while i * i < N {
        if N % i == 0 {
            divisor = i
        }
        i += 1
    }
    if i * i == N {
        divisor = i
    }
    
    return 2 * (divisor + (N / divisor))
}
