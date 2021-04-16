//
//  Solution260.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 哈希
// 2. 位运算
class Solution260 {
    
    // 位运算
    func singleNumber(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return []
        }
        var value = nums[0]
        
        for i in 1..<nums.count {
            value = value ^ nums[i]
        }
        // a ^ a = 0
        // 0 ^ b = b
        
        // 最终是 nums[i] ^ nums[j]
        
        // 找到最小位的i
        var i = 1
        while value & 1 == 0 {
            value = value >> 1
            i = i << 1
        }
        
        var num1 = 0
        var num2 = 0
        for j in 0..<nums.count {
            if nums[j] & i == 0 {
                // 表示该位是0
                num1 = num1 ^ nums[j]
            }else {
                num2 = num2 ^ nums[j]
            }
        }
        return [num1, num2]
    }
    
    func test() {
        print(singleNumber([1,2,1,8,2,5]))
        print(singleNumber([1,2,1,3,2,5]))
    }
}

// 3
//011

//5
//101

//110

// a ^ b = c

// a ^ b ^ b = a ^ 0 = a

// 0 ^ 0 = 0
// 0 ^ 1 = 1
// 1 ^ 1 = 0
