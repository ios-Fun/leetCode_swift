//
//  Solution287.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 快慢指针 -- 执行用时过慢

class Solution287 {
    // 位运算
    func findDuplicate2(_ nums: [Int]) -> Int {
        // todo
        return 0
    }
    
    // 1 -> 3 -> 2 -> 4 - > 2
    
    // 快慢指针
    func findDuplicate3(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[nums[0]]
        while slow != fast {
            slow = nums[slow]
            fast = nums[nums[fast]]
        }
        return nums[slow]
    }
    
    // 暴力法
    func findDuplicate(_ nums: [Int]) -> Int {
        
        var sub = 1
        
        var index = 0
        while sub < nums.count {
            while index + sub < nums.count {
                if nums[index] == nums[index + sub] {
                    return nums[index]
                }
                index = index + 1
            }
            index = 0
            sub = sub + 1
        }
        
        return 0
    }
    
    func test() {
        print(findDuplicate3([1,3,4,2,2]))
        // 2
        
        print(findDuplicate3([3,1,3,4,2]))
        // 3
    }
}

// 1, 3, 4 ,2 , 2
// 3, 4
// 4, 2
//

// 3, 1, 3, 4, 2




