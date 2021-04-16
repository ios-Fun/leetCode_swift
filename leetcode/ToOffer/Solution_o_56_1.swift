//
//  Solution_o_56_1.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/27.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_56_1 {
    func singleNumbers(_ nums: [Int]) -> [Int] {
        let result = nums.reduce(0, ^)
        // 找到最小位的i
        let min = result - result & (result - 1)
        var num1 = 0
        var num2 = 0
        for j in 0..<nums.count {
            if nums[j] & min == 0 {
                num1 = num1 ^ nums[j]
            }else {
                num2 = num2 ^ nums[j]
            }
        }
        return [num1, num2]
    }
    
    func test() {
        print(singleNumbers([4,1,4,6]))
        print(singleNumbers([1,2,10,4,1,4,3,3]))
    }
}
