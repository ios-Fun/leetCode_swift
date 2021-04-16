//
//  Solution844.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/29.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// todo O(1)的空间复杂度
class Solution844 {
    func backspaceCompare2(_ S: String, _ T: String) -> Bool {
        // todo
        return true
    }
    
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        let resultS = getResult(S)
        let resultT = getResult(T)
        return resultS == resultT
    }
    
    func getResult(_ str: String) -> String {
        let chars = Array(str)
        var stack:[Character] = Array()
        for item in chars {
            if !stack.isEmpty && item == "#" {
                stack.removeLast()
            }else {
                if item != "#" {
                    stack.append(item)
                }
            }
        }
        var result = ""
        for i in 0..<stack.count {
            result.append(stack[i])
        }
        return result
     }
    
    func test() {
        print(backspaceCompare("ab#c", "ad#c"))
        print(backspaceCompare("ab##", "c#d#"))
        print(backspaceCompare("a##c", "#a#c"))
        print(backspaceCompare("a#c", "b"))
    }
}
