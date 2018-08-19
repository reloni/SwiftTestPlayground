import Foundation

public func binaryGap(_ value: Int) -> Int {
    print(String(value, radix: 2, uppercase: false))
    var n = value
    while n > 0 && n % 2 == 0 {
        n /= 2
    }
    
    var maxGap = 0
    var currentGap = 0
    while n > 0 {
        n /= 2
        
        if n % 2 == 0 {
            currentGap += 1
        } else {
            if currentGap > maxGap {
                maxGap = currentGap
            }
            currentGap = 0
        }
    }
    
    return maxGap
}
