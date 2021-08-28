//
//  Solution567.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/15.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 字符串的排列
// 滑动窗口
// 耗时过多
class Solution567 {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count {
            return false
        }
        let s1Chars = Array(s1)
        var s1Dictionary:[Character:Int] = Dictionary()
        for item in s1Chars {
            if s1Dictionary[item] == nil {
                s1Dictionary[item] = 1
            } else {
                s1Dictionary[item] = s1Dictionary[item]! + 1
            }
        }
        let s2Chars = Array(s2)
        var left = 0
        var right = s1.count-1
        var s2Dictionary:[Character:Int] = Dictionary()
        for i in left...right {
            let item = s2Chars[i]
            if s2Dictionary[item] == nil {
                s2Dictionary[item] = 1
            } else {
                s2Dictionary[item] = s2Dictionary[item]! + 1
            }
        }
        if s1Dictionary == s2Dictionary {
            return true
        }
        
        left += 1
        right += 1
        
        while right < s2.count {
            let rightItem = s2Chars[right]
            let leftItem = s2Chars[left-1]
            
            if s2Dictionary[leftItem]! == 1 {
                s2Dictionary.removeValue(forKey: leftItem)
            }else {
                s2Dictionary[leftItem]! -= 1
            }
            
            if s2Dictionary[rightItem] == nil {
                s2Dictionary[rightItem] = 1
            } else {
                s2Dictionary[rightItem] = s2Dictionary[rightItem]! + 1
            }
            if s1Dictionary == s2Dictionary {
                return true
            }else {
                left += 1
                right += 1
            }
        }
        return false
    }
    
    func test() {
        print(checkInclusion("adc", "dcda"))
        print(checkInclusion("ab", "eidbaooo"))
        print(checkInclusion("ab", "eidboaoo"))
    }
}
