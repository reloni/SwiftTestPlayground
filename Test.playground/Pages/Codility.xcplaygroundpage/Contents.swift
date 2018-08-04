//: [Previous](@previous)

import Foundation
import XCTest

// Brackets
equal(1, brackets("{[()]}"))
equal(0, brackets("{[(])}"))
equal(0, brackets("("))
equal(0, brackets(""))
equal(1, brackets("({}{}){}[()]"))
equal(0, brackets("({}{}){}[{()]"))


// Fish
equal(2, fish([4, 3, 2, 1, 5], [0, 1, 0, 0, 0]))
equal(2, fish([4, 3, 2, 1, 5, 8], [0, 1, 0, 0, 1, 0]))
equal(1, fish([4], [0]))
equal(1, fish([4], [1]))
equal(0, fish([], []))
equal(1, fish([100, 3, 2, 1, 5, 8], [1, 0, 0, 0, 0, 0]))
equal(1, fish([4, 3,], [1, 0]))
equal(2, fish([1, 9, 8], [1, 1, 0]))
equal(3, fish([2, 1, 9, 8], [0, 1, 1, 0]))
equal(4, fish([1, 3, 2, 1, 9, 8], [1, 0, 0, 1, 1, 0]))


