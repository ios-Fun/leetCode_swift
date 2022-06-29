//
//  Solution516.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 最长回文子序列
// 好题目
class Solution516 {
    // 动态规划 todo
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        let sList = Array(s)
        let list:[Int] = Array.init(repeating: 0, count: n)
        var dp:[[Int]] = Array.init(repeating: list, count: n)
        for i in 0..<n {
            dp[i][i] = 1
        }
        // i 是逆序的
        for i in (0..<n).reversed() {
            for j in (i+1)..<n {
                if sList[i] == sList[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][n-1]
    }
    
    func test() {
        print(longestPalindromeSubseq("bbbab"))
        print(longestPalindromeSubseq("cbbd"))
    }
}

// c b b d
// 0 0 0 0
// 0 0 0 0
// 0 0 0 0
// 0 0 0 0


//   0 1 2 3 4
// 0 0 1 1 1 1
// 1 1 0 0 0 0
// 2 1 0 0 0 0
// 3 1 0 0 0 0
// 4 1 0 0 0 0

// c [0][0] = 1
// c b  // [0][1] = 0 [1][1] = 1
// c b b // [2][2] = 1, [1][2] = 2 ,[0][2] = 0
// c b b d // [3][3] = 1, [2][3] = 0, [1][3] = 0, [0][3] = 0

// c [0][0] = 1
// c b  // [1][1] = 1 [0][1] = max([0][0],max([1][1])
// c b b // [2][2] = 1, [1][2] = 2 ,[0][2] = 0
// c b b d // [3][3] = 1, [2][3] = 0, [1][3] = 0, [0][3] = 0
