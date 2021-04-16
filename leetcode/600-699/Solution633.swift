//
//  Solution633.swift
//  leetcode
//
//  Created by youzhuo wang on 2021/1/5.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation

class Solution633 {
    // 双指针
    func judgeSquareSum(_ c: Int) -> Bool {
        var right = Int(sqrt(Double(c)))
        var left = 0
        while left <= right {
            let target = left * left + right * right
            if target == c {
                return true
            }else if target < c {
                left += 1
            }else {
                right -= 1
            }
        }
        return false
    }
    
    func test() {
        print(judgeSquareSum(5))
        print(judgeSquareSum(3))
        print(judgeSquareSum(4))
        print(judgeSquareSum(2))
        print(judgeSquareSum(1))
    }
}

//
