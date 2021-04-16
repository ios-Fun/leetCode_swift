//
//  Solution371.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution371 {
    func getSum(_ a: Int, _ b: Int) -> Int {
        if a == 0 {
            return b
        }
        if b == 0 {
            return a
        }
        var a = a
        var b = b
        var carry = 0
        var lower = 0
        while true {
            lower = a ^ b
            // 进位
            carry = a & b
            if carry == 0 {
                break
            }
            a = lower
            b = carry << 1
        }
        return lower
    }
    
    func test() {
        // print(getSum(1, 2))
        print(getSum(-2, 3))
    }
}

// 0001
// 0010
//  ^
// 0011

// 5 + 4
// 0101
// 0100  b
//
// 0001  a
// 0100 carrier
// 1000 b

