//
//  Solution38.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 思路：递归
class Solution38 {
    
    // 正则表达式 todo
    
    // TODO: 双指针
    
    // 递归
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        let preStr = countAndSay(n-1)
        let charList:[Character] = Array(preStr)
        
        var count = 0
        var lastChar:Character? = nil
        var resultStr = ""
        for item in charList {
            if item != lastChar {
                if lastChar != nil {
                    resultStr = resultStr + String.init(count) + String(lastChar!)
                }
                count = 1
                lastChar = item
                
            }else {
                count = count + 1
            }
        }
        resultStr = resultStr + String.init(count) + String(lastChar!)
        return resultStr
    }
    
    func test() {
        print(countAndSay(2))
        print(countAndSay(3))
        print(countAndSay(4))
        print(countAndSay(5))
    }
}
