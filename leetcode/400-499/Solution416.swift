//
//  Solution416.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 深度优先 + 剪枝
// 2. 动态规划，空间换时间，问题： 如果值很大时，需要的空间也大
class Solution416 {
    
    // 0-1 背包
    func canPartition(_ nums: [Int]) -> Bool {
    
        let len = nums.count
        if len < 2 {
            return false
        }
        let sum = nums.reduce(0, +)
        if sum & 1 == 1 {
            return false
        }
        let target = sum >> 1
        let item:[Bool] = Array.init(repeating: false, count: target+1)
        
        // dp空间有些大
        var dp: [[Bool]] = Array.init(repeating: item, count: nums.count)
        
        dp[0][nums[0]] = true
        
        for i in 1..<len {
            for j in 0...target {
                
                // 上一个可以，下一个必然也可以
                dp[i][j] = dp[i-1][j]
                
                if nums[i] == j {
                    dp[i][j] = true
                    continue
                }
                if nums[i] < j {
                    dp[i][j] = dp[i-1][j] || dp[i-1][j - nums[i]]
                }
            }
        }
        
        return dp[len-1][target]
    }
    
    
//    var visit1:[Int]!
//    var visit2:[Int]!
    var nums: [Int]!
    func canPartition2(_ nums: [Int]) -> Bool {
        
        let sum = nums.reduce(0, +)
        if sum & 1 == 1 {
            return false
        }
        self.nums = nums.sorted(by: { (a, b) -> Bool in
            return a > b
        })
        return dst(sum >> 1, 0)
        
        // return flag
    }
    
    func dst(_ target: Int, _ index: Int) -> Bool{
        if target == 0 {
            // flag = true
            return true
        }
        if target < 0 {
            return false
        }
        if index >= nums.count {
            return false
        }
        
        let flag1 =  dst(target - nums[index], index + 1)
        if flag1 {
            return true
        }else {
            return dst(target, index + 1)
        }
        
        // return dst(target - nums[index], index + 1) || dst(target, index + 1)
    }
    
    func test() {
        
        print(canPartition([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,100]))
        print(canPartition([1,2,3,4,5,6,7]))
        print(canPartition([1, 5, 11, 5]))
    }
}

// 28  -- 14

// 0  1， 2， 3， 4， 5， 6， 7，8， 9，10， 11， 12， 13， 14
// t  t
// t  t  t
// t  t  t   t   t
// t  t  t   t   t   t  t   t  t
