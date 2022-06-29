//
//  Solution905.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/19.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation


class Solution905 {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        var newNums = nums
        var left = 0  // 左边的奇数
        var right = nums.count - 1
        while left < right {
            while left < right {
                if nums[left] & 1 == 0 {
                    // 偶数
                    left += 1
                }else {
                    break
                }
            }
            while left < right {
                if nums[right] & 1 == 1 {
                    // 奇数
                    right -= 1
                } else {
                    break
                }
            }
            if left < right {
                newNums.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        return newNums
    }
    
    func test() {
        print(sortArrayByParity([3,1,2,4]))
        print(sortArrayByParity([0]))
    }
}
