//
//  Solution_o_60.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/26.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution_o_60 {
    
//    func twoSum(_ n: Int) -> [Int] {
//        
//    }
    
    // 动态规划
    func twoSum2(_ n: Int) -> [Int] {
        var total = 6 * n
        var dp:[Int] = Array.init(repeating: 0, count: total)
        for i in 0..<6 {
            dp[i] = 1
        }
        for j in 2...n {
            var dpNew:[Int] = Array.init(repeating: 0, count: total)
            for k in (j-1)...(j*6)>>1 {
                dpNew[k] = dpNew[k-1] + dp[k-1]
                dpNew[j*6-k] = dpNew[k]
            }
            dp = dpNew
        }
        
        return dp
    }
    
    func test() {
        // print(twoSum(1))
        print(twoSum2(3))
    }
}

// 1, 1, 1, 1, 1, 1
// 1, 1, 1, 1, 1, 1
// 0, 1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1
// 0, 0 ,1, 3

//1   2  3  4  5  6   7   8   9   10  11  12  13  14  15 16 17 18
//[0, 0, 1, 3, 6, 10, 15, 21, 26, 30, 26, 21, 15, 10, 6, 3, 1, 0]

// 2 -- 2 - 12

// 3 -- 3 - 18
