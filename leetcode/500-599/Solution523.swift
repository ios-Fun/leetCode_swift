//
//  Solution523.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

// 连续的子数组和
class Solution523 {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        return false
    }
    
    func test() {
        print(checkSubarraySum([23,2,4,6,7], 6))
        print(checkSubarraySum([23,2,6,4,7], 6))
        print(checkSubarraySum([23,2,6,4,7], 13))
    }
}

// 23 25 29 35 42
//    2  6  12 19
//       4  10 17
//           6 13
//             7
