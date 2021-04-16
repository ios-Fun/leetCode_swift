//
//  Solution746.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution746 {
    // 动态规划
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp:[Int] = Array.init(repeating: 0, count: cost.count)
        dp[0] = 0
        dp[1] = min(cost[0], cost[1])
        for i in 2..<cost.count {
            dp[i] = min(dp[i-2] + cost[i-1], dp[i-1] + cost[i])
        }
        return dp.last!
    }
    
    func test() {
        // print(minCostClimbingStairs([10, 15, 20]))
        
        print(minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]))
    }
}

// 1,100, 2,3,3,103,4,5,
