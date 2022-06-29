//
//  Solution485.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 双指针写法
class Solution485 {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var left = 0
        var right = 0
        var maxCount = 0
        for (index,num) in nums.enumerated() {
            if num == 1 {
                right += 1
            } else {
                maxCount = max(maxCount, right - left)
                left = index
                right = index
            }
        }
        maxCount = max(maxCount, right - left)
        return maxCount
    }
    
    func test() {
        print(findMaxConsecutiveOnes([1,1,0,1,1,1]))
        
        print(findMaxConsecutiveOnes([1,0,1,1,0,1]))
    }
}
