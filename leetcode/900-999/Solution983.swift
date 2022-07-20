//
//  Solution983.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/4.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution983 {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        // let maxCost = costs.last!
        var dp = Array.init(repeating: Array.init(repeating: 0, count: 31), count: days.count+1)
        for day in days {
//            dp[day][1] = dp[day-1][1] + costs[0]
//            if day <= 7 {
//                dp[day][7] = dp[day-7][1] + costs[1]
//            }
//            if day <
        }
        return 0
    }
    
    func test() {
        
    }
}
