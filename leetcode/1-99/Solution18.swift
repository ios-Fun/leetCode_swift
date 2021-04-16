//
//  Solution18.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//


// 四位数之和
// 和15相似 先排序，然后4层循环

import Foundation

class Solution18 {
    // 两层for 循环， + 双指针
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sortNum = nums.sorted { (a, b) -> Bool in
            return a <= b
        }
        var resultArray:[[Int]]  = Array()
        
        return resultArray
    }
    
    func test() {
        print(fourSum([1, 0, -1, 0, -2, 2], 0))
    }
}
