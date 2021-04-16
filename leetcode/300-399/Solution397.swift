//
//  Solution397.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 类似二叉树的最小深度
// 1. 递归？
// 2. 非递归
class Solution397 {
    
    var dic:[Int: Int] = Dictionary()
    // 记忆化递归
    func integerReplacement(_ n: Int) -> Int {
        
        dic[1] = 0
        return getDic(n)
        // return 0
    }
    
    func getDic(_ n: Int) -> Int {
        if (dic[n] != nil) {
            return dic[n]!
        }else {
            if n & 1 == 1 {
                // 奇数
                // dic[n] = min(dic[n+1], dic[n-1])
                dic[n] = min(getDic(n+1), getDic(n-1)) + 1
            }else {
                dic[n] = getDic(n>>1) + 1
            }
            return dic[n]!
        }
    }
    
    // 递归
    func integerReplacement2(_ n: Int) -> Int {
        // 奇数 偶数
        if n & 1 == 1 {
            if n == 1 {
                return 0
            }
            // 奇数
            return (min(integerReplacement2(n+1), integerReplacement2(n-1))) + 1
        }else {
            return integerReplacement2(n>>1) + 1
        }
    }
    
    func test() {
        print(integerReplacement(8))
        
        print(integerReplacement(7))
    }
}

// 101
// 102 51
// 100 50
