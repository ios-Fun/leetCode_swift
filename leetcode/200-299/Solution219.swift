//
//  Solution219.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// Set的使用
class Solution219 {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        // 最关键是:值作为key, 索引作为value
        // var record = [Int: Int]()
        
        var set = Set<Int>()
        
        for idx in 0..<nums.count {
            
            if set.contains(nums[idx]) {
                return true
            }
            
            set.insert(nums[idx])
            
            if set.count == k + 1 {
                set.remove(nums[idx - k])
            }
        }
        return false
    }
    
    func test() {
        print(containsNearbyDuplicate([1,2,3,1], 3))
        print(containsNearbyDuplicate([1,0,1,1], 1))
        print(containsNearbyDuplicate([1,2,3,1,2,3], 2))
    }
}

