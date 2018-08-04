import Foundation

public func genomicRangeQuery(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    // write your code in Swift 3.0 (Linux)
    var suffixes = Array(repeating: Array(repeating: 0, count: S.count + 1), count: 4)
    
    for char in S.enumerated() {
        let ind = char.offset + 1
        let elem: Int = {
            switch char.element {
            case "A": return 0
            case "C": return 1
            case "G": return 2
            case "T": return 3
            default: fatalError()
            }
        }()
        
        suffixes[elem][ind] += 1
        
        suffixes[0][ind] += suffixes[0][ind - 1]
        suffixes[1][ind] += suffixes[1][ind - 1]
        suffixes[2][ind] += suffixes[2][ind - 1]
        suffixes[3][ind] += suffixes[3][ind - 1]
    }
    
    var results = Array(repeating: 4, count: P.count)
    for i in 0..<P.count {
        let left = P[i]
        let right = Q[i] + 1
        
        for j in 0..<4 {
            if suffixes[j][right] - suffixes[j][left] > 0 {
                results[i] = j + 1
                break
            }
        }
    }
    
    return results
}
