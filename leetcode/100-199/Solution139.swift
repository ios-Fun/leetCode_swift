//
//  Solution139.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/5.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

//  回溯法 -- 超时

// 动态规划 --

class Solution139 {
    
    // 动态规划
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        if s.count == 0 {
            return false
        }
        if wordDict.count == 0 {
            return false
        }
        let strCount = s.count
        var dp:[Bool] = Array.init(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 0..<s.count {
            let subStr  = s.suffix(strCount - i)
            for item in wordDict {
                if dp[i] && subStr.starts(with: item) {
                    dp[i + item.count] = true
                }
            }
        }
        return dp.last!
    }
    
    
    var wordDict:[String]!
    var isFound = false
    func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
        self.wordDict = wordDict.sorted(by: { (a, b) -> Bool in
            return a.count > b.count
        })
        isFound = false
        if s.count == 0 {
            return false
        }
        if wordDict.count == 0 {
            return false
        }
        dst(s)
        return isFound
    }
    
    func dst(_ s: String) {
        for item in wordDict {
            if isFound {
                return
            }
            if s == item {
                isFound = true
                return
            }else {
                if s.starts(with: item) {
                    dst(String(s.suffix(s.count - item.count)))
                }
            }
        }
    }
    
    func test() {
        print(wordBreak("leetcode",["leet", "code"]))
        print(wordBreak("applepenapple", ["apple", "pen"]))
        print(wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"]))
        
        print(wordBreak("acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb",
        ["abbcbda","cbdaaa","b","dadaaad","dccbbbc","dccadd","ccbdbc","bbca","bacbcdd","a","bacb","cbc","adc","c","cbdbcad","cdbab","db","abbcdbd","bcb","bbdab","aa","bcadb","bacbcb","ca","dbdabdb","ccd","acbb","bdc","acbccd","d","cccdcda","dcbd","cbccacd","ac","cca","aaddc","dccac","ccdc","bbbbcda","ba","adbcadb","dca","abd","bdbb","ddadbad","badb","ab","aaaaa","acba","abbb"]))
        
        print(wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]))
    }
}
