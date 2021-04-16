//
//  Solution392.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/6/28.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

// 双指针
class Solution392 {
    
    // 动态规划
    func isSubsequence2(_ s: String, _ t: String) -> Bool {
        // todo
        return false
    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let sCount = s.count
        let tCount = t.count
        
        if sCount > tCount {
            return false
        }
        if sCount == 0 {
            return true
        }
        var sIndex = 0
        var tIndex = 0
        let sChars = Array(s)
        let tChars = Array(t)
        while sIndex < sCount && tIndex < tCount {
            if sChars[sIndex] == tChars[tIndex] {
                sIndex = sIndex + 1
                tIndex = tIndex + 1
            }else {
                tIndex = tIndex + 1
            }
        }
//        if sIndex == sCount {
//            return true
//        }
//        return false
        return sIndex == sCount
    }
    
    func test() {
        print(isSubsequence("", "ahbgdc"))
        print(isSubsequence("abc", "ahbgdc"))
        print(isSubsequence("axc", "ahbgdc"))
    }
}
