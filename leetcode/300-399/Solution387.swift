//
//  Solution387.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/24.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//1. java 的 TreeSet?

//2. hash

//3. 数组
class Solution387 {
    func firstUniqChar(_ s: String) -> Int {
        let chars = Array(s)
        if chars.count == 0 {
            return -1
        }
        var letterCount:[Int] = Array.init(repeating: 0, count: 26)
        for i in 0..<chars.count {
            letterCount[Int(chars[i].asciiValue!) - 97] = letterCount[Int(chars[i].asciiValue!) - 97] + 1
        }
        for i in 0..<chars.count {
            if letterCount[Int(chars[i].asciiValue!) - 97] == 1 {
                return i
            }
        }
        return -1
    }
    
    func test() {
        print(firstUniqChar("cc"))
        print(firstUniqChar(""))
        print(firstUniqChar("leetcode"))
        print(firstUniqChar("loveleetcode"))
    }
}

// l e
// l e e
