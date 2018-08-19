import Foundation

public func commonPrimeDivisors(_ A: [Int], _ B: [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var count = 0
    for (a, b) in zip(A, B) {
        if hasCommonPrimeDivisors(a, b) {
            count += 1
        }
    }
    
    return count
}

func hasCommonPrimeDivisors(_ a: Int, _ b: Int) -> Bool {
    // The gcd contains all
    // the common prime divisors
    let commonGcd = gcd(a, b)
    guard removeCommonPrimeDivisors(a, commonGcd) == 1 else {
        // If a and b have exactly the same common
        // prime divisors, a must be composed by
        // the prime divisors in commonGcd. So
        // after previous loop, result must be one.
        return false
    }
    
    return removeCommonPrimeDivisors(b, commonGcd) == 1
}

func removeCommonPrimeDivisors(_ a: Int, _ b: Int) -> Int {
    var localA = a
    
    while localA != 1 {
        let localGcd = gcd(localA, b)
        // a does not contain any more
        // common prime divisors
        if localGcd == 1 {
            break
        }
        
        localA /= localGcd
    }
    
    return localA
}
