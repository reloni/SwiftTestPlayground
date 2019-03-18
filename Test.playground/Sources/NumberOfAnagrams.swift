import Foundation

func isAnagram<S: StringProtocol>(_ a: S, _ b: S) -> Bool {
    var d1 = [Character: Int]()
    a.forEach {
        d1[$0, default: 0] += 1
    }
    
    var d2 = [Character: Int]()
    b.forEach {
        d2[$0, default: 0] += 1
    }
    
    return d1 == d2
}

public func numberOfAnagrams(in value: String) -> Int {
    let n = value.count
    var I = 1
    var numOfAnagrams = 0
    
    for _ in 0..<(n - 1) {
        for j in 0...(n - I) {
            let str1 = value[value.index(value.startIndex, offsetBy: j)..<value.index(value.startIndex, offsetBy: j + I)]
            let lower = j + 1
            let upper = n - I
            guard lower <= upper else { continue }
            for k in lower...upper {
                let str2 = value[value.index(value.startIndex, offsetBy: k)..<value.index(value.startIndex, offsetBy: k + I)]
                if isAnagram(str1, str2) {
                    numOfAnagrams += 1
                }
            }
        }
        
        I += 1
    }
    
    return numOfAnagrams
}
