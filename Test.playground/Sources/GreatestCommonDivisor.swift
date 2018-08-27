import Foundation

public func gcd(_ a: Int, _ b: Int) -> Int {
    if a % b == 0 {
        return b
    } else {
        return gcd(b, a % b)
    }
}

public func gcd(_ arr: [Int]) -> Int {
    guard arr.count > 0 else { return 0 }
    guard arr.count > 1 else { return arr[0] }
    var result = arr[0]
    for i in 1..<arr.count {
        result = gcd(result, arr[i])
    }
    return result
}

public func lcm(_ arr: [Int]) -> Int {
    var result = arr[0]
    for i in 1..<arr.count {
        result = (arr[i] * result) / gcd(arr[i], result)
    }
    return result
}

/*
// Returns LCM of array elements
ll findlcm(int arr[], int n)
{
    // Initialize result
    ll ans = arr[0];
    
    // ans contains LCM of arr[0], ..arr[i]
    // after i'th iteration,
    for (int i = 1; i < n; i++)
    ans = (((arr[i] * ans)) /
    (gcd(arr[i], ans)));
    
    return ans;
}
*/
