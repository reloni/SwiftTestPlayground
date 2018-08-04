import Foundation

public func fish(_ A: [Int], _ B: [Int]) -> Int {
    let fishes = Stack<(Int, Int)>()
    
    for i in (0..<A.count).reversed() {
        //print(fishes.array)
        let size = A[i]
        let direction = B[i]
        
        if let current = fishes.peek() {
            if current.1 == direction {
                fishes.push((size, direction))
            } else {
                let fsh = (size, direction)
                while let backtrack = fishes.peek() {
                    if fsh.1 == 0 && backtrack.1 == 1 {
                        fishes.push(fsh)
                        break
                    } else if backtrack.0 > fsh.0 {
                        break
                    } else {
                        if backtrack.1 == fsh.1 {
                            fishes.push(fsh)
                            break
                        }
                        _ = fishes.pop()
                        if fishes.size == 0 {
                            fishes.push(fsh)
                            break
                        }
                    }
                }
            }
        } else {
            fishes.push((size, direction))
        }
    }

    return fishes.size
}
