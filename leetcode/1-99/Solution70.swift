//
//  Solution70.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 递归--记忆化递归
// 2. 动态规划
class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        if n == 1 {
            return 1
        }
        if n == 2 {
            return 2
        }
        
        var i1 = 1
        var i2 = 2
        var temp = i1
        
        for _ in (3...n) {
            temp = i1
            i1 = i2
            i2 = temp + i1
        }
        return i2
    }
    
    func test() {
        print(climbStairs(4))
        print(climbStairs(44))
    }
}
