//
//  Solution1433.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1433 {
    func checkIfCanBreak(_ s1: String, _ s2: String) -> Bool {
        let chars1 = Array(s1).sorted()
        let chars2 = Array(s2).sorted()
        // 0: 相等；-1，小于，1: 大于
        var status = 0
        
        for i in 0..<chars1.count {
            if chars1[i] == chars2[i] {
                continue
            } else if chars1[i] < chars2[i] {
                if status == 0 {
                    status = -1
                }else if status  == -1  {
                    continue
                }else{
                    return false
                }
            } else {
                if status == 0 {
                    status = 1
                }else if status  == 1  {
                    continue
                }else{
                    return false
                }
            }
        }
        return true
    }
    
    func test() {
        print(checkIfCanBreak("abc", "xya"))
        
        print(checkIfCanBreak("abe", "acd"))
        
        print(checkIfCanBreak("leetcodee", "interview"))
        
    }
}
