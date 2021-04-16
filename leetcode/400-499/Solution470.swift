//
//  Solution470.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 二维矩阵

class Solution470{
    
    // 扩大范围 n * n
    func rand10() -> Int {
        var col = 0
        var row = 0
        var result = 0
        repeat {
            col = rand7() // 1-- 7
            row = rand7() // 1-- 7
            result = col + (row - 1) * 7 //1-- 49
        }while(result > 40)  // 1--40之间。 41--49 舍弃。 40/49选中
        return result % 10 + 1
    }
    
    func rand7() -> Int {
        return Int.random(in: Range(1...7))
    }
    
    func test() {
        for i in 1...10 {
            print(rand10())
        }
    }
}

