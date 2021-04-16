//
//  Solution309.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 二维数组（天数，状态）
class Solution309 {
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        // 0--不持 1--持股 2--冷冻期
        let statusArray:[Int] = Array.init(repeating: 0, count: 3)
        var dp:[[Int]] = Array.init(repeating: statusArray, count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        dp[0][2] = 0
        for i in 1..<prices.count {
            // 不持有股票的前一天（不持有股票。冷冻期）
            dp[i][0] = max(dp[i-1][0], dp[i-1][2])
            
            // 持股的前一天（前一天不持股-今天的股价，前一天的持股）
            dp[i][1] = max(dp[i-1][0] - prices[i], dp[i-1][1])
            dp[i][2] = dp[i-1][1] + prices[i]
        }
        return max(dp[prices.count-1][0], dp[prices.count-1][2])
    }
    
    
    func maxProfit2(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var dp:[Int] = Array.init(repeating: 0, count: prices.count)
        
        var minValue = prices[0]
        var minIndex = 0
        for i in 1..<prices.count {
            if prices[i] < prices[i-1] {
                if i > minIndex + 2 {
                    minIndex = i
                    minValue = prices[i]
                }
            }
            if prices[i] <= minValue {
                minValue = prices[i]
                minIndex = i
            }
            
            if prices[i] <= prices[i-1] {
                dp[i] = dp[i-1]
            }else {
                
                var value = (prices[i] - minValue)
                if minIndex >= 3 {
                    value = value + dp[minIndex-2]
                }
                
                dp[i] = max(dp[i-1], value )
            }
        }
        return dp[prices.count-1]
    }
    
    func test() {
        
        print(maxProfit([1,2,7,3,11]))
        // 10

        print(maxProfit([1,2,7,4,11]))
        // 10

        print(maxProfit([3,3,5,0,0,3,1,4]))
        // 6

        print(maxProfit([2,1,4, 0, -3,2,9,7]))
        // 15

        print(maxProfit([2,1,4,5,2,9,7]))
        // 10

        print(maxProfit([6,1,3,2,4,7]))
        // 6

        print(maxProfit([1,2,3,0,2]))
        //  3
        
    }
}

// 6 1 3 2 4 7

// 0

// 0 0 2 2
