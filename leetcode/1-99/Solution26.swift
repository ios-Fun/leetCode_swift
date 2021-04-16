//
//  Solution26.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 用时和内存消耗过高
class Solution26 {
    
    //
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count <= 1{
            return nums.count
        }
        var count = 1
        // 上一次的值
        var lastValue = nums.first!
        for i in 1..<nums.count {
            // 如果当前值与上一次的值不同，在index位置赋值给当前值
            if nums[i] != lastValue {
                lastValue = nums[i]
                
                nums[count] = lastValue
                count += 1
            }
        }
        return count
    }
    
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        
        if nums.count <= 1{
            return nums.count
        }
        
        var lastValue = 0
        
        for (index, num) in nums.enumerated().reversed() {
            if index == nums.count - 1 {
                lastValue = num
            }else {
                if num == lastValue {
                    //删除
                    nums.remove(at: index)
                }else {
                    lastValue = num
                }
            }
        }
        
        return nums.count
    }
    
    func test() {
        var num1 = [1,1,2]
        print(removeDuplicates(&num1))
        print(num1)
        
        var num2 = [0,0,1,1,1,2,2,3,3,4]
        print(removeDuplicates(&num2))
        print(num2)
    }
}

