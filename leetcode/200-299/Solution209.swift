//
//  Solution209.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution209 {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var ans = Int.max
        var sums = Array.init(repeating: 0, count: nums.count + 1)
        for i in 1...nums.count {
            sums[i] = sums[i-1] + nums[i-1]
        }
        for i in 1...nums.count {
            let target = s + sums[i-1]
            let index = lowerBound(sums, target)
            if index == -1 {
                continue
            }
            ans = min(ans, index - i + 1)
        }
        return ans == Int.max ? 0 : ans
    }
    
    func lowerBound(_ nums:[Int], _ target: Int) -> Int {
        var mid = -1
        var left = 0
        var right = nums.count - 1
        while (left < right) {
            mid = (left + right) >> 1
            if nums[mid] < target {
                left = mid + 1
            }else {
                right = mid
            }
        }
        if nums[left] >= target {
            return left
        }else {
            return -1
        }
    }
    
    // 双指针 待优化
    func minSubArrayLen2(_ s: Int, _ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var sum = 0
        var minLength = Int.max
        var beginIndex = 0
        for i in 0..<nums.count {
            sum = sum + nums[i]
            // print("i:", i, "num:", nums[i])
            if sum >= s {
                
                let indexValue = beginIndex
                for j in indexValue...i {
                    if sum - nums[j] >= s {
                        sum = sum - nums[j]
                        beginIndex = j + 1
                    }else {
                        break
                    }
                }
                let count = i - beginIndex + 1
                // print("count:", count)
                if count < minLength {
                    minLength = count
                }
            }
        }
        
        return minLength == Int.max ? 0: minLength
    }
    
    func test() {
        print(minSubArrayLen(3, [1, 1]))
        print(minSubArrayLen(100, []))
        print(minSubArrayLen(7, [2,3,1,2,4,3]))
    }
}

// 思路1: O(n)
// 2+3+1+2 =8   4
// 8+4-7=5, 和为7 index = 1
// 7+3-7=3， 和为7，index = 4

// 思路2: nlogn, 前缀和
// 0, 2, 5, 6, 8, 12， 15
// 2, 找 >=7， 二分查找
// 3, 找 >=7+2
// 1, 找 >=7+5
// 2, 找 >=7+6
// 4, 找 >=7+8
// 3, 找 >=7+12

// 暴力法 O(n*n)
// 2+3+1+2 = 8

// 3+1+2+4 = 10

// 1+2+4 = 7

// 3+4 = 7



