//
//  Solution217.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 排序
// 2. set
class Solution217 {
    
    // TODO: 排序
    func containsDuplicate2(_ nums: [Int]) -> Bool {
        print(123)
//        var nums = nums
//
//        quickSort(&nums, 0, nums.count - 1)
//        print(nums)
        return true
    }
    
    func quickSort(_ nums: inout [Int], _ low: Int, _ high: Int) {
        if low > high {
            return
        }
        var i = low
        var j = high
        let key = nums[low]
        while i < j {
            while i < j && nums[j] >= key {
                j -= 1
            }
            while i < j && nums[i] <= key {
                i += 1
            }
            if (i != j) {
                nums.swapAt(i, j)
            }
        }
        nums.swapAt(i, low)
        quickSort(&nums, low, i-1)
        quickSort(&nums, i+1, high)
    }
    
    
    // 采用set
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
    
    func test() {
//        print(containsDuplicate([1,2,3,1]))
//        print(containsDuplicate([1,2,3,4]))
        print(containsDuplicate2([1,1,1,3,3,4,3,2,4,2]))
    }
}
