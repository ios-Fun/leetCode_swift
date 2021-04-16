//
//  Solution220.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 使用了Set
// 2. 存商数
class Solution220 {
    /*
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if t < 0 {
            return false
        }
        var set = Set<Int>()
        //var t = t
        
        for (index, num) in nums.enumerated() {
            if t == 0 {
                if set.contains(num) {
                    return true
                }
            }else{
                if set.contains(where: {abs($0-num) <= t}) {
                    return true
                }
            }
            
            set.insert(num)
            
            if set.count == k + 1 {
                set.remove(nums[index - k])
            }
        }
        return false
    }
    */
    
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard nums.count > 0 && k > 0 && t >= 0 else {
            return false
        }
        var dictionary: [Int:Int] = [:]
        let dividend = t + 1
        for (index,num) in nums.enumerated() {
            var bucket = num / dividend
            if num < 0 {
                bucket = bucket - 1
            }
            if let _ = dictionary[bucket] {
                return true
            }else if let oldNum = dictionary[bucket + 1], oldNum - num <= t {
                return true
            }else if let oldNum = dictionary[bucket - 1], num - oldNum <= t {
                return true
            }
            if index >= k {
                let oldBucket = nums[index - k] / dividend
                dictionary.removeValue(forKey: oldBucket)
            }
            dictionary[bucket] = num
        }
        return false
    }
    
    func test() {
        // print(containsNearbyAlmostDuplicate([-1,-1], 1, -1))
        //print(containsNearbyAlmostDuplicate([1,2,3,1], 3, 0))
        //print(containsNearbyAlmostDuplicate([10,9,6,3], 1, 2))
        print(containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3))
        
        print(containsNearbyAlmostDuplicate([10,9,6,3], 1, 2))
    }
}
