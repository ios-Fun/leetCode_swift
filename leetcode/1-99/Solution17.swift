//
//  Solution17.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/14.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 电话号码的字母组合
// 思路：回溯法
//
class Solution17 {

    var result:[String]!
    var n:Int!
    var s_charsList:[Character]!
    var listStr = [["a", "b", "c"], ["d", "e", "f"],["g", "h", "i"],
                   ["j", "k", "l"], ["m", "n", "o"],["p", "q", "r", "s"],
                   ["t", "u", "v"],["w", "x", "y", "z"]
    ]
    
    // 回溯法
    func letterCombinations(_ digits: String) -> [String] {
        if digits.count == 0 {
            return []
        }
        result = Array()
        s_charsList = digits.map{$0}
        n = digits.count
        var curStr:String = ""
        backtrace(0, &curStr)
        return result
    }
    
    // index -- 第几个数字
    // curStr -- 当前的组合字符串
    func backtrace(_ index: Int, _ curStr: inout String) {
        if index == n! {
            result.append(curStr)
            // curStr = ""
            return
        }
        
        let strIndex = characterToInt(char: s_charsList[index]) - 2
        
        for i in (0..<(listStr[strIndex].count)) {
            curStr = curStr + listStr[strIndex][i]
            backtrace(index+1, &curStr)
            curStr.removeLast()
        }
    }
    
    func characterToInt(char: Character) -> Int {
        let string = String(char)
        let index = string.unicodeScalars.startIndex
        let scalar = string.unicodeScalars[index]
        return Int(scalar.value) - 48
    }
    
    func test() {
        print(letterCombinations("22"))
    }
}
