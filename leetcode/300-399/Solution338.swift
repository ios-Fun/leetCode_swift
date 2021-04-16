//
//  Solution338.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 汉明权重计算1个数
// 2. 动态规划
//
class Solution338 {
    
    // 动态规划2
    func countBits2(_ num: Int) -> [Int] {
        var dp:[Int] = Array.init(repeating: 0, count: num + 1)
        dp[0] = 0
        for i in 1..<num {
            dp[i] = dp[i>>1] + i & 1
        }
        return dp
    }
    
    // 动态规划
    func countBits(_ num: Int) -> [Int] {
        var resultList:[Int] = Array.init(repeating: 0, count: num + 1)
        resultList[0] = 0
        // resultList[1] = 1
        var index = 0
        var step = 1
        while step <= num {
            while (index < step && index + step <= num) {
                resultList[step + index] = resultList[index] + 1
                index = index + 1
            }
            index = 0
            // step = step << 1
            step *= 2
        }
        
        return resultList
    }
    
    func test() {
        print(countBits(2))
        print(countBits(5))
    }
}

// 0 - 0
// 1 - 1
// 2 --1
// 3 -> f(2) + f(1) = 1 + 1 = 2
// 4 = 1
// 5 = f(4) + f(1) = 1+ 1 = 2
// 6 = f(4) + f(2) = 1 + 1= 2
// 7 = f(4) + f(3) = 3
// 8 = 1
// 9 = f(8) + f(1) = 2
// 10 = f(8) + f(2) = 2
// 11 = f(8) + f(3) = 3
// 12 = f(8) + f(4) = 2
// 13 = f(8) + f(5) = 3

