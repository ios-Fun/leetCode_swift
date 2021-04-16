//
//  Solution3.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
// 1--滑动窗口
// 2--用字典存储<字符，位置>
// 3--使用set
class Solution3 {
    
    // 滑动窗口
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        // let characters = s.map{$0}
        let characters = Array(s)
        let n = characters.count
        var maxLegth = 0
        
        // 字符数组
        var chars:[Character] = []
        
        for i in (0..<n) {
            // 取单个字符
            let charStr = characters[i]
            
            // j 之前都是无重复的
            if let j = chars.firstIndex(of: charStr) {
                if maxLegth < chars.count {
                    maxLegth = chars.count
                }
                
                // j+1 -- i 之间的字符串
                var temp:[Character] = []
                var k = j + 1
                while k < chars.count {
                    temp.append(chars[k])
                    k = k + 1
                }
                chars = temp
            }
            chars.append(charStr)
        }
        if maxLegth < chars.count {
            maxLegth = chars.count
        }
        return maxLegth
    }
 
    // 哈希的方式
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        var dict = [Character:Int]()
        var repeatIndex = -1
        var maxLen = 0
        for (i,c) in Array(s).enumerated() {
            if let index = dict[c], index > repeatIndex {
                repeatIndex = index
            }
            dict[c] = i
            maxLen = max(maxLen,i-repeatIndex)
        }
        return maxLen
        
    }
    
    
    func test() {
        print(lengthOfLongestSubstring2("abcabcbb"))
        print(lengthOfLongestSubstring2("bbbbb"))
    }
}
