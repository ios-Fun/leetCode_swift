//
//  Solution647.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/5/31.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 深度优先
// 2. 动态规划 -- 二维数组，空间换时间
class Solution647 {
    // todo
    func countSubstrings(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        let chars = Array(s)
        var count = 0
        for i in (0..<chars.count) {
            // 奇数
            
            // 偶数
            
        }
        
        return 0
    }
    
    func test() {
        countSubstrings("abc")
        countSubstrings("aaa")
    }
}
