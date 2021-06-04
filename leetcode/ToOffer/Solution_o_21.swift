//
//  Solution_o_21.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_21 {
    
    // 首尾双指针 -- 交换的过多--待优化
    func exchange(_ nums: [Int]) -> [Int] {
        var nums = nums
        if nums.count < 2 {
            return nums
        }
        
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] & 1 != 0 {
                // left 为基数
                left += 1
                continue
            }
            if nums[right] & 1 == 0 {
                // right 为偶数
                right -= 1
                continue
            }
            nums.swapAt(left, right)
        }
        return nums
    }
    
    // TODO: 快慢指针
    
    func test() {
        print(exchange([1,2,3,4]))
    }
}
