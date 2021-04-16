//
//  Solution_o_62.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_62 {
    // 实际方式模拟
    func lastRemaining(_ n: Int, _ m: Int) -> Int {
        var list:[Int] = Array.init(repeating: 0, count: n)
        for i in 0..<n {
            list[i] = i
        }
        var index = 0
        while list.count > 1 {
            index = (index + m - 1) % list.count
            list.remove(at: index)
        }
        return list.last!
    }
    
    // 通过数学公式递归
    func lastRemaining2(_ n: Int, _ m: Int) -> Int {
        // todo
        return 0
    }
    
    func test() {
        print(lastRemaining(5, 3))
        print(lastRemaining(10, 17))
    }
}

// 0, 1, 2 ,3 ,4
//  index = 2
// (2 + 4 - 1) % 4 = 1
// index = 1
//
