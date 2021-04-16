//
//  Solution96.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/21.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 动态规划
// 难
// 1-1, 2-2, 3-5,
// 1

//  2    1
// 1       2

// 动态规划--如何去规划？
// G(n) = G(0)*G(n-1) + G(1)* (G(n-2) + G(2)*G(n-3)
// G(1) = G(0)*G(0) = 1
// G(2) = G(0)*G(0) + G(1)* G(0) = 2
// G(3) = G(0)*G(2) + G(1)* G(1) + G(2)*G(0) = 5
class Solution96 {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var g:[Int] = Array.init(repeating: 0, count: n+1)
        g[0] = 1
        g[1] = 1
        
        for i in (2...n) {
            for j in (0..<i){
                 g[i] = g[i] + g[j] * g[i-j-1]
            }
        }
        return g[n]
    }
    
    // 记忆化递归
    func numTrees2(_ n: Int) -> Int {
        
        return 0
    }
    
    func test(){
        print(numTrees(1))
        print(numTrees(2))
        print(numTrees(3))
    }
}
