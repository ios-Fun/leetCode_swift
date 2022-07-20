//
//  Solution553.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/6/20.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation
// 1. 回溯处理括号
// 2. 动态规划 -- todo
// 3. 数学方法
class Solution553 {
    var nums: [Int]!
    var maxValue = 0
    var maxList:[Int]?
    func optimalDivision(_ nums: [Int]) -> String {
        self.nums = nums
        return ""
    }
    
    
    
    func test() {
        print(optimalDivision([1000,100,10,2]))
    }
}

//  1， 2， 3
//  1   3  2
//  2   1  3
//  2   3  1
//  3   1  2
//  3   2  1
