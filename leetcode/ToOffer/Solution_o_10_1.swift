//
//  Solution_o_10_1.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_10_1 {
    func fib(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        return fibNum(n, 1, 0)
    }
    
    // 尾递归
    func fibNum(_ n: Int, _ n1: Int, _ n2: Int) -> Int {
        if n == 1 {
            return n1 % 1000000007
        }
        return fibNum(n-1, (n1 + n2) % 1000000007, n1 % 1000000007)
    }
    
    func test() {
        print(fib(1))
        print(fib(2))
        print(fib(5))
        print(fib(45))
        print(fib(95))
    }
}
