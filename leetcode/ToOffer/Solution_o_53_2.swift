//
//  Solution_o_53_2.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_53_2 {
    // O(n)
    func missingNumber2(_ nums: [Int]) -> Int {
        var preValue = -1
        for value in nums {
            if value != preValue + 1 {
                return value - 1
            }
            preValue = value
        }
        return preValue + 1
    }
    
    // 二分法 -- nums 为有序数组
    func missingNumber(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count-1
        while left <= right {
            if nums[left] > left {
                return left
            }
            if nums[right] == right {
                return right + 1
            }
            let mid = left + (right - left) >> 1
            if nums[mid] == mid {
                left = mid + 1
            }else {
                right = mid - 1
            }
        }
        return 0
    }
    
    // 位运算 -- nums 可以无序
    func missingNumber3(_ nums: [Int]) -> Int {
        let n = nums.count
        var res = n
        for i in 0..<n {
            res = res ^ i
            res = res ^ nums[i]
            
        }
        return res
    }
    
    func test() {
        print(missingNumber([1,2,3]))
        print(missingNumber([0,1,3]))
        print(missingNumber([0,1,2]))
        print(missingNumber([0,1,2,3,4,5,6,7,9]))
    }
}

// [0,1,2,3,4,5,6,7,9]
// 0  8
// mid 4
//
