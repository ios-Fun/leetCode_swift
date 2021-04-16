//
//  Solution191.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/10.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 注意负数，64位环境下
class Solution191 {
    func hammingWeight(_ n: Int) -> Int {
        var mask = 1
        var count = 0
        for _ in (0..<64) {
            if n & mask != 0 {
                count = count + 1
            }
            mask = mask << 1
        }
        return count
    }
    
    func test() {
        print(hammingWeight(8))
        print(hammingWeight(9))
        print(hammingWeight(-8))
        print(hammingWeight(-9))
    }
}
