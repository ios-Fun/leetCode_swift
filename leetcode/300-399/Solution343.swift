//
//  Solution343.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 2 <= n <= 58
class Solution343 {
    
    // a. 数学思维，拆分尽可能多的3
    // b. 暴力法 + 记忆化递归
    // c. 动态规划
    func integerBreak(_ n: Int) -> Int {
        if n == 2 {
            return 1
        }
        if n == 3 {
            return 2
        }
        var dp:[Int] = Array.init(repeating: 0, count: n+1)
        dp[1] = 1
        dp[2] = 2
        dp[3] = 3
        for i in 4...n {
            // var max = 0
            for j in 2...(i>>1) {
                dp[i] = max(dp[j] * dp[i-j], dp[i])
            }
        }
        return dp.last!
    }
    
    func test() {
        print(integerBreak(2))
        
        print(integerBreak(10))
        print(integerBreak(11))
        print(integerBreak(12))
    }
    
}

// 10
// 3 * 3 * 4
// 2 * 2 * 2 * 2 * 2  = 32

// 2 3 4 5 6 7  8    9   10  11
// 2 2 4 6 9 12 18   27  36

// 11 = 3 * 3 * 3 * 2 = 54
// 11 = 3 * 4 * 4 =

// 12 = 3 * 3 * 3 * 3 = 81
// 12 =
