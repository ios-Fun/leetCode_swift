//
//  Solution28.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/1.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 字符串匹配， KMP算法
// 滑动窗口？？
class Solution28 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        return kmp_search(haystack, needle)
    }
    
    // 计算next
    private func kmp_getNextList(_ str: String) ->[Int] {
        
        let charList = Array(str)
        let length = str.count
        var list = Array(repeating: 0, count: length)
        var index:Int = 0
        var i = 1
        while i < length {
            if charList[i] == charList[index] {
                index = index + 1
                list[i] = index
                i = i + 1
            }else {
                if index > 0 {
                    index = list[index - 1]
                }else {
                    // 不相同，并且index = 0
                    list[i] = index
                    i = i + 1
                }
            }
        }
        list.insert(-1, at: 0)
        list.removeLast()
        return list
    }
    
    // kmp搜索匹配字符串
    private func kmp_search(_ text: String, _ patten: String) -> Int {
        let n = patten.count
        let m = text.count
        if n == 0 || m == 0 {
            return -1
        }
        let textChars = Array(text)
        let pattenChars = Array(patten)
        let prefixTable = kmp_getNextList(patten)
        
        var i:Int = 0, j:Int = 0
        while i < m {
            if j == n-1 && textChars[i] == pattenChars[j] {
                return i - j
            }
            if textChars[i] == pattenChars[j] {
                i = i + 1
                j = j + 1
            }else {
                j = prefixTable[j]
                if j == -1 {
                    i = i + 1
                    j = j + 1
                }
            }
        }
        return -1
    }
    
    func test() {
        // print(strStr("hello", "ll"))
        // next: -1, 0
        
        print(strStr("aaaaa", "bba"))
        
    }
}
