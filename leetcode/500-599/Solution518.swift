//
//  Solution518.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution518 {
    // 动态规划 todo
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp:[Int] = Array.init(repeating: 0, count: amount+1)
        dp[0] = 1
        for i in 1...amount {       // 金额枚举
            for coin in coins {
                if i < coin {
                    continue
                }
                dp[i] = dp[i] + dp[i - coin]
            }
        }
        return dp[amount]
    }
    
    func test() {
        print(change(5, [1, 2, 5]))
        print(change(3, [2]))
    }
}
// 1  1
// 2  1 + 1
// 3  dp[2] + dp[1]
// 4
// 5
