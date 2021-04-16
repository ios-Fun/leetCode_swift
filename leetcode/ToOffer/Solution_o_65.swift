//
//  Solution_o_65.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_65 {
    func add(_ a: Int, _ b: Int) -> Int {
        var sum = 0
        var carry = 0
        var a = a
        var b = b
        while b != 0 {
            sum = a ^ b
            carry = (a & b) << 1
            a = sum
            b = carry
        }
        return a
    }
    
    func test() {
        print(add(1, 1))
    }
}
