//
//  Solution45.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 跳跃游戏 II
// 思路： 1. dp 当前的耗时过多,待优化
class Solution45 {
    
    // 反向
    func jump3(_ nums: [Int]) -> Int {
        // todo
        return 0
    }
    
    // dp 2 --贪心
    func jump2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp:[Int] = Array.init(repeating: 0, count: nums.count)
        let count = nums.count
        var last = 0
        for i in 0..<count {
            if i == 0 {
                dp[0] = 0
            }else {
                while (last < count && last + nums[last] < i) {
                    last += 1
                }
                dp[i] = dp[last] + 1
            }
        }
        
        return dp.last!
    }
    
    // dp o(N*N)
    func jump(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp:[Int] = Array.init(repeating: 0, count: nums.count)
        let count = nums.count
        for i in 0..<count {
            let value = dp[i]
            for j in 0...nums[i] {
                if i + j == 0 {
                    continue
                }
                if i + j == count {
                    break
                }
                if dp[i+j] == 0 {
                    dp[i+j] = value + 1
                }else if dp[i+j] > value + 1 {
                    dp[i+j] = value + 1
                }
            }
        }
        // print(dp)
        return dp.last!
    }
    
    func test() {
        print(jump([0]))
        print(jump([2,3,1,1,4]))
    }
}

//   2, 3, 1, 1, 4
//dp 0, 0, 0 ,0, 0
//   0, 1, 1, 0, 0 -- 1
//   0, 1, 1, 2, 2 -- 2


//   2, 3, 1, 1, 1, 1
//dp 0, 0, 0 ,0, 0
//   0, 1, 1, 0, 0 -- 1
//   0, 1, 1, 2, 2 -- 2
//   0, 1, 1, 2, 2, 3
