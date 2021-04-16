//
//  Solution313.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution313 {
    
    // 小顶堆
    func nthSuperUglyNumber2(_ n: Int, _ primes: [Int]) -> Int {
        // todo
        return 0
    }
    
    func nthSuperUglyNumber(_ n: Int, _ primes: [Int]) -> Int {
        if n == 1 {
            return 1
        }
        
        let count = primes.count
        var dp:[Int] = [1]
        var indexList:[Int] = Array.init(repeating: 0, count: count)
        
        for _ in 1..<n {
            var minValue = Int.max
            for j in 0..<count {
                minValue = min(minValue, primes[j] * dp[indexList[j]] )
            }
            dp.append(minValue)
            for j in 0..<count {
                if minValue == primes[j] * dp[indexList[j]] {
                    indexList[j] = indexList[j] + 1
                }
            }
        }
        
        return dp[n-1]
    }
    
    func test() {
        print(nthSuperUglyNumber(12, [2,7,13,19]))
    }
}

// dp 1, 2, 4, 7,8, 13,14,16,19,26,28,
// 2, 4, 8, 14,16,26,28,32
// 7, 14, 28,
// 13, 26,52,
// 19, 38,
