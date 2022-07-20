//
//  Solution1324.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/16.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

// 用数组存储
class Solution1324 {
    func printVertically(_ s: String) -> [String] {
        let strs = s.split(separator: " ")
        var maxCount = 0
        for str in strs {
            maxCount = max(maxCount, str.count)
        }
        var strList:[[Character]] = Array.init(repeating: Array.init(repeating: " ", count: strs.count), count: maxCount)
        for i in 0..<strs.count {
            let charList = Array(strs[i])
            for j in 0..<charList.count {
                strList[j][i] = charList[j]
            }
        }
        var resultList:[String] = []
        for list in strList {
            var str = ""
            var notWhiteIndex = list.count - 1
            
            for j in (0..<list.count).reversed() {
                if list[j] != " " {
                    notWhiteIndex = j
                    break
                }
            }
            
            for i in 0...notWhiteIndex {
                str.append(list[i])
            }
            resultList.append(str)
        }
        return resultList
    }
    
    func test() {
        print(printVertically("HOW ARE YOU"))
                            
        print(printVertically("TO BE OR NOT TO BE"))
        
        print(printVertically("CONTEST IS COMING"))
    }
}

// CIC
// OSO
// N M
