import Foundation

public func betweenTwoSets(a: [Int], b: [Int]) -> Int {
    /*
     * Write your code here.
     */
    let lcm_a = lcm(a)
    let gcd_b = gcd(b)
    
    var lcm_var = lcm_a
    
    var result = 0
    while lcm_var <= gcd_b {
        if gcd_b % lcm_var == 0 {
            result += 1
        }
        lcm_var += lcm_a
    }
    
    return result
}

