import Foundation

public func flipNumber(_ value: Int) -> Int {
    var newVal = 0
    var current = value
    while current > 0 {
        let tmp = current % 10
        newVal *= 10
        newVal += tmp
        current /= 10
    }
    
    return newVal
}
