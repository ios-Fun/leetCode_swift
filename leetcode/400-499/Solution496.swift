//
//  Solution496.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 耗时过多
class Solution496 {
    
    // 单调栈 -- 递减
    func nextGreaterElement2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var stack:[Int] = Array.init()
        var dic:[Int:Int] = Dictionary()
        for item in nums2 {
            if stack.count == 0 {
                stack.append(item)
            }else if item < stack.last! {
                stack.append(item)
            }else if item > stack.last! {
                // var nextValue = stack.last!
                while !stack.isEmpty {
                    let last = stack.last!
                    stack.removeLast()
                    if item > last {
                        dic[last] = stack.isEmpty ? item : stack.last!
                    }
                }
                stack.append(item)
            }
        }
        
        var result:[Int] = Array.init(repeating: -1, count: nums1.count)
        for i in 0..<nums1.count {
            if dic[nums1[i]] == nil{
                result[i] = -1
            }else {
                result[i] = dic[nums1[i]]!
            }
        }
        
        return result
    }
    
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        if nums1.count == 0 || nums2.count == 0 {
            return []
        }
        var result:[Int] = Array.init(repeating: -1, count: nums1.count)
        for i in 0..<nums1.count {
            // 先查找到 nums1[i]
            
            var hasFound = false
            var foundIndex = -1
            for j in 0..<nums2.count {
                if hasFound {
                    if nums2[j] > nums1[i] {
                        foundIndex = j
                        break
                    }
                }else {
                    if nums2[j] == nums1[i] {
                        hasFound = true
                    }
                }
                
            }
            if hasFound && foundIndex > -1 {
                result[i] = nums2[foundIndex]
            }
        }
        return result
    }
    
    func test() {
        print(nextGreaterElement2([4,1,2], [1,3,4,2]))
        
        print(nextGreaterElement2([2,4], [1,2,3,4]))
    }
}
