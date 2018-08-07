import Foundation

public func maxSlice(_ array: [Int]) -> Int {
    var maxEnding = 0
    var maxSlice = 0
    for i in array {
        maxEnding = max(0, maxEnding + i)
        maxSlice = max(maxSlice, maxEnding)
    }
    return maxSlice
}
