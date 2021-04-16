//
//  Solution16.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//  最接近的三数之和
// 思路 1. 先数组排序 2.将结果除3得到a 3.找到距离a最接近的三个数(二分查找)

//
class Solution16 {
    
    // for + 双指针
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 4 {
            return nums.reduce(0, +)
        }
        let sort_nums = nums.sorted()
        
        var res = sort_nums[0] + sort_nums[1] + sort_nums[2]
        for i in 0..<sort_nums.count {
            var left = i + 1
            var right = sort_nums.count - 1
            while left < right {
                // 三数和
                let curr_sum = sort_nums[i] + sort_nums[left] + sort_nums[right]
                // 当前三数和 - 目标值 比较 结果三数和 - 目标值
                if abs(curr_sum - target) < abs(res - target) {
                    res = curr_sum
                }
                if curr_sum > target {
                    right -= 1
                }else if curr_sum < target {
                    left += 1
                }else {
                    return target
                }
            }
        }
        return res
    }
    
    func test() {
        
        print(threeSumClosest([-3,-2,-5,3,-4], 1))
        // -2
        
        print(threeSumClosest([-1,2,1,-4], 1))
    }
}


// -4, -1, 1, 2

//
