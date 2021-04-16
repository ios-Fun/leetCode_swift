//
//  Solution1071.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/23.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1071 {
    
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        let len1 = str1.count
        let len2 = str2.count
        let minLen = min(len1, len2)
        for i in (1...minLen).reversed() {
            // 倒着
            if len1 % i == 0 && len2 % i == 0 {
                let subStr = String(str1[str1.index(str1.startIndex, offsetBy: 0)..<str1.index(str1.startIndex, offsetBy: i)])
                if check(str1, subStr) && check(str2, subStr) {
                    return subStr
                }
            }
        }
        return ""
    }
    
    func check(_ strA: String, _ strB: String) -> Bool {
        let len = strA.count / strB.count
        for i in 0..<len {
            let subA = String(strA[strA.index(strA.startIndex, offsetBy:  strB.count*i)..<strA.index(strA.startIndex, offsetBy: strB.count*(i+1))])
            if subA != strB {
                return false
            }
        }
        return true
    }
    
    func test() {
        print(gcdOfStrings("ABCABC","ABC"))
        print(gcdOfStrings("ABABAB","ABAB"))
        print(gcdOfStrings("LEET","CODE"))
    }
}
