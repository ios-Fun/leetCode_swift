//
//  Solution1328.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1328 {
    func breakPalindrome(_ palindrome: String) -> String {
        if palindrome.count == 1 {
            return ""
        }
        var chars = Array(palindrome)
        // let index = chars.count >> 1
        // var chatItem = chars[index]
        var isChange = false
        for i in 0..<chars.count {
            if chars.count & 1 == 1 && i == chars.count >> 1 {
                continue
            }else {
                if chars[i] > "a" {
                    isChange = true
                    chars[i] = "a"
                    break
                }
            }
        }
        if !isChange {
            chars[chars.count-1] = "b"
        }
        let result = chars.map{String.init($0)}.reduce("", +)
        return result
    }
    
    func test() {
        print(breakPalindrome("abcbcba"))
        print(breakPalindrome("aaabaaa"))
        print(breakPalindrome("abccba"))
        print(breakPalindrome("aa"))
    }
}

// aaabaaa
// aabbaaa
// aaabaab
