//
//  Solution1143.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/3.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution1143 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        if text1.count == 0 || text2.count == 0 {
            return 0
        }
        
        let text1List = Array(text1)
        let text2List = Array(text2)
        let length1 = text1List.count + 1
        let length2 = text2List.count + 1
        
        let list:[Int] = Array.init(repeating: 0, count: length2)
        var dp:[[Int]] = Array.init(repeating: list, count: length1)
        
        for i in 1...text1List.count {
            for j in 1...text2List.count {
                if text1List[i-1] == text2List[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                }else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp.last!.last!
    }
    
    func test() {
        print(longestCommonSubsequence("abcde", "ace"))
        print(longestCommonSubsequence("abc", "def"))
    }
}

// 5 * 3
// dp[0][0] = 0
// dp[1][0] = 1

// dp[2][0] = 2

// dp[3][0] = 3

//   0  1  2  3  4
//0  0  1  2  3  4
//1  1  2
//2  2


//   0  1  2  3  4
//0  1  1  1  1  1
//1  1  1  2  2  2
//2  1  1  2  2  3
