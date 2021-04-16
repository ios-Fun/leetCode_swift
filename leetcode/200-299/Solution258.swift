//
//  Solution258.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/25.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution258 {
    // 递归
    func addDigits2(_ num: Int) -> Int {
        var num = num
        var sum = 0
        repeat {
            sum += num % 10
            num = num / 10
        }while num > 0
        if sum >= 10 {
            return addDigits(sum)
        }else {
            return sum
        }
    }
    
    // 不使用循环或者递归。 O（1）复杂度
    func addDigits(_ num: Int) -> Int {
        return 0
    }
    
    func test() {
        print(addDigits(38))
    }
}
