//: [Previous](@previous)

import Foundation
import XCTest

equal(1, brackets("{[()]}"))
equal(0, brackets("{[(])}"))
equal(0, brackets("("))
equal(0, brackets(""))
equal(1, brackets("({}{}){}[()]"))
equal(0, brackets("({}{}){}[{()]"))
