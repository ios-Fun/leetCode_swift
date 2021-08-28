//
//  Solution518.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution518 {
    // 动态规划
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var dp:[Int] = Array.init(repeating: 0, count: amount+1)
        dp[0] = 1
        
        for coin in coins {
            if amount < coin {
                break
            }
            for i in coin...amount {
                dp[i] += dp[i-coin]
            }
        }
        return dp[amount]
    }
    
    func test() {
        print(change(0, [7]))
//        print(change(5, [1, 2, 5]))
//        print(change(3, [2]))
    }
}
