//
//  Solution1446.swift
//  leetcode
//
//  Created by wang youzhuo on 2022/7/11.
//  Copyright © 2022 youzhuo wang. All rights reserved.
//

import Foundation

class Solution1446 {
    func maxPower(_ s: String) -> Int {
        let chars = Array(s)
        var lastChar = chars.first!
        var maxCount = 1
        var curCount = 1
        for i in 1..<chars.count {
            let charItem = chars[i]
            if charItem == lastChar {
                curCount += 1
                maxCount = max(maxCount, curCount)
            } else {
                curCount = 1
            }
            lastChar = charItem
        }
        return maxCount
    }
    
    func test() {
        print(maxPower("leetcode"))
        
        print(maxPower("abbcccddddeeeeedcba"))
    }
}
