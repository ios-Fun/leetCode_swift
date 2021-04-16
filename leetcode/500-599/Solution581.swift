//
//  Solution581.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation


// 数组操作

class Solution581 {
    // O(n)时间复杂度
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let count = nums.count
        if count <= 1 {
            return 0
        }
        
        var left = -1
        var right = -1
        
        // 找left 的位置
        for i in 0..<count-1 {
            if nums[i] > nums[i+1] {
                left = i
                break
            }
        }
        if left == -1 {
            return 0
        }
        
        // 找right的位置
        for i in (1..<count).reversed() {
            if nums[i] < nums[i-1] {
                right = i
                break
            }
        }
        
        if right == -1 {
            return count
        }
        
        // 区间的最大值和最小值
        var max = nums[left...right].max()!
        var min = nums[left...right].min()!
        
        // right 往右移动
        while right < count - 1, max > nums[right + 1]{
            max = max2(max, nums[right + 1])
            right = right + 1
        }
        
        // left 往左移动
        while left > 0, min < nums[left-1] {
            min = min2(min, nums[left-1])
            left = left - 1
        }
        
        
        return right - left + 1
    }
    
    func max2(_ a: Int, _ b: Int) -> Int {
        return a >= b ? a : b
    }

    func min2(_ a: Int, _ b: Int) -> Int {
        return a <= b ? a : b
    }
    
    func test() {
        
        print(findUnsortedSubarray([3, 2, 4]))
        // 2
        
        print(findUnsortedSubarray([1,3,5,4,2]))
        // 4
        
        print(findUnsortedSubarray([1,2,4,5,3]))
        // 3
        print(findUnsortedSubarray([1,1]))
        // 0
        
        print(findUnsortedSubarray([1,2,3,3,3]))
        // 0
        print(findUnsortedSubarray([2, 3, 1]))
        // 3
        
        print(findUnsortedSubarray([2, 3, 4]))
        // 0
        
        print(findUnsortedSubarray([1,3,2,2,0]))
        // 5
        
        print(findUnsortedSubarray([1,3,2,2,2]))
        // 4
        
        print(findUnsortedSubarray([1,3,2,1,2]))
        // 4
        
        print(findUnsortedSubarray([1,3,2,0,2]))
        // 5
        
        print(findUnsortedSubarray([2,3,2,2,3]))
        // 3
        
        print(findUnsortedSubarray([2,1,3,2,2,2]))
        // 6
        
        print(findUnsortedSubarray([2, 6, 4, 8, 10, 9, 15]))
        // 5
        
        print(findUnsortedSubarray([2, 1]))
        // 2
        
        
        
        print(findUnsortedSubarray([3,4, 2,-1,1]))
        // 5
        
        
    }
}
