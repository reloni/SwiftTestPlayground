import Foundation

// slow
public func queensAttack(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) -> Int {
    var field = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in obstacles {
        let x = abs(i[0] - n)
        let y = i[1] - 1
        field[x][y] = 1
    }
    
    //print(field)
    let x = abs(r_q - n)
    let y = c_q - 1
    
    var result = 0
    for i in (0..<x).reversed() {
        if field[i][y] == 0 {
            result += 1
        } else {
            break
        }
    }
    
    for i in (x + 1)..<n {
        if field[i][y] == 0 {
            result += 1
        } else {
            break
        }
    }
    
    for i in (0..<y).reversed() {
        if field[x][i] == 0 {
            result += 1
        } else {
            break
        }
    }
    
    for i in (y + 1)..<n {
        if field[x][i] == 0 {
            result += 1
        } else {
            break
        }
    }
    
    var crossX = x - 1
    var crossY = y - 1
    while crossX >= 0 && crossY >= 0 {
        if field[crossX][crossY] == 0 {
            result += 1
        } else {
            break
        }
        crossX -= 1
        crossY -= 1
    }
    
    crossX = x - 1
    crossY = y + 1
    while crossX >= 0 && crossY < n {
        if field[crossX][crossY] == 0 {
            result += 1
        } else {
            break
        }
        crossX -= 1
        crossY += 1
    }
    
    crossX = x + 1
    crossY = y - 1
    while crossX < n && crossY >= 0 {
//        print("x: \(crossX) y: \(crossY)")
        if field[crossX][crossY] == 0 {
            result += 1
        } else {
            break
        }
        crossX += 1
        crossY -= 1
    }
    
    crossX = x + 1
    crossY = y + 1
    while crossX < n && crossY < n {
        //        print("x: \(crossX) y: \(crossY)")
        if field[crossX][crossY] == 0 {
            result += 1
        } else {
            break
        }
        crossX += 1
        crossY += 1
    }
    
    return result
}
