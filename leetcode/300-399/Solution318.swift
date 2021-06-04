//
//  Solution318.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/8.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 采用位运算
class Solution318 {
    
    // 采用set
    func maxProduct2(_ words: [String]) -> Int {
     
        // todo
        return 0
    }
    
    // 位运算
    func maxProduct(_ words: [String]) -> Int {
        if words.count < 2 {
            return 0
        }
        var array:[Int] = Array.init(repeating: 0, count: 26)
        for i in 0..<26 {
            array[i] = 1 << i
        }
        var wordsArray:[Int] = Array()
        for item in words {
            if item.count == 0 {
                wordsArray.append(0)
                continue
            }
            let charArray = Array(item)
            var value = array[Int(charArray[0].asciiValue!)-97]
            if charArray.count > 1 {
                // value = value ^
                for j in 1..<charArray.count {
                    if value ^ array[Int(charArray[j].asciiValue!)-97] == 0 {
                        continue
                    }
                    if value ^ array[Int(charArray[j].asciiValue!)-97] < value {
                        continue
                    }
                    value = value ^ array[Int(charArray[j].asciiValue!)-97]
                }
            }
            wordsArray.append(value)
        }
        
        var maxCount = 0
        for i in 0..<words.count {
            for j in (i+1)..<words.count {
                
                if wordsArray[i] & wordsArray[j] == 0 && wordsArray[i] != 0 && wordsArray[j] != 0 {
                    // 表示无相同字母
                    let count = words[i].count * words[j].count
                    if maxCount < count {
                        maxCount = count
                    }
                }
            }
        }
        return maxCount
    }
    
    func getBitCount(_ n:Int) -> Int{
        var count = 0
        var n = n
        while n != 0 {
            n = n & (n-1)
            count = count + 1
        }
        return count
    }
    
    func test() {
        print(maxProduct([""]))
        print(maxProduct(["", "abc"]))
        print(maxProduct(["foo"]))
        print(maxProduct(["foo","abcw","baz","bar","xtfn","abcdef"]))
        
        print(maxProduct(["a","ab","abc","d","cd","bcd","abcd"]))
    }
}

// & and
// 0 & 0 = 0
// 0 & 1 = 0
// 1 & 0 = 0
// 1 & 1 = 1
//
// | or
// 0 | 0 = 0
// 1 | 0 = 1
// 0 | 1 = 1
// 1 | 1 = 1
//
// ^
// 0 ^ 0  = 0
// 1 ^ 0 = 1
// 0 ^ 1 = 1
// 1 ^ 1 = 0

// b ^ b = 1

