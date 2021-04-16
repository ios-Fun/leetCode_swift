//
//  Solution136.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 考察异或，两个相同的数异或 = 0 
class Solution136 {
    // 两层for循环
    /*
    func singleNumber(_ nums: [Int]) -> Int {
        
        for i in (0...nums.count-1) {
            var hasSame = false
            for j in (0...nums.count-1) {
                // 如果相同，说明这个数有重复,继续i下一次循环
                if nums[i] == nums[j] {
                    if i != j {
                        hasSame = true
                        break
                    }else {
                        // 两个相同的位置， 继续
                    }
                    
                }
                
            }
            if !hasSame {
                return nums[i]
            }
            
        }
        return -1
    }
     */
    
    // 异或
    func singleNumber(_ nums: [Int]) -> Int {
        var value = 0
        for i in (0...nums.count-1) {
            value = value^nums[i]
        }
        return value
    }
}
