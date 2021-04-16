//
//  Solution11.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 双指针移动
class Solution11 {
    
    func maxArea(_ height: [Int]) -> Int {
        
        if height.count == 0 {
            return 0
        }
        if height.count == 1 {
            return height[0]
        }
        var left = 0
        var right = height.count-1
        var maxValue = (right - left) * min(height[left], height[right])
        
        while(left < right) {
            if height[left] < height[right] {
                left = left + 1
            }else {
                right = right - 1
            }
            let value = (right - left) * min(height[left], height[right])
            if value > maxValue {
                maxValue = value
            }
        }
        return maxValue
    }
    
    func test() {
        print(maxArea([1,8,6,2,5,4,8,3,7]))
    }
}
