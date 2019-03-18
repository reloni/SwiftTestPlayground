//: [Previous](@previous)

import Foundation

sieveOfSundaram(n: 100)


//easySieve(n: 10)
//sieveOfSundaram(n: 10)

//maxSlice([5, -7, 3, 5, -2, 4, -1])
//maxSlice([-7, 3, 5, -2, 4])
//maxSlice([6, -7, 3, 5, -2, 9, 7])
//maxSlice([-7, 3, 5, -2, 9])
//maxSlice([-7, -3, -5, -2, -9])


//equal(356, maxProfit([23171, 21011, 21123, 21366, 21013, 21367]))
//equal(0, maxProfit([1]))
//equal(0, maxProfit([2, 1]))
//equal(8, maxProfit([5, 9, 2, 10]))
//equal(10, maxProfit([5, 15, 2, 12]))
//equal(5, maxProfit([3, 2, 3, 5, 7, 1]))

//equal(17, maxDoubleSliceSum([3, 2, 6, -1, 4, 5, -1, 2]))
//equal(0, maxDoubleSliceSum([10000, 1, 999999999]))
//equal(0, maxDoubleSliceSum([10000]))
//equal(3, maxDoubleSliceSum([10000, 1, 3, 99999]))
//equal(22, maxDoubleSliceSum([10000, 1, 7, 8, 4, 3, 99999]))
//equal(15, maxDoubleSliceSum([10000, -1, -7, 8, 4, 3, 99999]))
//equal(9, maxDoubleSliceSum([10000, 1, -7, 8, -4, -3, 99999]))
//

//equal(1, peaks([1, 2, 3, 2, 2, 3, 1]))
//equal(2, peaks([1, 2, 3, 2, 4, 3]))
//equal(0, peaks([1]))
//equal(0, peaks([1, 2, 3, 4, 5, 6, 7]))
//equal(1, peaks([1, 2, 1]))
//equal(4, peaks([1, 2, 1, 2, 2, 5, 2, 4, 2, 4, 3, 2]))
//equal(1, peaks([1, 2, 1, 2, 2, 5, 2, 4, 2, 4, 3, 2, 1]))
//equal(2, peaks([1, 2, 1, 2, 2, 5, 2, 4, 2, 4, 3, 2, 1, 1]))

//
//let root = Node(1)
//root.left = Node(2)
//root.right = Node(3)
//root.left?.left = Node(4)
//root.right?.right = Node(5)
//root.right?.right?.left = Node(6)
//root.right?.right?.left?.right = Node(7)
//
//printBinaryTreeNodesByLevels(root)
//
//gcd(15, 75)

//commonPrimeDivisors([15, 10, 3], [75, 30, 5])

//var a = [1, 2, -2, 0, -1, 5, 2, 6, 5, -1]
//equal(3, minMissingPositive(&a))


//flipNumber(14)
//flipNumber(14234)
//flipNumber(1)

//equal(5, binaryGap(1041))
//equal(1, binaryGap(5))
//equal(2, binaryGap(18))
//equal(2, binaryGap(9))
//

//printField(["XOOXXXOO", "OOOOXOXX", "XXOXXOOO", "OXOOOXXX", "OOXXXXOX", "XOXXXOXO", "OOOXOXOX", "XOXXOXOX"])

//equal(252, lcm([2, 7, 3, 9, 4]))
//equal(3, betweenTwoSets(a: [2, 4], b: [16, 32, 96]))

//queensAttack2(n: 100, k: 100, r_q: 48, c_q: 81, obstacles: [[5, 5], [4, 2], [2, 3]])

let obs =
[
[54, 87],
[64,97],
[42, 75],
[32, 65],
[42, 87],
[32, 97],
[54, 75],
[64, 65],
[48, 87],
[48, 75],
[54, 81],
[42, 81],
[45, 17],
[14, 24],
[35, 15],
[95, 64],
[63, 87],
[25, 72],
[71, 38],
[96, 97],
[16, 30],
[60, 34],
[31, 67],
[26, 82],
[20, 93],
[81, 38],
[51, 94],
[75, 41],
[79, 84],
[79, 65],
[76, 80],
[52, 87],
[81, 54],
[89, 52],
[20, 31],
[10, 41],
[32, 73],
[83, 98],
[87, 61],
[82, 52],
[80, 64],
[82, 46],
[49, 21],
[73, 86],
[37, 70],
[43, 12],
[94, 28],
[10, 93],
[52, 25],
[50, 61],
[52, 68],
[52, 23],
[60, 91],
[79, 17],
[93, 82],
[12, 18],
[75, 64],
[69, 69],
[94, 74],
[61, 61],
[46, 57],
[67, 45],
[96, 64],
[83, 89],
[58, 87],
[76, 53],
[79, 21],
[94, 70],
[16, 10],
[50, 82],
[92, 20],
[40, 51],
[49, 28],
[51, 82],
[35, 16],
[15, 86],
[78, 89],
[41,98],
[70, 46],
[79, 79],
[24, 40],
[91, 13],
[59, 73],
[35, 32],
[40, 31],
[14, 31],
[71, 35],
[96, 18],
[27, 39],
[28, 38],
[41, 36],
[31, 63],
[52, 48],
[81, 25],
[49, 90],
[32, 65],
[25, 45],
[63, 94],
[89, 50],
[43, 41],
]

//queensAttack(n: 100, k: 100, r_q: 48, c_q: 81, obstacles: obs)

//equal([6, -1, -1, -1, -1, -1, 12, -1, 12], bfs(n: 10, m: 6, edges: [[3, 1], [10, 1], [10, 1], [3, 1], [1, 8], [5, 2]], s: 3))


let a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 }
let s = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 })

"".lowercased()


let f = [Int: Int]()

numberOfAnagrams(in: "abba")

