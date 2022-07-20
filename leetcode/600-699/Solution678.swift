//
//  Solution678.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/3.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 1. dfs
// 2. 动态规划
// 3. 栈
// 4. 贪心
class Solution678 {
    func checkValidString(_ s: String) -> Bool {
        var leftStack:[Int] = []
        var starStack:[Int] = []
        let chars = Array(s)
        for (index,char) in chars.enumerated() {
            if char == "(" {
                leftStack.append(index)
            } else if char == "*" {
                starStack.append(index)
            } else {
                // 右括号
                if leftStack.count > 0 {
                    leftStack.removeLast()
                }else if starStack.count > 0 {
                    starStack.removeLast()
                }else {
                    return false
                }
            }
        }
        while !leftStack.isEmpty || !starStack.isEmpty {
            if leftStack.isEmpty {
                return true
            }
            if starStack.isEmpty {
                return false
            }
            if leftStack.last! < starStack.last! {
                leftStack.removeLast()
                starStack.removeLast()
            } else {
                return false
            }
        }
        return leftStack.isEmpty
    }
    
    func test() {
        print(checkValidString("()"))
        print(checkValidString("(*)"))
        print(checkValidString("(*))"))
    }
}

// 左
// 右
// 空

// dp[i][j][3]

//
