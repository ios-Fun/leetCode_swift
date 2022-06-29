//
//  Solution583.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/13.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 好题目
class Solution583 {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let m  = word1.count
        let n = word2.count
        let word1List = Array(word1)
        let word2List = Array(word2)
        var dp:[[Int]] = Array.init(repeating: Array.init(repeating: 0, count: n+1), count: m+1)
        for i in 0...m {
            dp[i][0] = i
        }
        for j in 0...n {
            dp[0][j] = j
        }
        for i in 1...m {
            for j in 1...n {
                if word1List[i-1] == word2List[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                } else {
                    dp[i][j] = min(dp[i][j-1], dp[i-1][j]) + 1
                }
            }
        }
        return dp[m][n]
    }
    
    func test() {
        print(minDistance("sea", "eat"))
        print(minDistance("leetcode", "etco"))
    }
}
