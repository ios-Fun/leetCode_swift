//
//  Solution1493.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/7.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1493 {
    
    func longestSubarray(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var left = 0
        var right = 0
        var lastValue = 0
        var dpLeft = Array.init(repeating: 0, count: nums.count)
        var dpRight = Array.init(repeating: 0, count: nums.count)
        while right < nums.count {
            let value = nums[right]
            if value == 1 {
                if lastValue == 0 {
                    left = right
                }
            }else {
                if lastValue == 1 {
                    // print("left:\(left), right:\(right-1)")
                    for i in left...(right-1) {
                        dpLeft[i] = i - left + 1
                        dpRight[i] = right - i
                    }
                }
            }
            right += 1
            lastValue = value
        }
        if lastValue == 1 {
            //  print("left:\(left), right:\(right-1)")
            for i in left...(right-1) {
                dpLeft[i] = i - left + 1
                dpRight[i] = right - i
            }
        }
        var maxValue = 0
        for i in 0..<nums.count {
            if i == 0 {
                maxValue = max(maxValue, dpRight[i+1])
            } else if i == nums.count - 1 {
                maxValue = max(maxValue, dpLeft[i-1])
            } else {
                maxValue = max(maxValue, dpLeft[i-1] + dpRight[i+1])
            }
        }
        return maxValue
    }
    
    func test() {
        print(longestSubarray([1,1,0,1]))
        print(longestSubarray([0,1,1,1,0,1,1,0,1]))
        print(longestSubarray([1,1,1]))
        print(longestSubarray([1]))
        print(longestSubarray([1,1]))
        
        print(longestSubarray([0]))
        
        print(longestSubarray([0,0]))
    }
}

// 0
// left[0] = 1
// right[0] = 2

// 1
// left[1] = 2
// right[1] = 1

// 2
// left[2] = 0
// right[2] = 0

// 3
// left[3] = 1
// right[3] = 1

// 0
// right[1]= 1

// 1
// left[0] + right[2] =   1

// 2
// left[1]    + right[3] = 3

// 3
// left[2] = 0
