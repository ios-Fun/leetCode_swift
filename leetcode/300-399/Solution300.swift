//
//  Solution300.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 需要用NlogN
class Solution300 {
    
    // nlogn -- 维护递增list
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        // todo
        if nums.count < 2 {
            return nums.count
        }
        var resList:[Int] = Array()
        resList.append(nums[0])
        
        for i in 1..<nums.count {
            if nums[i] > resList.last! {
                resList.append(nums[i])
            }else if nums[i] < resList.last!{
                // 更新
                var left = 0
                var right = resList.count-1
                while left < right {
                    let mid = (left + right) >> 1
                    if resList[mid] < nums[i] {
                        left = mid + 1
                    }else {
                        right = mid
                    }
                }
                resList[left] = nums[i]
            }
        }
        return resList.count
    }
    
    // 动态规划
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return nums.count
        }
        var dp:[Int] = Array.init(repeating: 1, count: nums.count)
        
        // O(n*n)
        for i in 1..<nums.count {
            // 如何二分
            var maxDp = 1
            for j in 0..<i {
                if nums[i] > nums[j] {
                    maxDp = max(maxDp, dp[j] + 1)
                }
            }
            dp[i] = maxDp
        }
        // return 0
        var maxValue = 1
        for i in 1..<nums.count {
            maxValue = max(maxValue, dp[i])
        }
        return maxValue
    }
    
    func test() {
        print(lengthOfLIS2([10,9,2,5,3,7,101,18]))
        print(lengthOfLIS2([10,9,2,5,3,7,101,18, 19]))
    }
}


// dp
// 10,9, 2, 5, 3, 7, 101, 18, 19
// 1, 1, 1, 2, 2, 3, 4,   4,  5
