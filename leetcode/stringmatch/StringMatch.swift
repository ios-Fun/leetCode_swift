//
//  StringMatch.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/4/12.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 0. BF算法
// 1. BM（Boyer-Moore）算法--等待实现
// 2. KMP算法 -- 核心前后缀相同的next数组
// 3. Sunday算法--发现不匹配，位置i处字符串，将patten的最后字符移到i处继续比较
// 4. Horspool

class StringMatch {
    
    // 计算next
    private func kmp_getNextList(_ str: String) ->[Int] {
        
        var charList = Array(str)
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
    func kmp_search(_ text: String, _ patten: String) -> Int {
        let n = patten.count
        let m = text.count
        if n == 0 {
            return 0
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
    
    // sunday算法
    func sunday_search(_ text: String, _ patten: String) -> Int {
        let n = patten.count
        let m = text.count
        if n == 0 {
            return 0
        }
        let textChars = Array(text)
        let pattenChars = Array(patten)
        var i:Int = 0, j:Int = 0
        let dict = sunday_dict(patten)
        while i < m {
            if j == n-1 && textChars[i] == pattenChars[j] {
                return i - j
            }
            if textChars[i] == pattenChars[j] {
                i = i + 1
                j = j + 1
            }else {
                // 不匹配时
                i = i - j + n
                j = 0
                if i < m {
                    let char_text = textChars[i]
                    if let index = dict[char_text] {
                        // 存在
                        i = i - index
                    }
                }
            }
        }
        return -1
    }
    
    // sunday算法用到的字典
    private func sunday_dict(_ patten: String) -> [Character:Int] {
        var dict = [Character:Int]()
        let pattenChars = Array(patten)
        for (index, item) in pattenChars.enumerated() {
            dict[item] = index
        }
        return dict
    }
    
    func test() {
        print(kmp_getNextList("abxabwabxad"))
        print(kmp_search("abxabwabxafggabxabwabxad", "abxabwabxad"))
        print(kmp_search("abxabwabxafggabxabwabxad", "e"))
        print(kmp_search("", ""))
        print(sunday_search("abxabwabxafggabxabwabxad", "abxabwabxad"))
        print(sunday_search("abxabwabxafggabxabwabxad", "e"))
        print(sunday_search("", ""))
    }
}
