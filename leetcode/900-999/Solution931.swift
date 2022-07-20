//
//  Solution931.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/3.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// dfs + 记忆化
// 动态规划
class Solution931 {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        let n = matrix.count
        // var dp:[[Int]] = Array.init(repeating: Array.init(repeating: Int.max, count: n), count: n)
        var dp = Array.init(repeating: Int.max, count: n)
        for i in 0..<n {
            dp[i] = matrix[n-1][i]
        }
        for i in (0..<(n-1)).reversed() {
            var newdp = Array.init(repeating: Int.max, count: n)
            for j in 0..<n {
                if j == 0 {
                    newdp[j] = matrix[i][j] + min(dp[j], dp[j+1])
                } else if j == n - 1 {
                    newdp[j] = matrix[i][j] + min(dp[j-1], dp[j])
                } else {
                    newdp[j] = matrix[i][j] + min(dp[j-1], min(dp[j], dp[j+1]))
                }
            }
            dp = newdp
        }
        var minValue = Int.max
        for value in dp {
            minValue = min(minValue, value)
        }
        return minValue
    }
    
    func test() {
        print(minFallingPathSum([[-80,-13,22],[83,94,-5],[73,-48,61]]))
        print(minFallingPathSum([[2,1,3],[6,5,4],[7,8,9]]))
        print(minFallingPathSum([[-19,57],[-40,-5]]))
    }
}
