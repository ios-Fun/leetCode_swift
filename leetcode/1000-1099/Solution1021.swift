//
//  Solution1021.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1021 {
    func removeOuterParentheses(_ S: String) -> String {
        let chars = Array(S)
        var stack:[Int] = Array()
        var startIndex = 1
        var resultString = ""
        for i in 0..<chars.count {
            if !stack.isEmpty && chars[i] == ")" && chars[stack.last!] == "(" {
                stack.removeLast()
                if stack.count == 0 {
                    for j in startIndex..<i {
                        resultString.append(chars[j])
                    }
                    startIndex = i + 2
                }
            }else {
                stack.append(i)
            }
        }
        return resultString
    }
    
    func test() {
        print(removeOuterParentheses("(()())(())"))
        print(removeOuterParentheses("(()())(())(()(()))"))
        print(removeOuterParentheses("()()"))
        
    }
}
