//
//  Solution140.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/6.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 1. 回溯法 -- 倒着增加-- 记忆化回溯
// 2. 动态规划？？？
class Solution140 {
    
    // 动态规划
    func wordBreak2(_ s: String, _ wordDict: [String]) -> [String] {
        // todo
        return []
    }
    
    
    var wordDict:[String]!
    var map:[String: [String]] = Dictionary()
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        map = Dictionary()
        self.wordDict = wordDict
        let ret = dfs(s)
        return ret
    }
    
    // 倒着增加
    func dfs(_ s: String)-> [String] {
        if let arr = map[s] {
            return arr
        }
        
        if s.count == 0 {
            return [""]
        }
        
        var res = [String]()
        for word in wordDict {
            if s.starts(with: word) {
                let nextStr = String(s[s.index(s.startIndex, offsetBy: word.count) ..< s.endIndex])
                let arr = dfs(nextStr)
                for sub in arr {
                    res.append((word + (sub.isEmpty ? "":" ")) + sub)
                }
            }
        }
        map[s] = res
        return res
    }
    
    func test() {
        print(wordBreak("catsanddog", ["cat", "cats", "and", "sand", "dog"]))
        print(wordBreak("pineapplepenapple", ["apple", "pen", "applepen", "pine", "pineapple"]))
        print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
        
        print(wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]))
    }
}
