//
//  Solution665.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/5.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution665 {
    // todo
    func checkPossibility(_ nums: [Int]) -> Bool {
        if nums.count <= 2 {
            return true
        }
        var preValue = nums.first!
        var count = 0
        for i in 1..<nums.count {
            if nums[i] >= preValue {
                preValue = nums[i]
                continue
            }
            count += 1
            // preValue = nums[i]
            if count == 2 {
                return false
            }
            if i >= 2 && nums[i-2] > nums[i] {
                preValue = nums[i-1]
            }else {
                preValue = nums[i]
            }
        }
        return true
    }
    
    func test() {
        print(checkPossibility([3,4,2,3]))  //false
        print(checkPossibility([4,2,3]))
        print(checkPossibility([4,2,1]))
    }
}

//
