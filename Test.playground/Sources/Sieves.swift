import Foundation

public func sieveOfSundaram(n: Int) -> [Int] {
    let numberOfPrimes = (n - 2) / 2
    var results = Array.init(repeating: false, count: numberOfPrimes + 1)
    for i in 1...numberOfPrimes {
        var j = i
        while i + j + 2 * i * j <= numberOfPrimes {
            results[i + j + 2 * i * j] = true
            j += 1
        }
    }
    
    return [2] + (1...numberOfPrimes).compactMap { index -> Int? in
        if !results[index] {
            return 2 * index + 1
        } else {
            return nil
        }
    }
}

public func easySieve(n: Int) -> [Int] {
    return [1] + eSieve(numbers: Array(2..<n))
}

private func eSieve(numbers: [Int]) -> [Int] {
    guard !numbers.isEmpty else { return [] }
    let p = numbers[0]
    let rest = numbers[1..<numbers.count]
    return [p] + eSieve(numbers: rest.filter { $0 % p > 0 })
}
