//
//  Solution398.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 随机--是否要洗牌算法
class Solution398 {

    var nums:[Int]!
    
    init(_ nums: [Int]) {
        self.nums = nums
    }
    
    func pick(_ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        var count = 0
        var res = -1
        
        for i in 0..<nums.count {
            if target == nums[i] {
                count = count + 1
                if Int.random(in: Range(1...count)) == count {
                    res = i
                }
            }
        }
        
        return res
    }
}
