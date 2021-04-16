//
//  Solution198.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
class Solution198 {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var value1 = 0
        var value2 = 0
        var value3 = 0
        for i in (0..<nums.count) {
            value3 = max(value1 + nums[i], value2)
            value1 = value2
            value2 = value3
        }
        return value3
        
        // var tempNums:[Int] = Array.init(repeating: 0, count: nums.count)
//        for i in (0..<nums.count) {
//            if i == 0 {
//                tempNums[i] = nums[i]
//            }else if i == 1 {
//                tempNums[i] = max(nums[i], tempNums[0])
//            }else {
//                tempNums[i] = max(tempNums[i-2] + nums[i], tempNums[i-1])
//            }
//        }
//        return tempNums.last!
        // return max(nums1Sum, nums2Sum)
    }
    
    func test() {
        print(rob([1,2,3,1]))
        print(rob([2,7,9,3,1]))
        
        print(rob([2,1,1,2]))
        
    }
}
