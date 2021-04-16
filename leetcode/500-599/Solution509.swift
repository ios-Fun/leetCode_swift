//
//  Solution509.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. 记忆化递归
//2. 遍历
class Solution509 {
    
    // 递归
    func fib(_ N: Int) -> Int {
        
        return 0
    }
    
    
    // 遍历
    func fib2(_ N: Int) -> Int {
        if N <= 1 {
            return N
        }
        var result_N = 0
        var result_N_1 = 1
        var result_N_2 = 0
        for _ in 2...N {
            result_N = result_N_1 + result_N_2
            result_N_2 = result_N_1
            result_N_1 = result_N
        }
        return result_N
    }
    
    func test() {
        print(fib(0))
        print(fib(1))
        print(fib(2))
        print(fib(3))
        print(fib(4))
    }
}
