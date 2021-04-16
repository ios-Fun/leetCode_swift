//
//  Solution696.swift
//  leetcode
//
//  Created by youzhuo wang on 2020/12/2.
//  Copyright © 2020 youzhuo wang. All rights reserved.
//

import Foundation

class Solution696 {
    
    func countBinarySubstrings(_ s: String) -> Int {
        let charArray = Array(s)
        var totalCount = 0
        
        return 0
    }
    
    // 超时了
    func countBinarySubstrings2(_ s: String) -> Int {
        let charArray = Array(s)
        var totalCount = 0
        for i in 0..<charArray.count {
            let startChar = charArray[i]
            var startCount = 1
            var k = i + 1
            var isSame = true
            var otherCount = 0
            while k < charArray.count {
                if charArray[k] == startChar {
                    if isSame {
                        startCount += 1
                    }else {
                        break
                    }
                }else {
                    // 字符变化了
                    if isSame {
                        isSame = false
                        otherCount = 1
                        if startCount == otherCount {
                            totalCount += 1
                            break
                        }
                    }else {
                        // 之前也是相同字符
                        otherCount += 1
                        if startCount == otherCount {
                            totalCount += 1
                            break
                        }
                    }
                    
                }
                k += 1
            }
        }
        return totalCount
    }
    // 0 - 0011
    // 1 - 01
    // 2 -
    // 3 - 10
    // 4 - 0011
    // 5 - 01
    
    func test() {
        
    }
}
