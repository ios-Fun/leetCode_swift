//
//  Solution494.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 1. 递归 -- 回溯？
// 2. 动态规划
// 3. 动态规划 + 空间优化
// 我的思路，正数集，负数集合，然后采用深度优先遍历
class Solution494 {
    
    // 背包问题
    func findTargetSumWays2(_ nums: [Int], _ S: Int) -> Int {
        let sum = nums.reduce(0, +)
        
        if S > sum || S < -sum {
            return 0
        }
        
        let count = nums.count
        let list:[Int] = Array.init(repeating: 0, count: 2001)
        var dp:[[Int]] = Array.init(repeating: list, count: 2 * sum + 1)
        
        for i in 0..<count {
            if i == 0 {
                dp[0][nums[0] + 1000] = 1
                dp[0][-nums[0] + 1000] += 1
            }else {
                for j in -1000...1000{
                    dp[i][j + nums[i] + 1000] += dp[i-1][j+1000]
                    dp[i][j - nums[i] + 1000] += dp[i-1][j+1000]
                }
            }
        }
        return S > 1000 ? 0 : dp[nums.count - 1][S + 1000]
    }
    
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
    
        let sum = nums.reduce(0, +)
        
        if S > sum || S < -sum {
            return 0
        }
        
        var dp:[Int] = Array.init(repeating: 0, count: 2 * sum + 1)
    
        // dp[i][S] = dp[i-1][S- nums[i]] + dp[i-1][S + nums[i]]
        // dp[S] = dp[S- nums[i]] + dp[S + nums[i]]
        
        for i in 0..<nums.count {
            if i == 0 {
                dp[sum + nums[i]] = 1
                dp[sum - nums[i]] = dp[sum-nums[i]] + 1
            }else {
                var next:[Int] = Array.init(repeating: 0, count: 2 * sum + 1)
                for j in (0..<(2 * sum+1)) {
                    if j - nums[i] >= 0 {
                        next[j] = dp[j-nums[i]]
                    }else {
                        next[j] = 0
                    }

                    if j+nums[i] < 2 * sum  + 1 {
                        next[j] = next[j] + dp[j+nums[i]]
                    }
                }
                dp = next
            }
        }
        
        return dp[sum + S]
    }
    
    func test() {
        print(findTargetSumWays([1, 1, 1, 1, 1], 3))
    }
}


// 1+1+1+1+1 = 5

//   0  1   2  3  4 5 6 7 8 9 10
//   -5 -4 -3 -2 -1 0 1 2 3 4 5
//0  0  0   0  0  1 0 1 0 0 0 0
//1  0  0   0  1  0 2 0 1 0 0 0
//2  0  0   1  0  3 0 3 0 1 0 0
//3  0  1   0  4  0 6 0 4 0 1 0
//4  1  0   5  0 10 0 10-0-5-0 1
