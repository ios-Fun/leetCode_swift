//
//  Solution389.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution389 {
    // 字典？
    // 位运算
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let charS = Array(s)
        let charT = Array(t)
        var result:Int = Int(charT.last!.asciiValue!)
        for i in 0..<s.count {
            result = result ^ Int(charS[i].asciiValue!)
            result = result ^ Int(charT[i].asciiValue!)
        }
        // result = result ^ Int(charT.last!.asciiValue!)
        return Character(Unicode.Scalar(result)!)
    }
    
    func test() {
        print(findTheDifference("abcd", "abcde"))
        print(findTheDifference("", "y"))
        print(findTheDifference("a", "aa"))
        print(findTheDifference("ae", "aea"))
    }
}
