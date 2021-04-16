//
//  Solution123.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/7.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution123 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        let list3:[Int] = Array.init(repeating: 0, count: 3)
        let list2:[[Int]] = Array.init(repeating: list3, count: 2)
        var dp:[[[Int]]] = Array.init(repeating: list2, count: prices.count)
        let count = prices.count
        dp[0][0][1] = Int.min
        dp[0][0][2] = Int.min
        dp[0][1][0] = -prices[0]
        dp[0][1][1] = Int.min
        dp[0][1][2] = Int.min
        for i in 1..<count {
            dp[i][0][0] = 0
            dp[i][0][1] = max(dp[i-1][1][0] + prices[i], dp[i-1][0][1])
            dp[i][0][2] = max(dp[i-1][1][1] + prices[i], dp[i-1][0][2])
            dp[i][1][0] = max(dp[i-1][1][0], dp[i-1][0][0] - prices[i])
            
            // 当前持有，卖出过一次
            dp[i][1][1] = max(dp[i-1][1][1], dp[i-1][0][1] == Int.min ? Int.min :  dp[i-1][0][1] - prices[i])
            dp[i][1][2] = Int.min
        }
        return max(dp.last![0][0], dp.last![0][1], dp.last![0][2])
    }
    
    func test() {
        print(maxProfit([6,1,3,2,4,7]))
        // 7
        
        print(maxProfit([7,6,4,3,1]))
        // 0
        
        print(maxProfit([3,3,5,0,0,3,1,4]))
        // 6
        
        print(maxProfit([1,2,3,4,5]))
        // 4
    }
}

// 3，3 ，5，0，0，3，1， 4

// 1， 2， 3，4， 5

// 状态 买入1，买入2， 卖出，

// 第i天，状态 j  0--不持有，1 -- 买入 一次， 2-- 买入二次 ,
// dp[i][j]

// dp[1][0] -- 第一天不持有 = max(dp[0][0], dp[0][1], dp[0][2])
// dp[1][1] -- 第一天持有一次 = max(dp[0][0]
// dp[1][2] -- 第一天持有两次 = max(dp[0][0]

// dp[i][0][0] -- 未持股，未卖出股票
//            = 0
// dp[i][0][1] -- 未持股，卖出过1次股票(昨天持股了 ｜ 昨天没持股)
//            = max(dp[i-1][1][0] + prices[i], dp[i-1][0][1]
// dp[i][0][2] -- 未持股，卖出过2次股票（昨天持股了 ｜ 昨天没持股）
//            = max(dp[i-1][1][1] + prices[i], dp[i-1][0][2]
// dp[i][1][0] -- 持股，未卖出股票(昨天持股，昨天未持股)
//            = max(dp[i-1][1][0], dp[i-1][0][0] - price[i])
// dp[i][1][1] -- 持股，卖出过1次股票 (昨天持股，昨天未持股)
//            = max(dp[i-1][1][1],dp[i-1][0][1]-price[i]
// dp[i][1][2] -- 持股，卖出过2次股票，不存在

//   6,           1,          3,            2,            4,           7
//0  [0,inf,inf] [0,-5,inf] [0,2,-3]
//1 [-6,inf,inf] [-1,-6,inf]
