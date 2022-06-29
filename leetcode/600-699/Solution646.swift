//
//  Solution646.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/20.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 1. dfs
// 2. 动态规划
class Solution646 {
    func findLongestChain(_ pairs: [[Int]]) -> Int {
        let n = pairs.count
        var pairsSort = pairs.sorted(by: {$0[0] < $1[0]})
        var dp = Array.init(repeating: 1, count: n)
        for j in 0..<n {
            for i in 0..<j {
                if pairsSort[i][1] < pairsSort[j][0] {
                    dp[j] = max(dp[j], dp[i] + 1)
                }
            }
        }
        return dp.last!
    }
    
    func test() {
        print(findLongestChain([[1,2],[7,8],[4,5]]))
        print(findLongestChain([[1,2], [2,3], [3,4]]))
    }
}

//  0 1 2
//0 1 1 2
//1   1 1
//1     1

// dp[0][2] = dp
