import Foundation

public func lcsLength<C: Collection>(first: C, second: C) -> Int where C.Element: Equatable {
    return matrix(first: first, second: second).last?.last ?? -1
}

public func lcs<C: BidirectionalCollection>(first: C, second: C) -> [C.Element] where C.Element: Equatable {
    return backtrack(collection: first, matrix: matrix(first: first, second: second))
}

func matrix<C: Collection>(first: C, second: C) -> [[Int]] where C.Element: Equatable {
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

func backtrack<C: BidirectionalCollection>(collection: C, matrix: [[Int]]) -> [C.Element] where C.Element: Equatable {
    var i = matrix.count - 1
    var j = matrix.first!.count - 1
    
    var sequenceElementIndex = collection.endIndex
    var elements = [C.Element]()
    
    while i >= 1 && j >= 1 {
        if matrix[i][j] == matrix[i][j - 1] {
            j -= 1
        } else if matrix[i][j] == matrix[i - 1][j] {
            i -= 1
            sequenceElementIndex = collection.index(before: sequenceElementIndex)
        } else {
            i -= 1
            j -= 1
            sequenceElementIndex = collection.index(before: sequenceElementIndex)
            elements.append(collection[sequenceElementIndex])
        }
    }
    
    return elements.reversed()
}
