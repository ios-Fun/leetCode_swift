//
//  Solution576.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/2.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

//1. dfs
//2. 动态规划
class Solution576 {
    
    // 状态方程不对
    func findPaths2(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        var dp = Array.init(repeating: Array.init(repeating: 0, count: n+2), count: m+2)
        dp[startRow+1][startColumn+1] = 1
        for _ in 1...maxMove {
            var list:[[Int]] = []
            for i in 1...m {
                for j in 1...n {
                    if dp[i][j] != 0 {
                        list.append([i, j])
                    }
                }
            }
            for item in list {
                let x = item[0]
                let y = item[1]
                dp[x-1][y] += dp[x][y]
                dp[x+1][y] += dp[x][y]
                dp[x][y-1] += dp[x][y]
                dp[x][y+1] += dp[x][y]
                dp[x][y] -= 1
            }
        }
        var sum1 = 0
        var sum2 = 0
        for i in 1...m {
            sum1 = sum1 + dp[i][0] + dp[i][n+1]
        }
        for j in 1...n {
            sum2 = sum2 + dp[0][j] + dp[m+1][j]
        }
        return sum1 + sum2
    }
    
    
    func findPaths(_ m: Int, _ n: Int, _ maxMove: Int, _ startRow: Int, _ startColumn: Int) -> Int {
        let MOD = 1000000007
        var count = 0
        var dp = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
        let directions = [[-1,0], [1,0], [0, -1], [0, 1]]
        dp[startRow][startColumn] = 1
        for _ in 0..<maxMove {
            var dpNew = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
            for i in 0..<m {
                for j in 0..<n {
                    for direction in directions {
                        let x = i + direction[0]
                        let y = j + direction[1]
                        if x >= 0 && x < m && y >= 0 && y < n {
                            dpNew[x][y] = (dpNew[x][y] + dp[i][j]) % MOD
                        } else {
                            count = (count + dp[i][j]) % MOD
                        }
                    }
                }
            }
            dp = dpNew
        }
        return count
    }
    
    func test() {
        print(findPaths(2, 2, 2, 0, 0))
        print(findPaths(1, 3, 3, 0, 1))
        
        print(findPaths(2, 3, 8, 1, 0))
    }
}

// 0 1 1 0
// 1 2 0 1
// 1 0 2
// 0 2

// 0 1 1 0
// 1 2 0 1
// 1 0 2
// 0 1

// 2
// 0 1 1 1 0
// 1 0 2 0 1
// 0 1 1 1 0

// 3
// 0 1 3 1 0
// 1 1 1 1 1
// 0 1 3 1 0
