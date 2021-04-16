//
//  Solution137.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation
// 1. set
// 2. map
// 3. 位运算
class Solution137 {
    func singleNumber(_ nums: [Int]) -> Int {
        
        var once:Int = 0
        var two:Int = 0
        
        for i in 0..<nums.count {
            once = ~two & (once ^ nums[i])
            two = ~once & (two ^ nums[i])
        }
        
        return 0
    }
    
    func test() {
        print(singleNumber([2, 2, 3, 2]))
    }
}

// 0 ^ a  = a
// 0 & a = a

// ~0 = 1111111
// 1 & a = a

// two = ~a & a = 0

// 2
// a ^ a = 0
// ~0 & 0 = 0

// 0 ^ a = a, ~0 & a = a

