//
//  Solution5.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 最长回文子串 -- 对称的字符串
// 运行时间过长，要优化
// 中心扩散
// 动态规划
class Solution5 {
    
    //1. 动态规划--思路难
    func longestPalindrome2(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        var ans:String = ""
        let schars = Array(s)
        let count = s.count
        let list:[Bool] = Array.init(repeating: false, count: count)
        var dp:[[Bool]] = Array.init(repeating: list, count: count)
        for l in 0..<count {
            for i in 0..<count {
                let j = i + l
                if j >= count {
                    break
                }
                if l == 0 {
                    dp[i][j] = true
                }else if  l == 1 {
                    if schars[i] == schars[j] {
                        dp[i][j] = true
                    }
                }else {
                    if schars[i] == schars[j] {
                        dp[i][j] = dp[i+1][j-1]
                    }
                }
                if dp[i][j] && l + 1 > ans.count {
                    ans = String(s[s.index(s.startIndex, offsetBy: i)...s.index(s.startIndex, offsetBy: j)])
                }
            }
        }
        
        return ans
    }
    
    //2. 中心扩散
    func longestPalindrome3(_ s: String) -> String {
        if s.count == 0 {
            return ""
        }
        var start = 0
        var end = 0
        var maxLength = 0
        let chars = Array(s)
        for i in 0..<s.count {
            let len1 = expandCenter(chars, i, i)
            let len2 = expandCenter(chars, i, i+1)
            let len = max(len1, len2)
            if len > maxLength {
                start = i - (len-1) / 2
                end = i + len / 2
                maxLength = len
            }
        }
        return String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: end)])
    }
    
    private func expandCenter(_ chars: [Character], _ start: Int, _ end: Int) -> Int{
        var l = start
        var r = end
        while l >= 0 && r < chars.count && chars[l] == chars[r]{
            l -= 1
            r += 1
        }
        return r - l - 1
    }
    
    func longestPalindrome(_ s: String) -> String {
        
        var maxCount = 0
        var maxString = ""
        
        //let charList = s.map{$0}
        
        if s.count == 1 {
            return s
        }
        if s.count == 2 {
            let startChar = s[s.index(s.startIndex, offsetBy: 0)]
            let endChar = s[s.index(s.startIndex, offsetBy: 1)]
            if startChar == endChar {
                return s
            }else {
                return String(startChar)
            }
        }
        
        var lastChar:Character? = nil
        for i in (0..<s.count) {
            // 获取字符
            let charStr = s[s.index(s.startIndex, offsetBy: i)]
            
            if lastChar != nil {
                if charStr == lastChar! {
                    continue
                }
            }
            lastChar = charStr
            
            let result = findLong(sub: charStr, s: s, index:i)
            if result.count > maxCount {
                maxCount = result.count
                maxString = result.resultStr
                if maxCount == s.count {
                    break
                }
            }
            
        }
        
        return maxString
    }
    
    // 查找对应i位置的最高数组
    func findLong(sub:Character, s:String, index:Int) -> (count:Int, resultStr:String){
        // print("sub:", sub)
        
        var startIndex = index - 1
        var endIndex = index + 1
        var maxLength = 1
        
        var isSameWord:Bool?
        while(startIndex >= 0 || endIndex < s.count) {
            
            // 前一个字符
            var startChar:Character?
            if startIndex >= 0 {
                startChar = s[s.index(s.startIndex, offsetBy: startIndex)]
            }
            var endChar:Character?
            if endIndex < s.count {
                endChar = s[s.index(s.startIndex, offsetBy: endIndex)]
            }
            
            if startChar == endChar {
                maxLength = maxLength + 2
                startIndex = startIndex - 1
                endIndex = endIndex + 1
                if startChar == sub {
                    // 如果字符串相同
                    if isSameWord == nil {
                        isSameWord = true
                    }
                }else {
                    isSameWord = false
                }
            }else {
                if startChar == sub{
                    // 如果首部的字符串与sub相同
                    var flag = false
                    if isSameWord == nil {
                        flag = true
                    }else {
                        if isSameWord! {
                            flag = true
                        }
                    }
                    if flag {
                        maxLength = maxLength + 1
                        startIndex = startIndex - 1
                    }else {
                        break
                    }
                    
                }else if (endChar == sub) {
                    var flag = false
                    if isSameWord == nil {
                        flag = true
                    }else {
                        if isSameWord! {
                            flag = true
                        }
                    }
                    if flag {
                        maxLength = maxLength + 1
                        endIndex = endIndex + 1
                    }else {
                        break
                    }
                }else {
                    break
                }
            }
        }
        // 截取子字符串
        let start = s.index(s.startIndex, offsetBy: startIndex+1)
        let end = s.index(s.startIndex, offsetBy: startIndex+maxLength)
        let resultStr = s[start...end]
        // print("maxLength:",maxLength, resultStr)
        return (maxLength, String(resultStr))
    }
    
    func test() {
        print(longestPalindrome3("babad"))
        print(longestPalindrome3("cbbd"))
        print(longestPalindrome3("ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg"))
        
    }
}
