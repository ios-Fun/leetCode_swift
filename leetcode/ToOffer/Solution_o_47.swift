//
//  Solution47.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution_o_47 {
    //  采用二维数据
    func maxValue(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 0 {
            return 0
        }
        let m = grid.last!.count
        if m == 0 {
            return 0
        }
        
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: m), count: n)
        dp[0][0] = grid[0][0]
        for i in 1..<m {
            dp[0][i] = grid[0][i] + dp[0][i-1]
        }
        for i in 1..<n {
            dp[i][0] = grid[i][0] + dp[i-1][0]
        }
        for i in 1..<n {
            for j in 1..<m{
                dp[i][j] = max(dp[i-1][j], dp[i][j-1]) + grid[i][j]
            }
        }
 
        return dp[n-1][m-1]
    }
    
    // 采用一维数组
    func maxValue2(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if n == 0 {
            return 0
        }
        let m = grid.last!.count
        if m == 0 {
            return 0
        }
        var dp:[Int] = Array.init(repeating: 0, count: m)
        dp[0] = grid[0][0]
        for i in 1..<m {
            dp[i] = grid[0][i] + dp[i-1]
        }
        
        for i in 1..<n {
            for j in 0..<m{
                if j == 0 {
                    dp[j] = dp[0] + grid[i][j]
                }else {
                    dp[j] = max(dp[i-1], dp[j]) + grid[i][j]
                }
            }
        }
        
        return dp.last!
    }
    
    // TODO: 递归
    
    func test() {
        print(maxValue2([
          [1,3,1],
          [1,5,1],
          [4,2,1]
        ]))
    }
    
    // 1, 4, 5
    // 2, 9, 10
    // 6, 11,12
}
