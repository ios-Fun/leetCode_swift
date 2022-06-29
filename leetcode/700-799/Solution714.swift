//
//  Solution714.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/19.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划 - 好题目
class Solution714 {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp1: [Int] = Array.init(repeating: 0, count: n)  // 持有时的第i天最大收益
        var dp2: [Int] = Array.init(repeating: 0, count: n)    // 不持有的i天最大收益
        dp1[0] = -prices[0]
        for i in 1..<n {
            // 持有
            dp1[i] = max(dp1[i-1], dp2[i-1] - prices[i])
            dp2[i] = max(dp2[i-1], dp1[i-1] + prices[i] - fee)
        }
        return dp2[n-1]
    }
    
    func test() {
        print(maxProfit([1, 3, 2, 8, 4, 9], 2))
        
        print(maxProfit([1,3,7,5,10,3], 3))
    }
}

// 两种状态，持有， 不持有
