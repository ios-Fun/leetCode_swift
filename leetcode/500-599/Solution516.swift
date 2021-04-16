//
//  Solution516.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution516 {
    // 动态规划 todo
    func longestPalindromeSubseq(_ s: String) -> Int {
        let n = s.count
        
        var list:[Int] = Array.init(repeating: 1, count: n)
        var dp:[[Int]] = Array.init(repeating: list, count: n)
        for i in 1..<n {
            
        }
        return 0
    }
    
    func test() {
        print(longestPalindromeSubseq("bbbab"))
        print(longestPalindromeSubseq("cbbd"))
    }
}

// c b b d
// 0 0 0 0
// 0 0 0 0
// 0 0 0 0
// 0 0 0 0

// c [0][0] = 1
// c b  // [0][1] = 0 [1][1] = 1
// c b b // [2][2] = 1, [1][2] = 2 ,[0][2] = 0
// c b b d // [3][3] = 1, [2][3] = 0, [1][3] = 0, [0][3] = 0

// c [0][0] = 1
// c b  // [1][1] = 1 [0][1] = max([0][0],max([1][1])
// c b b // [2][2] = 1, [1][2] = 2 ,[0][2] = 0
// c b b d // [3][3] = 1, [2][3] = 0, [1][3] = 0, [0][3] = 0
