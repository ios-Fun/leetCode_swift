//
//  Solution217.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 排序
// 2. set
class Solution217 {
    // 采用set
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count < 2 {
            return false
        }
        
        var set = Set<Int>()
        for num in nums {
            if set.contains(num) {
                return true
            }
            set.insert(num)
        }
        return false
    }
    
    func test() {
        print(containsDuplicate([1,2,3,1]))
        print(containsDuplicate([1,2,3,4]))
        print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
    }
}
