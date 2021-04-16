//
//  Solution242.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/8/17.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution242 {
    
    // 用数组来判断
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let chars_s = Array(s)
        let chars_t = Array(t)
        var num_s = Array.init(repeating: 0, count: 26)
        var num_t = Array.init(repeating: 0, count: 26)
        for i in 0..<chars_s.count {
            let index = Int(chars_s[i].asciiValue!-97)
            num_s[index] += 1
        }
        for i in 0..<chars_t.count {
            let index = Int(chars_t[i].asciiValue!-97)
            num_t[index] += 1
        }
        for i in 0..<26 {
            if num_s[i] != num_t[i] {
                return false
            }
        }
        return true
    }
    
    // 用字典？
    func isAnagram2(_ s: String, _ t: String) -> Bool {
        return true
    }
    
    // 排序后比较是否相同
    func isAnagram3(_ s: String, _ t: String) -> Bool {
        return true
    }
    
    func test() {
        print(isAnagram("anagram", "nagaram"))
        
        print(isAnagram("rat", "car"))
        
    }
}
