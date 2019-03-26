import Foundation

public func lcsLength<Element: Equatable>(first: [Element], second: [Element]) -> Int {    
    return matrix(first: first, second: second).last?.last ?? -1
}

func matrix<Element: Equatable>(first: [Element], second: [Element]) -> [[Int]] {
    var matrix = Array(repeating: Array(repeating: 0, count: second.count + 1), count: first.count + 1)
    
    for f in first.enumerated() {
        for s in second.enumerated() {
            if f.element == s.element {
                matrix[f.offset + 1][s.offset + 1] = matrix[f.offset][s.offset] + 1
            } else {
                matrix[f.offset + 1][s.offset + 1] = max(matrix[f.offset][s.offset + 1], matrix[f.offset + 1][s.offset])
            }
        }
    }
    
    return matrix
}
