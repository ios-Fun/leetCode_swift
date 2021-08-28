//
//  Solution44.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/3/18.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 通配符匹配
// 难
class Solution44 {
    
    // 动态规划
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sLength = s.count + 1
        let pLength = p.count + 1
        let sChars = Array(s)
        let pChars = Array(p)
        
        var dp:[[Bool]] = Array.init(repeating: Array.init(repeating: false, count: pLength), count: sLength)
        dp[0][0] = true
        
        for i in 0..<sLength {
            for j in 1..<pLength {
                if pChars[j-1] == "*" {
                    dp[i][j] = dp[i][j-1]   // 匹配0个字符
                    if i != 0 {
                        dp[i][j] = dp[i-1][j] || dp[i][j]
                    }
                }else {
                    if i != 0 {
                        if pChars[j-1] == "?" || sChars[i-1] == pChars[j-1] {
                            dp[i][j] = dp[i-1][j-1]
                        }
                    }
                }
                
            }
        }
        return dp.last!.last!
    }
    
    // dsf 超时了
    func isMatch2(_ s: String, _ p: String) -> Bool {
        
        return dsf(sChars: Array(s), pChars: Array(p), sIndex: 0, pIndex: 0)
    }
    
    func dsf(sChars: [Character], pChars: [Character], sIndex: Int, pIndex: Int) -> Bool {
        let sLength = sChars.count
        let pLength = pChars.count
        
        if sIndex == sLength && pIndex == pLength {
            return true
        }
        
        if sIndex > sLength {
            return false
        }
        
        // if sIndex >= sLength || pIndex >= pLength {
        if pIndex >= pLength {
            return false
        }
        
        // 都在范围内
        if pChars[pIndex] == "*" {
            if pIndex == pLength - 1 {
                return true
            }
            if sIndex < sLength {
                for i in (sIndex..<sLength).reversed() {
                    if dsf(sChars: sChars, pChars: pChars, sIndex: i, pIndex: pIndex + 1) {
                        return true
                    }
                }
                return false
            } else {
                return dsf(sChars: sChars, pChars: pChars, sIndex: sIndex, pIndex: pIndex + 1)
            }
            
        }else if pChars[pIndex] == "?"{
            return dsf(sChars: sChars, pChars: pChars, sIndex: sIndex + 1, pIndex: pIndex + 1)
        }else if sIndex < sLength && sChars[sIndex] == pChars[pIndex] {
            return dsf(sChars: sChars, pChars: pChars, sIndex: sIndex + 1, pIndex: pIndex + 1)
        }else {
            return false
        }
    }
    
    func test() {
        print(isMatch("aa", "a"))   //false
        print(isMatch("aa", "aa"))  //true
        print(isMatch("aaa", "aa"))  //false
        print(isMatch("aa", "*"))  //true
        print(isMatch("aa", "a*"))  //true
        print(isMatch("ab", "?*"))  //true
        print(isMatch("aab", "c*a*b"))  //false
        print(isMatch("", "*****"))  //true
        print(isMatch("", "?"))  //false
        print(isMatch("b", "*?*?*"))  //false
    }
}

