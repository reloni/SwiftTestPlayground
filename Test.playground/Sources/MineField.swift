import Foundation

public func printField(_ input: [String]) {
    let rows = input.count
    let columns = input[0].count
    
    var matrix = Array(repeating: Array(repeating: 0, count: columns), count: rows)

    for i in 0..<input.count {
        for str in input[i].enumerated() {
            if str.element == "X" {
                matrix[i][str.offset] = -1
            } else {
                matrix[i][str.offset] = 0
            }
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            if matrix[i][j] != -1 {
                matrix[i][j] = minesNear(i, y: j, matrix)
            }
        }
    }
    
    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            let str = matrix[i][j] == -1 ? "X " : "\(matrix[i][j]) "
            print(str, terminator: "")
        }
        print("")
    }
    
}

func minesNear(_ x: Int, y: Int, _ array: [[Int]]) -> Int {
    var count = 0
    if x > 0 {
        if array[x - 1][y] == -1 {
            count += 1
        }
        
        if y > 0 {
            if array[x - 1][y - 1] == -1 {
                count += 1
            }
        }
        
        if y < array[x].count - 1 {
            if array[x - 1][y + 1] == -1 {
                count += 1
            }
        }
    }
    
    if y > 0 {
        if array[x][y - 1] == -1 {
            count += 1
        }
    }
    
    if y < array[x].count - 1 {
        if array[x][y + 1] == -1 {
            count += 1
        }
    }
    
    if x < array.count - 1 {
        if array[x + 1][y] == -1 {
            count += 1
        }
        
        if y > 0 {
            if array[x + 1][y - 1] == -1 {
                count += 1
            }
        }
        
        if y < array[x].count - 1 {
            if array[x + 1][y + 1] == -1 {
                count += 1
            }
        }
    }
    return count
}
