import Foundation

// slow
public func queensAttack_slow(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) -> Int {
    var field = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in obstacles {
        let x = abs(i[0] - n)
        let y = i[1] - 1
        field[x][y] = 1
    }
    
    //print(field)
    for i in field {
        print(i)
    }
    let x = abs(r_q - n)
    let y = c_q - 1
    
    print(x)
    print(y)
    
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

// incorrect
public func queensAttack(n: Int, k: Int, r_q: Int, c_q: Int, obstacles: [[Int]]) -> Int {
    guard n > 1 else { return 0 }
    
    let x = abs(r_q - n)
    let y = c_q - 1
    
    var topLeftObs: Int? = nil
    var topObs: Int? = nil
    var topRightObs: Int? = nil
    
    var leftObs: Int? = nil
    var rightObs: Int? = nil
    
    var bottomLeftObs: Int? = nil
    var bottomObs: Int? = nil
    var bottomRightObs: Int? = nil
    
    for i in obstacles {
        let oX = abs(i[0] - n)
        let oY = i[1] - 1
        
        if oX == x {
            if oY < y {
                leftObs = maxOpt(leftObs, b: oY)
            } else if oY > y {
                rightObs = minOpt(rightObs, b: oY)
            }
        } else if oY == y {
            if oX < x {
                topObs = maxOpt(topObs, b: oX)
            } else if oX > x {
                bottomObs = minOpt(bottomObs, b: oX)
            }
        }
        
        if oX - x < 0 && oY - y < 0 && oX - x == oY - y {
            // top left diagonal
            topLeftObs = oY
        }
        
        if oX - x > 0 && oY - y < 0 && abs(oX - x) == abs(oY - y) {
            // bottom left diagonal
            bottomLeftObs = oY
        }
        
        if oX - x < 0 && oY - y > 0 && abs(oX - x) == abs(oY - y) {
            // top right diagonal
            topRightObs = oY
        }
        
        if oX - x > 0 && oY - y > 0 && abs(oX - x) == abs(oY - y) {
            // bottom right diagonal
            bottomRightObs = oY
        }
    }
    
    var result = 0
    
    // top
    result += max(x - ((topObs ?? -1) + 1), 0)
    // bottom
    result += bottomObs == nil ? n - 1 - x : bottomObs! - 1 - x
    // left
    result += max(y - ((leftObs ?? -1) + 1), 0)
    // right
    result += rightObs == nil ? n - 1 - y : rightObs! - 1 - y
    // top left diagonal
    result += topLeftObs == nil ? min(x, y) : max(min(x, y - 1) - (topLeftObs! + 1), 0)
    // bottom left diagonal
    result += bottomLeftObs == nil ? min(n - 1 - x, y) : max(min(n - 1 - x, y) - (bottomLeftObs! + 1), 0)
    // top right diagonal
    result += topRightObs == nil ? min(x, n - y - 1) : max(min(x, n - y - 1) - (n - topRightObs! + 1), 0)
    // bottom right diagonal
    result += bottomRightObs == nil ? min(n - x - 1, n - y - 1) : max(min(n - x - 1, n - y - 1) - (n - bottomRightObs!), 0)
    
    return result
}

private func minOpt(_ a: Int?, b: Int) -> Int {
    guard let a = a else { return b }
    return min(a, b)
}

private func maxOpt(_ a: Int?, b: Int) -> Int {
    guard let a = a else { return b }
    return max(a, b)
}

struct Pair: Hashable {
    let x: Int
    let y: Int
    
    static func == (lhs: Pair, rhs: Pair) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}
