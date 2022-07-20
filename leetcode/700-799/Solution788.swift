//
//  Solution788.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/17.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution788 {
    func rotatedDigits(_ n: Int) -> Int {
        // -1 表示不存在，0--表示相同，1--表示不相同
        var dp = Array.init(repeating: -1, count: n+1)
        dp[0] = 0
        var count = 0
        if n >= 1 {
            dp[1] = 0
        }
        if n >= 2 {
            dp[2] = 1
            count += 1
        }
        if n >= 5 {
            dp[5] = 1
            count += 1
        }
        if n >= 6 {
            dp[6] = 1
            count += 1
        }
        if n >= 8 {
            dp[8] = 0
        }
        if n >= 9 {
            dp[9] = 1
            count += 1
        }
        if n >= 10 {
            for i in 10...n {
                let a = i / 10
                let b = i % 10
                if dp[a] == 0 && dp[b] == 0 {
                    dp[i] = 0
                }else if dp[a] == -1 || dp[b] == -1{
                    dp[i] = -1
                } else {
                    dp[i] = 1
                    count += 1
                    // print(i)
                }
            }
        }
        return count
    }
    
    func test() {
        print(rotatedDigits(10))

        print(rotatedDigits(20))
        print(rotatedDigits(857))
    }
}

// 821
