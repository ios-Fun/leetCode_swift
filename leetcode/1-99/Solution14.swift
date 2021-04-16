//
//  Solution14.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/7/13.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution14 {
    // 横向扫描 或 纵向扫描
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count == 0 {
            return ""
        }
        
        if strs.count == 1 {
            return strs.first!
        }
        
        var index = 0
        
        var flag = true
        while flag {
            var tempStr = ""
            for i in 0..<strs.count {
                if strs[i].count < index + 1 {
                    flag = false
                    break
                }
                let item = strs[i]
                let subStr = String(item[item.index(item.startIndex, offsetBy: index)])
                if i == 0 {
                    tempStr = subStr
                }else {
                    if tempStr != subStr {
                        flag = false
                        break
                    }
                }
            }
            if flag {
                index += 1
            }
        }
        let item = strs.first!
        let subStr = String(item[item.index(item.startIndex, offsetBy: 0)..<item.index(item.startIndex, offsetBy: index)])
        // print("subStr:", subStr)
        return subStr
    }
    
    func test() {
        print(longestCommonPrefix(["flower", "flow", "flight"]))
    }
}
