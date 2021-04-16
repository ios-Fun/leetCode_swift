//
//  Solution575.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/4.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 采用set
// 2. 排序后再遍历统计
class Solution575 {
    func distributeCandies(_ candyType: [Int]) -> Int {
        var candyType = candyType
        quickSort(&candyType, low: 0, high: candyType.count - 1)
        var count = 0
        var lastValue: Int? = nil
        for num in candyType {
            if num != lastValue {
                count += 1
            }
            lastValue = num
        }
        return min(count, candyType.count >> 1)
    }
    
    func quickSort(_ nums: inout [Int], low: Int, high: Int) {
        if low >= high {
            return
        }
        var i = low
        var j = high
        let key = nums[i]
        while i < j {
            while nums[j] >= key && i < j {
                j -= 1
            }
            nums[i] = nums[j]
            while nums[i] <= key && i < j {
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key
        quickSort(&nums, low: low, high: i-1)
        quickSort(&nums, low: i+1, high: high)
    }
    
    func test() {
        print(distributeCandies([]))
        print(distributeCandies([1,3,2,1,2, 3]))
    }
}
