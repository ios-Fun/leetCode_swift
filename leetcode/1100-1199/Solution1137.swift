//
//  Solution1137.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1137 {
    func tribonacci(_ n: Int) -> Int {
        var value0 = 0
        var value1 = 1
        var value2 = 1
        if n <= 1 {
            return n
        }
        if n == 2 {
            return 1
        }
        var result = 0
        for _ in 3...n {
            result = value0 + value1 + value2
            value0 = value1
            value1 = value2
            value2 = result
        }
        return result
    }
    
    func test() {
        print(tribonacci(4))
        print(tribonacci(25))
    }
}
