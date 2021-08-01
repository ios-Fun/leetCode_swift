//
//  Solution34.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/16.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 在排序数组中查找元素的第一个和最后一个位置
// O(log n)
// 思路： 二分查找，单独找头和单独找尾
// 要优化
class Solution34 {
    var nums:[Int]!
    var target:Int!
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 0 {
            return [-1, -1]
        }
        self.nums = nums
        self.target = target
        var result = [-1, -1]
        result[0] = binary(true)
        result[1] = binary(false)
        return result
    }
    
    // 二分查找 -- 边界处理难
    func binary(_ isLeft: Bool) -> Int{
        var left = 0
        var right = nums.count
        while(left < right) {
            let mid = (left + right) >> 1
            if nums[mid] > target || (isLeft && target == nums[mid]){
                right = mid
                continue
            }else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    
    func searchRange2(_ nums: [Int], _ target: Int) -> [Int] {
        if nums.count == 1 {
            if nums[0] == target {
                return [0, 0]
            }else {
                return [-1, -1]
            }
        }
        if nums.count == 0 {
            return [-1, -1]
        }
        let left = findFirst(nums, target)
        let right = findEnd(nums, target)
        
        return [left, right]
    }
    
    // 查找做边界
    func findFirst(_ nums: [Int], _ target: Int)->Int {
        var l = 0
        var r = nums.count - 1
        
        while(l < r) {
            if nums[l] == target {
                return l
            }
            if nums[l] > target {
                return -1
            }
            
            if nums[r] < target {
                return -1
            }else if nums[r] >= target {
                // 取中间
                let midValue = (l + r)/2
                if nums[midValue] > target {
                    r = midValue - 1
                }else if nums[midValue] == target {
                    r = midValue
                }else{
                    // target > 中间值
                    l = midValue + 1
                }
            }
        }
        if nums[l] == target {
            return l
        }else {
            return -1
        }
    }
    
    func findEnd(_ nums: [Int], _ target: Int)->Int {
        var l = 0
        var r = nums.count - 1
        while(l < r) {
            
            if nums[r] == target {
                return r
            }
            if nums[r] < target {
                return -1
            }
            
            if nums[l] > target {
                return -1
            }else if nums[l] <= target {
                // 取中间
                
                let midValue = (l + r) % 2 == 1 ? (l + r) / 2 + 1 : (l + r) / 2
                if nums[midValue] > target {
                    r = midValue - 1
                }else if nums[midValue] < target {
                    l = midValue + 1
                }else {
                    // target > 中间值
                    l = midValue
                }
            }
        }
        if nums[l] == target {
            return l
        }else {
            return -1
        }
    }
    
    func test() {
        print(searchRange([5,7,7,8,8,10], 8))
        print(searchRange([5,7,7,8,8,10], 6))
        print(searchRange([1], 1))
        print(searchRange([1,3], 1))
    }
}
