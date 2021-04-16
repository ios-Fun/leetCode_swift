//
//  Solution_o_21.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_21 {
    func exchange(_ nums: [Int]) -> [Int] {
        var nums = nums
        if nums.count < 2 {
            return nums
        }
        
        var left = 0
        var right = nums.count - 1
        while left < right {
            if nums[left] & 1 == 0 {
                // 偶数
                nums.swapAt(left, right)
                right -= 1
            }else {
                left += 1
            }
        }
        return nums
    }
    
    func test() {
        print(exchange([1,2,3,4]))
    }
}
