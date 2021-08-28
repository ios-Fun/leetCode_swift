//
//  Solution540.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution540 {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var value = 0
        for num in nums {
            value = value ^ num;
        }
        return value
    }
    
    func test() {
        print(singleNonDuplicate([1,1,2,3,3,4,4,8,8]))
        print(singleNonDuplicate([3,3,7,7,10,11,11]))
    }
}
