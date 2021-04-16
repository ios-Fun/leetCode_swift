//
//  Solution357.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 数学方法（公式）
// 2. 动态规划
class Solution357 {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        if n == 0 {
            return 1
        }
        var k = 9
        var reuslt = 10
        var temp = 9
        let minValue = min(10, n)
        for _ in 1..<minValue {
            temp *= k
            k -= 1
            reuslt += temp
        }
        return reuslt
    }
    
    func test() {
        print(countNumbersWithUniqueDigits(1))
        print(countNumbersWithUniqueDigits(2))
        print(countNumbersWithUniqueDigits(3))
        print(countNumbersWithUniqueDigits(4))
        print(countNumbersWithUniqueDigits(10))
        print(countNumbersWithUniqueDigits(11))
    }
}

// 1 -- 10
// 2- 9 * 9  + 10 = 91
// 3 - 9 * 9 * 8 + 91
