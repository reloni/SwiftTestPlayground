import Foundation

public func lcsLength<Element: Equatable>(first: [Element], second: [Element]) -> Int {    
    return matrix(first: first, second: second).last?.last ?? -1
}

public func lcs<Element: Equatable>(first: [Element], second: [Element]) -> [Element] {
    return backtrack(sequence: first, matrix: matrix(first: first, second: second))
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

func backtrack<Element: Equatable>(sequence: [Element], matrix: [[Int]]) -> [Element] {
    var i = matrix.count - 1
    var j = matrix.first!.count - 1
    
    var sequenceElementIndex = sequence.count
    var elements = [Element]()
    
    while i >= 1 && j >= 1 {
        if matrix[i][j] == matrix[i][j - 1] {
            j -= 1
        } else if matrix[i][j] == matrix[i - 1][j] {
            i -= 1
            sequenceElementIndex -= 1
        } else {
            i -= 1
            j -= 1
            sequenceElementIndex -= 1
            elements.append(sequence[sequenceElementIndex])
        }
    }
    
    return elements.reversed()
}
