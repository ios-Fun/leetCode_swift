//
//  Solution50.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// pow(x, n) ，即计算 x 的 n 次幂函数
// 采用二分的办法
class Solution50 {
    func myPow(_ x: Double, _ n: Int) -> Double {
        // var result: Double = 0
        
        if n < 0 {
            return 1.0 / myPow(x, -n)
        }
        if n == 0 {
            return 1
        }
        
        if n & 1 == 1 {
            let value = myPow(x, n >> 1)
            return value * value * x
        }else {
            let value = myPow(x, n >> 1)
            return value * value
        }
    }
    
    func test() {
        print(myPow(2.00000, 9))
        print(myPow(2.00000, 10))
        
        print(myPow(2.10000, 3))
        
        print(myPow(2.00000, -2))
        
        
    }
}

// 10 -> 5 -> 2.5 ( 2 * 2 + 1)
