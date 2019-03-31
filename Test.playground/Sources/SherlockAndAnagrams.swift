import Foundation

func countAnagrams(in value: String) -> Int {
    let chars = Array(value.lowercased())
    var signatures = [String: Int]()
    
    for start in 0..<chars.count {
        for finish in start..<chars.count {
            let slice = chars[start...finish]
            let sig = signature2(from: slice)
            signatures[sig, default: 0] += 1
        }
    }
    
    return signatures.values.reduce(0, { subtotal, next in subtotal + next * (next - 1) / 2 })
}

func signature<C: Collection>(from characters: C) -> [Int] where C.Element == Character {
    var signature = Array(repeating: 0, count: 26)
    
    characters.forEach { char in
        let ascii = Int(char.asciiValue!) - 97
        signature[ascii] += 1
    }
    return signature
}

func signature2<C: Collection>(from characters: C) -> String where C.Element == Character {
    var signature = Array(repeating: 0, count: 26)
    
    characters.forEach { char in
        let ascii = Int(char.asciiValue!) - 97
        signature[ascii] += 1
    }
    return String(signature.map { i in Character(UnicodeScalar(i + 97)!) })
}
