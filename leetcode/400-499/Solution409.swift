//
//  Solution409.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/11/30.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution409 {
    
    func longestPalindrome(_ s: String) -> Int {
        if s.count < 2 {
            return s.count
        }
        // 65-90 26个大写
        // 97-122 26个小写
        var result:[Int] = Array.init(repeating: 0, count: 127)
        let charArray = Array(s)
        for i in 0..<charArray.count {
            let asciiValue = Int(charArray[i].asciiValue!)
            result[asciiValue] = result[asciiValue] + 1
        }
        var sumValue = 0
        for i in 0..<127 {
            if result[i] & 1 == 1 {
                sumValue += result[i] - 1
            }else {
                sumValue += result[i]
            }
        }
        if sumValue < s.count {
            return sumValue + 1
        }else {
            return sumValue
        }
    }
    
    var charArray:[Character]!
    func longestPalindrome2(_ s: String) -> Int {
        
        self.charArray = Array(s)
        if charArray.count < 2 {
            return charArray.count
        }
        var maxValue = 0
        for i in 1..<charArray.count {
            let maxI = max(getLength(i, true), getLength(i, false))
            maxValue = max(maxI, maxValue)
        }
        return maxValue
    }
    
    func getLength(_ index:Int, _ contails: Bool) -> Int{
        var left:Int!
        var right:Int!
        var maxValue = contails ? 1 : 0
        if contails {
            left = index - 1
            right = index + 1
        }else {
            left = index - 1
            right = index
        }
        while left >= 0 && right < charArray.count {
            if charArray[left] == charArray[right] {
                maxValue += 2
                left -= 1
                right += 1
            }else {
                break
            }
        }
        return maxValue
    }
    
    func test() {
        print(longestPalindrome("ccc"))
        print(longestPalindrome("abccccdd"))
    }
}
