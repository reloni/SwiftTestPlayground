import Foundation

public func numberOfCarryOperations(_ a: Int, _ b: Int) -> Int {
    var left = a
    var right = b
    
    var carryCount = 0
    
    var carred = 0
    while left > 0 || right > 0 {
        let l = left % 10
        let r =  right % 10
        
        let result = l + r + carred
        
        if result >= 10 {
            carred = 1
            carryCount += 1
        } else {
            carred = 0
        }
        
        left /= 10
        right /= 10
    }
    
    return carryCount
}
