import Foundation

public func minMissingPositive(_ array: inout [Int]) -> Int {
    let shift = segregate(&array)
    var values = Array(repeating: 0, count: array.count - shift)
    
    for i in (shift..<(array.count)) {
        if array[i] < array.count - shift {
            values[array[i] - 1] = -1
        }
    }
    
    return (values.enumerated().first(where: { $0.element == 0 })?.offset ?? 0) + 1
}

public func segregate(_ array: inout [Int]) -> Int {
    var j = 0
    for i in 0..<array.count {
        if array[i] <= 0 {
            array.swapAt(i, j)
            j += 1
        }
    }
    
    return j
}
