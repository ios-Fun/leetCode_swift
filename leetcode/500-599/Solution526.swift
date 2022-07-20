//
//  Solution526.swift
//  leetcode
//
//  Created by xiao on 2021/8/27.
//  Copyright © 2021 youzhuo wang. All rights reserved.
//

import Foundation
//1. 回溯
//2. 动态规划
class Solution526 {
    func countArrangement(_ n: Int) -> Int {
        return 0
    }
    
    func test() {
        print(countArrangement(2))
        // 2
        // [1, 2] [2, 1]
        
        print(countArrangement(1))
        //
    }
}

// 1 -> 1
// 2 -> [1, 2] ,[2, 1]
// 3 -> []

//   1 2
//1  1 2
//2  2 1

//   1  2  3
//   1  2  3 ok
//   1  3  1
//   2  1  3 ok
//   2  3  1
//   3  1  2
//   3  2  1

