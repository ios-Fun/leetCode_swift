//
//  Solution561.swift
//  leetcode
//
//  Created by xiao on 2021/8/28.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution561 {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var nums = nums
        quickSort(nums: &nums, left:0, right: nums.count - 1)
        // print(nums)
        var sum = 0
        for i in 0..<nums.count>>1 {
            sum += nums[2*i]
        }
        return sum
    }
    
    // 快速排序
    func quickSort(nums: inout [Int], left: Int, right: Int) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = nums[i]
        while i < j {
            while i < j {
                if nums[j] >= key {
                    j -= 1
                }else {
                    nums[i] = nums[j]
                    i += 1
                    break
                }
            }
            while i < j {
                if nums[i] <= key {
                    i += 1
                }else {
                    nums[j] = nums[i]
                    j -= 1
                    break
                }
            }
        }
        nums[i] = key
        quickSort(nums: &nums, left: left, right: i-1)
        quickSort(nums: &nums, left: i+1, right: right)
    }
    
    func test() {
        print(arrayPairSum([1,4,3,2]))
        
        print(arrayPairSum([6,2,6,5,1,2]))
    }
}
