//
//  Solution97.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/9.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 1. 方程的建立
// 2. 初始值的设置

class Solution97 {
    
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        if s1.count == 0 {
            return s2 == s3
        }
        if s2.count == 0 {
            return s1 == s3
        }
        let s1Count = s1.count
        let s2Count = s2.count
        // let s3Count = s3.count
        let list = Array.init(repeating: false, count: s2Count+1)
        var dp:[[Bool]] = Array.init(repeating: list, count: s1Count+1)
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        let s3Chars = Array(s3)
        
        dp[0][0] = true
        for i in 1...s1Count {
            if dp[i-1][0] && s1Chars[i-1] == s3Chars[i-1] {
                dp[i][0] = true
            }else {
                break
            }
        }
        
        for j in 1...s2Count {
            if dp[0][j-1] && s2Chars[j-1] == s3Chars[j-1] {
                dp[0][j] = true
            }else {
                break
            }
        }
        
        // 遍历
        for i in 1...s1Count {
            for j in 1...s2Count {
                // 如果s2的j位与目标字符串相同，则比较 dp[i][j-1]
                if (dp[i][j-1] && s2Chars[j-1] == s3Chars[i+j-1]) || (dp[i-1][j] && s1Chars[i-1] == s3Chars[i+j-1]) {
                    dp[i][j] = true
                }
            }
        }
        return dp.last!.last!
    }
    
    func test() {
        print(isInterleave("db", "b", "cbb"))
        print(isInterleave("aabcc", "dbbca", "aadbbcbcac"))
        print(isInterleave("aabcc", "dbbca", "aadbbbaccc"))
        print(isInterleave("aabcc", "", "aabcc"))
        print(isInterleave("aabcc", "a", "aabcca"))
    }
}

// 第s3的i位， s1的j位
// dp[i][j] =

// a s1：a
// aa s1: aa
// aad s1: aa, s2: d
// aadb s1: aa, s2: db
// aadbb s1: aab s2:db
