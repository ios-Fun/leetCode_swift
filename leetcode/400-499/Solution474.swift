//
//  Solution474.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/12.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划 -- 状态转移方程
// 动态规划加递归
class Solution474 {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m+1), count: n+1)
        // var dp2:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m+1), count: n+1)
        for item in strs {
            var zeroCount = 0
            var oneCount = 0
            for charItem in Array(item) {
                if charItem == "0" {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            }
            if zeroCount <= m && oneCount <= n {
                for i in (oneCount...n).reversed() {
                    for j in (zeroCount...m).reversed(){
                        dp[i][j] = max(dp[i][j], 1 + dp[i - oneCount][j - zeroCount])
                    }
                }
            } else {
                continue
            }
        }
        return dp[n][m]
    }
    
    func test() {
        print(findMaxForm(["10", "0001", "111001", "1", "0"], 5, 3))
        print(findMaxForm(["10", "0", "1"], 1, 1))
    }
}


// m = 5 ,n  = 3

// 0, 1  选中，在剩下数组中， dp[5][3] = dp[5][2] + 1, 未选中，在剩下的数组中 dp[5][3]
// 1, 0,
// 1, 1
// 2, 4
// 3, 1

// 数组操作麻烦


// d[m][n]

// 1, 0
// 0, 1
// 1, 1

// dp[1][1] = max(dp[1][1], dp[0][0] + 1)
