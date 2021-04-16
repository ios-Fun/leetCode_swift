//
//  Solution20.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 栈 -- 遍历完栈为空，表示true
class Solution20 {
    func isValid(_ s: String) -> Bool {
        // let isValid = true
        
        var stack:[Character] = Array()
        
        for i in (0..<s.count) {
            
            let char = s[s.index(s.startIndex, offsetBy: i)]
            if char == ")" || char == "}" || char == "]" {
                if stack.count == 0 {
                    return false
                }else {
                    // pop
                    let popChar = stack.last!
                    stack.removeLast()
                    
                    if isCompareChar(sourceChar: popChar, toChar: char) {
                        continue
                    }else {
                        return false
                    }
                }
            }else {
                // push
                stack.append(char)
            }
        }
        if stack.count == 0 {
            return true
        }else {
            return false
        }
    }
    
    func isCompareChar(sourceChar: Character, toChar: Character) ->Bool {
        switch sourceChar {
        case "[":
            if toChar == "]" {
                return true
            }else {
                return false
            }
        case "{":
            if toChar == "}" {
                return true
            }else {
                return false
            }
        case "(":
            if toChar == ")" {
                return true
            }else {
                return false
            }
        default:
            return true
        }
    }
    
    func test() {
        print(isValid(""))
        print(isValid("()"))
        print(isValid("()[]{}"))
        print(isValid("(]"))
        print(isValid("([)]"))
        print(isValid("{[]}"))
    }
}
