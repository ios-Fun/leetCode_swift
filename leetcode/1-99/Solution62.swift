//
//  Solution62.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划

class Solution62 {
    
    // dp
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dp:[[Int]] = Array()
        
        for i in (0..<n) {
            var rowArray:[Int] = Array()
            for j in (0..<m) {
                var value = 0
                if i == 0 {
                    value = 1
                }
                if j == 0{
                    value = 1
                }
                if i > 0 && j > 0 {
                    value = dp[i-1][j] + rowArray[j-1]
                }
                rowArray.append(value)
            }
            dp.append(rowArray)
        }
        return dp[n-1][m-1]
    }
    
    func test() {
        print(uniquePaths(7, 3))
        print(uniquePaths(3, 2))
    }
}

