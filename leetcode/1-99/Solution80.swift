//
//  Solution80.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/20.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution80 {
    
    // 快慢指针，i是遍历的位置，j是赋值的位置
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var count = 0
        // todo
        return count
    }
    
    // 比较差的方式
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var lastValueCount = 0
        
        for i in (0..<nums.count).reversed() {
            if i == nums.count - 1 {
                lastValueCount = 1
            }else {
                if nums[i] == nums[i+1] {
                    lastValueCount = lastValueCount + 1
                    if lastValueCount > 2 {
                        nums.remove(at: i)
                        lastValueCount = 2
                    }
                }else {
                    lastValueCount = 1
                }
            }
        }
        
        return nums.count
    }
    
    
    func test() {
        var list = [1,1,1,2,2,3]
        print(removeDuplicates(&list))
    }
}
