//
//  Solution503.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 用时过长

// 2. 要用栈
class Solution503 {
    
    // 单调栈
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        var result:[Int] = Array.init(repeating: -1, count: nums.count)
        var stack:[Int] = Array()
        
        // 倒着遍历
        for _ in 0...1 {
            for i in (0..<nums.count).reversed() {
                if stack.count == 0 {
                    stack.append(i)
                }else {
                    while stack.count > 0 {
                        if nums[stack.last!] > nums[i] {
                            // 栈顶元素比它大
                            result[i] = nums[stack.last!]
                            stack.append(i)
                            break
                        }else {
                            stack.removeLast()
                            
                        }
                    }
                    if stack.count == 0  {
                        stack.append(i)
                    }
                }
            }
        }
        
        return result
    }
    
    func nextGreaterElements2(_ nums: [Int]) -> [Int] {
        if nums.count == 0 {
            return []
        }
        var result:[Int] = Array.init(repeating: -1, count: nums.count)
        for i in 0..<nums.count {
            var count = 1
            var foundIndex = -1
            while count < nums.count {
                let index = i + count >= nums.count ? (i + count - nums.count) : i + count
                if nums[index] > nums[i] {
                    foundIndex = index
                    break
                }
                count = count + 1
            }
            if foundIndex > -1 {
                result[i] = nums[foundIndex]
            }
        }
        return result
    }
    
    func test() {
        print(nextGreaterElements2([1,2,1]))
        print(nextGreaterElements2([3,8,4,1,2]))

        print(nextGreaterElements([1,2,1]))
        print(nextGreaterElements([3,8,4,1,2]))
    }
}

// 1, 2, 1
// 2, -1, 2
// stack: [2, 1]

// 1,-1 2, 1, 3

// [1, ]
//
