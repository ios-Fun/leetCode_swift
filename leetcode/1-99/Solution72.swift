//
//  Solution72.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/3.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution72 {
    // -- hard
    func minDistance(_ word1: String, _ word2: String) -> Int {
        if word1.count * word2.count == 0 {
            return word1.count + word2.count
        }
        
        let text1List = Array(word1)
        let text2List = Array(word2)
        let length1 = text1List.count + 1
        let length2 = text2List.count + 1
        
        let list:[Int] = Array.init(repeating: 0, count: length2)
        var dp:[[Int]] = Array.init(repeating: list, count: length1)
        
        for i in 0..<length1 {
            dp[i][0] = i
        }
        
        for j in 0..<length2 {
            dp[0][j] = j
        }
 
        for i in 1...text1List.count {
            for j in 1...text2List.count {
                if text1List[i-1] == text2List[j-1] {
                    // 最后一个字母相同
                    // 上一位+0，A减少 +1， A增加+1
                    dp[i][j] = min(dp[i-1][j-1], dp[i][j-1] + 1, dp[i-1][j] + 1)
                }else {
                    // 最后一个字母不同， 替换 + 1， A增加 + 1， A减少 + 1
                    dp[i][j] = min(dp[i-1][j-1], dp[i][j-1], dp[i-1][j]) + 1
                }
            }
        }
        return dp.last!.last!
    }
    
    func test() {
        print(minDistance("", "a"))
        print(minDistance("horse", "ros"))
        
        print(minDistance("intention", "execution"))
    }
}


// 删除
// 替换
// 插入
// strA   strB
// strA增加 -- strB减少
// strA删除 -- strB增加
// strA替换


// dp[i][j] = dp[i][j]
