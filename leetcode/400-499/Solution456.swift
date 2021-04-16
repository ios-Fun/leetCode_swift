//
//  Solution456.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//
class Solution456 {
    
    
    // 单调栈
    func find132pattern2(_ nums: [Int]) -> Bool {
        
        if nums.count < 3 {
            return false
        }
        var stack:[Int] = Array()
        // stack.append(nums[0])
        
        for i in 0..<nums.count {
            // while stack.count > 0 &&
            
            if stack.count == 0 {
                stack.append(nums[i])
            }else if nums[i] > stack.last! {
                // 更新
                //stack[stack.count-1] = nums[i]
                stack.append(nums[i])
            }else if nums[i] < stack.last! {
                while stack.count > 0 {
                    if stack.last! >= nums[i] {
                        stack.removeLast()
                    }else {
                        return true
                    }
                }
                stack.append(nums[i])
            }
        }
        
        return false
    }
    
    func find132pattern(_ nums: [Int]) -> Bool {
        var oneStack:[Int] = Array()
        var threeStack:[Int] = Array()
        
        for i in 0..<nums.count {
            if oneStack.count == 0 {
                oneStack.append(nums[i])
                continue
            }
            // 查看当前结果是否在堆栈中
            if threeStack.count > 0 {
                for j in 0..<threeStack.count {
                    if nums[i] < threeStack[j] && nums[i] > oneStack[j] {
                        return true
                    }
                }
            }
            
            if oneStack.count > threeStack.count {
                if nums[i] < oneStack.last! {
                    // 更新 oneStack 的最后一个 的值
                    oneStack[oneStack.count-1] = nums[i]
                }else if nums[i] > oneStack.last! {
                    threeStack.append(nums[i])
                }
            }else {
                if nums[i] > threeStack.last! {
                    threeStack[threeStack.count-1] = nums[i]
                }
                oneStack.append(nums[i])
            }
        }
        return false
    }
    
    func test() {
        print(find132pattern2([-2,1,2,-2,1,2]))
        print(find132pattern2([1, 2, 3, 4]))
        print(find132pattern2([3, 1, 4, 2]))
        print(find132pattern2([-1, 3, 2, 0]))
    }
}

// 3, 1, 4 ,2

// 3
// 1
// 1, 4
